import { Box, Button, IconButton, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Typography, useMediaQuery, useTheme } from "@mui/material"
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

/**
 * Component to display the list of schools added.
 */
export default function Schools() {
    const { schools, metaData, schoolParams, schoolsLoaded } = useSchools()
    const dispatch = useAppDispatch()
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))

    const [editMode, setEditMode] = useState(false)
    const [loading, setLoading] = useState(false)
    const [showDeletePopup, setShowDeletePopup] = useState(false)
    const [selectedSchool, setSelectedSchool] = useState<School | undefined>(undefined)
    
    function handleSelectSchool(school: School) {
        const normalizedSchool: School = {
            id: school.id ?? null,
            name: school.name ?? '',
            contactName: school.contactName ?? '',
            contactEmail: school.contactEmail ?? '',
            contactPhone: school.contactPhone ?? '',
            estimatedNumOfStudents: school.estimatedNumOfStudents,
            address: {
                    id: school.address?.id ?? null,
                    address1: school.address?.address1 ?? '',
                    address2: school.address?.address2 ?? '',
                    city: school.address?.city ?? '',
                    state: school.address?.state ?? '',
                    zip: school.address?.zip ?? '',
                    country: school.address?.country ?? '',
            }
        }
        setSelectedSchool(normalizedSchool)
        setEditMode(true)
    }

    function handleShowConfirmDelete(event: MouseEvent<HTMLButtonElement, globalThis.MouseEvent>, school: School) {
        event.stopPropagation()
        setSelectedSchool(school)
        setShowDeletePopup(true)
    }

    async function handleDeleteSchool() {
        if (selectedSchool) {
            setLoading(true);
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
                <Typography variant={isTablet ? isMobile ? "h5" : "h4" : "h3"}>Schools</Typography>
                <Box>
                    <AppTextSearch label="Search Schools"
                        stateSearchTerm={schoolParams.searchTerm} setParams={setSchoolParams} />
                </Box>
                <Button variant="contained" onClick={() => setEditMode(true)}
                    sx={{ fontSize: isMobile ? '0.75rem' : '0.875rem', lineHeight: isMobile ? 1.2 : 1.7 }}
                >
                    New School
                </Button>
            </Box>
            <TableContainer component={Paper}>
                <Table sx={{ '& .MuiTableCell-root': { fontSize: isTablet ? '0.75rem' : '0.875rem' } }}>
                    <TableHead>
                        <TableRow>
                            <TableCell>Name</TableCell>
                            <TableCell>Address</TableCell>
                            <TableCell>Contact Name</TableCell>
                            <TableCell>Phone Number</TableCell>
                            <TableCell>Email</TableCell>
                            <TableCell width={50}>Estimated Students</TableCell>
                            <TableCell></TableCell>
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
                                        <TableCell>{school.address?.address1} {school.address?.address2}{" "}<br />
                                            {school.address?.city} {school.address?.state} {school.address?.zip}</TableCell>
                                        <TableCell>{school.contactName}</TableCell>
                                        <TableCell>{school.contactPhone}</TableCell>
                                        <TableCell>{school.contactEmail}</TableCell>
                                        <TableCell>{school.estimatedNumOfStudents}</TableCell>
                                        <TableCell align="right">
                                            <IconButton color='error' size='small' onClick={(e) => handleShowConfirmDelete(e, school)}>
                                                <Delete fontSize="small" />
                                            </IconButton>
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
