import { Button, Dialog, DialogActions, DialogContent, DialogTitle, List, ListItem, Typography } from "@mui/material";
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
                    {session.students.sort((a, b) => a.lastFirstName.localeCompare(b.lastFirstName)).map(s => (
                        <ListItem key={s.id} sx={{ display: 'list-item', pl: 1, py: 0 }}>
                            <Typography component="span" sx={{ fontSize: 'inherit', fontWeight: 'bold' }}>
                                {s.lastFirstName}
                            </Typography>
                            <Typography component="span" sx={{ fontSize: '0.75rem', ml: 1 }}>
                                ({s.grade}th/{s.gender})
                            </Typography>
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