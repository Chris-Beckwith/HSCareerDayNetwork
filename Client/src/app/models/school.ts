export interface School {
    id: number
    name: string
    address: Address
    estimatedNumOfStudents: number
  }
  
  export interface Address {
    address1: string
    address2: string
    city: string
    state: string
    zip: string
    country: string
    id: number
  }