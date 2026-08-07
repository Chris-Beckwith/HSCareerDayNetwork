import { Button, Grid, IconButton, Paper, Typography, useMediaQuery, useTheme } from "@mui/material";
import { FieldValues, useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";
import { speakerValidationSchema } from "./speakerValidation";
import AddressInputs from "../../app/components/AddressInputs";
import useCareers from "../../app/hooks/useCareers";
import LoadingComponent from "../../app/components/LoadingComponent";
import { useEffect, useState } from "react";
import Name from "./components/Name";
import TitleCompany from "./components/TitleCompany";
import PhoneEmail from "./components/PhoneEmail";
import AddCareers from "./components/AddCareers";
import AppDropzone from "../../app/components/AppDropzone";
import { Speaker } from "../../app/models/speaker";
import { LoadingButton } from "@mui/lab";
import agent from "../../app/api/agent";
import { useAppDispatch } from "../../app/store/configureStore";
import { setSpeaker } from "./speakerSlice";
import SpeakerSchool from "./components/SpeakerSchool";
import { Cancel } from "@mui/icons-material";
import ConfirmDelete from "../../app/components/ConfirmDelete";
import { PHONE_NUMBER_TYPE } from "../../app/util/constants";

interface Props {
    speaker?: Speaker,
    cancelEdit: () => void
}

/**
 * Form component to add or edit speakers.
 */
export default function SpeakerForm({ speaker, cancelEdit }: Props) {
    const [selectedCareers, setSelectedCareers] = useState<number[]>([])
    const { careers, categories, status } = useCareers()
    const dispatch = useAppDispatch()
    const { control, watch, reset, handleSubmit, setValue, formState: { isDirty, isSubmitting } } = useForm({
        resolver: yupResolver<any>(speakerValidationSchema),
        defaultValues: {
            file: null,
            removePortrait: false,
            phoneNumbers: [
                {
                    type: PHONE_NUMBER_TYPE[0],
                    number: "",
                }
            ]
        }
    })
    const watchFile = watch('file')
    const removePortrait = watch('removePortrait')
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))

    let isWatchFile : boolean
    const [confirmDelete, setConfirmDelete] = useState(false)

    useEffect(() => {
        if (!speaker || watchFile) return
        const sanitizedSpeaker = {
            ...speaker,
            phoneNumbers: speaker.phoneNumbers.map(phone => ({
                type: PHONE_NUMBER_TYPE[phone.type],
                number: phone.number + (phone.ext ? " x" + phone.ext : ""),
                primary: phone.isPrimary
            })),
            file: null
        }
        reset(sanitizedSpeaker)
        setSelectedCareers(prevSelectedCareers => {
            if (speaker.careers) {
                const newCareers = speaker.careers.filter(career =>
                    !prevSelectedCareers.some(existingCareer => existingCareer === career.id)
                ).map(c => c.id)
                return [...prevSelectedCareers, ...newCareers]
            }
            return prevSelectedCareers;
        })
        return () => {
            if (watchFile) URL.revokeObjectURL(watchFile.preview);
        }
    }, [speaker, reset, watchFile, setSelectedCareers])

    async function handleAddSpeaker(data: FieldValues) {
        try {
            const sanitiziedData = {
                id: data.id ?? '',
                firstName: data.firstName ?? '',
                middleName: data.middleName ?? '',
                lastName: data.lastName ?? '',
                title: data.title ?? '',
                company: data.company ?? '',
                schoolLastSpokeAt: data.schoolLastSpokeAt ?? null,
                phoneNumbers: data.phoneNumbers
                    .filter((phone: { number: string; }) => phone.number?.replace(/\D/g, "").length > 0)
                    .map((phone: { type: string; number: string; isPrimary: any; }, index: number) => {
                        const match = phone.number.match(/^(\(\d{3}\)\s\d{3}-\d{4})(?:\s*x\s*(\d+))?$/i)

                        console.log(match)
                        return {
                            type: PHONE_NUMBER_TYPE.indexOf(phone.type),
                            number: match?.[1] ?? "",
                            ext: match?.[2] ?? "",
                            isPrimary: index === 0
                        }
                }),
                email: data.email ?? '',
                file: data.file ?? '',
                careerIds: data.careerIds ?? [],
                removePortrait: data.removePortrait ?? false,
                address: {
                    address1: data.address.address1 ?? '',
                    address2: data.address.address2 ?? '',
                    city: data.address.city ?? '',
                    state: data.address.state ?? '',
                    zip: data.address.zip ?? '',
                }
            }

            if (selectedCareers) sanitiziedData.careerIds = selectedCareers
            let response: Speaker
            if (speaker) {
                response = await agent.Speaker.update(sanitiziedData)
            } else {
                response = await agent.Speaker.create(sanitiziedData)
            }
            dispatch(setSpeaker(response))
            cancelEdit()
        } catch (error) {
            console.log(error)
        }
    }

    const handleAddSelectedCareer = (careerId: number) => {
        const career = careers.find(careerToFind => careerToFind.id === careerId)
        if (career && !selectedCareers.includes(careerId))
            setSelectedCareers([...selectedCareers, careerId])
    }

    const handleRemoveSelectedCareer = (id: number) => {
        setSelectedCareers(prevItems => prevItems.filter(careerId => careerId !== id))
    }

    async function handleDeletePortrait() {
        if (isWatchFile) {
            setValue("file", null, { shouldDirty: true })
            if (speaker?.portraitUrl)
                setValue("removePortrait", true)
        } else {
            setValue("removePortrait", true, { shouldDirty: true })
        }
        setConfirmDelete(false)
    }

    if (status.includes('pending')) return <LoadingComponent message="Loading..." />

    return (
        <>
            <Paper variant="outlined" sx={{ my: { xs: 3, md: 6 }, p: { xs: 2, md: 3 } }}>
                <Typography align="center" variant={isTablet ? "h4" : "h3"}>{speaker ? "Edit Speaker" : "Add New Speaker"}</Typography>
                <form onSubmit={handleSubmit(handleAddSpeaker)}>
                    <Grid container rowSpacing={2} sx={{ my: 4 }}>
                        <Name control={control} name="name" />
                        <TitleCompany control={control} name="titleCompany" />
                        <PhoneEmail control={control} name="phoneEmail" />
                        <SpeakerSchool control={control} name="schoolLastSpokeAt" />

                        <Grid container item justifyContent="center">
                            <Grid item xs={6} sm={5} md={4} display='flex' justifyContent='center' alignItems='center' sx={{ cursor: 'pointer' }}>
                                <AppDropzone control={control} name='file' setValue={setValue} portraitUrl={speaker?.portraitUrl}
                                    descriptionText={(speaker?.portraitUrl && !removePortrait) || watchFile ? "Edit Speaker Picture" : "Add Speaker Picture"} />
                            </Grid>
                            <Grid item xs={6} sm={5} md={4} display='flex' position='relative' justifyContent='center' alignItems='center'>
                                    {watchFile ? (
                                        <>
                                            <img src={watchFile?.preview} alt="preview" 
                                                style={{ maxHeight: isTablet ? isMobile ? 150 : 175 : 200, display: "block" }} />

                                            <IconButton sx={{ position: "absolute", top: 0, right: '25px', p: 0 }}
                                                color="error" size="small"
                                                onClick={() => {
                                                    setConfirmDelete(true)
                                                    isWatchFile = true
                                                }}
                                            >
                                                <Cancel />
                                            </IconButton>
                                        </>
                                    ) : (
                                        speaker?.portraitUrl && !removePortrait && (
                                            <>
                                                <img src={speaker?.portraitUrl} alt={speaker?.lastName} 
                                                    style={{ maxHeight: isTablet ? isMobile ? 150 : 175 : 200, display: "block" }} />
                                            
                                                <IconButton sx={{ position: "absolute", top: 0, right: '25px', p: 0 }}
                                                    color="error" size="small"
                                                    onClick={() => {
                                                        setConfirmDelete(true)
                                                        isWatchFile = false
                                                    }}
                                                >
                                                    <Cancel />
                                                </IconButton>
                                            </>
                                        )
                                    )}
                            </Grid>
                        </Grid>

                        <AddCareers
                            careers={careers}
                            categories={categories}
                            selectedCareerIds={selectedCareers}
                            onAddSelectedCareer={handleAddSelectedCareer}
                            onRemoveSelectedCareer={handleRemoveSelectedCareer}
                        />

                        <AddressInputs control={control} name="address" />

                        <Grid container item justifyContent='center'>
                            <Grid item xs={6} sm={5} md={4}>
                                <Button onClick={cancelEdit} variant="contained" color="inherit">Cancel</Button>
                            </Grid>
                            <Grid item xs={6} sm={5} md={4} display="flex" justifyContent="flex-end">
                                <LoadingButton
                                    loading={isSubmitting}
                                    variant="contained"
                                    type="submit"
                                    color="success"
                                    disabled={!isDirty}
                                >
                                    {speaker ? "Save" : "Add Speaker"}
                                </LoadingButton>
                            </Grid>
                        </Grid>
                    </Grid>
                </form>
            </Paper>

            <ConfirmDelete open={confirmDelete} itemType="Profile Picture" 
                itemName={""}
                handleClose={() => setConfirmDelete(false)}
                confirmDelete={handleDeletePortrait}
                loading={false}
            />
        </>
    )
}