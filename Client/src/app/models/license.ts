import { LicenseStatus, LicenseType } from "../util/constants"

export interface License {
    id: number
    type: LicenseType
    status: LicenseStatus
    startDate: string
    expirationDate: string
    maxSchools: number
    maxEvents: number
}

