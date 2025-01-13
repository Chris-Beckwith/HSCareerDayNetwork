import { Button, Checkbox, Grid, Typography } from "@mui/material"
import { CareerEvent } from "../../app/models/event"
import { LoadingButton } from "@mui/lab"
import { useEffect, useState } from "react"
import SessionView, { UnplacedStudent } from "./SessionView"
import { FieldValues, useForm } from "react-hook-form"
import { yupResolver } from "@hookform/resolvers/yup"
import { schedulingValidationSchema } from "./schedulingValidation"
import AppTextInput from "../../app/components/AppTextInput"
import { Session } from "../../app/models/session"
import agent from "../../app/api/agent"
import useClassrooms from "../../app/hooks/useClassrooms"
import { Career } from "../../app/models/career"
import { findNextEventPhaseId } from "../../app/util/util"
import { useAppDispatch, useAppSelector } from "../../app/store/configureStore"
import { reloadEvents } from "../careerEvents/careerEventSlice"
import { EVENT_PHASES } from "../../app/util/constants"
import { reloadClassrooms } from "../classroom/classroomSlice"
import SessionViewSkeleton from "./SessionViewSkeleton" 
import TriStateCheckbox from "./components/TriStateCheckbox"

interface Props {
    event: CareerEvent
    back: () => void
}

interface CheckedState {
    [key: number]: (0 | 1 | 2)[]
}

export default function SchedulingTool({ event, back }: Props) {
    const dispatch = useAppDispatch()
    const { classrooms, metaData } = useClassrooms(event.school.id, 500)
    const [loading, setLoading] = useState(false)
    const [loadingSessions, setLoadingSessions] = useState(false)
    const [activeStep, setActiveStep] = useState(0)
    const [sessions, setSessions] = useState<Session[]>([])
    const [periodCounts, setPeriodCounts] = useState<number[]>([])
    const [unplacedStudents, setUnplacedStudents] = useState<UnplacedStudent[]>([])
    const [selectCareers, setSelectCareers] = useState(false)
    const [sameSpeakers, setSameSpeakers] = useState<Career[][]>([])
    const [sameSpeakersIndex, setSameSpeakersIndex] = useState(0)
    const { eventPhases } = useAppSelector(state => state.careerEvents)

    useEffect(() => {
        if (event.eventPhase.phaseName === EVENT_PHASES.SESSIONSGENERATED) {
            setLoadingSessions(true)
            setActiveStep(1)
            agent.Schedule.getSessionsAndUnplaced(event.id)
                .then(response => {
                    setSessions(response.allSessions)
                    setUnplacedStudents(response.unplacedStudents)
                })
                .catch(error => console.log(error))
                .finally(() => {
                    reloadClassrooms()
                    setLoadingSessions(false)
                })
        }
    }, [event.eventPhase.phaseName, event.id])

    const { control, handleSubmit, watch } = useForm({
        resolver: yupResolver<any>(schedulingValidationSchema),
        defaultValues: {
            sessionCount: 3
        }
    })
    
    const maxClassSizeValue = watch('maxClassSize')
    const sessionCountValue = watch('sessionCount') || 3
    
    const [checkedState, setCheckedState] = useState<CheckedState>(
        event.careers.reduce((acc: CheckedState, career) => {
            acc[career.id] = Array(sessionCountValue).fill(0);
            return acc;
        }, {} as CheckedState)
    )

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

    async function generateSchedule(data: FieldValues) {
        setLoading(true)

        const generationParams = {
            eventId: event.id,
            maxClassSize: data.maxClassSize,
            minClassSize: data.minClassSize,
            periodCount: sessionCountValue,
            requiredPeriodForCareerList: checkedState,
            sameSpeakersForCareerList: sameSpeakers
        }

        console.log("PARAMS: ", generationParams)

        try {
            agent.Schedule.generateSessions(generationParams)
                .then(response => {
                    setSessions(response.allSessions)
                    setPeriodCounts(response.periodCounts)
                    setUnplacedStudents(response.unplacedStudents)
                    setActiveStep(activeStep + 1)
                })
                .catch(error => console.log(error))
                .finally(() => setLoading(false))
        } catch (error) {
            console.log(error)
        }
    }

    async function SaveSchedule() {
        setLoading(true)

        const isSave = event.eventPhase.phaseName === EVENT_PHASES.SURVEYCLOSED

        try {
            if (isSave)
                await agent.Schedule.saveSessions(sessions)
            else
                await agent.Schedule.updateSessions(sessions)
                
            try {
                if (isSave) {
                    await agent.Event.updatePhase(event.id, 
                        findNextEventPhaseId(eventPhases, event.eventPhase.phaseName))
                }
            } catch (error) {
                console.log(error)
            } finally {
                dispatch(reloadEvents())
            }
            back()
        } catch (error) {
            console.log(error)
        }

        setLoading(false)
    }

    const getStepContent = (step: number) => {
        switch (step) {
            case 0: return;
            case 1: 
                if (loadingSessions)
                    return <SessionViewSkeleton event={event} />
                else
                    return <SessionView event={event} sessions={sessions} periodCounts={periodCounts} classrooms={classrooms} unplacedStudents={unplacedStudents} />
            default:
                throw new Error('Unknown step')
        }
    }

    return (
        <Grid container>
            <Grid container item xs={12}>

                <Grid container item xs={6} sx={{ alignItems: 'flex-start', justifyContent: 'flex-start' }}>
                    <Button variant="contained" onClick={back}>Back to Event</Button>
                </Grid>

                {activeStep === 1 &&
                    <Grid container item xs={6} sx={{ alignItems: 'flex-end', justifyContent: 'flex-end' }}>
                        <LoadingButton loading={loading} variant="contained" onClick={SaveSchedule}>Save Schedule</LoadingButton>
                    </Grid>
                }

                <Grid container item xs={12}>
                    <Grid item xs={12}>
                        {activeStep === 0 ?
                            (
                                <form onSubmit={handleSubmit(generateSchedule)}>
                                    <Grid container spacing={2}>
                                        <Grid container item xs={12} spacing={2} sx={{ display: 'flex', justifyContent: 'center' }}>
                                            <Grid item xs={2}>
                                                <Typography variant="h6">Max Class Size</Typography>
                                                <AppTextInput control={control} label="Max Class Size" name="maxClassSize" />
                                            </Grid>
                                            <Grid item xs={2}>
                                                <Typography variant="h6">Min Class Size</Typography>
                                                <AppTextInput control={control} label="Min Class Size" name="minClassSize" />
                                            </Grid>
                                        </Grid>

                                        <Grid container item xs={12} spacing={2} sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
                                            <Grid item xs={2}>
                                                <Typography variant="body1" sx={{ fontSize: '1.1em', fontWeight: '500' }}>Number of Sessions</Typography>
                                            </Grid>
                                            <Grid item xs={2} sx={{ display: 'flex', justifyContent: 'flex-start' }}>
                                                <AppTextInput disabled control={control} label="Number of Sessions" name="sessionCount" />
                                            </Grid>
                                        </Grid>

                                        <Grid container item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                                            <Grid container item xs={3} sx={{ display: 'flex', justifyContent: 'center' }}>
                                                <Typography variant="h6">Total Rooms: {metaData?.totalCount}</Typography>
                                            </Grid>
                                            <Grid container item xs={3} sx={{ display: 'flex', justifyContent: 'center' }}>
                                                <Typography variant="h6">Larger Rooms:</Typography>
                                                {classrooms.filter(c => maxClassSizeValue > 0 && c.capacity > maxClassSizeValue).map(c => (
                                                    <Typography key={c.building + "-" + c.roomNumber} sx={{ display: 'flex', alignItems: 'center', mx: 1}}>
                                                        {c.building} - {c.roomNumber} - Size: {c.capacity}
                                                    </Typography>
                                                ))}
                                            </Grid>
                                        </Grid>
                                        
                                        <Grid container item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                                            <Typography variant="body1">
                                                Click Same Speakers to allow careers to use the same speakers.  This will combine classes for the selected careers.
                                            </Typography>
                                            {selectCareers && 
                                                <Typography>
                                                    Click save to add same speaker grouping.  You may add another group after saving a group.
                                                </Typography>
                                            }
                                        </Grid>

                                        <Grid container item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                                            <Grid item xs={3} sx={{ display: 'flex', justifyContent: 'center', alignItems: 'start' }}>
                                                <Button variant="contained" onClick={handleSetSameSpeaker}>
                                                    {selectCareers ? 'Save' : 'Same Speakers'}
                                                </Button>
                                            </Grid>
                                            <Grid item xs={8} sx={{ justifyContent: 'flex-start' }}>
                                                {sameSpeakers.map((c, outIndex) => (
                                                    <Grid item key={outIndex} xs={12}>
                                                        <span>{outIndex + 1}.</span>
                                                        {c.map((cc, index) => (
                                                            <span key={cc.id}>
                                                                <Typography key={cc.id} sx={{ display: 'inline', pl: 1 }}>{cc.name}</Typography>
                                                                {index !== c.length - 1 && <Typography sx={{ display: 'inline', px: 1 }}>-</Typography>}
                                                            </span>
                                                        ))}
                                                    </Grid>
                                                ))}
                                            </Grid>
                                        </Grid>

                                        <Grid container item xs={12}>
                                            <Grid container item xs={12} sx={{ display: 'flex', justifyContent: 'center'}}>
                                                <Typography sx={{ display: 'flex', width: '400px'}}>
                                                    <Checkbox defaultChecked disabled size="small" sx={{ p: 0, '&.Mui-disabled': { color: 'primary.main' } }} />
                                                    Select sessions you want to force a career to be in
                                                </Typography>
                                            </Grid>
                                            <Grid container item xs={12} sx={{ display: 'flex', justifyContent: 'center'}}>
                                                <Typography sx={{ display: 'flex', width: '400px' }}>
                                                    <Checkbox defaultChecked disabled size="small" sx={{ p: 0, '&.Mui-disabled': { color: 'error.main' } }} />
                                                    Select sessions you want to a career NOT to be in
                                                </Typography>
                                            </Grid>
                                        </Grid>

                                        <Grid item xs={1}></Grid>
                                        <Grid container item xs={11}>
                                            <Grid container>
                                                <Grid item xs={4} sx={{ display: 'flex', flexDirection: 'row'}}>
                                                    {[...Array(sessionCountValue)].map((_, index) => (
                                                        <Typography key={index} sx={{ width: '20px', display: 'flex', justifyContent: 'center' }}>
                                                            {index + 1}
                                                        </Typography>
                                                    ))}
                                                </Grid>
                                                <Grid item xs={4} sx={{ display: 'flex', flexDirection: 'row'}}>
                                                    {[...Array(sessionCountValue)].map((_, index) => (
                                                        <Typography key={index} sx={{ width: '20px', display: 'flex', justifyContent: 'center' }}>
                                                            {index + 1}
                                                        </Typography>
                                                    ))}
                                                </Grid>
                                                <Grid item xs={4} sx={{ display: 'flex', flexDirection: 'row'}}>
                                                    {[...Array(sessionCountValue)].map((_, index) => (
                                                        <Typography key={index} sx={{ width: '20px', display: 'flex', justifyContent: 'center' }}>
                                                            {index + 1}
                                                        </Typography>
                                                    ))}
                                                </Grid>
                                            </Grid>
                                            {event.careers.map(career => (
                                                <Grid item xs={4} key={career.id} sx={{ display: 'flex', alignItems: 'center'}}>
                                                    {[...Array(sessionCountValue)].map((_, index) => (
                                                        <TriStateCheckbox key={index}
                                                            value={checkedState[career.id][index]}
                                                            handleChange={() => handleCheckboxChange(career.id, index)} />
                                                    ))}
                                                        <Typography variant="body2" 
                                                            sx={{ ml: 1, cursor: selectCareers ? 'pointer' : 'default', '&:hover': {
                                                                bgcolor: selectCareers ? 'lightgray' : 'transparent'
                                                            } }}
                                                            onClick={selectCareers ? () => handleAddSameSpeaker(career) : undefined}
                                                        >
                                                            {career.name}
                                                        </Typography>
                                                </Grid>
                                            ))}
                                        </Grid>

                                        <Grid container item xs={12}>
                                            <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'center', pb: 2 }}>
                                                <LoadingButton loading={loading} type="submit" variant="contained">
                                                    Generate Schedule
                                                </LoadingButton>
                                            </Grid>
                                        </Grid>
                                    </Grid>
                                </form>
                            ) : (
                                <>
                                    {getStepContent(activeStep)}
                                </>
                            )}
                    </Grid>
                </Grid>

            </Grid>
        </Grid>
    )
}