import { createAsyncThunk, createEntityAdapter, createSlice } from "@reduxjs/toolkit"
import { Survey } from "../../app/models/survey"
import agent from "../../app/api/agent"
import { RootState } from "../../app/store/configureStore"

interface SurveyState {
    surveyResultsLoaded: boolean
    status: string
}

const surveyAdapter = createEntityAdapter<Survey>()

export const getAllSurveysByEvent = createAsyncThunk<Survey[], number>(
    'survey/getAllSurveysByEvent',
    async (eventId, thunkAPI) => {
        try {
            return await agent.Survey.listByEvent(eventId)
        } catch (error: any) {
            return thunkAPI.rejectWithValue({error: error.data})
        }
    }
)

export const surveySlice = createSlice({
    name: 'survey',
    initialState: surveyAdapter.getInitialState<SurveyState> ({
        surveyResultsLoaded: false,
        status: 'idle'
    }),
    reducers: {
        reloadSurveyResults: (state) => {
            state.surveyResultsLoaded = false
        }
    },
    extraReducers: (builder => {
        builder.addCase(getAllSurveysByEvent.pending, (state) => {
            state.status = 'pendingGetAllSurveysByEvent'
        })
        builder.addCase(getAllSurveysByEvent.fulfilled, (state, action) => {
            surveyAdapter.setAll(state, action.payload)
            state.surveyResultsLoaded = true
            state.status = 'idle'
        })
        builder.addCase(getAllSurveysByEvent.rejected, (state, action) => {
            console.log("Get all surveys by event rejected: ", action.payload)
            state.status = 'idle'
        })
    })
})

export const {reloadSurveyResults} = surveySlice.actions
export const surveySelectors = surveyAdapter.getSelectors((state: RootState) => state.surveys)