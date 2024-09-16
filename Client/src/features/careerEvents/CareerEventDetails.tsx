import { Box, Button, Grid, Paper, Typography } from "@mui/material";
import NotFound from "../../app/errors/NotFound";
import { CareerEvent } from "../../app/models/event";
import LinearProgressWithLabel from "../../app/components/LinearProgressWithLabel";
import { EVENT_PHASES } from "../../app/util/constants";
import { toast } from "react-toastify";
import agent from "../../app/api/agent";
import { useAppDispatch, useAppSelector } from "../../app/store/configureStore";
import { reloadEvents } from "./careerEventSlice";
import CareerEventForm from "./CareerEventForm";
import { useEffect, useState } from "react";
import useEvents from "../../app/hooks/useEvents";
import LoadingComponent from "../../app/components/LoadingComponent";
import ConfirmDelete from "../../app/components/ConfirmDelete";
import CareerEventSpeakers from "./components/CareerEventSpeakers";
import { Speaker } from "../../app/models/speaker";
import CareerEventCareers from "./components/CareerEventCareers";
import { Career } from "../../app/models/career";
import Students from "../student/Students";
import { reloadStudents } from "../student/studentSlice";

interface Props {
    careerEvent: CareerEvent
    cancelView: () => void
    updateCareerEvent: (speakers?: Speaker[], careers?: Career[], saveCareerSet?: boolean) => void
}

export default function CareerEventDetails({ careerEvent, cancelView, updateCareerEvent }: Props) {
    const dispatch = useAppDispatch()
    const { careerEventsLoaded } = useEvents()
    const [editMode, setEditMode] = useState(false)
    const [deleteMode, setDeleteMode] = useState(false)
    const [speakerMode, setSpeakerMode] = useState(false)
    const [careerMode, setCareerMode] = useState(false)
    const [studentMode, setStudentMode] = useState(false)
    const [confirmDeleteLoading, setConfirmDeleteLoading] = useState(false)
    const [eventPhaseName, setEventPhaseName] = useState('')
    const { eventPhases } = useAppSelector(state => state.careerEvents)
    const date = new Date(careerEvent.eventDate)

    console.log(careerEvent.eventPhase.phaseName)

    useEffect(() => {
        console.log("USE EFFECT")
        setEventPhaseName(careerEvent.eventPhase.phaseName)
    }, [careerEvent.eventPhase])

    const cancelEdit = () => {
        setEditMode(false)
    }

    const saveEdit = () => {
        setEditMode(false)
        cancelView()
    }

    const back = () => {
        dispatch(reloadStudents())
        setSpeakerMode(false)
        setCareerMode(false)
        setStudentMode(false)
    }

    const deleteEvent = () => {
        setDeleteMode(true)
    }

    const cancelDelete = () => {
        setDeleteMode(false)
    }

    async function restoreEvent() {
        await agent.Event.restore(careerEvent.id)
        dispatch(reloadEvents())
        cancelView()
    }

    async function confirmDelete() {
        setConfirmDeleteLoading(true)
        try {
            if (careerEvent) {
                await agent.Event.delete(careerEvent.id)
                dispatch(reloadEvents())
                setDeleteMode(false)
                cancelView()
            }
        } catch (error) {
            console.log(error)
        }
        setConfirmDeleteLoading(false)
    }

    if (!careerEventsLoaded) return <LoadingComponent message="Loading Career Events.." />

    if (!careerEvent) return <NotFound />

    if (editMode) return <CareerEventForm selectedEvent={careerEvent} cancelEdit={cancelEdit} saveEdit={saveEdit} />

    if (speakerMode) return <CareerEventSpeakers
                                careerEventName={careerEvent.name}
                                careerEventSpeakers={careerEvent.speakers}
                                updateCareerEvent={updateCareerEvent} back={back} />
                                
    if (careerMode) return <CareerEventCareers
                                careerEventName={careerEvent.name}
                                careerEventCareers={careerEvent.careers}
                                updateCareerEvent={updateCareerEvent} back={back} />

    if (studentMode) return <Students eventId={careerEvent.id} back={back} />

    const nextEventPhaseText = () => {
        switch (eventPhaseName) {
            case EVENT_PHASES.CREATED: return "Open Survey"
            case EVENT_PHASES.SURVEYINPROGRESS: return "Close Survey"
            case EVENT_PHASES.SURVEYCLOSED: return "Generate Sessions"
            case EVENT_PHASES.SESSIONSGENERATED: return "Assign Rooms"
            case EVENT_PHASES.ROOMSASSIGNED: return "Assign Speakers"
            case EVENT_PHASES.SPEAKERSASSIGNED: return "Generate Schedule"
            case EVENT_PHASES.SCHEDULEEXPORT: return "Schedule Exporter"
            case EVENT_PHASES.COMPLETED:
            case EVENT_PHASES.CANCELLED: return "Reopen Event"
        }
    }

    const prevEventPhaseText = () => {
        switch (eventPhaseName) {
            case EVENT_PHASES.SURVEYINPROGRESS:
            case EVENT_PHASES.SURVEYCLOSED:
            case EVENT_PHASES.SESSIONSGENERATED:
            case EVENT_PHASES.ROOMSASSIGNED:
            case EVENT_PHASES.SPEAKERSASSIGNED:
            case EVENT_PHASES.SCHEDULEEXPORT: return "Previous Phase"
            case EVENT_PHASES.COMPLETED:
            case EVENT_PHASES.CANCELLED: return "Reopen Event"
        }
    }

    const findNextEventPhaseId = (phaseName: string) => {
        let eventPhase;
        switch (phaseName) {
            case EVENT_PHASES.CREATED:
                eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SURVEYINPROGRESS)
                break;
            case EVENT_PHASES.SURVEYINPROGRESS:
                eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SURVEYCLOSED)
                break;
            case EVENT_PHASES.SURVEYCLOSED:
                eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SESSIONSGENERATED)
                break;
            case EVENT_PHASES.SESSIONSGENERATED:
                eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.ROOMSASSIGNED)
                break;
            case EVENT_PHASES.ROOMSASSIGNED:
                eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SPEAKERSASSIGNED)
                break;
            case EVENT_PHASES.SPEAKERSASSIGNED:
                eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SCHEDULEEXPORT)
                break;
            case EVENT_PHASES.SCHEDULEEXPORT:
            case EVENT_PHASES.COMPLETED:
                eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.COMPLETED)
                break;
            case EVENT_PHASES.CANCELLED:
                eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.CANCELLED)
                break;
            default:
                eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.CREATED)
        }
        if (eventPhase === undefined) return -1
        return eventPhase.id
    }

    const findPrevEventPhaseId = (phaseName: string) => {
        let eventPhase;
        switch (phaseName) {
            case EVENT_PHASES.SURVEYINPROGRESS:
                eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.CREATED)
                break;
            case EVENT_PHASES.SURVEYCLOSED:
                eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SURVEYINPROGRESS)
                break;
            case EVENT_PHASES.SESSIONSGENERATED:
                eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SURVEYCLOSED)
                break;
            case EVENT_PHASES.ROOMSASSIGNED:
                eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SESSIONSGENERATED)
                break;
            case EVENT_PHASES.SPEAKERSASSIGNED:
                eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.ROOMSASSIGNED)
                break;
            case EVENT_PHASES.SCHEDULEEXPORT:
                eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SPEAKERSASSIGNED)
                break;
            case EVENT_PHASES.COMPLETED:
                eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SCHEDULEEXPORT)
                break;
            default:
                eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.CREATED)
        }
        if (eventPhase === undefined) return -1
        return eventPhase.id
    }

    async function progressEventPhaseAction() {
        if (!careerEvent) return;

        switch (eventPhaseName) {
            case EVENT_PHASES.CREATED:
                if (careerEvent.careers.length < 5)
                    toast.error("You do not have the minimum 5 required careers")
                else {
                    const eventPhaseId = findNextEventPhaseId(eventPhaseName)
                    await agent.Event.updatePhase(careerEvent.id, eventPhaseId)
                    dispatch(reloadEvents())
                }
                break;
            case EVENT_PHASES.SURVEYINPROGRESS: return "Close Survey"
            case EVENT_PHASES.SURVEYCLOSED: return "Generate Sessions"
            case EVENT_PHASES.SESSIONSGENERATED: return "Assign Rooms"
            case EVENT_PHASES.ROOMSASSIGNED: return "Assign Speakers"
            case EVENT_PHASES.SPEAKERSASSIGNED: return "Generate Schedule"
            case EVENT_PHASES.SCHEDULEEXPORT: return "Schedule Exporter"
            case EVENT_PHASES.COMPLETED:
            case EVENT_PHASES.CANCELLED: return "Reopen Event"
        }
    }

    async function regressEventPhaseAction() {
        if (!careerEvent) return;
        
        const eventPhaseId = findPrevEventPhaseId(eventPhaseName)

        switch(eventPhaseName) {
            case EVENT_PHASES.SURVEYINPROGRESS:
                await agent.Event.updatePhase(careerEvent.id, eventPhaseId)
                dispatch(reloadEvents())
                break;
        }
    }

    return (
        <Grid container spacing={6}>
            <Grid container item xs={12}>
                <Grid container item xs={2}>
                    <Grid item xs={12}></Grid>
                    <Grid item xs={12}></Grid>
                    <Grid item xs={12}>
                        <Button onClick={cancelView}
                            variant="contained"
                            color="inherit">
                            Back
                        </Button>
                    </Grid>
                    <Grid item xs={12}>
                        <Button onClick={() => setEditMode(true)}
                            variant="contained"
                            color="secondary">
                            Edit Event
                        </Button>
                    </Grid>
                    {careerEvent.eventPhase.phaseName != EVENT_PHASES.CREATED &&
                        <Grid item xs={12}>
                            <Button onClick={regressEventPhaseAction}
                                variant="contained"
                                color="error">
                                {prevEventPhaseText()}
                            </Button>
                        </Grid>
                    }
                    <Grid item xs={12}>
                        <Button onClick={progressEventPhaseAction}
                            variant="contained"
                            color="primary">
                            {nextEventPhaseText()}
                        </Button>
                    </Grid>
                    <Grid item xs={12}></Grid>
                    <Grid item xs={12}></Grid>
                    <Grid item xs={12}></Grid>
                    <Grid item xs={12}></Grid>
                </Grid>
                <Grid container item xs={8} rowSpacing={4}>
                    <Grid item xs={12} display='flex' justifyContent='center'>
                        <Typography variant="h3">{careerEvent.name}</Typography>
                    </Grid>
                    <Grid item xs={12} display='flex' justifyContent='center'>
                        {careerEvent.isDeleted &&
                            <Typography variant="h5" color="error">This Event is marked as deleted</Typography>}
                    </Grid>

                    <Grid item xs={6} display='flex' justifyContent='center'>
                        <Typography variant="h6">School: {careerEvent.school.name}</Typography>
                    </Grid>
                    <Grid item xs={6} display='flex' justifyContent='center'>
                        <Typography variant="h6">
                            Event Date: {date.toLocaleDateString()} @ {date.toLocaleTimeString()}
                        </Typography>
                    </Grid>

                    <Grid container item xs={6}>
                        <Grid item xs={12} display='flex' justifyContent='center'>
                            {careerEvent.school.address.address1} {careerEvent.school.address.address2}
                        </Grid>
                        <Grid item xs={12} display='flex' justifyContent='center'>
                            {careerEvent.school.address.city}, {careerEvent.school.address.state} {careerEvent.school.address.zip}
                        </Grid>
                    </Grid>
                    <Grid container item xs={6} display='flex' justifyContent='center'>
                        <Grid item xs={12}>
                            <Paper sx={{ p: 1, m: 1, backgroundColor: 'rgba(255, 255, 255, 0)' }}>
                                {careerEvent.description}
                            </Paper>
                        </Grid>
                    </Grid>

                    <Grid item xs={12} sx={{ pl: 0 }}>
                        <Box display='flex' justifyContent='space-between' alignItems='center' sx={{ mb: 1 }}>
                            <Typography>Event Phase: <strong>{careerEvent.eventPhase.phaseName}</strong></Typography>
                            <Typography sx={{ mr: 2 }}>Survey Progress</Typography>
                        </Box>
                        <LinearProgressWithLabel value={careerEvent.surveyCompletePercent} />
                    </Grid>

                    <Grid item xs={12} sx={{ pl: 0 }}>
                        <Box display='flex' justifyContent='space-between' alignItems='center' sx={{ mb: 1 }}>
                        <Button onClick={() => setCareerMode(true)}
                                variant="contained"
                                color="primary">
                                Careers
                            </Button>
                            <Button onClick={() => setStudentMode(true)}
                                variant="contained"
                                color="primary">
                                Students
                            </Button>
                            <Button onClick={() => setSpeakerMode(true)}
                                variant="contained"
                                color="primary">
                                Speakers
                            </Button>
                        </Box>
                    </Grid>
                </Grid>
                <Grid container item xs={2}>
                    <Grid item xs={12}></Grid>
                    <Grid item xs={12}>
                        <Button onClick={careerEvent.isDeleted ? restoreEvent : deleteEvent}
                            variant="contained"
                            color={careerEvent.isDeleted ? "success" : "error"}>
                            {careerEvent.isDeleted ? "Restore Event" : "Delete Event"}
                        </Button>
                    </Grid>
                    <Grid item xs={12}></Grid>
                    <Grid item xs={12}></Grid>
                    <Grid item xs={12}></Grid>
                    <Grid item xs={12}></Grid>
                    <Grid item xs={12}></Grid>
                    <Grid item xs={12}></Grid>
                </Grid>
            </Grid>
            <ConfirmDelete open={deleteMode} itemName={careerEvent.name} itemType="Event"
                handleClose={cancelDelete} confirmDelete={confirmDelete} loading={confirmDeleteLoading} />
        </Grid>
    )
}