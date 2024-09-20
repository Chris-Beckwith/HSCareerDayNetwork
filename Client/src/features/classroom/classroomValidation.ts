import * as yup from 'yup';

export const classroomValidationSchema = yup.object({
    roomNumber: yup.string().required('Room Number is required'),
    capacity: yup.number().typeError("Room Capacity must be a number")
        .required('Room Capacity is required'),
    // overflow: yup.number().typeError("Overflow must be a number")
})