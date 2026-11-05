import { User } from "../models/user"

export const ADMIN_ROLE = "Admin"
export const ADMIN_FULL_ROLES = ["Admin", "FullLicenseUser"]
export const ADMIN_FULL_SURVEY_ROLES = ["Admin", "FullLicenseUser", "SurveyLicenseUser"]
export const SCHOOL_USER_ROLE = "SchoolUser"

export const hasAnyRole = (userRoles: string[], allowedRoles: string[]) => allowedRoles.some(role => userRoles.includes(role))

const endpointPermissions = {
    careerSets: ADMIN_FULL_ROLES,
    rooms: ADMIN_FULL_ROLES,
    schedule: ADMIN_FULL_ROLES
}

export const canManageCareerSets = (user: User | null) =>
    hasAnyRole(user?.roles ?? [], endpointPermissions.careerSets)

export const canManageRooms = (user: User | null) =>
    hasAnyRole(user?.roles ?? [], endpointPermissions.rooms)

export const canManageSchedule = (user: User | null) =>
    hasAnyRole(user?.roles ?? [], endpointPermissions.schedule)
