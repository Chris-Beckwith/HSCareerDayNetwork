import { Button, Dialog, DialogActions, DialogContent, DialogTitle, Grid, IconButton, List, ListItem, Paper, Typography } from "@mui/material";
import { Session } from "../../app/models/session";
import { useEffect, useState } from "react";
import { SwapHoriz } from "@mui/icons-material";
import { Student } from "../../app/models/student";

interface Props {
    session: Session
    onSwapStudent: (student: Student) => void
    open: boolean
    handleClose: () => void
}

export default function SessionStudentView({ session, onSwapStudent, open, handleClose }: Props) {
    const [genderCount, setGenderCount] = useState<{ [key: string]: number}>({})
    const [gradeCount, setGradeCount] = useState<{ [key: number]: number}>({})
    const totalStudents = session.students.length
    const isSaved = session.id !== 0

    useEffect(() => {
        const newGenderCount: { [key: string]: number} = {}
        session.students.forEach(s => {
            newGenderCount[s.gender] = (newGenderCount[s.gender] || 0) + 1
        })
        setGenderCount(newGenderCount)

        const newGradeCount: { [key: number]: number} = {}
        session.students.forEach(s => {
            newGradeCount[s.grade] = (newGradeCount[s.grade] || 0) + 1
        })
        setGradeCount(newGradeCount)
    }, [session.students])


    return (
        <Dialog open={open} onClose={handleClose}>
            <DialogTitle sx={{ pb: 0 }}>
                Session {session.period} - {session.subject.name}
            </DialogTitle>
            <DialogContent sx={{ mt: 0 }}>
                <Paper elevation={6} sx={{ p: 1 }}>
                    <Grid container spacing={1}>
                        <Grid item xs={12}>
                            <Typography variant="body1"><strong>Total Students:</strong> {totalStudents}</Typography>
                        </Grid>
                        <Grid item xs={6} sx={{ ml: 1 }}>
                            <Typography variant="body1"><strong>Grades:</strong></Typography>
                            {Object.entries(gradeCount).map(([grade, count]) => (
                                <Typography key={grade} variant="body2">
                                    {grade}th: {count} ({((count/totalStudents) * 100).toFixed(0)}%)
                                </Typography>
                            ))}
                        </Grid>
                        <Grid item>
                            <Typography variant="body1"><strong>Genders:</strong></Typography>
                            {Object.entries(genderCount).map(([gender, count]) => (
                                <Typography key={gender} variant="body2">
                                    {gender}: {count} ({((count/totalStudents) * 100).toFixed(0)}%)
                                </Typography>
                            ))}
                        </Grid>
                    </Grid>
                </Paper>
                <List sx={{  }}>
                    {session.students.sort((a, b) => a.lastFirstName.localeCompare(b.lastFirstName)).map(s => (
                        <ListItem key={s.id} sx={{ pl: 1, py: 0, '&:hover': { bgcolor: 'lightgray' } }}>
                            <IconButton disabled={!isSaved} onClick={() => onSwapStudent(s)} sx={{ p: 0, color: 'primary.dark' }}><SwapHoriz fontSize="small" /></IconButton>
                            <Typography component="span" sx={{ fontSize: 'inherit', fontWeight: 'bold', pl: 1 }}>
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