import { Button, Dialog, DialogActions, DialogContent, DialogContentText, DialogTitle, List, ListItem } from "@mui/material"
import { Student } from "../../app/models/student"

interface Props {
    open: boolean
    incompleteStudents: Student[]
    handleClose: () => void
}

export default function incompleteStudentsDialog({ open, handleClose, incompleteStudents }: Props) {
    return (
        <Dialog open={open} onClose={handleClose}>
            <DialogTitle align="center">Incomplete students</DialogTitle>
            <DialogContent>
                <DialogContentText>
                    The following students were not imported due to having incomplete information:
                </DialogContentText>
                <List>
                    {incompleteStudents.map(s => (
                        <ListItem>{s.lastFirstName}</ListItem>
                    ))}
                </List>
                <DialogActions>
                    <Button onClick={handleClose}>Close</Button>
                </DialogActions>
            </DialogContent>
        </Dialog>
    )
}