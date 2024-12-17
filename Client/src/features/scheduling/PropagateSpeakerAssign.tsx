import { Button, Dialog, DialogActions, DialogContent, DialogTitle, Typography } from "@mui/material"
import { Session } from "../../app/models/session"
import { Speaker } from "../../app/models/speaker"

interface Props {
    open: boolean
    session: Session
    currentSpeakers: Speaker[]
    handleClose: (propagate: boolean) => void
}

export default function PropagateSpeakerAssign({ open, session, currentSpeakers, handleClose }: Props) {
    return (
        <Dialog open={open} onClose={() => handleClose(false)}>
            <DialogTitle>Assign speaker(s) to same Career?</DialogTitle>
            <DialogContent>
                <Typography>
                    Would you like to assign speaker(s): {currentSpeakers.map(s =>
                        s.firstName + " " + s.middleName + " " + s.lastName
                    ).join(", ")} to {session.subject.name} in other sessions?
                </Typography>
            </DialogContent>
            <DialogActions>
                <Button onClick={() => handleClose(true)}>Yes</Button>
                <Button onClick={() => handleClose(false)}>No</Button>
            </DialogActions>
        </Dialog>
    )
}