import { Box, Button, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Typography } from "@mui/material"
import { useAppDispatch } from "../../app/store/configureStore"
import { reloadSchools, setPageNumber, setSchoolParams } from "./schoolSlice"
import { MouseEvent, useState } from "react"
import { Delete } from "@mui/icons-material"
import { School } from "../../app/models/school"
import AppPagination from "../../app/components/AppPagination"
import SchoolForm from "./SchoolForm"
import agent from "../../app/api/agent"
import useSchools from "../../app/hooks/useSchools"
import AppTextSearch from "../../app/components/AppTextSearch"
import ConfirmDelete from "../../app/components/ConfirmDelete"
import SchoolSkeleton from "./SchoolSkeleton"

export default function Schools() {
    const { schools, metaData, schoolParams, schoolsLoaded } = useSchools()
    const dispatch = useAppDispatch()

    const [editMode, setEditMode] = useState(false)
    const [loading, setLoading] = useState(false)
    const [showDeletePopup, setShowDeletePopup] = useState(false)
    const [selectedSchool, setSelectedSchool] = useState<School | undefined>(undefined)
    
    function handleSelectSchool(school: School) {
        setSelectedSchool(school)
        setEditMode(true)
    }

    function handleShowConfirmDelete(event: MouseEvent<HTMLButtonElement, globalThis.MouseEvent>, school: School) {
        event.stopPropagation()
        setSelectedSchool(school)
        setShowDeletePopup(true)
    }

    async function handleDeleteSchool() {
        setLoading(true);
        if (selectedSchool) {
            await agent.School.delete(selectedSchool.id)
                .then(() => dispatch(reloadSchools()))
                .catch(error => console.log(error))
                .finally(() => {
                    setLoading(false)
                    setShowDeletePopup(false)
                    setSelectedSchool(undefined)
                })
        }
    }

    function handleCloseDelete() {
        if (selectedSchool) setSelectedSchool(undefined)
        setShowDeletePopup(false)
    }

    function cancelEdit() {
        if (selectedSchool) setSelectedSchool(undefined)
        setEditMode(false)
    }
    
    if (editMode) return <SchoolForm school={selectedSchool} cancelEdit={cancelEdit} />
    
    return (
        <>
            <Box display='flex' justifyContent='space-between' alignItems='center' sx={{mb: 2}}>
                <Typography variant="h3">School</Typography>
                <Box>
                    <AppTextSearch label="Search Schools"
                        stateSearchTerm={schoolParams.searchTerm} setParams={setSchoolParams} />
                </Box>
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
                                {!schoolsLoaded ? (
                                    <SchoolSkeleton />
                                ) : (
                                    <>
                                        <TableCell>{school.name}</TableCell>
                                        <TableCell>{school.address?.address1} {school.address?.address2} 
                                            {school.address?.city} {school.address?.state} {school.address?.zip}
                                        </TableCell>
                                        <TableCell>{school.contactName}</TableCell>
                                        <TableCell>{school.contactPhone}</TableCell>
                                        <TableCell>{school.contactEmail}</TableCell>
                                        <TableCell>{school.estimatedNumOfStudents}</TableCell>
                                        <TableCell align="right">
                                            <Button
                                                    startIcon={<Delete/>}
                                                    color='error'
                                                    onClick={(e) => handleShowConfirmDelete(e, school)}
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
            <ConfirmDelete open={showDeletePopup} itemType="School" itemName={selectedSchool?.name || ''}
                        handleClose={handleCloseDelete} confirmDelete={handleDeleteSchool} loading={loading} />
        </>
    )
}
