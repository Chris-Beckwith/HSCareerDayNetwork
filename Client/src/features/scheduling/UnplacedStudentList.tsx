import { Button, Dialog, DialogActions, DialogContent, DialogTitle, Divider, Grid, Typography } from "@mui/material";
import { UnplacedStudent } from "./SessionView";

interface Props {
    unplacedStudents: UnplacedStudent[],
    open: boolean,
    handleClose: () => void
}

export default function UnplacedStudentList({ unplacedStudents, open, handleClose }: Props) {
    return (
        <Dialog open={open}>
            <DialogTitle>
                <Typography variant="body1" gutterBottom>Unplaced Students - {unplacedStudents.length}</Typography>
            </DialogTitle>
            <DialogContent>
                <Grid item xs={12}>
                    <Divider sx={{ mb: 1 }}/>
                    {unplacedStudents.map((s, index) => (
                        <Grid item key={index}>
                            <Typography variant="body2">{s.student.lastFirstName}</Typography>
                            <Typography variant="body2">{s.career.name}</Typography>
                            <Divider />
                        </Grid>
                    ))}
                </Grid>
            </DialogContent>
            <DialogActions>
                <Button onClick={handleClose}>Close</Button>
            </DialogActions>
        </Dialog>
    )
}