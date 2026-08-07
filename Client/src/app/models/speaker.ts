import { Address } from "./address"
import { Career } from "./career"
import { School } from "./school"

export interface Speaker {
    id: number
    firstName: string
    middleName: string
    lastName: string
    title: string
    company: string
    schoolLastSpokeAt: School
    portraitUrl: string
    email: string
    phoneNumbers: PhoneNumber[]
    address: Address
    careers: Career[]
    careerIds: number[]
    publicId: string
}

export interface PhoneNumber {
    type: number
    number: string
    ext: string
    isPrimary: boolean
}

export interface SpeakerParams {
    searchTerm?: string
    pageNumber: number
    pageSize: number
}