import * as yup from 'yup';
import { School } from '../../app/models/school';

export const eventValidationSchema = yup.object({
    name: yup.string().notRequired(),
    school: yup.mixed<School>().required('A school is required'),
    eventDate: yup.date().required('Event date is required').nullable(),
    description: yup.string().notRequired()
})