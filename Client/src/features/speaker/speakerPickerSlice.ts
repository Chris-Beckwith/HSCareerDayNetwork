import { createAsyncThunk, createSlice } from "@reduxjs/toolkit";
import { Speaker, SpeakerParams } from "../../app/models/speaker";
import agent from "../../app/api/agent";
import { RootState } from "../../app/store/configureStore";
import { MetaData } from "../../app/models/pagination";

interface SpeakerPickerState {
    speakers: Speaker[]
    speakersLoaded: boolean
    status: string
    hasMore: boolean

    speakerParams: SpeakerParams
    metaData: MetaData | null
}

const initialState: SpeakerPickerState = {
    speakers: [],
    speakersLoaded: false,
    status: 'idle',
    hasMore: false,

    speakerParams: {
        pageNumber: 1,
        pageSize: 10
    },
    metaData: null
}

function getAxiosParams(speakerParams: SpeakerParams) {
    const params = new URLSearchParams()
    params.append('pageNumber', speakerParams.pageNumber.toString())
    params.append('pageSize', speakerParams.pageSize.toString())
    if (speakerParams.searchTerm) params.append('searchTerm', speakerParams.searchTerm)
    return params
}

export const fetchSpeakerPickerPageAsync = createAsyncThunk<Speaker[], void, {state: RootState}>(
    'speaker/fetchSpeakerPickerPageAsync',
    async (_, thunkAPI) => {
        const params = getAxiosParams(thunkAPI.getState().speakerPicker.speakerParams)
        try {
            const response = await agent.Speaker.list(params)
            thunkAPI.dispatch(setMetaData(response.metaData))
            return response.items
        } catch (error: any) {
            return thunkAPI.rejectWithValue({error: error.data})
        }
    }
)

export const speakerPickerSlice = createSlice({
    name: 'speakerPicker',
    initialState,
    reducers: {
        clearSpeakers: (state) => {
            state.speakers = []
            state.speakersLoaded = false
        },
        setSpeakerPickerParams: (state, action) => {
            state.speakersLoaded = false
            state.speakerParams = {...state.speakerParams, ...action.payload}
        },
        setSpeakerPickerSearchTerm: (state, action) => {
            state.speakers = []
            state.speakerParams.pageNumber = 1
            state.speakersLoaded = false
            state.speakerParams = {...state.speakerParams, ...action.payload}
        },
        setMetaData: (state, action) => {
            state.metaData = action.payload
        },
        resetPicker: (state) => {
            Object.assign(state, initialState)
        }
    },
    extraReducers: (builder => {
        builder.addCase(fetchSpeakerPickerPageAsync.pending, (state) => {
            state.status = 'pendingFetchSpeakerPicker'
        }),
        builder.addCase(fetchSpeakerPickerPageAsync.fulfilled, (state, action) => {
            const existingIds = new Set(state.speakers.map(s => s.id))
            const newSpeakers = action.payload.filter(s => !existingIds.has(s.id))
            state.speakers.push(...newSpeakers)
            state.speakersLoaded = true
            state.status = 'idle'
            state.hasMore = action.payload.length === state.speakerParams.pageSize
        }),
        builder.addCase(fetchSpeakerPickerPageAsync.rejected, (state, action) => {
            console.log("Rejected:", action.payload)
            state.status = 'idle'
        })
    })
})

export const {clearSpeakers, setSpeakerPickerParams, setSpeakerPickerSearchTerm, setMetaData, resetPicker} = speakerPickerSlice.actions