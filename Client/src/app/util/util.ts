import { Classroom } from "../models/classroom";
import { EventPhase } from "../models/event";
import { EVENT_PHASES } from "./constants";

export function getCookie(key: string) {
    const b = document.cookie.match("(^|;)\\s*" + key + "\\s*=\\s*([^;]+)");
    return b ? b.pop() : "";
}

export function getClassroomText(classroom: Classroom | undefined) {
    return classroom 
        ? classroom.building + classroom.roomNumber 
            + " - Capacity: " + classroom.capacity
        : "Not assigned"
}

export function downloadExcel(response: any) {
    const blob = new Blob([response.file], { type: response.contentType })
    const link = document.createElement('a')
    const url = window.URL.createObjectURL(blob)

    link.href = url
    link.download = response.fileName
    
    document.body.appendChild(link)
    
    link.click()
    
    document.body.removeChild(link)
}

export function findNextEventPhaseId(eventPhases: EventPhase[], phaseName: string) {
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
            eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SCHEDULEEXPORT)
            break;
        // case EVENT_PHASES.ROOMSASSIGNED:
        //     eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SPEAKERSASSIGNED)
        //     break;
        // case EVENT_PHASES.SPEAKERSASSIGNED:
        //     eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SCHEDULEEXPORT)
        //     break;
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

export function findPrevEventPhaseId(eventPhases: EventPhase[], phaseName: string) {
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
        // case EVENT_PHASES.ROOMSASSIGNED:
        //     eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SESSIONSGENERATED)
        //     break;
        // case EVENT_PHASES.SPEAKERSASSIGNED:
        //     eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.ROOMSASSIGNED)
        //     break;
        case EVENT_PHASES.SCHEDULEEXPORT:
            eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SESSIONSGENERATED)
            break;
        case EVENT_PHASES.COMPLETED:
            eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SESSIONSGENERATED)
            break;
        default:
            eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.CREATED)
    }
    if (eventPhase === undefined) return -1
    return eventPhase.id
}