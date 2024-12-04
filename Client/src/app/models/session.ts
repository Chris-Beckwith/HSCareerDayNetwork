import { Career } from "./career"
import { Classroom } from "./classroom"
import { Speaker } from "./speaker"
import { Student } from "./student"

export interface Session {
    id: number
    classroom?: Classroom
    students: Student[]
    speakers: Speaker[]
    period: number
    subject: Career
    eventId: number
}