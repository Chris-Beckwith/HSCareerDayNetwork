import { Box, Button, Grid, Typography } from "@mui/material"
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

interface Props {
    event: CareerEvent
    back: () => void
}

// const steps = ['Initial Page', 'Session View']

export default function SchedulingTool({ event, back }: Props) {
    const [loading, setLoading] = useState(false)
    const [activeStep, setActiveStep] = useState(0)
    const [sessions, setSessions] = useState<Session[]>([])
    const [unplacedStudents, setUnplacedStudents] = useState<UnplacedStudent[]>([])
    // const [stdRoomSize, setStdRoomSize] = useState(0)

    const { control, handleSubmit } = useForm({
        resolver: yupResolver<any>(schedulingValidationSchema)
    })

    async function generateSchedule(data: FieldValues) {
        setLoading(true)

        console.log(data)
        console.log(event.id)

        try {
            agent.Schedule.generateSessions(event.id, data.stdRoomSize)
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
                    <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                        {activeStep == 0 ?
                            (
                                <form onSubmit={handleSubmit(generateSchedule)}>
                                    <Box display='flex' flexDirection='column' gap={2}>
                                        <Typography variant="h5">Enter Standard Room Size</Typography>
                                        <AppTextInput control={control} label="Standard Room Size" name="stdRoomSize" />
                                        <LoadingButton loading={loading} type="submit" variant="contained">
                                            Generate Schedule
                                        </LoadingButton>
                                    </Box>
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