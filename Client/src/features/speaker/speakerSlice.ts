import { createAsyncThunk, createEntityAdapter, createSlice } from "@reduxjs/toolkit";
import { Speaker } from "../../app/models/speaker";
import { RootState } from "../../app/store/configureStore";
import agent from "../../app/api/agent";

const speakerAdapter = createEntityAdapter<Speaker>()

export const getAllSpeakersAsync = createAsyncThunk<Speaker[]>(
    'speaker/getAllSpeakersAsync',
    async (_, thunkAPI) => {
        try {
            return await agent.Speaker.list()
        } catch (error: any) {
            return thunkAPI.rejectWithValue({error: error.data})
        }
    }
)

export const speakerSlice = createSlice({
    name: 'speaker',
    initialState: speakerAdapter.getInitialState({
        speakersLoaded: false,
        status: 'idle'
    }),
    reducers: {},
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
            console.log(action.payload)
            state.status = 'idle'
        })
    })
})

export const speakerSelectors = speakerAdapter.getSelectors((state: RootState) => state.speakers)