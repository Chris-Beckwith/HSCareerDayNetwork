import { Session } from "../../app/models/session"
import { Divider, Grid, Typography } from "@mui/material"
import { Student } from "../../app/models/student"
import { Career } from "../../app/models/career"
import SessionCard from "./SessionCard"

export interface UnplacedStudent {
    student: Student
    career: Career
}

interface Props {
    sessions: Session[]
    unplacedStudents: UnplacedStudent[]
}

export default function SessionView({ sessions, unplacedStudents }: Props) {
    const periods = Array.from(new Set(sessions.map(s => s.period))).sort((a, b) => a - b)

    return (
        <Grid container item xs={12}>
            <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                <Typography variant="h4" gutterBottom>Session View</Typography>
            </Grid>

            <Grid container item xs={12} spacing={2}>
                <Grid container item xs={10} spacing={2}>
                    {periods.map(p => (
                        <Grid key={p} item xs={Math.floor(12/periods.length)}>
                            <Typography variant="body1">
                                Period {p} (Classes: {sessions.filter(s => s.period === p).length})
                            </Typography>
                                <Grid item>
                                    {sessions.filter(s => s.period === p)
                                        .sort((a, b) => a.subject.category.localeCompare(b.subject.category))
                                        .sort((a, b) => a.subject.courseId - b.subject.courseId)
                                        .map((session, index) => (
                                            <Grid item key={index} sx={{ my: 2 }}>
                                                <SessionCard session={session} />
                                            </Grid>
                                    ))}
                                </Grid>
                        </Grid>
                    ))}
                </Grid>
                <Grid item xs={2}>
                    <Typography variant="body1" gutterBottom>Unplaced Students</Typography>
                    <Divider sx={{ mb: 1 }}/>
                    {unplacedStudents.map((s, index) => (
                        <Grid item key={index}>
                            <Typography variant="body2">{s.student.lastFirstName}</Typography>
                            <Typography variant="body2">{s.career.name}</Typography>
                            <Divider />
                        </Grid>
                    ))}
                </Grid>
            </Grid>
        </Grid>
    )
}