import { CareerEvent } from "./event"

export interface User {
    id: string
    email: string
    userName: string
    event?: CareerEvent
    eventId?: number
    token: string
    roles?: string[]
}

export interface UserParams {
    searchTerm?: string
    pageNumber: number
    pageSize: number
}