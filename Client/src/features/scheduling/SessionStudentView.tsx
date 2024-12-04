import { Button, Dialog, DialogActions, DialogContent, DialogTitle, List, ListItem } from "@mui/material";
import { Session } from "../../app/models/session";

interface Props {
    session: Session
    open: boolean
    handleClose: () => void
}

export default function SessionStudentView({ session, open, handleClose }: Props) {
    return (
        <Dialog open={open} onClose={handleClose}>
            <DialogTitle sx={{ pb: 0 }}>
                Session {session.period} - {session.subject.name}
            </DialogTitle>
            <DialogContent sx={{ mt: 0 }}>
                <List sx={{ listStyleType: 'disc', pl: 4 }}>
                    {session.students.map(s => (
                        <ListItem key={s.id} sx={{ display: 'list-item', pl: 1, py: 0 }}>
                            {s.lastFirstName}
                        </ListItem>
                    ))}
                </List>
            </DialogContent>
            <DialogActions>
                <Button onClick={handleClose}>Close</Button>
            </DialogActions>
        </Dialog>
    )
}