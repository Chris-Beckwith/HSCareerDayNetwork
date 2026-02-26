import { Box, Grid, IconButton, Paper, Typography, useMediaQuery, useTheme } from "@mui/material"
import useStudents from "../../app/hooks/useStudents"
import AppTextSearch from "../../app/components/AppTextSearch"
import { reloadStudents, resetStudentParams, setPageMetaData, setStudentParams } from "./studentSlice"
import RadioButtonGroup from "../../app/components/RadioButtonGroup"
import { useAppDispatch } from "../../app/store/configureStore"
import CheckboxButtons from "../../app/components/CheckboxButtons"
import { DataGrid, GridColDef, GridPaginationModel } from '@mui/x-data-grid';
import { useState } from "react"
import ImportStudents from "./ImportStudents"
import agent from "../../app/api/agent"
import ConfirmDelete from "../../app/components/ConfirmDelete"
import { Student, StudentParams } from "../../app/models/student"
import { Delete, Edit } from "@mui/icons-material"
import StudentForm from "./StudentForm"
import { CareerEvent } from "../../app/models/event"
import { downloadExcel } from "../../app/util/util"
import AppButton from "../../app/components/AppButton"

interface Props {
    event: CareerEvent
    back: () => void
    schoolUser?: boolean
}

const genderOptions = [
    { value: '', label: 'Any'},
    { value: 'F', label: 'F'},
    { value: 'M', label: 'M'},
]

const gradeOptions = [
    { value: '9', label: '9'},
    { value: '10', label: '10'},
    { value: '11', label: '11'},
    { value: '12', label: '12'},
]

const surveyOptions = [
    { value: '', label: 'Any'},
    { value: true, label: 'True'},
    { value: false, label: 'False'},
]

/**
 * Component to display, search, sort, filter, add or remove students from an event.
 */
export default function Students({ event, back, schoolUser }: Props) {
    const { students, studentsLoaded, metaData, studentParams } = useStudents(event.id)
    const dispatch = useAppDispatch()
    const rows = students
    const [openImport, setOpenImport] = useState(false)
    const [openDelete, setOpenDelete] = useState(false)
    const [confirmDeleteLoading, setConfirmDeleteLoading] = useState(false)
    const [responseMsg, setResponseMsg] = useState('')
    const [editStudent, setEditStudent] = useState<Student | undefined>(undefined)
    const [deleteStudent, setDeleteStudent] = useState<Student | undefined>(undefined)
    const [addStudent, setAddStudent] = useState(false)
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))

    const [paginationModel, setPaginationModel] = useState<GridPaginationModel>({
        pageSize: metaData?.pageSize || 20,
        page: 0
    })

    const handlePaginationModelChange = (model: GridPaginationModel) => {
        setPaginationModel(model)
        dispatch(setPageMetaData({
            pageNumber: model.page + 1,
            pageSize: model.pageSize
        }))
    }

    const columns: GridColDef[] = [
        { field: 'school.name', headerName: 'School',
            valueGetter: (_value, row) => {
                return row.school ? `${row.school.name}` : 'School Not Found'
            }
        },
        { field: 'studentNumber', headerName: 'Student Number' },
        { field: 'lastFirstName', headerName: 'Last, First Name' },
        { field: 'lastName', headerName: 'Last Name'},
        { field: 'firstName', headerName: 'First Name' },
        { field: 'gender', headerName: 'Gender', width: 30 },
        { field: 'grade', headerName: 'Grade', width: 30 },
        { field: 'email', headerName: 'Email' },
        { field: 'homeroomTeacher', headerName: 'Homeroom Teacher' },
        { field: 'homeroomNumber', headerName: 'Room Number' },
        { field: 'surveyComplete', headerName: 'Survey Completed' },
        { field: 'edit', headerName: 'Edit',
            renderCell: (params) => {
                return <IconButton onClick={() => setEditStudent(params.row)} size="small" color="primary">
                    <Edit fontSize="small"/>
                </IconButton>
            },
            sortable: false,
            width: 60
        },
        { field: 'delete', headerName: 'Delete',
            renderCell: (params) => {
                return <IconButton onClick={() => setDeleteStudent(params.row)} size="small" color="error">
                    <Delete fontSize="small"/>
                </IconButton>
            },
            sortable: false,
            width: 60
        }
    ]

    const deleteAllStudents = async () => {
        setConfirmDeleteLoading(true)
        await agent.Student.deleteAll(event.id)
        dispatch(reloadStudents())
        setConfirmDeleteLoading(false)
        setOpenDelete(false)
    }

    const handleDeleteStudent = async () => {
        setConfirmDeleteLoading(true)
        if (deleteStudent) await agent.Student.delete(deleteStudent.id)
        dispatch(reloadStudents())
        setConfirmDeleteLoading(false)
        setDeleteStudent(undefined)
    }

    function getAxiosParams(studentParams: StudentParams) {
        const params = new URLSearchParams()
        params.append('eventId', event.id.toString())
        if (studentParams.searchTerm)
            params.append('searchTerm', studentParams.searchTerm)
        if (studentParams.gender)
            params.append('gender', studentParams.gender)
        if (studentParams.grades.length > 0)
            params.append('grades', studentParams.grades.toString())
        if (studentParams.surveyComplete)
            params.append('surveyComplete', studentParams.surveyComplete.toString())
        return params
    }

    const handleExportStudents = async () => {
        const params = getAxiosParams(studentParams)
        await agent.Student.export(params)
            .then(response => downloadExcel(response))
    }

    
    function cancelEdit() {
        if (editStudent) setEditStudent(undefined)
        setAddStudent(false)
    }

    if (editStudent) return <StudentForm student={editStudent} cancelEdit={cancelEdit} />
    if (addStudent) return <StudentForm cancelEdit={cancelEdit} event={event} />

    return (
        <Grid container columnSpacing={2}>
            <Grid item xs={3} sm={2}>
                <AppButton variant="contained" color="inherit" onClick={back}>{schoolUser ? 'Survey Results' : 'Back'}</AppButton>
                <Paper sx={{ my: 2 }}>
                    <AppTextSearch label="Search Students" 
                        stateSearchTerm={studentParams.searchTerm} setParams={setStudentParams} />
                </Paper>
                <Paper sx={{ mb: 2, p: 1 }}>
                    <Grid item sx={{ color: 'rgba(0,0,0,0.6)', fontSize: isMobile ? '0.9rem' : '1rem', pl: 1 }} >Gender</Grid>
                    <RadioButtonGroup
                        selectedValue={studentParams.gender}
                        options={genderOptions}
                        onChange={(e) => dispatch(setStudentParams({ gender: e.target.value }))}
                    />
                </Paper>
                <Paper sx={{ mb: 2, p: 2 }}>
                    <CheckboxButtons
                        label="Grade"
                        items={gradeOptions.map(g => g.label)}
                        checked={studentParams.grades}
                        onChange={(items: string[]) => dispatch(setStudentParams({ grades: items }))}
                    />
                </Paper>
                <Paper sx={{ mb: 2, p: 1}}>
                    <Grid item sx={{ color: 'rgba(0,0,0,0.6)', fontSize: isMobile ? '0.9rem' : '1rem', pl: 1 }}>Survey Complete</Grid>
                    <RadioButtonGroup
                        selectedValue={studentParams.surveyComplete ? studentParams.surveyComplete.toString() : ''}
                        options={surveyOptions}
                        onChange={(e) => dispatch(setStudentParams({ surveyComplete: e.target.value }))}
                    />
                </Paper>
                <AppButton variant="contained" color="error" onClick={() => dispatch(resetStudentParams())}>
                    Reset Search
                </AppButton>
            </Grid>

            <Grid item xs={9} sm={10}>
                <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', mb: 2 }}>
                    <Typography variant={isTablet ? isMobile ? "h6" : "h5" : "h4"}>{event.name}</Typography>
                    <Typography variant={isMobile ? "h6" : "h5"} sx={{ alignItems: 'center', color: 'primary.main' }}>{responseMsg}</Typography>
                    <AppButton variant="contained" onClick={handleExportStudents}>Export Student List</AppButton>
                </Box>

                <Paper sx={{ width: '100%', height: "68vh", mb: 2 }}>
                    <DataGrid
                        rows={rows}
                        columns={columns}
                        rowCount={metaData?.totalCount || 0}
                        pagination
                        paginationMode="server"
                        paginationModel={paginationModel}
                        onPaginationModelChange={handlePaginationModelChange}
                        pageSizeOptions={[10, 20, 50, 100]}
                        loading={!studentsLoaded}
                        density="compact"
                        sx={{
                            '& .MuiDataGrid-cell': {
                                fontSize: isMobile ? '.8rem' : '.9rem'
                            }
                        }}
                    />
                </Paper>
                
                {!schoolUser &&
                    <Grid item display='flex' justifyContent='space-between' sx={{ my: 2 }}>
                        <AppButton variant="contained" 
                            onClick={() => setOpenImport(true)}>
                                Import Students
                        </AppButton>
                        <AppButton variant="contained" color="success" onClick={() => setAddStudent(true)}>Add Student</AppButton>
                        <AppButton variant="contained" color="error" 
                            onClick={() => setOpenDelete(true)}>
                            Delete All Students
                        </AppButton>
                    </Grid>
                }
            </Grid>

            <ImportStudents open={openImport} eventId={event.id} setResponse={setResponseMsg} handleClose={() => setOpenImport(false)} />
            <ConfirmDelete open={openDelete} itemName="All Students" itemType={""}
                customText="Are you sure you want to delete all students for this event?"
                handleClose={() => setOpenDelete(false)}
                confirmDelete={deleteAllStudents} loading={confirmDeleteLoading} />
            <ConfirmDelete open={deleteStudent !== undefined} itemType="Student" itemName={deleteStudent?.lastFirstName || ''}
                        handleClose={() => setDeleteStudent(undefined)} confirmDelete={handleDeleteStudent} loading={confirmDeleteLoading} />
        </Grid>
    )
}