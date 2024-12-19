import { Session } from "../../app/models/session"
import { Button, Grid, Typography } from "@mui/material"
import { Student } from "../../app/models/student"
import { Career } from "../../app/models/career"
import SessionCard from "./SessionCard"
import { CareerEvent } from "../../app/models/event"
import { Classroom } from "../../app/models/classroom"
import { useState } from "react"
import { Speaker } from "../../app/models/speaker"
import UnplacedStudentList from "./UnplacedStudentList"

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
    const [showUnplacedStudents, setShowUnplacedStudents] = useState(false)
    
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

    const updateSpeakers = (session: Session, speakers: Speaker[], propagate: boolean) =>  {
        session.speakers = speakers
        if (propagate) {
            sessions.forEach(s => {
                if (s.subject.id === session.subject.id && s.period !== session.period && s.speakers.length == 0) {
                    s.speakers = speakers
                }
            })
        }
    }

    return (
        <Grid container item xs={12}>
            <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                <Typography variant="h4">{event.name} - Session View</Typography>
            </Grid>
            <Grid item xs={12} sx={{ display: 'flex', alignItems: 'center', justifyContent: 'flex-end' }}>
                <Button onClick={() => setShowUnplacedStudents(true)}
                    sx={{ fontSize: '0.74rem', mb: 1 }} variant="outlined"
                >
                    Unplaced Students - {unplacedStudents.length}
                </Button>
            </Grid>

            <Grid container item xs={12} spacing={2} key={refreshKey}>
                <Grid container item xs={12} spacing={2}>
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
                                        const availableSpeakers = event.speakers.filter(
                                            speaker => !sessions.some(s =>
                                                s.period === session.period && s.speakers.some(sp => sp.id === speaker.id))
                                        )
                                        return (
                                            <Grid item key={index} sx={{ my: 2 }}>
                                                <SessionCard session={session} availableClassrooms={availableClassrooms} updateClassroom={updateClassroom} 
                                                    availableSpeakers={availableSpeakers} updateSpeakers={updateSpeakers} triggerRefresh={triggerRefresh} />
                                            </Grid>
                                        )
                                    })}
                            </Grid>
                        </Grid>
                    ))}
                </Grid>
            </Grid>
            <UnplacedStudentList unplacedStudents={unplacedStudents}
                open={showUnplacedStudents} 
                handleClose={() => setShowUnplacedStudents(false)} />
        </Grid>
    )
}