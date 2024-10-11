import { Box, Button, Grid, Paper, Typography } from "@mui/material"
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
import UpdateNotAllowed from "./UpdateNotAllowed"
import { StudentParams } from "../../app/models/student"

interface Props {
    eventId: number
    eventName: string
    allowUpdate: boolean
    back: () => void
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
]

export default function Students({ eventId, eventName, allowUpdate, back }: Props) {
    const { students, studentsLoaded, metaData, studentParams } = useStudents(eventId)
    const dispatch = useAppDispatch()
    const rows = students
    const [openImport, setOpenImport] = useState(false)
    const [openDelete, setOpenDelete] = useState(false)
    const [openUpdateNotAllowed, setOpenUpdateNotAllowed] = useState(false)
    const [confirmDeleteLoading, setConfirmDeleteLoading] = useState(false)
    const [responseMsg, setResponseMsg] = useState('')

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

    const deleteAllStudents = async () => {
        setConfirmDeleteLoading(true)
        await agent.Student.deleteAll(eventId)
        dispatch(reloadStudents())
        setConfirmDeleteLoading(false)
        setOpenDelete(false)
    }

    function getAxiosParams(studentParams: StudentParams) {
        const params = new URLSearchParams()
        params.append('eventId', eventId.toString())
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
            .then(response => {
                const blob = new Blob([response], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' })
                const link = document.createElement('a')
                const url = window.URL.createObjectURL(blob)

                link.href = url
                link.download = `Students_${students[0].school.name}_${new Date().toLocaleDateString()}.xlsx`
                
                document.body.appendChild(link)
                
                link.click()
                
                document.body.removeChild(link)
            })
    }

    return (
        <Grid container columnSpacing={2}>
            <Grid item xs={2}>
                <Button variant="contained" color="inherit" onClick={back}>Back</Button>
                <Paper sx={{ my: 2 }}>
                    <AppTextSearch label="Search Students" 
                        stateSearchTerm={studentParams.searchTerm} setParams={setStudentParams} />
                </Paper>
                <Paper sx={{ mb: 2, p: 2 }}>
                    <Grid item sx={{color: 'rgba(0,0,0,0.6)'}}>Gender</Grid>
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
                <Paper sx={{ mb: 2, p: 2 }}>
                    <Grid item sx={{color: 'rgba(0,0,0,0.6)'}}>Survey Complete</Grid>
                    <RadioButtonGroup
                        selectedValue={studentParams.surveyComplete ? studentParams.surveyComplete.toString() : ''}
                        options={surveyOptions}
                        onChange={(e) => dispatch(setStudentParams({ surveyComplete: e.target.value }))}
                    />
                </Paper>
                <Button variant="contained" color="error" onClick={() => dispatch(resetStudentParams())}>
                    Reset Search
                </Button>
            </Grid>

            <Grid item xs={10}>
                <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', mb: 2}}>
                    <Typography variant="h4">{eventName}</Typography>
                    <Typography variant="h5" sx={{ alignItems: 'center', color: 'primary.main' }}>{responseMsg}</Typography>
                    <Button variant="contained" onClick={handleExportStudents}>Export Student List</Button>
                </Box>

                <Paper sx={{ width: '100%'}}>
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
                    />
                </Paper>
                
                <Grid item display='flex' justifyContent='space-between' sx={{ my: 2 }}>
                    <Button variant="contained" 
                        onClick={() => allowUpdate ? setOpenImport(true) : setOpenUpdateNotAllowed(true)}>
                            Import Students
                    </Button>
                    <Button variant="contained" color="error" 
                        onClick={() => allowUpdate ? setOpenDelete(true) : setOpenUpdateNotAllowed(true)}>
                        Delete All Students
                    </Button>
                </Grid>
            </Grid>

            <UpdateNotAllowed open={openUpdateNotAllowed} handleClose={() => setOpenUpdateNotAllowed(false)} />
            <ImportStudents open={openImport} eventId={eventId} setResponse={setResponseMsg} handleClose={() => setOpenImport(false)} />
            <ConfirmDelete open={openDelete} itemName="All Students" itemType={""}
                customText="Are you sure you want to delete all students for this event?"
                handleClose={() => setOpenDelete(false)}
                confirmDelete={deleteAllStudents} loading={confirmDeleteLoading} />
        </Grid>
    )
}