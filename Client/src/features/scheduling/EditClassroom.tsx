import { Button, Dialog, DialogActions, DialogContent, DialogTitle, Table, TableBody, TableCell, TableHead, TableRow, Typography } from "@mui/material";
import { Classroom } from "../../app/models/classroom";
import { Session } from "../../app/models/session";
import { getClassroomText } from "../../app/util/util";
import { Delete } from "@mui/icons-material";
import { useState } from "react";
import PropagateRoomAssign from "./PropagateRoomAssign";

interface Props {
    session: Session
    availableClassrooms: Classroom[]
    updateClassroom: (session: Session, classroom: Classroom, propagate: boolean) => void
    triggerRefresh: () => void
    open: boolean
    handleClose: () => void
}

export default function EditClassroom({ session, availableClassrooms, updateClassroom, triggerRefresh, open, handleClose }: Props) {
    const [currentRoom, setCurrentRoom] = useState<Classroom | undefined>(session.classroom)
    const [showPropConfirm, setShowPropConfirm] = useState(false)

    const removeClassroom = () => {
        session.classroom = undefined
        setCurrentRoom(undefined)
    }

    const addClassroom = (session: Session, classroom: Classroom | undefined, propagate: boolean) => {
        if (classroom) updateClassroom(session, classroom, propagate)
        if (propagate) triggerRefresh()
        setCurrentRoom(classroom)
    }

    return (
        <>
            <Dialog open={open} onClose={handleClose}>
                <DialogTitle>
                    Edit Classroom for Session {session.period} - {session.subject.name}
                </DialogTitle>
                <DialogContent>
                    <Typography sx={{ alignContent: 'center', display: 'flex' }}>
                        Current Room: {getClassroomText(currentRoom)}
                        {currentRoom 
                            ? <Button startIcon={<Delete />} color='error' 
                                sx={{ p: 0 }} onClick={removeClassroom} /> 
                                : ''}
                    </Typography>
                    <Table>
                        <TableHead>
                            <TableRow>
                                <TableCell>Building</TableCell>
                                <TableCell>Room #</TableCell>
                                <TableCell>Size</TableCell>
                            </TableRow>
                        </TableHead>

                        <TableBody>
                            {availableClassrooms.map(room => (
                                <TableRow key={room.id} sx={{ cursor: "pointer" }} hover 
                                onClick={() => {
                                    addClassroom(session, room, false)
                                    setShowPropConfirm(true)
                                }}>
                                    <TableCell>{room.building}</TableCell>
                                    <TableCell>{room.roomNumber}</TableCell>
                                    <TableCell>{room.capacity}</TableCell>
                                </TableRow>
                            ))}
                        </TableBody>
                    </Table>
                </DialogContent>
                <DialogActions>
                    <Button onClick={handleClose}>Close</Button>
                </DialogActions>
            </Dialog>

            <PropagateRoomAssign open={showPropConfirm}
                currentRoom={currentRoom}
                session={session}
                addClassroom={addClassroom}
                handleClose={() => {
                    triggerRefresh()
                    setShowPropConfirm(false)
                    handleClose()
                }}
            />
        </>
    )
}