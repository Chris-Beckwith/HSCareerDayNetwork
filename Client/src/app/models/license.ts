import { LicenseStatus, LicenseType } from "../util/constants"
import { Career } from "./career"
import { CareerSet } from "./careerSet"
import { CareerEvent } from "./event"
import { School } from "./school"
import { Speaker } from "./speaker"
import { User } from "./user"

export interface License {
    id: number
    users: User[]
    events: CareerEvent[]
    schools: School[]
    careers: Career[]
    careerSets: CareerSet[]
    speakers: Speaker[]
    type: LicenseType
    status: LicenseStatus
    startDate: string
    expirationDate: string
    maxSchools: number
    maxEvents: number
}

export interface LicenseInvite {
    email: string
    expirationDate: string
    usedAt: string
    license: License
}

export interface LicenseParams {
    searchTerm?: string
    pageNumber: number
    pageSize: number
}

