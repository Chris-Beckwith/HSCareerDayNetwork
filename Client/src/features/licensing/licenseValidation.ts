import * as yup from 'yup'
import { emailRegex, usernameRegex, usernameRequirements } from '../../app/util/validation'

export const licenseValidationSchema = yup.object({
    type: yup.number().required('A license type is required'),
    email: yup.string().required('A user email is required'). matches(emailRegex, 'Please enter a valid email'),
    expirationDate: yup.date().required('An expiration date is required'),
    maxSchools: yup.number().required('A Max Schools number is required'),
    maxEvents: yup.number().required('A Max Events number is required')
})

export const licenseRegistrationSchema = yup.object({
    username: yup.string().matches(usernameRegex, usernameRequirements)
})