import { Button, Dialog, DialogActions, DialogContent, DialogTitle, Typography } from "@mui/material";
import { Session } from "../../app/models/session";
import { Classroom } from "../../app/models/classroom";

interface Props {
    open: boolean
    session: Session
    currentRoom: Classroom | undefined
    addClassroom: (session: Session, classroom: Classroom | undefined, propagate: boolean) => void
    handleClose: () => void
}

export default function PropagateRoomAssign({ open, session, currentRoom, addClassroom, handleClose }: Props) {
    return (
        <Dialog open={open} onClose={handleClose}>
            <DialogTitle>Assign room to same Career?</DialogTitle>
            <DialogContent>
                <Typography>
                    Would you like to assign room {currentRoom?.building}{currentRoom?.roomNumber} to {session.subject.name} in other sessions?
                </Typography>
            </DialogContent>
            <DialogActions>
                <Button onClick={() => {
                    addClassroom(session, currentRoom, true)
                    handleClose()
                }}>
                    Yes
                </Button>
                <Button onClick={handleClose}>No</Button>
            </DialogActions>
        </Dialog>
    )
}