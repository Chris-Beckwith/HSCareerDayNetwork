import { Career } from "./career"

export interface ScheduleParams {
    eventId: number
    maxClassSize: number
    minClassSize: number
    periodCount: number
    requiredPeriodForCareerList: {
        [key: number]: (0 | 1 | 2)[]
    }
    sameSpeakersForCareerList: Career[][]
}