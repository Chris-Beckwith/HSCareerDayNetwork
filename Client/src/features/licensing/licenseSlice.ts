import { createAsyncThunk, createEntityAdapter, createSlice } from "@reduxjs/toolkit"
import { License, LicenseParams } from "../../app/models/license"
import { MetaData } from "../../app/models/pagination"
import type { RootState } from "../../app/store/configureStore"
import agent from "../../app/api/agent"

interface LicenseState {
    licensesLoaded: boolean
    status: string
    licenseParams: LicenseParams
    metaData: MetaData | null
}

const licenseAdapter = createEntityAdapter<License>()

function getAxiosParams(licenseParams: LicenseParams) {
    const params = new URLSearchParams()
    params.append('pageNumber', licenseParams.pageNumber.toString())
    params.append('pageSize', licenseParams.pageSize.toString())
    if (licenseParams.searchTerm) params.append('searchTerm', licenseParams.searchTerm)
    return params
}

export const getAllLicensesAsync = createAsyncThunk<License[], void, {state: RootState}>(
    'license/getAllLicensesAsync',
    async (_, thunkAPI) => {
        const params = getAxiosParams(thunkAPI.getState().licenses.licenseParams)
        try {
            const response = await agent.License.list(params)
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
        pageSize: 10
    }
}

export const licenseSlice = createSlice({
    name: 'license',
    initialState: licenseAdapter.getInitialState<LicenseState>({
        licensesLoaded: false,
        status: 'idle',
        licenseParams: initParams(),
        metaData: null
    }),
    reducers: {
        reloadLicenses: (state) => {
            state.licensesLoaded = false
        },
        setPagination: (state, action) => {
            state.licensesLoaded = false
            state.licenseParams = {...state.licenseParams, ...action.payload}
        },
        setMetaData: (state, action) => { 
            state.metaData = action.payload
        },
        setLicenseSearchParams: (state, action) => {
            state.licensesLoaded  = false
            state.licenseParams = { ...state.licenseParams, ...action.payload, pageNumber: 1}
        }
    },
    extraReducers: (builder => {
        builder.addCase(getAllLicensesAsync.pending, (state) => {
            state.status = 'pendingGetAllLicenses'
        })
        builder.addCase(getAllLicensesAsync.fulfilled, (state, action) => {
            licenseAdapter.setAll(state, action.payload)
            state.licensesLoaded = true
            state.status = 'idle'
        })
        builder.addCase(getAllLicensesAsync.rejected, (state, action)  => {
            console.log("Get all licenses rejected:", action.payload)
            state.status = 'idle'
        })
    })
})

export const {reloadLicenses, setPagination, setMetaData, setLicenseSearchParams} = licenseSlice.actions
export const licenseSelectors = licenseAdapter.getSelectors((state: RootState) => state.licenses)