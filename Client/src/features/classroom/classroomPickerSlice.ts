import { createAsyncThunk, createSlice } from "@reduxjs/toolkit";
import { Classroom, ClassroomParams } from "../../app/models/classroom";
import { MetaData } from "../../app/models/pagination";
import type { RootState } from "../../app/store/configureStore";
import agent from "../../app/api/agent";

interface ClassroomPickerState {
    classrooms: Classroom[]
    classroomsLoaded: boolean
    status: string
    hasMore: boolean

    classroomParams: ClassroomParams
    metaData: MetaData | null
}

const initialState: ClassroomPickerState = {
    classrooms: [],
    classroomsLoaded: false,
    status: 'idle',
    hasMore: false,

    classroomParams: {
        pageNumber: 1,
        pageSize: 10,
    },
    metaData: null
}

function getAxiosParams(classroomParams: ClassroomParams, schoolId: number) {
    const params = new URLSearchParams()
    params.append('pageNumber', classroomParams.pageNumber.toString())
    params.append('pageSize', classroomParams.pageSize.toString())
    params.append('schoolId', schoolId.toString())
    if (classroomParams.searchTerm) params.append('searchTerm', classroomParams.searchTerm)
    return params
}

export const fetchClassroomPickerPageAsync = createAsyncThunk<Classroom[], number, {state: RootState}>(
    'classroom/fetchClassroomPickerPageAsync',
    async(schoolId, thunkAPI) => {
        const params = getAxiosParams(thunkAPI.getState().classroomPicker.classroomParams, schoolId)
        try {
            const response = await agent.Classroom.listBySchool(params)
            thunkAPI.dispatch(setMetaData(response.metaData))
            return response.items
        } catch (error: any) {
            return thunkAPI.rejectWithValue({error: error.data})
        }
    }
)

export const classroomPickerSlice = createSlice({
    name: 'classroomPicker',
    initialState,
    reducers: {
        clearClassrooms: (state) => {
            state.classrooms = []
            state.classroomsLoaded = false
        },
        setClassroomPickerParams: (state, action) => {
            state.classroomsLoaded = false
            state.classroomParams = {...state.classroomParams, ...action.payload}
        },
        setClassroomPickerSearchTerm: (state, action) => {
            state.classrooms = []
            state.classroomParams.pageNumber = 1
            state.classroomsLoaded = false
            state.classroomParams = {...state.classroomParams, ...action.payload}
        },
        setMetaData: (state, action) => {
            state.metaData = action.payload
        },
        resetPicker: (state) => {
            Object.assign(state, initialState)
        }
    },
    extraReducers: (builder => {
        builder.addCase(fetchClassroomPickerPageAsync.pending, (state) => {
            state.status = 'pendingFetchClassroomPicker'
        }),
        builder.addCase(fetchClassroomPickerPageAsync.fulfilled, (state, action) => {
            const existingIds = new Set(state.classrooms.map(c => c.id))
            const newClassrooms = action.payload.filter(c => !existingIds.has(c.id))
            state.classrooms.push(...newClassrooms)
            state.classroomsLoaded = true
            state.status = 'idle'
            state.hasMore = action.payload.length === state.classroomParams.pageSize
        }),
        builder.addCase(fetchClassroomPickerPageAsync.rejected, (state, action) => {
            console.log("Rejected: ", action.payload)
            state.status = 'idle'
        })
    })
})

export const {clearClassrooms, setClassroomPickerParams, setClassroomPickerSearchTerm,
    setMetaData, resetPicker} = classroomPickerSlice.actions