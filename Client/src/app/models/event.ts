import { Career } from "./career"
import { School } from "./school"
import { Speaker } from "./speaker"

export interface CareerEvent {
    id: number
    school: School
    eventDate: string
    name: string
    description: string
    surveyCompletePercent: number
    eventPhase: EventPhase
    speakers: Speaker[]
    careers: Career[]
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