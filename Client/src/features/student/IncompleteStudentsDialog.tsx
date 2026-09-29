import { Button, Dialog, DialogActions, DialogContent, DialogContentText, DialogTitle, List, ListItem } from "@mui/material"
import { Student } from "../../app/models/student"
import AppCopyButton from "../../app/components/AppCopyButton"

interface Props {
    open: boolean
    incompleteStudents: Student[]
    handleClose: () => void
}

export default function IncompleteStudentsDialog({ open, handleClose, incompleteStudents }: Props) {
    const getCopyText = () => {
        return incompleteStudents
            .map(s => s.studentNumber + " ~ " + s.lastFirstName)
            .join('\n')
    }

    return (
        <Dialog open={open} onClose={handleClose}>
            <DialogTitle align="center">Incomplete Students</DialogTitle>
            <DialogContent>
                <DialogContentText>
                    The following students were not imported due to having incomplete information:
                </DialogContentText>
                <List>
                    {incompleteStudents.map(s => (
                        <ListItem>{s.studentNumber} ~ {s.lastFirstName}</ListItem>
                    ))}
                </List>
                <DialogActions>
                    <AppCopyButton copyText={getCopyText()} />
                    <Button onClick={handleClose}>Close</Button>
                </DialogActions>
            </DialogContent>
        </Dialog>
    )
}