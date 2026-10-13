import { CareerEvent } from "./event"
import { License } from "./license"

export interface User {
    id: string
    email: string
    userName: string
    event?: CareerEvent
    eventId?: number
    license?: License
    licenseId?: number
    token: string
    roles?: string[]
}

export interface UserParams {
    searchTerm?: string
    pageNumber: number
    pageSize: number
}