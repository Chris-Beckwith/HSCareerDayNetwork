import { Box, Checkbox, Grid, IconButton, InputAdornment, Switch, TextField, Typography } from "@mui/material"
import { CareerEvent } from "../../app/models/event"
import { useEffect, useMemo, useState } from "react"
import SessionView from "./SessionView"
import { FieldValues, useForm } from "react-hook-form"
import { yupResolver } from "@hookform/resolvers/yup"
import { schedulingValidationSchema } from "./schedulingValidation"
import agent from "../../app/api/agent"
import { Career } from "../../app/models/career"
import { findNextEventPhaseId } from "../../app/util/util"
import { useAppDispatch, useAppSelector } from "../../app/store/configureStore"
import { reloadEvents } from "../careerEvents/careerEventSlice"
import { DEFAULT_FONT_SIZE, EVENT_PHASES } from "../../app/util/constants"
import TriStateCheckbox from "./components/TriStateCheckbox"
import { ExpandMore, ExpandLess, ArrowDropDown, ArrowDropUp, Delete } from "@mui/icons-material"
import AppButton from "../../app/components/AppButton"
import AppLoadingButton from "../../app/components/AppLoadingButton"
import { Classroom } from "../../app/models/classroom"
import AppBackButton from "../../app/components/AppBackButton"
import AppNumberInput from "../../app/components/AppNumberInput"
import OverrideScheduleDialog from "./components/OverrideScheduleDialog"

interface Props {
    event: CareerEvent
    back: () => void
}

interface CheckedState {
    [key: number]: (0 | 1 | 2)[]
}

/**
 * Component for setting the settings to generate a schedule
 */
export default function SchedulingTool({ event, back }: Props) {
    const dispatch = useAppDispatch()
    const [loading, setLoading] = useState(false)
    const [showParamsOverride, setShowParmsOverride] = useState(false)
    const [showOverrideConfirm, setShowOverrideConfirm] = useState(false)
    const [fieldValues, setFieldValues] = useState<FieldValues>([])
    const [selectCareers, setSelectCareers] = useState(false)
    const [totalClassrooms, setTotalClassrooms] = useState(0)
    const [largeRooms, setLargeRooms] = useState<Classroom[]>([])
    const [showLargeRooms, setShowLargeRooms] = useState(false)
    const [sameSpeakers, setSameSpeakers] = useState<Career[][]>([])
    const [sameSpeakersIndex, setSameSpeakersIndex] = useState(0)
    const [showCareerMaxSize, setShowCareerMaxSize] = useState(false)
    const [careerMaxClassSizeList, setCareerMaxClassSizeList] = useState<Record<number, number>>({})
    const [initialSameSpeakers, setInitialSameSpeakers] = useState<Career[][]>([])
    const [initialCareerMaxClassSizeList, setInitialCareerMaxClassSizeList] = useState<Record<number, number>>({})
    const [initialCheckedState, setInitialCheckedState] = useState<CheckedState>({})

    const { eventPhases } = useAppSelector(state => state.careerEvents)

    const { control, handleSubmit, watch, reset, formState: { isDirty } } = useForm({
        resolver: yupResolver<any>(schedulingValidationSchema),
        defaultValues: {
            sessionCount: 3
        }
    })

    const maxClassSizeValue = watch('maxClassSize') || 0
    const sessionCountValue = watch('sessionCount') || 3
    
    const [checkedState, setCheckedState] = useState<CheckedState>(
        event.careers.reduce((acc: CheckedState, career) => {
            acc[career.id] = Array(sessionCountValue).fill(0);
            return acc;
        }, {} as CheckedState)
    )

    useEffect(() => {
        if (showParamsOverride) {
            agent.Event.getScheduleParams(event.id)
                .then(response => {
                    reset({
                        ...response,
                        maxClassSize: response.maxClassSize?.toLocaleString() ?? '',
                        minClassSize: response.minClassSize?.toLocaleString() ?? ''
                    })

                    setSameSpeakers(response.sameSpeakersForCareerList)
                    setInitialSameSpeakers(response.sameSpeakersForCareerList)
                    setCareerMaxClassSizeList(response.careerMaxClassSizeList)
                    setInitialCareerMaxClassSizeList(response.careerMaxClassSizeList)
                    setCheckedState(response.requiredPeriodForCareerList)
                    setInitialCheckedState(response.requiredPeriodForCareerList)
                })
                .catch(error => console.log(error))
        }
    }, [event.id, reset, showParamsOverride])

    const hasChanges = useMemo(() => {
        return (
            JSON.stringify(sameSpeakers) !== JSON.stringify(initialSameSpeakers) ||
            JSON.stringify(careerMaxClassSizeList) !== JSON.stringify(initialCareerMaxClassSizeList) ||
            JSON.stringify(checkedState) !== JSON.stringify(initialCheckedState)
        )
    }, [sameSpeakers, initialSameSpeakers, careerMaxClassSizeList, initialCareerMaxClassSizeList, checkedState, initialCheckedState])    

    //Get Large Rooms when max class size changes
    useEffect(() => {
        if (maxClassSizeValue <= 0 || maxClassSizeValue === null) {
            setLargeRooms([])
        } else {
            const params = new URLSearchParams()
            params.append('schoolId', event.school.id.toString())
            params.append('maxClassSize', maxClassSizeValue.toString().replace(/,/g, ""))

            agent.Classroom.largeRoomsBySchool(params)
                .then(response => {
                    setLargeRooms(response.items)
                    setTotalClassrooms(response.metaData.totalCount)
                })
                .catch(error => console.log("Error fetching large classrooms: ", error))
        }
    },[event.school.id, maxClassSizeValue])

    const updateCareerMaxSize = (id: number, value: string) => {
        setCareerMaxClassSizeList(prev => {
            const updated = {...prev}
            
            if (value === "") delete updated[id]
            else updated[id] = Number(value)

            return updated
        })
    }

    const handleAddSameSpeaker = (career: Career) => {
        setSameSpeakers(prevState => {
            const newSameSpeakers = [...prevState]
            const careerExists = newSameSpeakers.some(careerArray =>
                careerArray.some(existingCareer => existingCareer.id === career.id)
            )

            if (!careerExists) {
                if (!newSameSpeakers[sameSpeakersIndex]) {
                    newSameSpeakers[sameSpeakersIndex] = []
                }

                newSameSpeakers[sameSpeakersIndex] = [...newSameSpeakers[sameSpeakersIndex], career]
            }

            return newSameSpeakers
        })
    }

    const handleSetSameSpeaker = () => {
        setSelectCareers(!selectCareers)
        if (sameSpeakers[sameSpeakersIndex]) {
            if (sameSpeakers[sameSpeakersIndex].length > 1) {
                setSameSpeakersIndex(sameSpeakersIndex + 1)
            } else if (sameSpeakers[sameSpeakersIndex].length === 1) {
                setSameSpeakers(prevState => {
                    const newSameSpeakers = prevState.filter((_, index) => index !== sameSpeakersIndex)
                    return newSameSpeakers
                })
            }
        }
    }

    const removeSameSpeakers = (index: number) => {
        setSameSpeakers(prev => prev.filter((_, i) => i !== index))
        setSameSpeakersIndex(sameSpeakersIndex - 1)
    }

    const handleCheckboxChange = (careerId: number, index: number) => {
        setCheckedState(prevState => {
            const currentState = prevState[careerId]

            let checkedValue = 0
            currentState.forEach((checked, i) => {
                if (i !== index && checked !== 0) {
                    checkedValue = checked
                }
            })

            let nextValue = (currentState[index] + 1) % 3 as 0 | 1 | 2

            if (checkedValue !== 0 && nextValue !== 0 && nextValue !== checkedValue) {
                nextValue = (nextValue + 1) % 3 as 0 | 1 | 2
            }

            return {
                ...prevState,
                [careerId]: prevState[careerId].map((checked, i) =>
                    i === index ? nextValue : checked
                )
            }
        })
    }

    function handleFormSubmit(data: FieldValues) {
        if (showParamsOverride) {
            setFieldValues(data)
            setShowOverrideConfirm(true)
            return
        }

        generateSchedule(data)
    }

    async function generateSchedule(data: FieldValues) {
        setLoading(true)

        try {
            if (event.eventPhase.phaseName === EVENT_PHASES.SCHEDULEGENERATED) {
                await agent.Schedule.deleteSessions(event.id)
                    .catch(error => console.log(error))
            }

            const generationParams = {
                eventId: event.id,
                maxClassSize: Number(data.maxClassSize.replace(/,/g, "")),
                minClassSize: Number(data.minClassSize.replace(/,/g, "")),
                periodCount: sessionCountValue,
                requiredPeriodForCareerList: checkedState,
                sameSpeakersForCareerList: sameSpeakers,
                careerMaxClassSizeList: careerMaxClassSizeList
            }

            const response = await agent.Schedule.generateSessions(generationParams)
            
            await agent.Schedule.saveSessions(response.allSessions)
            await agent.Event.saveScheduleParams(generationParams)
            if (showParamsOverride)
                setShowParmsOverride(false)
            else
                await agent.Event.updatePhase(event.id, findNextEventPhaseId(eventPhases, event.eventPhase.phaseName))
        } catch (error) {
            console.log(error)
        } finally {
            dispatch(reloadEvents())
            setLoading(false)
        }
    }

    return (
        <Grid container>
            <Grid container item xs={12} spacing={2} position='relative'>

                <Grid container item xs={6} sx={{ alignItems: 'flex-start', justifyContent: 'flex-start' }}>
                    <AppBackButton sx={{ left: 20, top: 16}} onClick={showParamsOverride ? () => {
                        setShowParmsOverride(false)
                        setSelectCareers(false)
                        setShowCareerMaxSize(false)
                    } : back}  />
                </Grid>
                    {event.eventPhase.phaseName === EVENT_PHASES.SURVEYCLOSED || showParamsOverride ?
                        <Grid item xs={12}>
                            {showParamsOverride &&
                                <Grid item xs={12} display='flex' pb={4} justifyContent="center">
                                    <Typography color="error" fontWeight="700" align="center" variant="h6" maxWidth="86%">
                                        Submitting new parameters will override the current schedule
                                    </Typography>
                                </Grid>
                            }
                            <form onSubmit={handleSubmit(handleFormSubmit)}>
                                <Grid container spacing={2}>
                                    <Grid container item xs={12} spacing={2} sx={{ display: 'flex', justifyContent: 'center' }}>
                                        <Grid item xs={5} sm={4} sx={{ display: 'flex', justifyContent: 'center' }}>
                                            <Grid item xs={9}>
                                                <AppNumberInput min={1} max={200000} control={control} label="Max Class Size" name="maxClassSize" />
                                            </Grid>
                                        </Grid>
                                        <Grid item xs={5} sm={4} sx={{ display: 'flex', justifyContent: 'center' }}>
                                            <Grid item xs={9}>
                                                <AppNumberInput min={0} max={200000} control={control} label="Min Class Size" name="minClassSize" />
                                            </Grid>
                                        </Grid>
                                    </Grid>

                                    <Grid container item xs={12} spacing={2} sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
                                        <Grid item xs={5} sm={4} sx={{ display: 'flex', justifyContent: 'center' }}>
                                            <Typography variant="body1"
                                                sx={{ fontSize: DEFAULT_FONT_SIZE, fontWeight: '500' }}>
                                                Number of Sessions: {sessionCountValue}
                                            </Typography>
                                        </Grid>
                                        <Grid item xs={5} sm={4} sx={{ display: 'flex', justifyContent: 'center' }}>
                                            <Typography variant="h6" sx={{ fontSize: DEFAULT_FONT_SIZE }}>
                                                Total Rooms: {totalClassrooms}
                                            </Typography>
                                        </Grid>
                                    </Grid>

                                    <Grid container item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                                        <Grid container item xs={9}>
                                            <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                                                <Typography variant="h6" sx={{ fontSize: DEFAULT_FONT_SIZE }}>
                                                    Larger Rooms:
                                                    {largeRooms.length > 0 &&
                                                        <>
                                                            <IconButton color="primary" size="small" onClick={() => setShowLargeRooms(!showLargeRooms)}>
                                                                {showLargeRooms ? <ExpandMore /> : <ExpandLess /> }
                                                            </IconButton>
                                                        </>
                                                    }
                                                </Typography>
                                            </Grid>
                                                {showLargeRooms && largeRooms.map(c => (
                                                    <Grid key={c.building + "-" + c.roomNumber} item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                                                        <Typography sx={{ display: 'flex', mx: 1, fontSize: DEFAULT_FONT_SIZE, textAlign: 'center' }}>
                                                            {c.building} - {c.roomNumber} - Size: {c.capacity}
                                                        </Typography>
                                                    </Grid>
                                                ))}
                                        </Grid>
                                    </Grid>

                                    <Grid container item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                                        <Grid item xs={6} sx={{ display: 'flex', justifyContent: 'flex-start' }}>
                                            <AppButton sx={{ alignSelf: 'center' }} variant="contained" onClick={handleSetSameSpeaker}
                                                title={selectCareers ? "You may add additional groups after saving"
                                                    : "Combining Careers allows you to count them as one career when scheduling"}
                                            >
                                                {selectCareers ? 'Save' : 'Combine Careers'}
                                            </AppButton>
                                        </Grid>
                                        <Grid item xs={6} sx={{ display: 'flex', justifyContent: 'flex-end'}}>
                                            <Typography sx={{ display: 'flex', alignItems: 'center', fontSize: DEFAULT_FONT_SIZE }}>Change career max class size</Typography>
                                            <Switch checked={showCareerMaxSize} onChange={() => setShowCareerMaxSize(!showCareerMaxSize)}/>
                                        </Grid>
                                        <Grid item xs={8} sx={{ justifyContent: 'flex-start', mt: 1 }}>
                                            {sameSpeakers.length > 0 &&
                                                <Typography sx={{ fontSize: DEFAULT_FONT_SIZE, pl: 4, textDecoration: 'underline' }}>Combined Careers</Typography>
                                            }
                                            {sameSpeakers.map((c, outIndex) => (
                                                <Grid item key={outIndex} xs={12} sx={{ display: 'flex', alignItems: 'center' }}>
                                                        <IconButton disabled={selectCareers} size="small" onClick={() => removeSameSpeakers(outIndex)} 
                                                            sx={{ pb: '6px', visibility: selectCareers ? 'hidden' : 'visible' }}
                                                        >
                                                            <Delete fontSize="small" color="error" />
                                                        </IconButton>
                                                    <Typography component="span" sx={{ fontSize: DEFAULT_FONT_SIZE }}>{outIndex + 1}.</Typography>
                                                    {c.map((cc, index) => (
                                                        <span key={cc.id}>
                                                            <Typography key={cc.id} 
                                                                sx={{ display: 'inline', pl: 1, fontSize: DEFAULT_FONT_SIZE }}>
                                                                    {cc.name}
                                                            </Typography>
                                                            {index !== c.length - 1 && <Typography sx={{ display: 'inline', px: 1 }}>-</Typography>}
                                                        </span>
                                                    ))}
                                                </Grid>
                                            ))}
                                        </Grid>
                                    </Grid>
                                    
                                    <Grid container item xs={12} sx={{ display: 'flex', justifyContent: 'left', ml: 1 }}>
                                        {selectCareers && 
                                            <Typography align="center" sx={{ fontSize: DEFAULT_FONT_SIZE }}>
                                                Please select the set of careers to combine from the list below.
                                            </Typography>
                                        }
                                    </Grid>

                                    <Grid container item xs={12}>
                                        <Grid container item xs={12} sx={{ display: 'flex', justifyContent: 'center'}}>
                                            <Typography sx={{ display: 'flex', width: '400px', fontSize: DEFAULT_FONT_SIZE }}>
                                                <Checkbox defaultChecked disabled size="small" sx={{ p: 0, '&.Mui-disabled': { color: 'primary.main' } }} />
                                                Select sessions you want to force a career to be in
                                            </Typography>
                                        </Grid>
                                        <Grid container item xs={12} sx={{ display: 'flex', justifyContent: 'center'}}>
                                            <Typography sx={{ display: 'flex', width: '400px', fontSize: DEFAULT_FONT_SIZE }}>
                                                <Checkbox defaultChecked disabled size="small" sx={{ p: 0, '&.Mui-disabled': { color: 'error.main' } }} />
                                                Select sessions you want to a career NOT to be in
                                            </Typography>
                                        </Grid>
                                    </Grid>

                                    <Grid container item xs={12}>
                                        {showCareerMaxSize ?
                                            <Grid container>
                                                <Grid item xs={4} sx={{ pl: "16px", height: '24px' }}>
                                                    <Typography fontSize={DEFAULT_FONT_SIZE}>Max</Typography>
                                                </Grid>
                                                <Grid item xs={4} sx={{ pl: "16px", height: '24px' }}>
                                                    <Typography fontSize={DEFAULT_FONT_SIZE}>Max</Typography>
                                                </Grid>
                                                <Grid item xs={4} sx={{ pl: "16px", height: '24px' }}>
                                                    <Typography fontSize={DEFAULT_FONT_SIZE}>Max</Typography>
                                                </Grid>
                                            </Grid>
                                        : <Grid container>
                                            <Grid item xs={4} sx={{ display: 'flex', flexDirection: 'row'}}>
                                                {[...Array(sessionCountValue)].map((_, index) => (
                                                    <Typography key={index} 
                                                        sx={{ width: '20px', display: 'flex', justifyContent: 'center', fontSize: DEFAULT_FONT_SIZE }}>
                                                        {index + 1}
                                                    </Typography>
                                                ))}
                                            </Grid>
                                            <Grid item xs={4} sx={{ display: 'flex', flexDirection: 'row'}}>
                                                {[...Array(sessionCountValue)].map((_, index) => (
                                                    <Typography key={index} 
                                                        sx={{ width: '20px', display: 'flex', justifyContent: 'center', fontSize: DEFAULT_FONT_SIZE }}>
                                                        {index + 1}
                                                    </Typography>
                                                ))}
                                            </Grid>
                                            <Grid item xs={4} sx={{ display: 'flex', flexDirection: 'row'}}>
                                                {[...Array(sessionCountValue)].map((_, index) => (
                                                    <Typography key={index} 
                                                        sx={{ width: '20px', display: 'flex', justifyContent: 'center', fontSize: DEFAULT_FONT_SIZE }}>
                                                        {index + 1}
                                                    </Typography>
                                                ))}
                                            </Grid>
                                        </Grid>}
                                        {event.careers.map(career => (
                                            <Grid item xs={4} key={career.id} sx={{ display: 'flex', alignItems: 'center', mb: 1}}>
                                                {showCareerMaxSize && 
                                                    <TextField type="text" name="max class size" size="small"
                                                        sx={{ minWidth: 50, width: 50, minHeight: 20, height: 20, ml: "10px",
                                                            "& .MuiOutlinedInput-input": {
                                                                p: "0 1px",
                                                                textAlign: "center",
                                                            },
                                                            '& .MuiInputBase-input': {
                                                                fontSize: DEFAULT_FONT_SIZE
                                                            },
                                                        }}
                                                        value={careerMaxClassSizeList[career.id] ?? ""}
                                                        onChange={(e) =>
                                                            updateCareerMaxSize(
                                                                career.id,
                                                                e.target.value.replace(/[^0-9]/g, "")
                                                            )
                                                        }
                                                        inputProps={{ inputMode: "numeric" }}
                                                        InputProps={{
                                                            endAdornment: (
                                                                <InputAdornment position="end" sx={{ m: 0, mr: "-10px" }}>
                                                                    <Box sx={{
                                                                            display: "flex",
                                                                            flexDirection: "column",
                                                                            alignItems: "center",
                                                                            lineHeight: 1,
                                                                        }}
                                                                    >
                                                                        <IconButton sx={{ p: 0, width: 12, height: 10 }}
                                                                            onClick={() => {
                                                                                const currentValue = Number(careerMaxClassSizeList[career.id] ?? 0)
                                                                                updateCareerMaxSize(career.id, String(currentValue + 1))
                                                                            }}
                                                                        >
                                                                            <ArrowDropUp sx={{ fontSize: 20 }} />
                                                                        </IconButton>
                                                                        <IconButton sx={{ p: 0, width: 12, height: 10 }}
                                                                            onClick={() => {
                                                                                const currentValue = Number(careerMaxClassSizeList[career.id] ?? 0)
                                                                                if (currentValue > 0) {
                                                                                    updateCareerMaxSize(career.id, String(currentValue - 1))
                                                                                }
                                                                            }}
                                                                        >
                                                                            <ArrowDropDown sx={{ fontSize: 20 }} />
                                                                        </IconButton>
                                                                    </Box>
                                                                </InputAdornment>
                                                            )
                                                        }}
                                                    />
                                                }
                                                {!showCareerMaxSize && [...Array(sessionCountValue)].map((_, index) => (
                                                    <TriStateCheckbox key={index}
                                                        value={checkedState[career.id][index]}
                                                        handleChange={() => handleCheckboxChange(career.id, index)} />
                                                ))}
                                                    <Typography variant="body2" 
                                                        sx={{ ml: 1, cursor: selectCareers ? 'pointer' : 'default', 
                                                            '&:hover': {
                                                                bgcolor: selectCareers ? 'action.focus' : 'transparent'
                                                            },
                                                            fontSize: DEFAULT_FONT_SIZE }}
                                                        onClick={selectCareers ? () => handleAddSameSpeaker(career) : undefined}
                                                    >
                                                        {career.name}
                                                    </Typography>
                                            </Grid>
                                        ))}
                                    </Grid>

                                    <Grid container item xs={12}>
                                        <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'center', pb: 2 }}>
                                            <AppLoadingButton disabled={!isDirty && !hasChanges} loading={loading} type="submit" variant="contained">
                                                Generate {showParamsOverride && "New"} Schedule
                                            </AppLoadingButton>
                                        </Grid>
                                    </Grid>
                                </Grid>
                            </form>
                        </Grid>
                :
                    <SessionView event={event} setShowParamsOverride={setShowParmsOverride} />
                }
            </Grid>
            <OverrideScheduleDialog data={fieldValues} generateSchedule={generateSchedule}
                open={showOverrideConfirm} handleClose={() =>setShowOverrideConfirm(false)} />
        </Grid>

    )
}