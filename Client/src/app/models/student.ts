import { CareerEvent } from "./event";
import { School } from "./school";

export interface Student {
    id: number,
    school: School,
    studentNumber: string,
    lastFirstName: string,
    lastName: string,
    firstName: string,
    gender: string,
    grade: number,
    email: string,
    homeroomTeacher: string,
    homeroomNumber: string,
    event: CareerEvent,
    surveyComplete: boolean
}

export interface StudentParams {
    searchTerm?: string,
    gender: string,
    grades: string[],
    surveyComplete: boolean | null,
    pageNumber: number,
    pageSize: number
}