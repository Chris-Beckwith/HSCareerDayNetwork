import { Button, Dialog, DialogActions, DialogContent, DialogTitle, Grid, Paper, Typography } from "@mui/material";
import { UnplacedStudent } from "./SessionView";
import { Session } from "../../app/models/session";
import { useEffect, useState } from "react";
import { ScheduleParams } from "../../app/models/scheduleParams";

interface Props {
    placementStudent: UnplacedStudent | undefined
    sessions: Session[]
    unplacedStudents: UnplacedStudent[]
    scheduleParams: ScheduleParams | undefined
    open: boolean
    handleClose: () => void
}

export default function PlacementDialog({ placementStudent, sessions, unplacedStudents, scheduleParams, open, handleClose }: Props) {
    const [placementSessions, setPlacementSessions] = useState<Session[]>([])
    const [placedSessions, setPlacedSessions] = useState<Session[]>([])
    const [noAltMatch, setNoAltMatch] = useState(false)
    const [selectedSession, setSelectedSession] = useState<Session>()

    useEffect(() => {
        if (placementStudent) {
            const newPlacedSessions = sessions.filter(s => s.students.some(st => st.id === placementStudent.student.id))
            setPlacedSessions(newPlacedSessions)

            const availableSessions = sessions.filter(s =>
                s.period === placementStudent.period
                && !newPlacedSessions.some(pc => pc.subject.id === s.subject.id)
                && placementStudent.altCareers.some(alt => alt.id === s.subject.id)
                && (scheduleParams?.maxClassSize === undefined || s.students.length < scheduleParams.maxClassSize)
            )

            if (availableSessions.length === 0) {
                setNoAltMatch(true)
                setPlacementSessions(
                    sessions.filter(s => s.period === placementStudent.period 
                        && !newPlacedSessions.some(pc => pc.subject.id === s.subject.id)
                        && (scheduleParams?.maxClassSize === undefined || s.students.length < scheduleParams.maxClassSize)
                    )
                )
            } else {
                setPlacementSessions(availableSessions)
                setNoAltMatch(false)
            }
        }
    }, [placementStudent, scheduleParams?.maxClassSize, sessions])

    const handleSelectSession = (session: Session) => {
        if (selectedSession === session) {
            setSelectedSession(undefined)
        } else {
            setSelectedSession(session)
        }
    }

    const onClose = () => {
        setSelectedSession(undefined)
        handleClose()
    }

    const onPlace = () => {
        if (placementStudent && selectedSession) {
            selectedSession.students.push(placementStudent.student)
            let index = unplacedStudents.findIndex(u => u.student.id === placementStudent.student.id)
            while (index !== -1) {
                unplacedStudents.splice(index, 1)
                index = unplacedStudents.findIndex(u => u.student.id === placementStudent.student.id)
            }
        }
        onClose()
    }

    return (
        <Dialog open={open} onClose={onClose} maxWidth="md">
            <DialogTitle>Choose Alternate Career for {placementStudent?.student.lastFirstName}</DialogTitle>

            <DialogContent>
                <Grid container spacing={1} sx={{ pb: 1 }}>
                    <Grid container item xs={6}>
                        <Grid item xs={12}>
                            <Typography variant="h6">Placed Careers:</Typography>
                        </Grid>
                        {placedSessions.map(s =>
                            <Grid item xs={12} key={s.subject.id} sx={{ pl: 1 }}>
                                <Typography>{s.subject.name}</Typography>
                            </Grid>
                        )}
                        <Typography sx={{ pl: 1 }}>{placementStudent?.career.name} <em>(unplaced)</em></Typography>
                    </Grid>

                    <Grid container item xs={6}>
                        <Grid item xs={12}>
                            <Typography variant="h6">Alternate Choices:</Typography>
                        </Grid>
                        {placementStudent?.altCareers.map(c =>
                            <Grid item xs={12} key={c.id} sx={{ pl: 1 }}>
                                <Typography>{c.name}</Typography>
                            </Grid>
                        )}
                    </Grid>
                </Grid>
                
                {noAltMatch &&
                    <Grid container item xs={12} sx={{ display: 'flex', justifyContent: 'center', pb: 1 }}>
                        <Typography variant="body1" color="error.main">
                            <strong>No alternate session available, Please choose another career</strong>
                        </Typography>
                    </Grid>}

                <Grid container spacing={1}>
                    {placementSessions.map(s =>
                        <Grid container item key={s.subject.id} xs={6}>
                            <Paper elevation={8}
                                onClick={() => handleSelectSession(s)}
                                sx={{ 
                                    p: 1, width: '100%', 
                                    cursor: selectedSession === undefined || selectedSession === s ? 'pointer' : 'default',
                                    bgcolor: selectedSession === s ? 'primary.light' : undefined,
                                    '&:hover': selectedSession === undefined || selectedSession === s ? { bgcolor: 'lightgray' } : {}
                                }}
                            >
                                <Grid item xs={12}>
                                    <Typography variant="h6" color="primary.dark">{s.subject.name}</Typography>
                                </Grid>
                                <Grid item xs={12}>
                                    <Typography>Session: {s.period}</Typography>
                                </Grid>
                                <Grid item xs={12}>
                                    <Typography>Number of Students: {s.students.length}</Typography>
                                </Grid>
                            </Paper>
                        </Grid>
                    )}
                </Grid>
            </DialogContent>

            <DialogActions>
                <Button disabled={selectedSession === undefined} onClick={onPlace}>Place</Button>
                <Button onClick={onClose}>Cancel</Button>
            </DialogActions>
        </Dialog>
    )
}