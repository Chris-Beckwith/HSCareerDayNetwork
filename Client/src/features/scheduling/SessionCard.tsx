import { Box, Button, Card, CardActions, CardContent, CardHeader, Tooltip, Typography } from "@mui/material";
import { Session } from "../../app/models/session";
import { useState } from "react";
import SessionStudentView from "./SessionStudentView";
import { Classroom, ClassroomParams } from "../../app/models/classroom";
import SessionClassroom from "./SessionClassroom";
import { getClassroomText } from "../../app/util/displayUtil";
import { Speaker } from "../../app/models/speaker";
import SessionSpeakers from "./SessionSpeakers";
import { Student } from "../../app/models/student";
import AppButton from "../../app/components/AppButton";
import { DEFAULT_FONT_SIZE } from "../../app/util/constants";

interface Props {
    session: Session
    availableClassrooms: Classroom[]
    updateClassroom: (session: Session, classroom: Classroom, propagate: boolean) => void
    availableSpeakers: Speaker[]
    updateSpeakers: (session: Session, speakers: Speaker[], propagate: boolean) => void
    triggerRefresh: () => void
    onSwapStudent: (student: Student) => void
    status: string
    hasMore: boolean
    loadMore: () => void
    classroomParams: ClassroomParams
}

export default function SessionCard({ session, availableClassrooms, updateClassroom, availableSpeakers, updateSpeakers,
        triggerRefresh, onSwapStudent, status, hasMore, loadMore, classroomParams }: Props) {
    const [showStudents, setShowStudents] = useState(false)
    const [showRooms, setShowRooms] = useState(false)
    const [showSpeakers, setShowSpeakers] = useState(false)

    return (
        <>
            <Card>
                <CardHeader 
                    title={
                        <Tooltip title={session.subject.name}>
                            <Typography variant="h6" sx={{ fontSize: { xs: '1rem', sm: '1.10rem', md: '1.25rem' } }}>{session.subject.name}</Typography>
                        </Tooltip>
                    }
                    titleTypographyProps={{
                        sx: {
                            fontSize: '1.3em', 
                            fontWeight: 'bold', 
                            color: 'primary.main',
                            whiteSpace: 'nowrap',
                            overflow: 'hidden',
                            textOverflow: 'ellipsis',
                        }
                    }}
                    sx={{ mb: 0, pb: 0,
                        '& .MuiCardHeader-content': {
                            overflow: 'hidden',
                            textOverflow: 'ellipsis',
                            whiteSpace: 'nowrap',
                        },
                    }}
                />
                <CardContent sx={{ py: 1 }}>
                    <Typography variant="body1" sx={{ display: 'flex', alignItems: 'center', alignContent: 'center', pb: .5,
                            fontSize: DEFAULT_FONT_SIZE, fontWeight: 'light' }}
                    >
                        Number of Students: 
                        <AppButton
                            variant="outlined"
                            onClick={() => setShowStudents(true)}
                            sx={{ p: 0, ml: 1, lineHeight: '1.5', minWidth: '32px'}}
                        >
                                {session.students.length}
                        </AppButton>
                    </Typography>
                    <Box sx={{
                            display: 'flex',
                            flexWrap: 'wrap',
                            fontSize: DEFAULT_FONT_SIZE,
                            pb: 0.5,
                        }}>
                        <Typography sx={{ fontWeight: 'light', mr: 0.5, fontSize: DEFAULT_FONT_SIZE }}>Location:</Typography>
                        <Box sx={{ flex: '1 1 auto', minWidth: 0 }}>{getClassroomText(session.classroom)}</Box>
                    </Box>
                    <Box sx={{ display: 'grid', gridTemplateColumns: 'auto 1fr', columnGap: 0.5 }}>
                        <Typography sx={{ fontWeight: 'light', fontSize: DEFAULT_FONT_SIZE }}>
                            Speakers:
                        </Typography>
                        <Box>
                            {session.speakers.map((s, i) =>
                                <Typography key={i} sx={{ fontSize: DEFAULT_FONT_SIZE }}>
                                    {s.firstName} {s.middleName} {s.lastName}{i < session.speakers.length - 1 && ","}
                                </Typography>
                                )}
                        </Box>
                    </Box>
                </CardContent>
                <CardActions sx={{ py: 0, px: 1, display: 'flex', justifyContent: 'space-evenly' }}>
                    <Button size="small" onClick={() => setShowRooms(true)}>
                        Assign Room
                    </Button>
                    <Button size="small" onClick={() => setShowSpeakers(true)}>
                        Assign Speakers
                    </Button>
                </CardActions>
            </Card>

            <SessionStudentView session={session} onSwapStudent={onSwapStudent}
                open={showStudents} handleClose={() => setShowStudents(false)} />
            <SessionClassroom session={session} availableClassrooms={availableClassrooms} updateClassroom={updateClassroom}
                triggerRefresh={triggerRefresh} open={showRooms} handleClose={() => setShowRooms(false)}
                status={status} hasMore={hasMore} loadMore={loadMore} classroomParams={classroomParams} />
            <SessionSpeakers session={session} availableSpeakers={availableSpeakers} updateSpeakers={updateSpeakers}
                triggerRefresh={triggerRefresh} open={showSpeakers} handleClose={() => setShowSpeakers(false)} />
        </>
    )
}