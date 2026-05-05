import { Session } from "../../app/models/session"
import { Box, Button, Grid, Typography, useMediaQuery, useTheme } from "@mui/material"
import { Student } from "../../app/models/student"
import { Career } from "../../app/models/career"
import SessionCard from "./SessionCard"
import { CareerEvent } from "../../app/models/event"
import { Classroom } from "../../app/models/classroom"
import { useState } from "react"
import { Speaker } from "../../app/models/speaker"
import UnplacedStudentList from "./UnplacedStudentList"
import PlacementDialog from "./PlacementDialog"
import SwapDialog from "./SwapDialog"
import useSurveys from "../../app/hooks/useSurveys"
import { Survey } from "../../app/models/survey"
import { ScheduleParams } from "../../app/models/scheduleParams"

export interface UnplacedStudent {
    student: Student
    career: Career
    altCareers: Career[]
    period: number
}

interface Props {
    event: CareerEvent
    sessions: Session[]
    classrooms: Classroom[]
    unplacedStudents: UnplacedStudent[]
    scheduleParams: ScheduleParams | undefined
}

export default function SessionView({ event, sessions, classrooms, unplacedStudents, scheduleParams }: Props) {
    const [refreshKey, setRefreshKey] = useState(0)
    const [showUnplacedStudents, setShowUnplacedStudents] = useState(false)
    const [showPlacementDialog, setShowPlacementDialog] = useState(false)
    const [placementStudent, setPlacementStudent] = useState<UnplacedStudent | undefined>(undefined)
    const [showSwap, setShowSwap] = useState(false)
    const [swapStudent, setSwapStudent] = useState<Student | undefined>(undefined)
    const [swapSurvey, setSwapSurvey] = useState<Survey | undefined>(undefined)
    const { surveys } = useSurveys(event.id)
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))
    
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

    const placeStudent = (unplacedStudent: UnplacedStudent) => {
        setPlacementStudent(unplacedStudent)
        setShowPlacementDialog(true)
    }

    const handleClosePlacement = () => {
        setShowPlacementDialog(false)
        setPlacementStudent(undefined)
    }

    const onSwapStudent = (student: Student) => {
        setSwapStudent(student)
        setSwapSurvey(surveys.find(s => s.studentId === student.id))
        setShowSwap(true)
    }

    const handleCloseSwap = () => {
        setShowSwap(false)
        setSwapSurvey(undefined)
        setSwapStudent(undefined)
    }

    return (
        <Grid container item xs={12}>
            <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                <Typography variant={isTablet ? isMobile ? "h6" : "h5" : "h4"} sx={{ textAlign: 'center', mb: 2 }}>{event.name} - Session View</Typography>
            </Grid>
            <Grid item xs={6} mb={1} fontSize=".9rem">
                <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'flex-start' }}>
                    <Typography variant="body1" color="primary" sx={{ ml: '3px', fontSize: '.9rem' }}>Min Class Size:</Typography>
                    <Typography color="primary" sx={{ minWidth: 30, textAlign: 'center', fontSize: '.9rem' }}>{scheduleParams?.minClassSize}</Typography>
                </Grid>
                <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'flex-start' }}>
                    <Typography variant="body1" color="primary" sx={{ fontSize: '.9rem' }}>Max Class Size:</Typography>
                    <Typography color="primary" sx={{ minWidth: 30, textAlign: 'center', fontSize: '.9rem' }}>{scheduleParams?.maxClassSize}</Typography>
                </Grid>
            </Grid>
            <Grid item xs={6} sx={{ display: 'flex', justifyContent: 'flex-end'}}>
                <Box display="flex" flexDirection="column" alignItems="flex-end" sx={{ mb: 2 }}>
                    <Button onClick={() => setShowUnplacedStudents(true)}
                        sx={{ fontSize: '0.74rem' }} variant="outlined"
                        >
                        Unplaced Students - {unplacedStudents.length}
                    </Button>
                </Box>
            </Grid>

            <Grid container item xs={12} spacing={2} key={refreshKey} sx={{ overflowX: 'auto', width: '100%' }}>
                <Grid container item xs={12} spacing={2} sx={{ minWidth: '860px' }}>
                    {periods.map(p => (
                        <Grid key={p} item xs={Math.floor(12/periods.length)}>
                            <Typography variant="body1" fontSize={isTablet ? isMobile ? ".8rem" : ".9rem" : "1rem"}>
                                Session {p} {isTablet && <br />} (Classes: {sessions.filter(s => s.period === p).length} - Students: {sessions.filter(s => s.period === p).reduce((total, s) => total + s.students.length, 0)})
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
                                                    availableSpeakers={availableSpeakers} updateSpeakers={updateSpeakers} triggerRefresh={triggerRefresh}
                                                    onSwapStudent={onSwapStudent}
                                                />
                                            </Grid>
                                        )
                                    })}
                            </Grid>
                        </Grid>
                    ))}
                </Grid>
            </Grid>
            <UnplacedStudentList unplacedStudents={unplacedStudents} placeStudent={placeStudent}
                open={showUnplacedStudents} 
                handleClose={() => setShowUnplacedStudents(false)} />
            <PlacementDialog placementStudent={placementStudent} sessions={sessions} unplacedStudents={unplacedStudents}
                scheduleParams={scheduleParams} open={showPlacementDialog} handleClose={handleClosePlacement} />
            <SwapDialog swapStudent={swapStudent} swapSurvey={swapSurvey} sessions={sessions} unplacedStudents={unplacedStudents}
                scheduleParams={scheduleParams} open={showSwap} handleClose={handleCloseSwap} />
        </Grid>
    )
}