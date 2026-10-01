import { EventPhase } from "../models/event";
import { EVENT_PHASES } from "./constants";

export function getCookie(key: string) {
    const b = document.cookie.match("(^|;)\\s*" + key + "\\s*=\\s*([^;]+)");
    return b ? b.pop() : "";
}

export function normalizeNewline(value?: string) {
  return value ? value.replace(/\r\n/g, "\n") : value;
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

export const isScheduleAvailable = (phaseName: string) => {
    return [EVENT_PHASES.SCHEDULEGENERATED,
        EVENT_PHASES.SCHEDULELOCKED,
        EVENT_PHASES.COMPLETED,
        EVENT_PHASES.CANCELLED]
            .includes(phaseName)
}

export function findNextEventPhaseId(eventPhases: EventPhase[], phaseName: string) {
    let eventPhase;
    switch (phaseName) {
        case EVENT_PHASES.SETUP:
            eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SURVEYINPROGRESS)
            break;
        case EVENT_PHASES.SURVEYINPROGRESS:
            eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SURVEYCLOSED)
            break;
        case EVENT_PHASES.SURVEYCLOSED:
            eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SCHEDULEGENERATED)
            break;
        case EVENT_PHASES.SCHEDULEGENERATED:
            eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SCHEDULELOCKED)
            break;
        case EVENT_PHASES.SCHEDULELOCKED:
        case EVENT_PHASES.COMPLETED:
            eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.COMPLETED)
            break;
        case EVENT_PHASES.CANCELLED:
            eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.CANCELLED)
            break;
        default:
            eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SETUP)
    }
    if (eventPhase === undefined) return -1
    return eventPhase.id
}

export function findPrevEventPhaseId(eventPhases: EventPhase[], phaseName: string) {
    let eventPhase;
    switch (phaseName) {
        case EVENT_PHASES.SURVEYINPROGRESS:
            eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SETUP)
            break;
        case EVENT_PHASES.SURVEYCLOSED:
        case EVENT_PHASES.SCHEDULEGENERATED:
            eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SURVEYINPROGRESS)
            break;
        case EVENT_PHASES.SCHEDULELOCKED:
            eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SCHEDULEGENERATED)
            break;
        case EVENT_PHASES.COMPLETED:
        case EVENT_PHASES.CANCELLED:
            eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SCHEDULELOCKED)
            break;
        default:
            eventPhase = eventPhases.find(e => e.phaseName === EVENT_PHASES.SETUP)
    }
    if (eventPhase === undefined) return -1
    return eventPhase.id
}