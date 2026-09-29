import * as yup from 'yup';

export const classroomValidationSchema = yup.object({
    roomNumber: yup.string().required('Room Number is required'),
    capacity: yup.string().required('Room Capacity is required')
})