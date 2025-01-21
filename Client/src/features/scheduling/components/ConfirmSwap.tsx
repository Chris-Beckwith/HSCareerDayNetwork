import { Button, Dialog, DialogActions, DialogContent, DialogTitle, Grid, Paper, Typography } from "@mui/material";
import { Student } from "../../../app/models/student";
import { Session } from "../../../app/models/session";

interface Props {
    open: boolean
    handleClose: () => void
    student: Student | undefined
    selectedSessions: Session[]
    handleSave: () => void
}

export default function ConfirmSwap({ open, handleClose, student, selectedSessions, handleSave }: Props) {
    return (
        <Dialog open={open} onClose={handleClose} maxWidth="md" fullWidth={true}>
            <DialogTitle>Confirm New Sessions for {student?.lastFirstName}</DialogTitle>

            <DialogContent>
                <Typography>Selected Sessions:</Typography>
                <Grid container item xs={12}>
                    {selectedSessions.sort((a,b) => a.period - b.period).map(s =>
                        <Grid key={s.id} container item xs={4}>
                            <Paper elevation={8} sx={{ m: 1, p: 1, width: '100%', position: 'relative'}}>
                                <Typography variant="subtitle2" sx={{ position: 'absolute', top: 1, left: 4 }}>{s.period}</Typography>
                                <Grid item xs={12} sx={{ pl: 1 }}>
                                    <Typography sx={{ color: 'primary.main' }}>
                                            <strong>{s.subject.name}</strong>
                                    </Typography>
                                    <Typography>Students #: {s.students.length}</Typography>
                                </Grid>
                            </Paper>
                        </Grid>
                    )}
                </Grid>
            </DialogContent>

            <DialogActions>
                <Button onClick={handleSave}>Confirm</Button>
                <Button onClick={handleClose}>Cancel</Button>
            </DialogActions>

        </Dialog>
    )
}