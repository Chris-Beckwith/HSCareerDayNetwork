import { Session } from "../../app/models/session"
import { Box, Button, Grid, Typography, useMediaQuery, useTheme } from "@mui/material"
import { Student } from "../../app/models/student"
import { Career } from "../../app/models/career"
import SessionCard from "./SessionCard"
import { CareerEvent } from "../../app/models/event"
import { Classroom } from "../../app/models/classroom"
import { useEffect, useMemo, useState } from "react"
import { Speaker } from "../../app/models/speaker"
import UnplacedStudentList from "./UnplacedStudentList"
import PlacementDialog from "./PlacementDialog"
import SwapDialog from "./components/SwapDialog"
import useSurveys from "../../app/hooks/useSurveys"
import { Survey } from "../../app/models/survey"
import { ScheduleParams } from "../../app/models/scheduleParams"
import { DEFAULT_FONT_SIZE, EVENT_PHASES } from "../../app/util/constants"
import useClassroomPicker from "../../app/hooks/useClassroomPicker"
import agent from "../../app/api/agent"
import { reloadClassrooms } from "../classroom/classroomSlice"
import { reloadEvents } from "../careerEvents/careerEventSlice"
import AppLoadingButton from "../../app/components/AppLoadingButton"
import { useAppDispatch } from "../../app/store/configureStore"
import SessionViewSkeleton from "./components/SessionViewSkeleton"
import AppButton from "../../app/components/AppButton"

export interface UnplacedStudent {
    student: Student
    career: Career
    altCareers: Career[]
    period: number
}

interface Props {
    event: CareerEvent
    setShowParamsOverride: React.Dispatch<React.SetStateAction<boolean>>
}

export default function SessionView({ event, setShowParamsOverride }: Props) {
    const { classrooms, status, hasMore, loadMore, classroomParams } = useClassroomPicker(event.school.id)

    const dispatch = useAppDispatch()
    const [loading, setLoading] = useState(false)
    const [loadingSessions, setLoadingSessions] = useState(false)
    const [sessions, setSessions] = useState<Session[]>([])
    const [unplacedStudents, setUnplacedStudents] = useState<UnplacedStudent[]>([])
    const [scheduleParams, setScheduleParams] = useState<ScheduleParams>()
    const [initialSessions, setInitialSessions] = useState("")

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

    //For Schedule/Session View
    useEffect(() => {
        if (event.eventPhase.phaseName === EVENT_PHASES.SCHEDULEGENERATED) {
            setLoadingSessions(true)
            agent.Schedule.getSessionsAndUnplaced(event.id)
                .then(response => {
                    setSessions(response.allSessions)
                    setUnplacedStudents(response.unplacedStudents)
                    setInitialSessions(JSON.stringify(response.allSessions))
                })
                .catch(error => console.log(error))
                .finally(() => {
                    reloadClassrooms()
                    setLoadingSessions(false)
                })
            agent.Event.getScheduleParams(event.id)
                .then(response => {
                    setScheduleParams(response)
                })
        }
    }, [event.eventPhase.phaseName, event.id])

    const hasScheduleChanged = JSON.stringify(sessions) !== initialSessions

    async function SaveSchedule() {
        setLoading(true)

        try {
            await agent.Schedule.updateSessions(sessions)
        } catch (error) {
            console.log(error)
        } finally {
            dispatch(reloadEvents())
            setLoading(false)
        }
    }
    
    const triggerRefresh = () => {
        setRefreshKey((prev: number) => prev + 1)
    }

    const availableClassrooms = useMemo(() => {
        return periods.reduce((acc, p) => {
            acc[p] = classrooms.filter(
                classroom => !sessions.some(s => s.period === p && s.classroom?.id === classroom.id)
            )

            return acc
        }, {} as Record<number, Classroom[]>)
    },[classrooms, periods, sessions])
    
    const availableSpeakers = useMemo(() => {
        return periods.reduce((acc, p) => {
            acc[p] = event.speakers.filter(
                speaker => !sessions.some(s => 
                    s.period === p && s.speakers.some(sp => sp.id === speaker.id))
            )

            return acc
        }, {} as Record<number, Speaker[]>)
    },[event.speakers, periods, sessions])

    useEffect(() => {
        for (const p of periods) {
            const rooms = availableClassrooms[p]

            if (rooms.length < 10 && hasMore)
                loadMore()
        }
    },[availableClassrooms, hasMore, loadMore, periods])

    const updateClassroom = (session: Session, classroom: Classroom | undefined, propagate: boolean) => {
        setSessions(prev => prev.map(s => {
            if (s.id === session.id)
                return {...s, classroom}

            if (propagate && s.subject.id === session.subject.id && s.period !== session.period) {
                const isClassroomOpen = !prev.some(s2 => s2.period === s.period && s2.classroom?.id === classroom?.id)
                if (isClassroomOpen) 
                    return {...s, classroom}
            }

            return s
        }))
    }

    const updateSpeakers = (session: Session, speakers: Speaker[], propagate: boolean) =>  {
        setSessions(prev => prev.map(s => {
            if (s.id === session.id)
                return {...s, speakers}
            
            if (propagate && s.subject.id === session.subject.id && s.period !== session.period && s.speakers.length === 0)
                return {...s, speakers}

            return s
        }))
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
            <Grid container item xs={12} sx={{ alignItems: 'flex-end', justifyContent: 'flex-end', pb: 1 }}>
                <AppLoadingButton loading={loading} variant="contained" disabled={!hasScheduleChanged} onClick={SaveSchedule}>
                    Save Schedule
                </AppLoadingButton>
            </Grid>
            <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                <Typography variant={isTablet ? isMobile ? "h6" : "h5" : "h4"} sx={{ textAlign: 'center', mb: 2 }}>{event.name} - Session View</Typography>
            </Grid>

            {loadingSessions ? <SessionViewSkeleton />
            : <>
                <Grid item xs={8} mb={1} fontSize=".9rem" sx={{ display: 'flex', alignItems: 'flex-start' }}>
                    <Grid sx={{ flexShrink: 0 }}>
                        <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'flex-start' }}>
                            <Typography variant="body1" color="primary" sx={{ ml: '3px', pr: '3px', fontSize: '.9rem' }}>Min Class Size:</Typography>
                            <Typography color="primary" sx={{ minWidth: 30, textAlign: 'center', fontSize: '.9rem' }}>{scheduleParams?.minClassSize?.toLocaleString() ?? ""}</Typography>
                        </Grid>
                        <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'flex-start' }}>
                            <Typography variant="body1" color="primary" sx={{ pr: '3px', fontSize: '.9rem' }}>Max Class Size:</Typography>
                            <Typography color="primary" sx={{ minWidth: 30, textAlign: 'center', fontSize: '.9rem' }}>{scheduleParams?.maxClassSize?.toLocaleString() ?? ""}</Typography>
                        </Grid>
                    </Grid>
                    <Grid item xs={12} display='flex' justifyContent='left' ml={2}>
                        <AppButton variant="contained" onClick={() => setShowParamsOverride(true)}>Edit Parameters</AppButton>
                    </Grid>
                </Grid>
                <Grid item xs={4} sx={{ display: 'flex', justifyContent: 'flex-end'}}>
                    <Box display="flex" flexDirection="column" alignItems="flex-end" sx={{ mb: 2 }}>
                        <Button onClick={() => setShowUnplacedStudents(true)}
                            sx={{ fontSize: '0.74rem' }} variant="outlined"
                            >
                            Unplaced Students: {unplacedStudents.length}
                        </Button>
                    </Box>
                </Grid>

                <Grid container item xs={12} spacing={2} key={refreshKey} sx={{ overflowX: 'auto', width: '100%' }}>
                    <Grid container item xs={12} spacing={2} sx={{ minWidth: '860px' }}>
                        {periods.map(p => (
                            <Grid key={p} item xs={Math.floor(12/periods.length)}>
                                <Typography variant="body1" fontSize={DEFAULT_FONT_SIZE}>
                                    Session {p} {isTablet && <br />} (Classes: {sessions.filter(s => s.period === p).length} - Students: {sessions.filter(s => s.period === p).reduce((total, s) => total + s.students.length, 0)})
                                </Typography>
                                <Grid item>
                                    {sessions.filter(s => s.period === p)
                                        .sort((a, b) => a.subject.category.localeCompare(b.subject.category))
                                        .sort((a, b) => a.subject.courseId - b.subject.courseId)
                                        .map((session, index) => {
                                            return (
                                                <Grid item key={index} sx={{ my: 2 }}>
                                                    <SessionCard session={session} availableClassrooms={availableClassrooms[p]} updateClassroom={updateClassroom} 
                                                        availableSpeakers={availableSpeakers[p]} updateSpeakers={updateSpeakers} triggerRefresh={triggerRefresh}
                                                        onSwapStudent={onSwapStudent} status={status} hasMore={hasMore} loadMore={loadMore} classroomParams={classroomParams}
                                                        />
                                                </Grid>
                                            )
                                        })}
                                </Grid>
                            </Grid>
                        ))}
                    </Grid>
                </Grid>
            </>
            }


            <UnplacedStudentList unplacedStudents={unplacedStudents} placeStudent={placeStudent}
                open={showUnplacedStudents} handleClose={() => setShowUnplacedStudents(false)} />
            <PlacementDialog placementStudent={placementStudent} sessions={sessions} unplacedStudents={unplacedStudents}
                scheduleParams={scheduleParams} open={showPlacementDialog} handleClose={handleClosePlacement} />
            <SwapDialog swapStudent={swapStudent} swapSurvey={swapSurvey} sessions={sessions} unplacedStudents={unplacedStudents}
                scheduleParams={scheduleParams} open={showSwap} handleClose={handleCloseSwap} />
        </Grid>
    )
}
