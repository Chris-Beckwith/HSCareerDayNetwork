import { Box, Button, Grid, Link, Paper, Typography } from "@mui/material";
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
import ConfirmDelete from "../../app/components/ConfirmDelete";
import CareerEventSpeakers from "./components/CareerEventSpeakers";
import { Speaker } from "../../app/models/speaker";
import CareerEventCareers from "./components/CareerEventCareers";
import { Career } from "../../app/models/career";
import Students from "../student/Students";
import { reloadStudents } from "../student/studentSlice";
import CareerEventDetailsSkeleton from "./CareerEventDetailsSkeleton";
import Classrooms from "../classroom/Classrooms";
import SurveyResults from "../survey/SurveyResults";
import ConfirmPreviousPhase from "./components/ConfirmPreviousPhase";
import SchedulingTool from "../scheduling/SchedulingTool";
import { LoadingButton } from "@mui/lab";

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
    const [roomMode, setRoomMode] = useState(false)
    const [surveyMode, setSurveyMode] = useState(false)
    const [scheduleMode, setScheduleMode] = useState(false)
    const [confirmPreviousPhase, setConfirmPreviousPhase] = useState(false)
    const [confirmDeleteLoading, setConfirmDeleteLoading] = useState(false)
    const [eventPhaseName, setEventPhaseName] = useState('')
    const [prevEventPhaseName, setPrevEventPhaseName] = useState('')
    const [confirmPrevMessage, setConfirmPrevMessage] = useState('')
    const [loading, setLoading] = useState(false)
    const { eventPhases } = useAppSelector(state => state.careerEvents)
    const date = new Date(careerEvent.eventDate)
    const baseUrl = import.meta.env.VITE_APP_HOST || '/';
    const surveyUrl = `${baseUrl}survey/${careerEvent.guid}`

    useEffect(() => {
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
        setRoomMode(false)
        setSurveyMode(false)
        setScheduleMode(false)
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

    if (!careerEvent) return <NotFound />

    if (editMode) return <CareerEventForm selectedEvent={careerEvent} cancelEdit={cancelEdit} saveEdit={saveEdit} />

    if (speakerMode) return <CareerEventSpeakers
        careerEventName={careerEvent.name}
        careerEventSpeakers={careerEvent.speakers}
        updateCareerEvent={updateCareerEvent} back={back} />

    if (careerMode) return <CareerEventCareers
        careerEventName={careerEvent.name}
        careerEventCareers={careerEvent.careers}
        allowUpdate={!showSurveyResultsButton()}
        updateCareerEvent={updateCareerEvent} back={back} />

    if (studentMode) return <Students event={careerEvent} back={back} />

    if (roomMode) return <Classrooms school={careerEvent.school} back={back} />

    if (surveyMode) return <SurveyResults event={careerEvent} back={back} />

    if (scheduleMode) return <SchedulingTool event={careerEvent} back={back} />

    const nextEventPhaseText = () => {
        switch (eventPhaseName) {
            case EVENT_PHASES.CREATED: return "Open Survey"
            case EVENT_PHASES.SURVEYINPROGRESS: return "Close Survey"
            case EVENT_PHASES.SURVEYCLOSED: return "Scheduling Tool"
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
                    return toast.error("You do not have the minimum 5 required careers")
                break;
            case EVENT_PHASES.SURVEYINPROGRESS: 
                if (careerEvent.surveyCompletePercent < 5)
                    return toast.error("Survey is still under 5% complete")
                break;
            case EVENT_PHASES.SURVEYCLOSED: setScheduleMode(true); return;
            case EVENT_PHASES.SESSIONSGENERATED: return "Assign Rooms"
            case EVENT_PHASES.ROOMSASSIGNED: return "Assign Speakers"
            case EVENT_PHASES.SPEAKERSASSIGNED: return "Generate Schedule"
            case EVENT_PHASES.SCHEDULEEXPORT: return "Schedule Exporter"
            case EVENT_PHASES.COMPLETED:
            case EVENT_PHASES.CANCELLED: return "Reopen Event"
        }

        setLoading(true)
        const eventPhaseId = findNextEventPhaseId(eventPhaseName)
        await agent.Event.updatePhase(careerEvent.id, eventPhaseId)
        dispatch(reloadEvents())
        setLoading(false)
    }

    const handlePreviousPhaseConfirm = () => {
        const prevEventPhase = eventPhases.find(e => e.id === findPrevEventPhaseId(eventPhaseName))

        if (prevEventPhase) {
            setPrevEventPhaseName(prevEventPhase.phaseName)
            switch (prevEventPhase.phaseName) {
                case EVENT_PHASES.CREATED: 
                    setConfirmPrevMessage("Going back to created will delete all student surveys!")
                    break;
                case EVENT_PHASES.SURVEYINPROGRESS:
                    setConfirmPrevMessage("Are you sure you want to reopen the survey?")
            }
            setConfirmPreviousPhase(true)
        }
    }

    async function regressEventPhaseAction() {
        if (!careerEvent) return;

        const eventPhaseId = findPrevEventPhaseId(eventPhaseName)
        await agent.Event.updatePhase(careerEvent.id, eventPhaseId)
        dispatch(reloadEvents())

        switch (eventPhaseName) {
            case EVENT_PHASES.SURVEYINPROGRESS:
                await agent.Survey.deleteSurveysByEvent(careerEvent.id)
                    .catch((error) => {
                        console.log(error)
                    })
                break;
        }
        setConfirmPreviousPhase(false)
    }

    function showSurveyResultsButton() {
        switch (eventPhaseName) {
            case EVENT_PHASES.CREATED:
            case EVENT_PHASES.CANCELLED: return false
            case EVENT_PHASES.SURVEYINPROGRESS: 
            case EVENT_PHASES.SURVEYCLOSED: 
            case EVENT_PHASES.SESSIONSGENERATED: 
            case EVENT_PHASES.ROOMSASSIGNED: 
            case EVENT_PHASES.SPEAKERSASSIGNED: 
            case EVENT_PHASES.SCHEDULEEXPORT: 
            case EVENT_PHASES.COMPLETED: return true
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
                            <Button onClick={handlePreviousPhaseConfirm}
                                variant="contained"
                                color="error">
                                {prevEventPhaseText()}
                            </Button>
                        </Grid>
                    }
                    <Grid item xs={12}>
                        <LoadingButton onClick={progressEventPhaseAction}
                            loading={loading}
                            variant="contained"
                            color="primary">
                            {nextEventPhaseText()}
                        </LoadingButton>
                    </Grid>
                    {showSurveyResultsButton() &&
                        <Grid item xs={12}>
                            <Button onClick={() => setSurveyMode(true)}
                                variant="contained"
                                color="success"
                            >
                                Survey Results
                            </Button>
                        </Grid>
                    }
                    <Grid item xs={12}></Grid>
                    <Grid item xs={12}></Grid>
                    <Grid item xs={12}></Grid>
                    <Grid item xs={12}></Grid>
                    <Grid item xs={12}></Grid>
                </Grid>
                <Grid container item xs={8} rowSpacing={4}>
                    {careerEventsLoaded ? (
                        <>
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
                                    Event Date: {date.toLocaleDateString()}
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

                            {careerEvent.guid &&
                                <Grid item xs={12}>
                                    <Grid item display='flex' justifyContent='center' sx={{ mb: 2 }}>
                                        {careerEvent.qrCodeUrl &&
                                            <Link href={surveyUrl}>
                                                <img src={careerEvent.qrCodeUrl} alt="QRCode" style={{ height: 150, marginRight: 20 }} />
                                            </Link>
                                        }
                                    </Grid>
                                    <Grid item display='flex' justifyContent='center' alignItems='center'>
                                        <Link href={surveyUrl}>{surveyUrl}</Link>
                                    </Grid>
                                </Grid>
                            }

                            <Grid item xs={12} sx={{ pl: 0 }}>
                                <Box display='flex' justifyContent='space-between' alignItems='center' sx={{ mb: 1 }}>
                                    <Typography>Event Phase: <strong>{careerEvent.eventPhase.phaseName}</strong></Typography>
                                    <Typography sx={{ mr: 2 }}>Survey Progress</Typography>
                                </Box>
                                <LinearProgressWithLabel value={careerEvent.surveyCompletePercent} />
                            </Grid>
                        </>
                    ) : (
                        <CareerEventDetailsSkeleton />
                    )}
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
                            <Button onClick={() => setRoomMode(true)}
                                variant="contained"
                                color="primary">
                                Classrooms
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
                </Grid>
            </Grid>
            <ConfirmPreviousPhase open={confirmPreviousPhase} previousPhase={prevEventPhaseName} 
                message={confirmPrevMessage}
                handleClose={() => setConfirmPreviousPhase(false)}
                handleConfirm={regressEventPhaseAction} />
            <ConfirmDelete open={deleteMode} itemName={careerEvent.name} itemType="Event"
                handleClose={cancelDelete} confirmDelete={confirmDelete} loading={confirmDeleteLoading} />
        </Grid>
    )
}