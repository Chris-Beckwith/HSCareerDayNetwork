import { createAsyncThunk, createEntityAdapter, createSlice } from "@reduxjs/toolkit"
import { CareerEvent, EventParams, EventPhase } from "../../app/models/event"
import agent from "../../app/api/agent"
import { RootState } from "../../app/store/configureStore";
import { MetaData } from "../../app/models/pagination";

interface CareerEventState {
    careerEventsLoaded: boolean
    eventPhasesLoaded: boolean
    status: string
    eventPhases: EventPhase[]
    includeDeleted: boolean
    eventParams: EventParams
    metaData: MetaData | null
}

const careerEventAdapter = createEntityAdapter<CareerEvent>()

function getAxiosParams(eventParams: EventParams) {
    const params = new URLSearchParams()
    params.append('pageNumber', eventParams.pageNumber.toString())
    params.append('pageSize', eventParams.pageSize.toString())
    params.append('orderBy', eventParams.orderBy)
    if (parseInt(eventParams.surveyComplete) > 0) params.append('surveyCompletePercent', eventParams.surveyComplete.toString())
    if (eventParams.searchTerm) params.append('searchTerm', eventParams.searchTerm)
    if (eventParams.eventPhases.length > 0) params.append('eventPhases', eventParams.eventPhases.toString())
    if (eventParams.includeDeleted) params.append('isDeleted', eventParams.includeDeleted.toString())
    return params
}

export const fetchAllCareerEventsAsync = createAsyncThunk<CareerEvent[], void, {state: RootState}>(
    'event/fetchAllCareerEventsAsync',
    async (_, thunkAPI) => {
        const params = getAxiosParams(thunkAPI.getState().careerEvents.eventParams)
        try {
            const response = await agent.Event.list(params)
            thunkAPI.dispatch(setMetaData(response.metaData))
            return response.items
        } catch (error: any) {
            return thunkAPI.rejectWithValue({error: error.data})
        }
    }
)

export const fetchCareerEventAsync = createAsyncThunk<CareerEvent, number>(
    'catalog/fetchCareerEventAsync',
    async (eventId, thunkAPI) => {
        try {
            return await agent.Event.details(eventId)
        } catch (error: any) {
            return thunkAPI.rejectWithValue({error: error.data})
        }
    }
)

export const fetchEventPhasesAsync = createAsyncThunk(
    'event/fetchEventPhasesAsync',
    async(_, thunkAPI) => {
        try {
            return agent.Event.eventPhases()
        } catch (error: any) {
            return thunkAPI.rejectWithValue({error: error.data})
        }
    }
)

function initParams() {
    return {
        pageNumber: 1,
        pageSize: 9,
        orderBy: 'date',
        surveyComplete: "0",
        includeDeleted: false,
        eventPhases: []
    }
}

export const careerEventSlice = createSlice({
    name: 'careerEvent',
    initialState: careerEventAdapter.getInitialState<CareerEventState>({
        careerEventsLoaded: false,
        eventPhasesLoaded: false,
        status: 'idle',
        eventPhases: [],
        includeDeleted: false,
        eventParams: initParams(),
        metaData: null
    }),
    reducers: {
        setEventParams: (state, action) => {
            state.careerEventsLoaded = false
            state.eventParams = {...state.eventParams, ...action.payload, pageNumber: 1}
        },
        setPageNumber: (state, action) => {
            state.careerEventsLoaded = false
            state.eventParams = {...state.eventParams, ...action.payload}
        },
        resetEventParams: (state) => {
            state.eventParams = initParams()
        },
        setMetaData: (state, action) => {
            state.metaData = action.payload
        },
        reloadEvents: (state) => {
            state.careerEventsLoaded = false
        }
    },
    extraReducers: (builder => {
        builder.addCase(fetchAllCareerEventsAsync.pending, (state) => {
            state.status = 'pendingGetAllCareerEvents'
        })
        builder.addCase(fetchAllCareerEventsAsync.fulfilled, (state, action) => {
            careerEventAdapter.setAll(state, action.payload)
            state.careerEventsLoaded = true
            state.status = 'idle'
        })
        builder.addCase(fetchAllCareerEventsAsync.rejected, (state, action) => {
            console.log(action.payload)
            state.status = 'idle'
        })
        builder.addCase(fetchCareerEventAsync.pending, (state) => {
            state.status = 'pendingfetchCareerEvent'
        })
        builder.addCase(fetchCareerEventAsync.fulfilled, (state, action) => {
            careerEventAdapter.upsertOne(state, action.payload)
            state.status = 'idle'
        })
        builder.addCase(fetchCareerEventAsync.rejected, (state, action) => {
            console.log(action)
            state.status = 'idle'
        })
        builder.addCase(fetchEventPhasesAsync.pending, (state) => {
            state.status = 'pendingFetchEventPhases'
        })
        builder.addCase(fetchEventPhasesAsync.fulfilled, (state, action) => {
            state.eventPhases = action.payload
            state.eventPhasesLoaded = true
            state.status = 'idle'
        })
        builder.addCase(fetchEventPhasesAsync.rejected, (state, action) => {
            state.status = 'idle'
            console.log(action.payload)
        })
    })
})

export const careerEventSelectors = careerEventAdapter.getSelectors((state: RootState) => state.careerEvents)
export const {setEventParams, setPageNumber, resetEventParams, setMetaData, reloadEvents} = careerEventSlice.actions