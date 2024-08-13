import { Address } from "./address"
import { Career } from "./career"

export interface Speaker {
    id: number
    firstName: string
    middleName: string
    lastName: string
    title: string
    company: string
    portraitUrl: string
    email: string
    phoneNumber: string
    address: Address
    careers: Career[]
    careerIds: number[]
    publicId: string
}

export interface SpeakerParams {
    searchTerm?: string
    pageNumber: number
    pageSize: number
}