import { School } from "./school"

export interface Classroom {
    id: number
    school: School
    building: string
    roomNumber: string
    capacity: number
    overflow: number
}

export interface ClassroomParams {
    searchTerm?: string
    pageNumber: number
    pageSize: number
}