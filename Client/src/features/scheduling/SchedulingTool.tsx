import { Button, Checkbox, Grid, Typography } from "@mui/material"
import { CareerEvent } from "../../app/models/event"
import { LoadingButton } from "@mui/lab"
import { useState } from "react"
import SessionView, { UnplacedStudent } from "./SessionView"
import { FieldValues, useForm } from "react-hook-form"
import { yupResolver } from "@hookform/resolvers/yup"
import { schedulingValidationSchema } from "./schedulingValidation"
import AppTextInput from "../../app/components/AppTextInput"
import { Session } from "../../app/models/session"
import agent from "../../app/api/agent"
import useClassrooms from "../../app/hooks/useClassrooms"
import { Career } from "../../app/models/career"

interface Props {
    event: CareerEvent
    back: () => void
}

interface CheckedState {
    [key: number]: boolean[]
}

// const steps = ['Initial Page', 'Session View']

export default function SchedulingTool({ event, back }: Props) {
    const { classrooms, metaData } = useClassrooms(event.school.id, 500)
    const [loading, setLoading] = useState(false)
    const [activeStep, setActiveStep] = useState(0)
    const [sessions, setSessions] = useState<Session[]>([])
    const [unplacedStudents, setUnplacedStudents] = useState<UnplacedStudent[]>([])
    const [selectCareers, setSelectCareers] = useState(false)
    const [sameSpeakers, setSameSpeakers] = useState<Career[][]>([])
    const [sameSpeakersIndex, setSameSpeakersIndex] = useState(0)

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
            acc[career.id] = Array(sessionCountValue).fill(false);
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
        setCheckedState(prevState => ({
            ...prevState,
            [careerId]: prevState[careerId].map((checked, i) => (i === index ? !checked : checked)),
        }))
    }

    async function generateSchedule(data: FieldValues) {
        setLoading(true)

        console.log("Data: ", data)
        console.log("Event ID: ", event.id)
        console.log("Session Count: ", sessionCountValue)
        console.log("Checked State: ", checkedState)
        console.log("Same Speakers: ", sameSpeakers)

        const generationParams = {
            eventId: event.id,
            maxClassSize: data.maxClassSize,
            minClassSize: data.minClassSize,
            periodCount: sessionCountValue,
            requiredPeriodForCareerList: checkedState,
            sameSpeakersForCareerList: sameSpeakers
        }

        console.log(generationParams)

        try {
            agent.Schedule.generateSessions(generationParams)
                .then((response) => {
                    console.log(response.allSessions)
                    console.log(response.unplacedStudents)
                    setSessions(response.allSessions)
                    setUnplacedStudents(response.unplacedStudents)
                    setActiveStep(activeStep + 1)
                })
                .catch(error => console.log(error))
                .finally(() => setLoading(false))
        } catch (error) {
            console.log(error)
        }
    }

    const getStepContent = (step: number) => {
        switch (step) {
            case 0: return;
            case 1: return <SessionView sessions={sessions} unplacedStudents={unplacedStudents} />
            case 2:
            case 3:
            default:
                throw new Error('Unknown step')
        }
    }

    return (
        <Grid container>
            <Grid container item xs={12}>

                <Grid container item xs={12} sx={{ alignItems: 'flex-start', justifyContent: 'flex-start' }}>
                    <Button variant="contained" onClick={back}>Back to Event</Button>
                </Grid>

                <Grid container item xs={12}>
                    <Grid item xs={12}>
                        {activeStep == 0 ?
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
                                            <Grid item xs={3} sx={{ display: 'flex', justifyContent: 'center', alignItems: 'start' }}>
                                                <Button variant="contained" onClick={handleSetSameSpeaker}>
                                                    {selectCareers ? 'Save' : 'Same Speakers'}
                                                </Button>
                                            </Grid>
                                            <Grid item xs={8} sx={{ justifyContent: 'flex-start' }}>
                                                {sameSpeakers.map((c, outIndex) => (
                                                    <Grid item key={outIndex} xs={12}>
                                                        {c.map((cc, index) => (
                                                            <span key={cc.id}>
                                                                <Typography key={cc.id} sx={{ display: 'inline' }}>{cc.name}</Typography>
                                                                {index !== c.length - 1 && <Typography sx={{ display: 'inline', px: 1 }}>-</Typography>}
                                                            </span>
                                                        ))}
                                                    </Grid>
                                                ))}
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
                                                        <Checkbox key={index} size="small" sx={{ p: 0 }}
                                                            checked={checkedState[career.id][index]}
                                                            onChange={() => handleCheckboxChange(career.id, index)} />
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