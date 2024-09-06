import { createAsyncThunk, createEntityAdapter, createSlice } from "@reduxjs/toolkit";
import { Career } from "../../app/models/career";
import agent from "../../app/api/agent";
import { RootState } from "../../app/store/configureStore";
import { CareerSet } from "../../app/models/careerSet";

interface CareerState {
    careersLoaded: boolean,
    categoriesLoaded: boolean,
    careerSetsLoaded: boolean,
    categories: string[],
    careerSets: CareerSet[],
    status: string
}

const careerAdapter = createEntityAdapter<Career>()

export const getAllCareersAsync = createAsyncThunk<Career[]>(
    'career/getAllCareersAsync',
    async (_, thunkAPI) => {
        try {
            return await agent.Career.list()
        } catch (error: any) {
            return thunkAPI.rejectWithValue({error: error.data})
        }
    }
)

export const getAllCareerCategoriesAsync = createAsyncThunk(
    'career/getAllCareerCategoriesAsync',
    async (_, thunkAPI) => {
        try {
            return await agent.Career.categories()
        } catch (error: any) {
            return thunkAPI.rejectWithValue({error: error.data})
        }
    }
)

export const getAllCareerSetsAsync = createAsyncThunk<CareerSet[]>(
    'careerSets/getAllCareerSetsAsync',
    async (_, thunkAPI) => {
        try {
            return await agent.CareerSet.list()
        } catch (error: any) {
            return thunkAPI.rejectWithValue({error: error.data})
        }
    }
)

export const careerSlice = createSlice({
    name: 'career',
    initialState: careerAdapter.getInitialState<CareerState>({
        careersLoaded: false,
        categoriesLoaded: false,
        careerSetsLoaded: false,
        categories: [],
        careerSets: [],
        status: 'idle'
    }),
    reducers: {
        reloadCareers: (state) => {
            state.careersLoaded = false
            state.categoriesLoaded = false
        },
        reloadCareerSets: (state) => {
            state.careerSetsLoaded = false
        }
    },
    extraReducers: (builder => {
        builder.addCase(getAllCareersAsync.pending, (state) => {
            state.status = 'pendingGetAllCareers'
        })
        builder.addCase(getAllCareersAsync.fulfilled, (state, action) => {
            careerAdapter.setAll(state, action.payload)
            state.careersLoaded = true
            state.status = 'idle'
        })
        builder.addCase(getAllCareersAsync.rejected, (state, action) => {
            console.log("Get all careers rejected:", action.payload)
            state.status = 'idle'
        })
        builder.addCase(getAllCareerCategoriesAsync.pending, (state) => {
            state.status = 'pendingGetAllCareerCategories'
        })
        builder.addCase(getAllCareerCategoriesAsync.fulfilled, (state, action) => {
            state.categories = action.payload
            state.categoriesLoaded = true
            state.status = 'idle'
        })
        builder.addCase(getAllCareerCategoriesAsync.rejected, (state, action) => {
            console.log("Get all career categories rejected:", action.payload)
            state.status = 'idle'
        })
        builder.addCase(getAllCareerSetsAsync.pending, (state) => {
            state.status = 'pendingGetAllCareerSets'
        })
        builder.addCase(getAllCareerSetsAsync.fulfilled, (state, action) => {
            state.careerSets = action.payload
            state.careerSetsLoaded = true
            state.status = 'idle'
        })
        builder.addCase(getAllCareerSetsAsync.rejected, (state, action) => {
            console.log("Get all career sets rejected:", action.payload)
            state.status = 'idle'
        })
    })
})

export const careerSelectors = careerAdapter.getSelectors((state: RootState) => state.careers)
export const {reloadCareers, reloadCareerSets} = careerSlice.actions

