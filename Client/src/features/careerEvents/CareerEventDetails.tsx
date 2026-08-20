import { Box, Button, Grid, IconButton, Link, MenuItem, Paper, Popover, Typography, useMediaQuery, useTheme } from "@mui/material";
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
import { findNextEventPhaseId, findPrevEventPhaseId } from "../../app/util/util";
import ExportTool from "./ExportTool";
import EventCompleted from "./components/EventCompleted";
import AppButton from "../../app/components/AppButton";
import AppLoadingButton from "../../app/components/AppLoadingButton";
import { useLocation } from "react-router-dom";
import AppBackButton from "../../app/components/AppBackButton";
import MenuIcon from '@mui/icons-material/Menu';
import { PushPin } from "@mui/icons-material";
import ConfirmCloseSurvey from "./components/ConfirmCloseSurvey";

interface Props {
    careerEvent: CareerEvent
    cancelView: () => void
    updateCareerEvent: (speakers?: Speaker[], careers?: Career[], saveCareerSet?: boolean) => void
}

/**
 * Component to display details of an event.  Also, the page where you access all of the tools
 * and change information about the event.
 */
export default function CareerEventDetails({ careerEvent, cancelView, updateCareerEvent }: Props) {
    const dispatch = useAppDispatch()
    const { careerEventsLoaded } = useEvents()
    const { eventPhases } = useAppSelector(state => state.careerEvents)
    const [editMode, setEditMode] = useState(false)
    const [deleteMode, setDeleteMode] = useState(false)
    const [speakerMode, setSpeakerMode] = useState(false)
    const [careerMode, setCareerMode] = useState(false)
    const [studentMode, setStudentMode] = useState(false)
    const [roomMode, setRoomMode] = useState(false)
    const [surveyMode, setSurveyMode] = useState(false)
    const [scheduleMode, setScheduleMode] = useState(false)
    const [exportMode, setExportMode] = useState(false)
    const [completeMode, setCompleteMode] = useState(false)
    const [confirmPreviousPhase, setConfirmPreviousPhase] = useState(false)
    const [confirmCloseSurvey, setConfirmCloseSurvey] = useState(false)
    const [confirmDeleteLoading, setConfirmDeleteLoading] = useState(false)
    const [confirmCompleteLoading, setConfirmCompleteLoading] = useState(false)
    const [eventPhaseName, setEventPhaseName] = useState('')
    const [prevEventPhaseName, setPrevEventPhaseName] = useState('')
    const [confirmPrevMessage, setConfirmPrevMessage] = useState('')
    const [loading, setLoading] = useState(false)
    const [testDataLoading, setTestDataLoading] = useState(false)
    const [anchorEl, setAnchorEl] = useState<HTMLElement | null>(null)
    const [isPinned, setIsPinned] = useState(() => {
        return localStorage.getItem("isPinned") === 'true'
    })
    const open = Boolean(anchorEl)

    const baseUrl = import.meta.env.VITE_APP_HOST || '/';
    const surveyUrl = `${baseUrl}survey/${careerEvent.guid}`
    const date = new Date(careerEvent.eventDate)
    const location = useLocation()
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))
    
    useEffect(() => {
        setEventPhaseName(careerEvent.eventPhase.phaseName)
    }, [careerEvent.eventPhase])

    useEffect(() => {
        localStorage.setItem("isPinned", String(isPinned))
    }, [isPinned])

    const handleButtonRef = (node: HTMLButtonElement | null) => {
        if (node && isPinned && !anchorEl) {
            setAnchorEl(node)
        }
    }
    
    const toggleMenu = (event?: React.MouseEvent<HTMLElement>) => {
        if (event)
            if (isPinned) {
                setAnchorEl(null)
                setIsPinned(false)
            } else {
                setAnchorEl(event.currentTarget)
            }
        else if (!isPinned)
            setAnchorEl(null)
    }

    const cancelEdit = () => {
        setAnchorEl(null)
        setEditMode(false)
    }

    const saveEdit = () => {
        setAnchorEl(null)
        setEditMode(false)
        cancelView()
    }

    const back = () => {
        setAnchorEl(null)
        dispatch(reloadStudents())
        setSpeakerMode(false)
        setCareerMode(false)
        setStudentMode(false)
        setRoomMode(false)
        setSurveyMode(false)
        setScheduleMode(false)
        setExportMode(false)
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

    async function confirmComplete() {
        setConfirmCompleteLoading(true)
        try {
            const completedPhaseId = eventPhases.find(e => e.phaseName === EVENT_PHASES.COMPLETED)?.id
            if (careerEvent && completedPhaseId) {
                await agent.Event.updatePhase(careerEvent.id, completedPhaseId)
                dispatch(reloadEvents())
                setCompleteMode(false)
            }
        } catch (error) {
            console.log(error)
        }
        setConfirmCompleteLoading(false)
    }

    async function generateTestSurveys() {
        setTestDataLoading(true)
        try {
            await agent.Survey.generateTestSurveyResults(careerEvent.id)
                .then(() => dispatch(reloadEvents()))
                .catch(error => console.log(error))
                .finally(() => setTestDataLoading(false))
        } catch (error) {
            console.log(error)
        }
    }

    if (!careerEvent) return <NotFound />

    if (editMode) return <CareerEventForm selectedEvent={careerEvent} cancelEdit={cancelEdit} saveEdit={saveEdit} />

    if (speakerMode) return <CareerEventSpeakers
        careerEvent={careerEvent}
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
            case EVENT_PHASES.SESSIONSGENERATED: return "View Schedule"
            case EVENT_PHASES.COMPLETED:
            case EVENT_PHASES.CANCELLED: return "Re-open Event"
        }
    }

    const prevEventPhaseText = () => {
        switch (eventPhaseName) {
            case EVENT_PHASES.SURVEYINPROGRESS: return "Previous Phase"
            case EVENT_PHASES.SURVEYCLOSED: return "Re-open Survey"
            case EVENT_PHASES.SESSIONSGENERATED: 
            case EVENT_PHASES.SCHEDULEEXPORT: return "Previous Phase"
            case EVENT_PHASES.COMPLETED:
            case EVENT_PHASES.CANCELLED: return "Re-open Event"
        }
    }

    async function progressEventPhaseAction() {
        if (!careerEvent) return;

        toggleMenu()

        switch (eventPhaseName) {
            case EVENT_PHASES.CREATED:
                if (careerEvent.careers.length < 5)
                    return toast.error("You do not have the minimum 5 required careers")
                break;
            case EVENT_PHASES.SURVEYINPROGRESS:
                setConfirmCloseSurvey(false)
                if (careerEvent.surveyCompletePercent < 5)
                    return toast.error("Survey is still under 5% complete")
                break;
            case EVENT_PHASES.SURVEYCLOSED: setScheduleMode(true); return;
            case EVENT_PHASES.SESSIONSGENERATED: setScheduleMode(true); return;
            case EVENT_PHASES.COMPLETED:
            case EVENT_PHASES.CANCELLED: return "Reopen Event"
        }

        setLoading(true)
        const eventPhaseId = findNextEventPhaseId(eventPhases, eventPhaseName)
        await agent.Event.updatePhase(careerEvent.id, eventPhaseId)
        dispatch(reloadEvents())
        setLoading(false)
    }

    const handlePreviousPhaseConfirm = () => {
        const prevEventPhase = eventPhases.find(e => e.id === findPrevEventPhaseId(eventPhases, eventPhaseName))
        toggleMenu()

        if (prevEventPhase) {
            setPrevEventPhaseName(prevEventPhase.phaseName)
            switch (prevEventPhase.phaseName) {
                case EVENT_PHASES.SURVEYINPROGRESS:
                    setConfirmPrevMessage("Are you sure you want to re-open the survey?")
                    break;
                case EVENT_PHASES.SESSIONSGENERATED:
                    setConfirmPrevMessage("Would you like to re-open this event?")
                    break;
            }
            setConfirmPreviousPhase(true)
        }
    }

    async function regressEventPhaseAction() {
        if (!careerEvent) return;

        setLoading(true)
        switch (eventPhaseName) {
            case EVENT_PHASES.SESSIONSGENERATED:
                await agent.Schedule.deleteSessions(careerEvent.id)
                    .catch(error => console.log(error))
                break;
        }
        
        const eventPhaseId = findPrevEventPhaseId(eventPhases, eventPhaseName)
        await agent.Event.updatePhase(careerEvent.id, eventPhaseId)
        dispatch(reloadEvents())
        setLoading(false)
        setConfirmPreviousPhase(false)
    }

    function showSurveyResultsButton() {
        switch (eventPhaseName) {
            case EVENT_PHASES.CREATED:
            case EVENT_PHASES.CANCELLED: return false
            case EVENT_PHASES.SURVEYINPROGRESS: 
            case EVENT_PHASES.SURVEYCLOSED: 
            case EVENT_PHASES.SESSIONSGENERATED:
            case EVENT_PHASES.SCHEDULEEXPORT: 
            case EVENT_PHASES.COMPLETED: return true
        }
    }

    const menuItemSx = {
        justifyContent: 'flex-end',
        fontSize: { xs: '.9rem', md: '1rem'},
        '&:hover': { backgroundColor: 'primary.light', color: 'primary.contrastText' }
    }

    const menuItems = (
        <>
            <MenuItem sx={menuItemSx} onClick={() => {
                setEditMode(true)
                toggleMenu()
            }}>
                Edit Event
            </MenuItem>
            {careerEvent.eventPhase.phaseName != EVENT_PHASES.CREATED &&
                <MenuItem sx={menuItemSx} onClick={handlePreviousPhaseConfirm}>
                    {prevEventPhaseText()}
                </MenuItem>
            }
            {careerEvent.eventPhase.phaseName != EVENT_PHASES.COMPLETED &&
                <MenuItem sx={menuItemSx} onClick={ careerEvent.eventPhase.phaseName === EVENT_PHASES.SURVEYINPROGRESS
                    ? () => setConfirmCloseSurvey(true)
                    : progressEventPhaseAction
                }>
                    {nextEventPhaseText()}
                </MenuItem>
            }
            {careerEvent.eventPhase.phaseName === EVENT_PHASES.SESSIONSGENERATED &&
                <MenuItem sx={menuItemSx} onClick={() => {
                    setExportMode(true)
                    toggleMenu()
                }}>
                    Export Schedules
                </MenuItem>
            }
            {showSurveyResultsButton() &&
                <MenuItem sx={menuItemSx} onClick={() => {
                    setSurveyMode(true)
                    toggleMenu()
                }}>
                    Survey Results
                </MenuItem>
            }
            {careerEvent.eventPhase.phaseName === EVENT_PHASES.SESSIONSGENERATED &&
                <MenuItem sx={menuItemSx} onClick={() => {
                    setCompleteMode(true)
                    toggleMenu()
                }}>
                    Event Completed
                </MenuItem>
            }
            <MenuItem sx={{ ...menuItemSx,
                '&:hover': careerEvent.isDeleted 
                ? { backgroundColor: 'success.light', color: 'success.contractText' }
                : { backgroundColor: 'error.light', color: 'error.contrastText' }
                }}
                onClick={() => {
                    careerEvent.isDeleted ? restoreEvent() : setDeleteMode(true)
                    toggleMenu()
                }}
            >
                {careerEvent.isDeleted ? "Restore Event": "Delete Event"}
            </MenuItem>
        </>
    )

    return (
        <Grid container>
            <Grid container item xs={12} display='flex' justifyContent='center' position='relative' alignItems='center'>
                <AppBackButton onClick={cancelView} />
                <Typography align="center" variant={isTablet ? isMobile ? "h5" : "h4" : "h3"}>{careerEvent.name}</Typography>
                <Grid item xs={12} position='absolute' sx={{ right: 4 }}>

                    {open && 
                        <IconButton onClick={() => setIsPinned(prev => !prev)} title={isPinned ? "Unpin menu" : "Pin menu"}
                            aria-label={isPinned ? "Unpin menu" : "Pin menu"}
                            sx={{ zIndex: theme => theme.zIndex.modal + 1 }}
                            >
                            <PushPin sx={{ mt: .5, transform: isPinned ? 'none' : 'rotate(45deg)' }}/>
                        </IconButton>
                    }

                    <Button onClick={toggleMenu} ref={handleButtonRef} title="Menu" 
                        sx={{ color: 'text.secondary', minWidth: '24px', '&:hover': { backgroundColor: 'action.hover' } }}
                    >
                        <MenuIcon fontSize={isMobile ? "small" : isTablet ? "medium" : "large" } />
                    </Button>
                    
                    <Popover open={open} anchorEl={anchorEl} onClose={() => toggleMenu()} 
                        disableEnforceFocus={isPinned}
                        disableAutoFocus={isPinned}
                        disableRestoreFocus
                        anchorOrigin={{
                            vertical: 'bottom',
                            horizontal: 'right',
                        }}
                        transformOrigin={{
                            vertical: 'top',
                            horizontal: 'right',
                        }}
                        slotProps={{
                            root: {
                                sx: {
                                    pointerEvents: isPinned ? 'none' : 'auto'
                                }
                            },
                            paper: {
                                sx: {
                                    pointerEvents: 'auto'
                                }
                            }
                        }}
                    >
                        {menuItems}
                    </Popover>
                </Grid>
            </Grid>
            {careerEvent.isDeleted &&
                <Grid item xs={12} display='flex' justifyContent='center'>
                        <Typography variant="h5" color="error">This Event is marked as deleted</Typography>
                </Grid>
            }
            {location.pathname === '/testData' && 
                eventPhaseName === EVENT_PHASES.SURVEYINPROGRESS && careerEvent.surveyCompletePercent < 100 &&
                <Grid item xs={12} display='flex' justifyContent='center'>
                    <AppLoadingButton variant="contained" loading={testDataLoading} onClick={generateTestSurveys}>
                        Generate Test Survey Data
                    </AppLoadingButton>
                </Grid>
            }

            <Grid container sx={{ mt: 2 }} display='flex' justifyContent="center">
                <Grid container item rowSpacing={4} xs={12} sm={11} md={10}>
                    {careerEventsLoaded ? (
                        <>
                            <Grid item xs={6} display='flex' justifyContent='center'>
                                <Typography variant="h6" align="center" fontSize={isMobile ? "1rem" : "1.25rem"}>
                                    School: {isTablet && <br />}{careerEvent.school.name}
                                </Typography>
                            </Grid>
                            <Grid item xs={6} display='flex' justifyContent='center'>
                                <Typography variant="h6" align="center" fontSize={isMobile ? "1rem" : "1.25rem"}>
                                    Event Date: {date.toLocaleDateString()}
                                </Typography>
                            </Grid>

                            <Grid container item xs={6}>
                                <Grid item xs={12} display='flex' flexDirection='column' justifyContent='flex-end'>
                                    <Typography align="center">
                                        {careerEvent.school.address.address1} {careerEvent.school.address.address2}
                                    </Typography>
                                </Grid>
                                <Grid item xs={12} display='flex' justifyContent='center'>
                                    <Typography align="center">
                                        {careerEvent.school.address.city}, {careerEvent.school.address.state} {careerEvent.school.address.zip}
                                    </Typography>
                                </Grid>
                            </Grid>
                            <Grid container item xs={6} display='flex' justifyContent='center'>
                                <Grid item xs={12}>
                                    {careerEvent.description &&
                                        <Paper sx={{ p: 1, m: 1, whiteSpace: 'pre-line', backgroundColor: 'rgba(255, 255, 255, 0)' }}>
                                            {careerEvent.description}
                                        </Paper>
                                    }
                                </Grid>
                            </Grid>

                            {careerEvent.guid &&
                                <Grid item xs={12}>
                                    <Grid item display='flex' justifyContent='center' sx={{ mb: 2 }}>
                                        {careerEvent.qrCodeUrl &&
                                            <Link target="_blank" rel="noopener noreferrer" href={surveyUrl}>
                                                <img src={careerEvent.qrCodeUrl} alt="QRCode" style={ isMobile ? { height: 125} : { height: 150 }} />
                                            </Link>
                                        }
                                    </Grid>
                                    <Grid item display='flex' justifyContent='center' alignItems='center'>
                                        <Link align="center" target="_blank" rel="noopener noreferrer" href={surveyUrl}>{surveyUrl}</Link>
                                    </Grid>
                                </Grid>
                            }

                            <Grid item xs={12} sx={{ pl: 0 }}>
                                <Box display='flex' justifyContent='space-between' alignItems='center' sx={{ mb: 1 }}>
                                    <Typography fontSize={isMobile ? "0.85rem" : "1rem"}>Event Phase: <strong>{careerEvent.eventPhase.phaseName}</strong></Typography>
                                    <Typography align="right" fontSize={isMobile ? "0.85rem" : "1rem"}>Survey Progress</Typography>
                                </Box>
                                <LinearProgressWithLabel value={careerEvent.surveyCompletePercent} />
                            </Grid>
                        </>
                    ) : (
                        <CareerEventDetailsSkeleton />
                    )}
                    <Grid item xs={12} sx={{ pl: 0 }}>
                        <Box display='flex' justifyContent='space-between' alignItems='center' sx={{ mb: 1 }}>
                            <AppButton onClick={() => setCareerMode(true)}
                                variant="contained"
                                color="primary">
                                Careers
                            </AppButton>
                            <AppButton onClick={() => setStudentMode(true)}
                                variant="contained"
                                color="primary">
                                Students
                            </AppButton>
                            <AppButton onClick={() => setRoomMode(true)}
                                variant="contained"
                                color="primary">
                                Classrooms
                            </AppButton>
                            <AppButton onClick={() => setSpeakerMode(true)}
                                variant="contained"
                                color="primary">
                                Speakers
                            </AppButton>
                        </Box>
                    </Grid>
                </Grid>
            </Grid>
            <ConfirmPreviousPhase open={confirmPreviousPhase} previousPhase={prevEventPhaseName} 
                message={confirmPrevMessage} loading={loading}
                handleClose={() => setConfirmPreviousPhase(false)}
                handleConfirm={regressEventPhaseAction} />
            <ConfirmCloseSurvey open={confirmCloseSurvey} loading={loading} 
                handleClose={() => setConfirmCloseSurvey(false)} handleConfirm={progressEventPhaseAction} />
            <ConfirmDelete open={deleteMode} itemName={careerEvent.name} itemType="Event"
                handleClose={() => setDeleteMode(false)} confirmDelete={confirmDelete} loading={confirmDeleteLoading} />
            <EventCompleted open={completeMode} handleClose={() => setCompleteMode(false)} 
                isCompleted={careerEvent.eventPhase.phaseName === EVENT_PHASES.COMPLETED}
                confirmComplete={confirmComplete} loading={confirmCompleteLoading} />
            <ExportTool open={exportMode} careerEvent={careerEvent} handleClose={() => setExportMode(false)} />
        </Grid>
    )
}