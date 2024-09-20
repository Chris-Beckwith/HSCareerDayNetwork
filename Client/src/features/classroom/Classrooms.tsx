import { Box, Button, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Typography } from "@mui/material";
import { School } from "../../app/models/school";
import { MouseEvent, useEffect, useState } from "react";
import ClassroomForm from "./ClassroomForm";
import useClassrooms from "../../app/hooks/useClassrooms";
import ClassroomSkeleton from "./ClassroomSkeleton";
import { Delete } from "@mui/icons-material";
import { Classroom } from "../../app/models/classroom";
import agent from "../../app/api/agent";
import { reloadClassrooms, setClassroomParams, setPageNumber } from "./classroomSlice";
import { useAppDispatch } from "../../app/store/configureStore";
import { LoadingButton } from "@mui/lab";
import AppTextSearch from "../../app/components/AppTextSearch";
import AppPagination from "../../app/components/AppPagination";

interface Props {
    school: School
    back: () => void
}

export default function Classrooms({ school, back }: Props) {
    const { classrooms, classroomsLoaded, classroomParams, metaData} = useClassrooms(school.id)
    const dispatch = useAppDispatch()
    const [loading, setLoading] = useState(false)
    const [editMode, setEditMode] = useState(false)
    const [selectedRoom, setSelectedRoom] = useState<Classroom | undefined>(undefined)

    useEffect(() => {
        dispatch(reloadClassrooms())
    }, [dispatch, school])

    function handleSelectClassroom(classroom: Classroom) {
        setSelectedRoom(classroom)
        setEditMode(true)
    }

    function cancelEdit() {
        if (selectedRoom) setSelectedRoom(undefined)
        setEditMode(false)
    }

    async function handleDeleteClassroom(event: MouseEvent<HTMLButtonElement, globalThis.MouseEvent>, classroom: Classroom) {
        event.stopPropagation()
        if (classroom) {
            setLoading(true)
            await agent.Classroom.delete(classroom.id)
                .then(() => dispatch(reloadClassrooms()))
                .catch(error => console.log(error))
                .finally(() => {
                    setLoading(false)
                    setSelectedRoom(undefined)
                })
        }
    }

    if (editMode) return <ClassroomForm school={school} selectedRoom={selectedRoom} cancelEdit={cancelEdit} />

    return (
        <>
            <Box display='flex' justifyContent='space-between' alignItems='center' sx={{mb: 2}}>
                <Typography variant="h3">{school.name} Classrooms</Typography>
            </Box>
            <Box display='flex' justifyContent='space-between' alignItems='center' sx={{mb: 2}}>
                <Button variant="contained" color="inherit" onClick={back}>Back</Button>
                <Box>
                    <AppTextSearch label="Search Classrooms"
                        stateSearchTerm={classroomParams.searchTerm} setParams={setClassroomParams} />
                </Box>
                <Button variant="contained" onClick={() => setEditMode(true)}>Add Classroom</Button>
            </Box>
            <TableContainer component={Paper}>
                <Table>
                    <TableHead>
                        <TableRow>
                            <TableCell>Building</TableCell>
                            <TableCell>Room Number</TableCell>
                            <TableCell>Capacity</TableCell>
                            <TableCell>Overflow</TableCell>
                            <TableCell align="right" width={50}></TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {classrooms.map(classroom => (
                            <TableRow
                                key={classroom.id}
                                onClick={() => handleSelectClassroom(classroom)}
                                sx={{cursor: "pointer"}}
                                hover
                            >
                                {!classroomsLoaded ? (
                                    <ClassroomSkeleton />
                                ) : (
                                    <>
                                        <TableCell>{classroom.building}</TableCell>
                                        <TableCell>{classroom.roomNumber}</TableCell>
                                        <TableCell>{classroom.capacity}</TableCell>
                                        <TableCell>{classroom.overflow}</TableCell>
                                        <TableCell align="right">
                                            <LoadingButton
                                                loading={loading}
                                                startIcon={<Delete />}
                                                color="error"
                                                onClick={(e) => handleDeleteClassroom(e, classroom)}
                                            />
                                        </TableCell>
                                    </>
                                )}
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>
            
            <Box sx={{ mt: 2 }}>
                {metaData &&
                    <AppPagination
                        metaData={metaData}
                        onPageChange={(page: number) => dispatch(setPageNumber({ pageNumber: page }))}
                    />
                }
            </Box>
        </>
    )
}