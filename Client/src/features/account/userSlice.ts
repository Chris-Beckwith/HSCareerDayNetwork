import { createEntityAdapter, createAsyncThunk, createSlice } from "@reduxjs/toolkit"
import agent from "../../app/api/agent"
import { MetaData } from "../../app/models/pagination"
import { User, UserParams } from "../../app/models/user"
import { RootState } from "../../app/store/configureStore"

interface UserState {
    usersLoaded: boolean
    status: string
    userParams: UserParams
    metaData: MetaData | null
}

const userAdapter = createEntityAdapter<User>()

function getAxiosParams(userParams: UserParams) {
    const params = new URLSearchParams()
    params.append('pageNumber', userParams.pageNumber.toString())
    params.append('pageSize', userParams.pageSize.toString())
    if (userParams.searchTerm) params.append('searchTerm', userParams.searchTerm)
    return params
}

export const getSchoolUsersAsync = createAsyncThunk<User[], void, {state: RootState}>(
    'user/getSchoolUsersAsync',
    async (_, thunkAPI) => {
        const params = getAxiosParams(thunkAPI.getState().user.userParams)
        try {
            const response = await agent.Account.schoolUsers(params)
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

export const userSlice = createSlice({
    name: 'user',
    initialState: userAdapter.getInitialState<UserState>({
        usersLoaded: false,
        status: 'idle',
        userParams: initParams(),
        metaData: null
    }),
    reducers: {
        reloadUsers: (state) => {
            state.usersLoaded = false
        },
        setPageNumber: (state, action) => {
            console.log("action: ", action.payload)
            state.usersLoaded = false
            state.userParams = {...state.userParams, ...action.payload}
        },
        setMetaData: (state, action) => {
            state.metaData = action.payload
        },
        setUserParams: (state, action) => {
            state.usersLoaded = false
            state.userParams = {...state.userParams, ...action.payload, pageNumber: 1}
        }
    },
    extraReducers: (builder => {
        builder.addCase(getSchoolUsersAsync.pending, (state) => {
            state.status = 'pendingGetAllUsers'
        })
        builder.addCase(getSchoolUsersAsync.fulfilled, (state, action) => {
            userAdapter.setAll(state, action.payload)
            state.usersLoaded = true
            state.status = 'idle'
        })
        builder.addCase(getSchoolUsersAsync.rejected, (state, action) => {
            console.log("Get all users rejected:", action.payload)
            state.status = 'idle'
        })
    })
})

export const {reloadUsers, setPageNumber, setMetaData, setUserParams} = userSlice.actions
export const userSelectors = userAdapter.getSelectors((state: RootState) => state.user)