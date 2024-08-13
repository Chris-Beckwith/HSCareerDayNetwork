import { createAsyncThunk, createEntityAdapter, createSlice } from "@reduxjs/toolkit";
import { School } from "../../app/models/school";
import agent from "../../app/api/agent";
import { RootState } from "../../app/store/configureStore";

const schoolAdapter = createEntityAdapter<School>()

export const getAllSchoolsAsync = createAsyncThunk<School[]>(
    'school/getAllSchoolsAsync',
    async (_, thunkAPI) => {
        try {
            return await agent.School.list()
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

export const schoolSlice = createSlice({
    name: 'school',
    initialState: schoolAdapter.getInitialState({
        schoolsLoaded: false,
        status: 'idle'
    }),
    reducers: {
        // setAllSchools: (state, action) => {
        //     state.allSchools = action.payload
        // },
        // setCurrentSchool: (state, action) => {
        //     state.currentSchool = action.payload
        // },
        // clearCurrentSchool: (state) => {
        //     state.currentSchool = null
        // }
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

// export const {setAllSchools, setCurrentSchool, clearCurrentSchool} = schoolSlice.actions
export const schoolSelectors = schoolAdapter.getSelectors((state: RootState) => state.schools)