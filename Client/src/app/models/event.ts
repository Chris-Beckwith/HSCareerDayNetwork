import { School } from "./school"

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