import { useState } from "react"
import { Session } from "../../app/models/session"
import { Speaker } from "../../app/models/speaker"
import { Button, Dialog, DialogActions, DialogContent, DialogTitle, Table, TableBody, TableCell, TableHead, TableRow, Typography } from "@mui/material"
import { Delete } from "@mui/icons-material"
import PropagateSpeakerAssign from "./PropagateSpeakerAssign"

interface Props {
    session: Session
    availableSpeakers: Speaker[]
    updateSpeakers: (session: Session, speakers: Speaker[], propagate: boolean) => void
    triggerRefresh: () => void
    open: boolean
    handleClose: () => void
}

export default function EditSpeakers({ session, availableSpeakers, updateSpeakers, triggerRefresh, open, handleClose }: Props) {
    const [currentSpeakers, setCurrentSpeakers] = useState<Speaker[]>(session.speakers)
    const [showPropConfirm, setShowPropConfirm] = useState(false)

    const removeSpeaker = (speaker: Speaker) => {
        setCurrentSpeakers(prev => prev?.filter(s => s.id !== speaker.id))
    }

    const addSpeaker = (speaker: Speaker) => {
        setCurrentSpeakers(prev => [...prev, speaker])
    }

    const saveSpeakers = (propagate: boolean) => {
        updateSpeakers(session, currentSpeakers, propagate)
        if (propagate) triggerRefresh()
    }

    const cancel = () => {
        setCurrentSpeakers(session.speakers)
        handleClose()
    }

    return (
        <>
            <Dialog open={open} onClose={cancel}>
                <DialogTitle>
                    Edit Speakers for Session {session.period} - {session.subject.name}
                </DialogTitle>
                <DialogContent>
                    Current Speakers: 
                    {currentSpeakers.map(s => 
                        <Typography key={s.id}>
                            {s.firstName} {s.middleName} {s.lastName} 
                            <Button startIcon={<Delete />} color="error" sx={{ p: 0 }} onClick={() => removeSpeaker(s)} />
                        </Typography>
                    )}

                    <Table>
                        <TableHead>
                            <TableRow>
                                <TableCell>Speaker</TableCell>
                                <TableCell>Careers</TableCell>
                            </TableRow>
                        </TableHead>

                        <TableBody>
                            {availableSpeakers.filter(s => !currentSpeakers.some(sp => sp.id === s.id)
                                ).map(speaker => (
                                    <TableRow key={speaker.id} sx={{ cursor: "pointer"}} hover
                                        onClick={() => addSpeaker(speaker)}
                                    >
                                        <TableCell>{[speaker.firstName, speaker.middleName, speaker.lastName].filter(Boolean).join(" ")}</TableCell>
                                        <TableCell>{speaker.careers?.map(c => c.name).join(", ")}</TableCell>
                                    </TableRow>
                                )
                            )}
                        </TableBody>
                    </Table>
                </DialogContent>
                <DialogActions>
                    <Button onClick={cancel}>Cancel</Button>
                    <Button onClick={() => setShowPropConfirm(true)}>Save</Button>
                </DialogActions>
            </Dialog>

            <PropagateSpeakerAssign open={showPropConfirm}
                currentSpeakers={currentSpeakers}
                session={session}
                handleClose={(propagate: boolean) => {
                    triggerRefresh()
                    setShowPropConfirm(false)
                    saveSpeakers(propagate)
                    handleClose()
                }}
            />
        </>
    )
}