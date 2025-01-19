import { Button, Dialog, DialogActions, DialogContent, DialogTitle, Divider, Grid, Typography } from "@mui/material";
import { UnplacedStudent } from "./SessionView";
import { PersonAdd } from "@mui/icons-material";

interface Props {
    unplacedStudents: UnplacedStudent[],
    placeStudent: (unplacedStudent: UnplacedStudent) => void
    open: boolean,
    handleClose: () => void
}

export default function UnplacedStudentList({ unplacedStudents, placeStudent, open, handleClose }: Props) {
    return (
        <Dialog open={open}>
            <DialogTitle>
                <Typography variant="body1" gutterBottom>Unplaced Students - {unplacedStudents.length}</Typography>
            </DialogTitle>
            <DialogContent>
                <Grid item xs={12}>
                    <Divider />
                    {unplacedStudents.sort((a,b) => a.student.lastFirstName.localeCompare(b.student.lastFirstName)).map((s, index) => (
                        <Grid item key={index} sx={{ '&:hover': { bgcolor: 'primary.light' } }}>
                            <Typography variant="body2"><em>{s.student.lastFirstName}</em></Typography>
                            <Grid item sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                                <Typography variant="body2">Open Session: {s.period} - Grade: {s.student.grade}</Typography>
                                <Button onClick={() => placeStudent(s)} sx={{ p: 0 }}><PersonAdd sx={{ '&:hover': { color: 'secondary.main' } }} /></Button>
                            </Grid>
                            <Typography variant="body2"><strong>{s.career.name}</strong></Typography>
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