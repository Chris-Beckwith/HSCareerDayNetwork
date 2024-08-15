import { Box, Button, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Typography } from "@mui/material"
import { useAppDispatch, useAppSelector } from "../../app/store/configureStore"
import { getAllSchoolsAsync, reloadSchools, schoolSelectors, setPageNumber } from "./schoolSlice"
import { MouseEvent, useEffect, useState } from "react"
import LoadingComponent from "../../app/components/LoadingComponent"
import { Delete } from "@mui/icons-material"
import { LoadingButton } from "@mui/lab"
import { School } from "../../app/models/school"
import AppPagination from "../../app/components/AppPagination"
import SchoolForm from "./SchoolForm"
import agent from "../../app/api/agent"

export default function Schools() {
    const schools = useAppSelector(schoolSelectors.selectAll)
    const {schoolsLoaded, status, metaData} = useAppSelector(state => state.schools)
    const dispatch = useAppDispatch()

    const [editMode, setEditMode] = useState(false)
    const [loading, setLoading] = useState(false)
    const [target, setTarget] = useState(0)
    const [selectedSchool, setSelectedSchool] = useState<School | undefined>(undefined)

    useEffect(() => {
        if (!schoolsLoaded) dispatch(getAllSchoolsAsync())
        }, [schoolsLoaded, dispatch])
    
    function handleSelectSchool(school: School) {
        setSelectedSchool(school)
        setEditMode(true)
    }

    function handleDeleteSchool(event: MouseEvent<HTMLButtonElement, globalThis.MouseEvent>, id: number) {
        event.stopPropagation()
        setLoading(true);
        setTarget(id);
        agent.School.delete(id)
            .then(() => dispatch(reloadSchools()))
            .catch(error => console.log(error))
            .finally(() => setLoading(false))
    }

    function cancelEdit() {
        if (selectedSchool) setSelectedSchool(undefined)
        setEditMode(false)
    }
    
    if (status.includes('pending')) return <LoadingComponent message="Loading Schools.." />
    
    if (editMode) return <SchoolForm school={selectedSchool} cancelEdit={cancelEdit} />

    console.log(schools)
    
    return (
        <>
            <Box display='flex' justifyContent='space-between' alignItems='center' sx={{mb: 2}}>
                <Typography variant="h3">School</Typography>
                <Button variant="contained" onClick={() => setEditMode(true)}>New School</Button>
            </Box>
            <TableContainer component={Paper}>
                <Table>
                    <TableHead>
                        <TableRow>
                            <TableCell>Name</TableCell>
                            <TableCell>Address</TableCell>
                            <TableCell>Contact Name</TableCell>
                            <TableCell>Phone Number</TableCell>
                            <TableCell>Email</TableCell>
                            <TableCell width={50}>Estimated Students</TableCell>
                            <TableCell align="right" width={50}></TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {schools.map(school => (
                            <TableRow
                                key={school.id}
                                onClick={() => handleSelectSchool(school)}
                                sx={{cursor: "pointer"}}
                                hover
                            >
                                <TableCell>
                                    {school.name}
                                </TableCell>
                                <TableCell>{school.address?.address1} {school.address?.address2} 
                                    {school.address?.city} {school.address?.state} {school.address?.zip}
                                </TableCell>
                                <TableCell>{school.contactName}</TableCell>
                                <TableCell>{school.contactPhone}</TableCell>
                                <TableCell>{school.contactEmail}</TableCell>
                                <TableCell>{school.estimatedNumOfStudents}</TableCell>
                                <TableCell align="right">
                                    <LoadingButton
                                            loading={loading && target === school.id}
                                            startIcon={<Delete/>}
                                            color='error'
                                            onClick={(e) => handleDeleteSchool(e, school.id)}
                                    />
                                </TableCell>
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
