import { Career } from "./career";
import { Student } from "./student";

export interface Survey {
    id: number,
    student: Student,
    studentId: number,
    primaryCareers: Career[],
    secondaryCareers: Career[]
}