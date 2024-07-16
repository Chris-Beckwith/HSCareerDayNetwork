export interface CareerEvent {
    id: number
    school: School
    eventDate: string
    name: string
    description: string
    surveyCompletePercent: number
    eventPhase: EventPhase
    isDeleted: boolean
  }
  
  export interface School {
    id: number
    name: string
    address: Address
    estimatedNumOfStudents: number
  }
  
  export interface Address {
    id: number
    address1: string
    address2?: string
    city: string
    state: string
    zip: string
    country: string
  }
  
  export interface EventPhase {
    id: number
    phaseName: string
  }

  export interface EventParams {
    orderBy: string;
    searchTerm?: string;
    eventPhases: string[];
    surveyComplete: string;
    includeDeleted: boolean;
    pageNumber: number;
    pageSize: number;
  }