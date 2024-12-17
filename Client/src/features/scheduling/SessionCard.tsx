import { Button, Card, CardActions, CardContent, CardHeader, Tooltip, Typography } from "@mui/material";
import { Session } from "../../app/models/session";
import { useState } from "react";
import SessionStudentView from "./SessionStudentView";
import { Classroom } from "../../app/models/classroom";
import EditClassroom from "./EditClassroom";
import { getClassroomText } from "../../app/util/util";
import { Speaker } from "../../app/models/speaker";
import EditSpeakers from "./EditSpeakers";

interface Props {
    session: Session
    availableClassrooms: Classroom[]
    updateClassroom: (session: Session, classroom: Classroom, propagate: boolean) => void
    availableSpeakers: Speaker[]
    updateSpeakers: (session: Session, speakers: Speaker[], propagate: boolean) => void
    triggerRefresh: () => void
}

export default function SessionCard({ session, availableClassrooms, updateClassroom, 
        availableSpeakers, updateSpeakers, triggerRefresh }: Props) {
    const [showStudents, setShowStudents] = useState(false)
    const [showRooms, setShowRooms] = useState(false)
    const [showSpeakers, setShowSpeakers] = useState(false)

    return (
        <>
            <Card>
                <CardHeader 
                    title={
                        <Tooltip title={session.subject.name}>
                            <span>{session.subject.name}</span>
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
                    <Typography variant="body1" sx={{ display: 'flex', alignItems: 'center', alignContent: 'center' }}>
                        Number of Students: 
                        <Button 
                            variant="outlined"
                            onClick={() => setShowStudents(true)}
                            sx={{ p: 0, ml: 1, lineHeight: '1.5', minWidth: '32px'}}
                        >
                                {session.students.length}
                        </Button>
                    </Typography>
                    <Typography variant="body1">Classroom: {getClassroomText(session.classroom)}</Typography>
                    <Typography variant="body1">
                        Speakers: {session.speakers.map(s =>
                            s.firstName + " " + s.middleName + " " + s.lastName).join(", ")}
                    </Typography>
                </CardContent>
                <CardActions sx={{ py: 0, px: 1 }}>
                    <Button onClick={() => setShowRooms(true)}>
                        Assign Room
                    </Button>
                    <Button onClick={() => setShowSpeakers(true)}>
                        Assign Speakers
                    </Button>
                </CardActions>
            </Card>

            <SessionStudentView session={session} open={showStudents} handleClose={() => setShowStudents(false)} />
            <EditClassroom session={session} availableClassrooms={availableClassrooms} updateClassroom={updateClassroom}
                triggerRefresh={triggerRefresh} open={showRooms} handleClose={() => setShowRooms(false)} />
            <EditSpeakers session={session} availableSpeakers={availableSpeakers} updateSpeakers={updateSpeakers}
                triggerRefresh={triggerRefresh} open={showSpeakers} handleClose={() => setShowSpeakers(false)} />
        </>
    )
}