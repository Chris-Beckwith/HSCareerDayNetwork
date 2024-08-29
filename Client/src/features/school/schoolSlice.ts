import { createAsyncThunk, createEntityAdapter, createSlice } from "@reduxjs/toolkit";
import { School, SchoolParams } from "../../app/models/school";
import agent from "../../app/api/agent";
import { RootState } from "../../app/store/configureStore";
import { MetaData } from "../../app/models/pagination";

interface SchoolState {
    schoolsLoaded: boolean
    status: string
    schoolParams: SchoolParams
    metaData: MetaData | null
}

const schoolAdapter = createEntityAdapter<School>()

function getAxiosParams(schoolParams: SchoolParams) {
    const params = new URLSearchParams()
    params.append('pageNumber', schoolParams.pageNumber.toString())
    params.append('pageSize', schoolParams.pageSize.toString())
    if (schoolParams.searchTerm) params.append('searchTerm', schoolParams.searchTerm)
    return params
}

export const getAllSchoolsAsync = createAsyncThunk<School[], void, {state: RootState}>(
    'school/getAllSchoolsAsync',
    async (_, thunkAPI) => {
        const params = getAxiosParams(thunkAPI.getState().schools.schoolParams)
        try {
            const response = await agent.School.list(params)
            thunkAPI.dispatch(setMetaData(response.metaData))
            return response.items
        } catch (error: any) {
            return thunkAPI.rejectWithValue({error: error.data})
        }
    }
)

export const fetchSchoolAsync = createAsyncThunk<School, number>(
    'school/fetchSchoolAsync',
    async (schoolId, thunkAPI) => {
        try {
            return await agent.School.details(schoolId)
        } catch (error: any) {
            return thunkAPI.rejectWithValue({error: error.data})
        }
    }
)

function initParams() {
    return {
        pageNumber: 1,
        pageSize: 10
    }
}

export const schoolSlice = createSlice({
    name: 'school',
    initialState: schoolAdapter.getInitialState<SchoolState>({
        schoolsLoaded: false,
        status: 'idle',
        schoolParams: initParams(),
        metaData: null
    }),
    reducers: {
        reloadSchools: (state) => {
            state.schoolsLoaded = false
        },
        setPageNumber: (state, action) => {
            state.schoolsLoaded = false
            state.schoolParams = {...state.schoolParams, ...action.payload}
        },
        setMetaData: (state, action) => {
            state.metaData = action.payload
        },
        setSchoolParams: (state, action) => {
            state.schoolsLoaded = false
            state.schoolParams = {...state.schoolParams, ...action.payload}
        }
    },
    extraReducers: (builder => {
        builder.addCase(getAllSchoolsAsync.pending, (state) => {
            state.status = 'pendingGetAllSchools'
        })
        builder.addCase(getAllSchoolsAsync.fulfilled, (state, action) => {
            schoolAdapter.setAll(state, action.payload)
            state.schoolsLoaded = true
            state.status = 'idle'
        })
        builder.addCase(getAllSchoolsAsync.rejected, (state, action) => {
            console.log("Get all schools rejected:", action.payload)
            state.status = 'idle'
        })
        builder.addCase(fetchSchoolAsync.pending, (state) => {
            state.status = 'pendingFetchSchool'
        })
        builder.addCase(fetchSchoolAsync.fulfilled, (state, action) => {
            schoolAdapter.upsertOne(state, action.payload)
            state.status = 'idle'
        })
        builder.addCase(fetchSchoolAsync.rejected, (state, action) => {
            console.log(action)
            state.status = 'idle'
        })
    })
})

export const {reloadSchools, setPageNumber, setMetaData, setSchoolParams} = schoolSlice.actions
export const schoolSelectors = schoolAdapter.getSelectors((state: RootState) => state.schools)