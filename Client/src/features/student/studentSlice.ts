import { createAsyncThunk, createEntityAdapter, createSlice } from "@reduxjs/toolkit"
import { MetaData } from "../../app/models/pagination"
import { Student, StudentParams } from "../../app/models/student"
import agent from "../../app/api/agent"
import { RootState } from "../../app/store/configureStore"

interface StudentState {
    studentsLoaded: boolean
    status: string
    studentParams: StudentParams
    metaData: MetaData | null
}

const studentAdapter = createEntityAdapter<Student>()

function getAxiosParams(studentParams: StudentParams) {
    const params = new URLSearchParams()
    params.append('pageNumber', studentParams.pageNumber.toString())
    params.append('pageSize', studentParams.pageSize.toString())
    if (studentParams.gender)
        params.append('gender', studentParams.gender)
    if (studentParams.grades.length > 0)
        params.append('grades', studentParams.grades.toString())
    if (studentParams.surveyComplete)
        params.append('surveyComplete', studentParams.surveyComplete.toString())
    return params
}

export const fetchAllStudentsForEventAsync = createAsyncThunk<Student[], number, {state: RootState}>(
    'student/fetchAllStudentsForEventAsync',
    async (eventId, thunkAPI) => {
        const params = getAxiosParams(thunkAPI.getState().students.studentParams)
        params.append('eventId', eventId.toString())
        try {
            const response = await agent.Student.list(params);
            thunkAPI.dispatch(setMetaData(response.metaData))
            return response.items
        } catch (error: any) {
            return thunkAPI.rejectWithValue({error: error.data})
        }
    }
)

function initParams() {
    return {
        pageNumber: 1,
        pageSize: 20,
        gender: '',
        grades: [],
        surveyComplete: null
    }
}

export const studentSlice = createSlice({
    name: 'student',
    initialState: studentAdapter.getInitialState<StudentState>({
        studentsLoaded: false,
        status: 'idle',
        studentParams: initParams(),
        metaData: null
    }),
    reducers: {
        setStudentParams: (state, action) => {
            state.studentsLoaded = false
            state.studentParams = {...state.studentParams, ...action.payload, pageNumber: 1}
        },
        setPageMetaData: (state, action) => {
            state.studentsLoaded = false
            state.studentParams = {...state.studentParams, ...action.payload}
        },
        resetStudentParams: (state) => {
            state.studentParams = initParams()
        },
        setMetaData: (state, action) => {
            state.metaData = action.payload
        },
        reloadStudents: (state) => {
            state.studentsLoaded = false
        }
    },
    extraReducers: (builder => {
        builder.addCase(fetchAllStudentsForEventAsync.pending, (state) => {
            state.status = 'pendingGetAllStudentsForEvent'
        })
        builder.addCase(fetchAllStudentsForEventAsync.fulfilled, (state, action) => {
            studentAdapter.setAll(state, action.payload)
            state.studentsLoaded = true
            state.status = 'idle'
        })
        builder.addCase(fetchAllStudentsForEventAsync.rejected, (state, action) => {
            console.log("Rejected: ", action.payload)
            state.status = 'idle'
        })
    })
})

export const studentSelectors = studentAdapter.getSelectors((state: RootState) => state.students)
export const {setStudentParams, setPageMetaData, resetStudentParams, setMetaData, reloadStudents} = studentSlice.actions