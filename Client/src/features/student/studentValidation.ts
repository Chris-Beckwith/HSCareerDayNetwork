import * as yup from 'yup';

export const studentValidationSchema = yup.object({
    studentNumber: yup.string().required('Student Number is required'),
    lastFirstName: yup.string().required('LastFirst Name is required'),
    lastName: yup.string().required('Last Name is required'),
    firstName: yup.string().required('First Name is required'),
    gender: yup.string().required('Gender is required'),
    grade: yup.string().required('Grade is required'),
    email: yup.string().required('Email is required'),
    homeroomTeacher: yup.string().required('Teacher is required'),
    homeroomNumber: yup.string().required('Room is required'),
})