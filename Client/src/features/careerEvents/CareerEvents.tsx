import { useAppDispatch } from "../../app/store/configureStore";
import { reloadEvents, setEventParams, setPageNumber } from "./careerEventSlice";
import { useEffect, useState } from "react";
import LoadingComponent from "../../app/components/LoadingComponent";
import { Button, Grid, Paper } from "@mui/material";
import RadioButtonGroup from "../../app/components/RadioButtonGroup";
import CheckboxButtons from "../../app/components/CheckboxButtons";
import AppPagination from "../../app/components/AppPagination";
import CareerEventCard from "./CareerEventCard";
import CareerEventCardSkeleton from "./CareerEventCardSkeleton";
import { CareerEvent } from "../../app/models/event";
import CareerEventDetails from "./CareerEventDetails";
import useEvents from "../../app/hooks/useEvents";
import CareerEventForm from "./CareerEventForm";
import IncludeDeletedCheckbox from "./components/IncludeDeletedCheckbox";
import SurveyCompleteSlider from "./components/SurveyCompleteSlider";
import agent from "../../app/api/agent";
import { Speaker } from "../../app/models/speaker";
import { Career } from "../../app/models/career";
import CareerEventCareers from "./components/CareerEventCareers";
import { EVENT_PANEL_BUTTON } from "../../app/util/constants";
import AppTextSearch from "../../app/components/AppTextSearch";
import Students from "../student/Students";
import { reloadStudents } from "../student/studentSlice";

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
    const [studentMode, setStudentMode] = useState(false)
    const [careerMode, setCareerMode] = useState(false)
    const dispatch = useAppDispatch()

    useEffect(() => {
        if (careerEvents.length > 0 && selectedEvent) {
            const updatedEvent = careerEvents.find(c => c.id == selectedEvent.id)
            if (updatedEvent)
                setSelectedEvent(updatedEvent)
        }
    }, [careerEvents, selectedEvent])

    const cancelView = () => {
        setViewMode(false)
        if (selectedEvent) setSelectedEvent(undefined)
    }

    const cancelEdit = () => {
        setEditMode(false)
        if (selectedEvent) setSelectedEvent(undefined)
    }

    const handleEventCardClick = (event: CareerEvent, button: string) => {
        switch(button) {
            case EVENT_PANEL_BUTTON.CAREERS: setCareerMode(true)
                break;
            case EVENT_PANEL_BUTTON.STUDENTS: setStudentMode(true)
                break;
            case EVENT_PANEL_BUTTON.VIEW: setViewMode(true)
                break;
            case EVENT_PANEL_BUTTON.EDIT: setEditMode(true)
                break;
        }
        setSelectedEvent(event)
    }

    const back = () => {
        dispatch(reloadStudents())
        setStudentMode(false)
        setCareerMode(false)
        if (selectedEvent) setSelectedEvent(undefined)
    }

    async function updateCareerEvent(speakers?: Speaker[], careers?: Career[]) {
        try {
            if (selectedEvent) {
                let updateCareerEvent: CareerEvent | undefined = undefined
                if (speakers) {
                    updateCareerEvent = {
                        ...selectedEvent,
                        speakers: speakers
                    }
                }
                if (careers) {
                    updateCareerEvent = {
                        ...selectedEvent,
                        careers: careers
                    }
                }
                if (updateCareerEvent) {
                    await agent.Event.update(updateCareerEvent)
                    dispatch(reloadEvents())
                }
            }
            setStudentMode(false)
            setCareerMode(false)
            cancelView()
        } catch (error) {
            console.log(error)
        }
    }

    if (!eventPhasesLoaded) return <LoadingComponent message="Loading Career Events.." />

    if (viewMode) return <CareerEventDetails careerEvent={selectedEvent!}
                            cancelView={cancelView} 
                            updateCareerEvent={updateCareerEvent} />

    if (editMode) return <CareerEventForm selectedEvent={selectedEvent} cancelEdit={cancelEdit} saveEdit={cancelEdit} />

    if (studentMode) return <Students eventId={selectedEvent!.id} back={back} />

    if (careerMode) return <CareerEventCareers careerEventName={selectedEvent!.name}
                                careerEventCareers={selectedEvent!.careers} 
                                updateCareerEvent={updateCareerEvent} back={back} />

    return (
        <Grid container columnSpacing={4}>
            <Grid item xs={3}>
                <Button onClick={() => setEditMode(true)}
                    variant="contained"
                    color="primary">New Event</Button>
                <Paper sx={{ my: 2 }}>
                    <AppTextSearch label="Search Events" 
                        stateSearchTerm={eventParams.searchTerm} setParams={setEventParams} />
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
                        label="Event Phases"
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
                                    <CareerEventCard careerEvent={event} handleEventCardClick={handleEventCardClick} />
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