import { useAppDispatch, useAppSelector } from "../../app/store/configureStore";
import { careerEventSelectors, fetchEventPhasesAsync, fetchAllCareerEventsAsync, setEventParams, setPageNumber } from "./careerEventSlice";
import { useEffect, useState } from "react";
import LoadingComponent from "../../app/components/LoadingComponent";
import { Grid, Paper } from "@mui/material";
import CareerEventSearch from "./CareerEventSearch";
import RadioButtonGroup from "../../app/components/RadioButtonGroup";
import CheckboxButtons from "../../app/components/CheckboxButtons";
import AppPagination from "../../app/components/AppPagination";
import SurveyCompleteSlider from "./SurveyCompleteSlider";
import IncludeDeletedCheckbox from "./IncludeDeletedCheckbox";
import CareerEventCard from "./CareerEventCard";
import CareerEventCardSkeleton from "./CareerEventCardSkeleton";
import { CareerEvent } from "../../app/models/event";
import CareerEventDetails from "./CareerEventDetails";

const sortOptions = [
    { value: 'name', label: 'Alphabetical' },
    { value: 'date', label: 'Date - Newest to Oldest' },
    { value: 'dateDesc', label: 'Date - Oldest to Newest' },
    { value: 'surveyComplete', label: 'Survey Complete - Highest to Lowest' },
    { value: 'surveyCompleteDesc', label: 'Survey Complete - Lowest to Highest' },
]

export default function CareerEvents() {
    const careerEvents = useAppSelector(careerEventSelectors.selectAll)
    const { careerEventsLoaded, eventPhasesLoaded, eventPhases, eventParams, metaData } = useAppSelector(state => state.careerEvents)
    const dispatch = useAppDispatch()
    const [selectedEvent, setSelectedEvent] = useState<CareerEvent | undefined>(undefined)
    const [viewMode, setViewMode] = useState(false)
    const [editMode, setEditMode] = useState(false)

    useEffect(() => {
        if (!careerEventsLoaded) dispatch(fetchAllCareerEventsAsync())
    }, [careerEventsLoaded, dispatch])

    useEffect(() => {
        if (!eventPhasesLoaded) dispatch(fetchEventPhasesAsync())
    }, [eventPhasesLoaded, dispatch])

    const viewEvent = (event: CareerEvent) => {
        setViewMode(true)
        setSelectedEvent(event)
    }

    const cancelView = () => {
        setViewMode(false)
        if (selectedEvent) setSelectedEvent(undefined)
    }

    const editEvent = (event: CareerEvent) => {
        setEditMode(true)
        setSelectedEvent(event)
    }

    const cancelEdit = () => {
        setEditMode(false)
        if (selectedEvent) setSelectedEvent(undefined)
    }

    if (!eventPhasesLoaded) return <LoadingComponent message="Loading Career Events.." />

    if (viewMode) return <CareerEventDetails careerEvent={selectedEvent} cancelView={cancelView} editEvent={editEvent} cancelEdit={cancelEdit} />

    if (editMode) return <></>

    return (
        <Grid container columnSpacing={4}>
            <Grid item xs={3}>
                <Paper sx={{ mb: 2 }}>
                    <CareerEventSearch />
                </Paper>
                <Paper sx={{ mb: 2, p: 2 }}>
                    <RadioButtonGroup
                        selectedValue={eventParams.orderBy}
                        options={sortOptions}
                        onChange={(e) => dispatch(setEventParams({ orderBy: e.target.value }))}
                    />
                </Paper>
                <Paper sx={{ mb: 2, p: 2 }}>
                    <CheckboxButtons
                        items={eventPhases}
                        checked={eventParams.eventPhases}
                        onChange={(items: string[]) => dispatch(setEventParams({ eventPhases: items }))}
                    />
                </Paper>
                <Paper>
                    <SurveyCompleteSlider
                        surveyComplete={eventParams.surveyComplete}
                    />
                </Paper>
                <Paper sx={{ mb: 2, p: 2 }}>
                    <IncludeDeletedCheckbox isChecked={eventParams.includeDeleted} />
                </Paper>
            </Grid>
            <Grid item xs={9}>
                <Grid container spacing={4}>
                    {careerEvents?.map(event => {
                        return (
                            <Grid item xs={4} key={event.id}>
                                {!careerEventsLoaded ? (
                                    <CareerEventCardSkeleton />
                                ) : (
                                    <CareerEventCard careerEvent={event} viewEvent={viewEvent} />
                                )}
                            </Grid>
                        )
                    })}
                </Grid>
            </Grid>
            <Grid item xs={3} />
            <Grid item xs={9} sx={{ mb: 2 }}>
                {metaData &&
                    <AppPagination
                        metaData={metaData}
                        onPageChange={(page: number) => dispatch(setPageNumber({ pageNumber: page }))}
                    />
                }
            </Grid>
        </Grid>
    )
}