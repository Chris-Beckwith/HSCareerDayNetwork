import { Button, Grid, Paper, Typography, useMediaQuery, useTheme } from "@mui/material";
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
    const { control, watch, reset, handleSubmit, formState: { isDirty, isSubmitting } } = useForm({
        resolver: yupResolver<any>(speakerValidationSchema)
    })
    const watchFile = watch('file', null)
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))


    useEffect(() => {
        if (speaker && !watchFile && !isDirty) {
            const sanitizedSpeaker = {
                ...speaker,
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
        }
        return () => {
            if (watchFile) URL.revokeObjectURL(watchFile.preview);
        }
    }, [speaker, reset, watchFile, isDirty, setSelectedCareers])

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
                phoneNumber: data.phoneNumber ?? '',
                email: data.email ?? '',
                file: data.file ?? '',
                careerIds: data.careerIds ?? [],
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

    if (status.includes('pending')) return <LoadingComponent message="Loading..." />

    return (
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
                            <AppDropzone control={control} name='file'
                                descriptionText={speaker && speaker.portraitUrl ? "Edit Speaker Picture" : "Add Speaker Picture"} />
                        </Grid>
                        <Grid item xs={6} sm={5} md={4} display='flex' justifyContent='center' alignItems='center'>
                            {watchFile ? (
                                <img src={watchFile?.preview} alt="preview" style={{ maxHeight: isTablet ? isMobile ? 150 : 175 : 200 }} />
                            ) : (
                                speaker?.portraitUrl &&
                                <img src={speaker?.portraitUrl}
                                    alt={speaker?.lastName}
                                    style={{ maxHeight: isTablet ? isMobile ? 150 : 175 : 200 }} />
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
    )
}