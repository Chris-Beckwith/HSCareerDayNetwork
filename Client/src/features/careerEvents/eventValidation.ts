import * as yup from 'yup';

export const eventValidationSchema = yup.object({
    name: yup.string().notRequired(),
    schoolId: yup.number().required('A school is required'),
    eventDate: yup.date().required('Event date is required').nullable(),
    description: yup.string().notRequired()
})