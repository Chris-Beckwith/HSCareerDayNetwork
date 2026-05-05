import { Button, Dialog, DialogActions, DialogContent, DialogTitle, Typography } from "@mui/material";
import { Session } from "../../app/models/session";
import { Classroom } from "../../app/models/classroom";
import { getClassroomText } from "../../app/util/displayUtil";
import { DEFAULT_FONT_SIZE } from "../../app/util/constants";

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
                <Typography sx={{ fontSize: DEFAULT_FONT_SIZE }}>
                    Would you like to assign room {getClassroomText(currentRoom)} to {session.subject.name} in other sessions?
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