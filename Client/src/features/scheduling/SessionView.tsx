import { Session } from "../../app/models/session"
import { Divider, Grid, Typography } from "@mui/material"
import { Student } from "../../app/models/student"
import { Career } from "../../app/models/career"
import SessionCard from "./SessionCard"
import { CareerEvent } from "../../app/models/event"
import { Classroom } from "../../app/models/classroom"
import { useState } from "react"

export interface UnplacedStudent {
    student: Student
    career: Career
}

interface Props {
    event: CareerEvent
    sessions: Session[]
    classrooms: Classroom[]
    unplacedStudents: UnplacedStudent[]
}

export default function SessionView({ event, sessions, classrooms, unplacedStudents }: Props) {
    const [refreshKey, setRefreshKey] = useState(0)
    
    const periods = Array.from(new Set(sessions.map(s => s.period))).sort((a, b) => a - b)

    const triggerRefresh = () => {
        setRefreshKey((prev: number) => prev + 1)
    }

    const updateClassroom = (session: Session, classroom: Classroom, propagate: boolean) => {
        session.classroom = classroom
        if (propagate) {
            sessions.forEach(s => {
                if (s.subject.id === session.subject.id && s.period !== session.period) {
                    const isClassroomOpen = !sessions.some(
                        s2 => s2.period === s.period && s2.classroom === classroom
                    )
                    
                    if (isClassroomOpen) s.classroom = classroom
                }
            })
        }
    }

    return (
        <Grid container item xs={12}>
            <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                <Typography variant="h4" gutterBottom>{event.name} - Session View</Typography>
            </Grid>

            <Grid container item xs={12} spacing={2} key={refreshKey}>
                <Grid container item xs={10} spacing={2}>
                    {periods.map(p => (
                        <Grid key={p} item xs={Math.floor(12/periods.length)}>
                            <Typography variant="body1">
                                Session {p} (Classes: {sessions.filter(s => s.period === p).length})
                            </Typography>
                                <Grid item>
                                    {sessions.filter(s => s.period === p)
                                        .sort((a, b) => a.subject.category.localeCompare(b.subject.category))
                                        .sort((a, b) => a.subject.courseId - b.subject.courseId)
                                        .map((session, index) => {
                                            const availableClassrooms = classrooms.filter(
                                                classroom => !sessions.some(s => s.period === session.period && s.classroom?.id === classroom.id)
                                            )
                                            return (
                                                <Grid item key={index} sx={{ my: 2 }}>
                                                    <SessionCard session={session} availableClassrooms={availableClassrooms} updateClassroom={updateClassroom} triggerRefresh={triggerRefresh} />
                                                </Grid>
                                            )
                                        })}
                                </Grid>
                        </Grid>
                    ))}
                </Grid>
                <Grid item xs={2}>
                    <Typography variant="body1" gutterBottom>Unplaced Students - {unplacedStudents.length}</Typography>
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