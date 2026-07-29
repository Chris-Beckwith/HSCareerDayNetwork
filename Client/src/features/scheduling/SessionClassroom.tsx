import { Box, Button, Dialog, DialogActions, DialogContent, DialogTitle, IconButton, Table, TableBody, TableCell, TableHead, TableRow, Typography } from "@mui/material";
import { Classroom, ClassroomParams } from "../../app/models/classroom";
import { Session } from "../../app/models/session";
import { getClassroomText } from "../../app/util/displayUtil";
import { Delete } from "@mui/icons-material";
import { useCallback, useRef, useState } from "react";
import PropagateRoomAssign from "./PropagateRoomAssign";
import AppTextSearch from "../../app/components/AppTextSearch";
import { setClassroomPickerSearchTerm } from "../classroom/classroomPickerSlice";

interface Props {
    session: Session
    availableClassrooms: Classroom[]
    updateClassroom: (session: Session, classroom: Classroom, propagate: boolean) => void
    triggerRefresh: () => void
    open: boolean
    handleClose: () => void
    status: string
    hasMore: boolean
    loadMore: () => void
    classroomParams: ClassroomParams
}

/**
 * Component to add/remove classroom to a session
 */
export default function SessionClassroom({ session, availableClassrooms, updateClassroom, triggerRefresh,
    open, handleClose, status, hasMore, loadMore, classroomParams }: Props) {

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

    const dialogContentRef = useRef<HTMLDivElement | null>(null)
    const observer = useRef<IntersectionObserver>()

    const lastRowRef = useCallback((node: HTMLTableRowElement | null) => {
        if (!open || !node) return

        observer.current?.disconnect()

        observer.current = new IntersectionObserver(
            entries => {
                if (entries[0].isIntersecting && hasMore && status === 'idle')
                    loadMore()
            },
            {
                root: dialogContentRef.current,
                rootMargin: "300px"
            }
        )

        observer.current.observe(node)
    },[hasMore, loadMore, open, status])

    return (
        <>
            <Dialog open={open} onClose={handleClose}>
                <DialogTitle>
                    Edit Classroom for Session {session.period} - {session.subject.name}
                </DialogTitle>
                <DialogContent ref={dialogContentRef}>
                    <Box sx={{ display: 'flex' }}>
                        <Typography sx={{ display: 'flex', pr: 0.5, fontStyle: 'italic', textDecoration: 'underline' }}>
                            Current Room:
                        </Typography>
                        {getClassroomText(currentRoom)}
                        
                        {currentRoom ?
                            <IconButton color='error' sx={{ p: 0, ml: 1 }} onClick={removeClassroom}>
                                <Delete fontSize="small"/>
                            </IconButton>
                            : ''}
                    </Box>

                    <Box sx={{ display: 'flex', justifyContent: 'center', pt: 1 }}>
                        <Box sx={{ width: '50%' }}>
                            <AppTextSearch isSmall={true}
                                stateSearchTerm={classroomParams.searchTerm} 
                                setParams={setClassroomPickerSearchTerm} />
                        </Box>
                    </Box>
                    
                    
                    <Table>
                        <TableHead>
                            <TableRow>
                                <TableCell>Building</TableCell>
                                <TableCell>Room #</TableCell>
                                <TableCell>Size</TableCell>
                            </TableRow>
                        </TableHead>

                        <TableBody>
                            {availableClassrooms.map((room, index) => (
                                <TableRow key={room.id} sx={{ cursor: "pointer" }} hover 
                                    onClick={() => {
                                        addClassroom(session, room, false)
                                        setShowPropConfirm(true)
                                    }}
                                    ref={index === availableClassrooms.length - 1 ? lastRowRef : null}
                                >
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