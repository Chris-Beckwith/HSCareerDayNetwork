import { useAppDispatch } from "../../app/store/configureStore";
import { setEventParams, setPageNumber } from "./careerEventSlice";
import { useState } from "react";
import LoadingComponent from "../../app/components/LoadingComponent";
import { Button, Grid, Paper } from "@mui/material";
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
import useEvents from "../../app/hooks/useEvents";
import CareerEventForm from "./CareerEventForm";

const sortOptions = [
    { value: 'name', label: 'Alphabetical' },
    { value: 'date', label: 'Date - Soonest' },
    { value: 'dateDesc', label: 'Date - Latest' },
    { value: 'surveyComplete', label: 'Survey Complete - Least' },
    { value: 'surveyCompleteDesc', label: 'Survey Complete - Most' },
]

export default function CareerEvents() {
    const { careerEvents, careerEventsLoaded, eventPhases, eventPhasesLoaded, eventParams, metaData } = useEvents()
    const [selectedEvent, setSelectedEvent] = useState<CareerEvent | undefined>(undefined)
    const [viewMode, setViewMode] = useState(false)
    const [editMode, setEditMode] = useState(false)
    const dispatch = useAppDispatch()

    const viewEvent = (event: CareerEvent) => {
        setViewMode(true)
        setSelectedEvent(event)
    }

    const editEvent = (event: CareerEvent) => {
        setEditMode(true)
        setSelectedEvent(event)
    }

    const cancelView = () => {
        setViewMode(false)
        if (selectedEvent) setSelectedEvent(undefined)
    }

    const cancelEdit = () => {
        setEditMode(false)
        if (selectedEvent) setSelectedEvent(undefined)
    }

    if (!eventPhasesLoaded) return <LoadingComponent message="Loading Career Events.." />

    if (viewMode) return <CareerEventDetails careerEvent={selectedEvent!} cancelView={cancelView} />

    if (editMode) return <CareerEventForm selectedEvent={selectedEvent} cancelEdit={cancelEdit} saveEdit={cancelEdit} />

    return (
        <Grid container columnSpacing={4}>
            <Grid item xs={3}>
                <Button onClick={() => setEditMode(true)}
                    variant="contained"
                    color="primary">New Event</Button>
                <Paper sx={{ my: 2 }}>
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
                        items={eventPhases.map(e => e.phaseName)}
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
                <Grid container spacing={2}>
                    {careerEvents?.map(event => {
                        return (
                            <Grid item xs={4} key={event.id}>
                                {!careerEventsLoaded ? (
                                    <CareerEventCardSkeleton />
                                ) : (
                                    <CareerEventCard careerEvent={event} viewEvent={viewEvent} editEvent={editEvent} />
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