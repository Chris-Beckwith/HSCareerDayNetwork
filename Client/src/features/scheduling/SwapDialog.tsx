import { Button, Dialog, DialogActions, DialogContent, DialogTitle, Grid, Paper, Typography } from "@mui/material";
import { Student } from "../../app/models/student";
import { Session } from "../../app/models/session";
import { useEffect, useState } from "react";
import { Survey } from "../../app/models/survey";
import SessionDisplay from "./components/SessionDisplay";
import ConfirmLessSwap from "./components/ComfirmLessSwap";
import ConfirmSwap from "./components/ConfirmSwap";

interface Props {
    swapStudent: Student | undefined
    swapSurvey: Survey | undefined
    sessions: Session[]
    open: boolean
    handleClose: () => void
}

export default function SwapDialog({ swapStudent, swapSurvey, sessions, open, handleClose }: Props) {
    const [studentSessions, setStudentSessions] = useState<Session[]>([])
    const [availableSessions, setAvailableSessions] = useState<Session[]>([])
    const [altAvailSessions, setAltAvailSessions] = useState<Session[]>([])
    const [periods, setPeriods] = useState<number[]>([])
    const [selectedSessions, setSelectedSessions] = useState<Session[]>([])
    const [showLessConfirm, setShowLessConfirm] = useState(false)
    const [showSwapConfirm, setShowSwapConfirm] = useState(false)

    useEffect(() => {
        if (swapStudent) {
            setStudentSessions(
                sessions.filter(s => s.students.some(st => st.id === swapStudent.id))
            )
        }
    }, [sessions, swapStudent])

    useEffect(() => {
        if (swapSurvey) {
            setAvailableSessions(
                sessions.filter(s => 
                    swapSurvey.primaryCareers.some(pc => pc.id === s.subject.id) &&
                    !studentSessions.some(ss => ss.id === s.id)
                )
            )
            setAltAvailSessions(
                sessions.filter(s => 
                    swapSurvey.alternateCareers.some(ac => ac.id === s.subject.id) &&
                    !studentSessions.some(ss => ss.id === s.id)
                )
            )
            setSelectedSessions(studentSessions)
            setPeriods(
                Array.from({ length: swapSurvey.primaryCareers.length }, (_, i) => i + 1)
            )
        }
    }, [sessions, studentSessions, swapSurvey])

    const handleSelectSession = (session: Session) => {
        if (selectedSessions.some(s => s.id === session.id)) {
            setSelectedSessions(prev => prev.filter(s => s.id !== session.id))
        } else {
            setSelectedSessions(prev => {
                const updatedSessions = prev.filter(s => s.period !== session.period && s.subject.id !== session.subject.id)
                
                return [...updatedSessions, session]
            })
        }
    }

    const confirmSave = () => {
        if (selectedSessions.length < studentSessions.length) {
            setShowLessConfirm(true)
        } else {
            setShowSwapConfirm(true)
        }
    }

    const handleSave = () => {
        if (swapStudent) {
            //Remove from unselected sessions
            studentSessions.forEach(s => {
                if (!selectedSessions.some(sel => sel.id === s.id)) {
                    const index = s.students.findIndex(st => st.id === swapStudent.id)
                    if (index !== -1) {
                        s.students.splice(index, 1)
                    }
                }
            })

            //Add to selected sessions
            selectedSessions.forEach(s => {
                const isAdded = s.students.some(st => st.id === swapStudent.id)
                if (!isAdded) {
                    s.students.push(swapStudent)
                }
            })
        }
        setShowSwapConfirm(false)
        handleClose()
    }

    return (
        <>
            <Dialog open={open} onClose={handleClose} maxWidth="lg" fullWidth={true}>
                <DialogTitle>Swap Sessions for {swapStudent?.lastFirstName}</DialogTitle>

                <DialogContent>
                    <Grid container>
                        <Grid container item xs={12}>
                            <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', pb: 1 }}>
                                <Typography sx={{ pr: 1 }}><strong>Primary Choices:</strong></Typography>
                                {swapSurvey?.primaryCareers.map(c => (
                                    <Paper key={c.id} elevation={4} sx={{ px: 1, mr: 1, bgcolor: 'primary.light' }}>{c.name}</Paper>
                                ))}
                            </Grid>
                            <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center', pb: 1 }}>
                                <Typography sx={{ pr: 1 }}><strong>Alternate Choices:</strong></Typography>
                                {swapSurvey?.alternateCareers.map(c => (
                                    <Paper key={c.id} elevation={4} sx={{ px: 1, mr: 1, bgcolor: 'warning.light' }}>{c.name}</Paper>
                                ))}
                            </Grid>
                        </Grid>

                        <SessionDisplay title="Current Sessions:" selectedSessions={selectedSessions} handleSelectSession={handleSelectSession}
                            periods={periods} sessions={studentSessions} alternateCareers={swapSurvey?.alternateCareers} />

                        <SessionDisplay title="Primary Sessions:" selectedSessions={selectedSessions} handleSelectSession={handleSelectSession}
                            periods={periods} sessions={availableSessions} />
                        
                        <SessionDisplay title="Alternate Sessions:" selectedSessions={selectedSessions} handleSelectSession={handleSelectSession}
                            periods={periods} sessions={altAvailSessions} isAlt={true} />
                        
                    </Grid>
                </DialogContent>

                <DialogActions>
                    <Button disabled={selectedSessions.length === 0} onClick={confirmSave}>Save</Button>
                    <Button onClick={handleClose}>Cancel</Button>
                </DialogActions>
            </Dialog>

            <ConfirmLessSwap open={showLessConfirm} handleClose={() => setShowLessConfirm(false)} setShowSwapConfirm={setShowSwapConfirm} />
            <ConfirmSwap open={showSwapConfirm} handleClose={() => setShowSwapConfirm(false)} 
                student={swapStudent} selectedSessions={selectedSessions} handleSave={handleSave}/>
        </>
    )
}