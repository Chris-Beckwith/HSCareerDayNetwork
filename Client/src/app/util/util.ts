import dayjs from "dayjs";
import { EventPhase } from "../models/event";
import { EVENT_PHASES, LicenseStatus, LicenseType } from "./constants";
import { FieldValues, UseFormSetError } from "react-hook-form";

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

export function getLicenseTypeText(type: number) {
    switch(type) {
        case LicenseType.Full: return "Full License"
        case LicenseType.SurveyOnly: return "Survey Only"
    }
}

export function getLicenseStatusText(status: number) {
    switch(status) {
        case LicenseStatus.Active: return "Active"
        case LicenseStatus.Expired: return "Expired"
        case LicenseStatus.Cancelled: return "Cancelled"
    }
}

export function formatDate(date: string) {
    if (!date) return '-'
    const parsed = dayjs(date)
    return parsed.isValid() ? parsed.format('MMM D, YYYY') : 'N/A'
}

export function handleApiErrors(errors: any, setError: UseFormSetError<FieldValues>) {
    if (errors && Array.isArray(errors)) {
        errors.forEach((error: string) => {
            console.log("Registration Error: ", error)
            if (error.includes('Password')) {
                setError('password', {message: error})
            } else if (error.includes('Email')) {
                setError('email', {message: error})
            } else if (error.includes('Username')) {
                setError('username', {message: error})
            }
        });
    }
}