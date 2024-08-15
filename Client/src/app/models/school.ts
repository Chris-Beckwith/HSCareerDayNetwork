import { Address } from "./address"

export interface School {
  id: number
  name: string
  address: Address
  contactName: string
  contactPhone: string
  contactEmail: string
  estimatedNumOfStudents: number
}

export interface SchoolParams {
  searchTerm?: string
  pageNumber: number
  pageSize: number
}