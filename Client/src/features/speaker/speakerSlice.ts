import { createAsyncThunk, createEntityAdapter, createSlice } from "@reduxjs/toolkit";
import { Speaker, SpeakerParams } from "../../app/models/speaker";
import { RootState } from "../../app/store/configureStore";
import agent from "../../app/api/agent";
import { MetaData } from "../../app/models/pagination";

interface SpeakerState {
    speakersLoaded: boolean
    status: string
    speakerParams: SpeakerParams
    metaData: MetaData | null
}

const speakerAdapter = createEntityAdapter<Speaker>()

function getAxiosParams(speakerParams: SpeakerParams) {
    const params = new URLSearchParams()
    params.append('pageNumber', speakerParams.pageNumber.toString())
    params.append('pageSize', speakerParams.pageSize.toString())
    if (speakerParams.searchTerm) params.append('searchTerm', speakerParams.searchTerm)
    return params
}

export const getAllSpeakersAsync = createAsyncThunk<Speaker[], void, {state: RootState}>(
    'speaker/getAllSpeakersAsync',
    async (_, thunkAPI) => {
        const params = getAxiosParams(thunkAPI.getState().speakers.speakerParams)
        try {
            const response = await agent.Speaker.list(params)
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

export const speakerSlice = createSlice({
    name: 'speaker',
    initialState: speakerAdapter.getInitialState<SpeakerState>({
        speakersLoaded: false,
        status: 'idle',
        speakerParams: initParams(),
        metaData: null
    }),
    reducers: {
        setSpeaker: (state, action) => {
            speakerAdapter.upsertOne(state, action.payload)
            state.speakersLoaded = false
        },
        removeSpeaker: (state, action) => {
            speakerAdapter.removeOne(state, action.payload)
            state.speakersLoaded = false
        },
        setSpeakerParams: (state, action) => {
            state.speakersLoaded = false
            state.speakerParams = {...state.speakerParams, ...action.payload}
        },
        resetSpeakerParams: (state) => {
            state.speakerParams = initParams()
        },
        setPageNumber: (state, action) => {
            state.speakersLoaded = false
            state.speakerParams = {...state.speakerParams, ...action.payload}
        },
        setMetaData: (state, action) => {
            state.metaData = action.payload
        }
    },
    extraReducers: (builder => {
        builder.addCase(getAllSpeakersAsync.pending, (state) => {
            state.status = 'pendingGetAllSpeakers'
        }),
        builder.addCase(getAllSpeakersAsync.fulfilled, (state, action) => {
            speakerAdapter.setAll(state, action.payload)
            state.speakersLoaded = true
            state.status = 'idle'
        }),
        builder.addCase(getAllSpeakersAsync.rejected, (state, action) => {
            console.log("Rejected:", action.payload)
            state.status = 'idle'
        })
    })
})

export const speakerSelectors = speakerAdapter.getSelectors((state: RootState) => state.speakers)
export const {setSpeaker, removeSpeaker, setPageNumber, setMetaData} = speakerSlice.actions