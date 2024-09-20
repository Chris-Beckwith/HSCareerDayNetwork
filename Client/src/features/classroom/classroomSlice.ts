import { createAsyncThunk, createEntityAdapter, createSlice } from "@reduxjs/toolkit"
import { Classroom, ClassroomParams } from "../../app/models/classroom"
import { MetaData } from "../../app/models/pagination"
import agent from "../../app/api/agent"
import { RootState } from "../../app/store/configureStore"

interface ClassroomState {
    classroomsLoaded: boolean
    status: string
    classroomParams: ClassroomParams
    metaData: MetaData | null
}

const classroomAdapter = createEntityAdapter<Classroom>()

function getAxiosParams(classroomParams: ClassroomParams, schoolId: number) {
    const params = new URLSearchParams()
    params.append('pageNumber', classroomParams.pageNumber.toString())
    params.append('pageSize', classroomParams.pageSize.toString())
    params.append('schoolId', schoolId.toString())
    if (classroomParams.searchTerm) params.append('searchTerm', classroomParams.searchTerm)
    return params
}

export const getAllRoomsBySchoolAsync = createAsyncThunk<Classroom[], number, {state: RootState}>(
    'classroom/getAllRoomsBySchoolAsync',
    async (schoolId, thunkAPI) => {
        try {
            const params = getAxiosParams(thunkAPI.getState().classrooms.classroomParams, schoolId)
            const response = await agent.Classroom.listBySchool(params)
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
        pageSize: 30
    }
}

export const classroomSlice = createSlice({
    name: 'classroom',
    initialState: classroomAdapter.getInitialState<ClassroomState>({
        classroomsLoaded: false,
        status: 'idle',
        classroomParams: initParams(),
        metaData: null
    }),
    reducers: {
        reloadClassrooms: (state) => {
            state.classroomsLoaded = false
        },
        setPageNumber: (state, action) => {
            state.classroomsLoaded = false
            state.classroomParams = {...state.classroomParams, ...action.payload}
        },
        setMetaData: (state, action) => {
            state.metaData = action.payload
        },
        setClassroomParams: (state, action) => {
            state.classroomsLoaded = false
            state.classroomParams = {...state.classroomParams, ...action.payload, pageNumber: 1}
        }
    },
    extraReducers: (builder => {
        builder.addCase(getAllRoomsBySchoolAsync.pending, (state) => {
            state.status = 'pendingGetAllRoomsBySchool'
        })
        builder.addCase(getAllRoomsBySchoolAsync.fulfilled, (state, action) => {
            classroomAdapter.setAll(state, action.payload)
            state.classroomsLoaded = true
            state.status = 'idle'
        })
        builder.addCase(getAllRoomsBySchoolAsync.rejected, (state, action) => {
            console.log("Get all rooms by school rejected:", action.payload)
            state.status = 'idle'
        })
    })
})

export const {reloadClassrooms, setPageNumber, setMetaData, setClassroomParams} = classroomSlice.actions
export const classroomSelectors = classroomAdapter.getSelectors((state: RootState) => state.classrooms)