import * as yup from 'yup';

export const studentValidationSchema = yup.object({
    studentNumber: yup.string().required('Student Number is Required'),
    lastFirstName: yup.string().required('Last, First Name is Required'),
    lastName: yup.string().required('Last Name is Required'),
    firstName: yup.string().required('First Name is Required'),
    gender: yup.string().required('Required'),
    grade: yup.number().typeError('Required').required('Required'),
    email: yup.string().email('Must be a valid Email').required('Email is Required'),
    homeroomTeacher: yup.string().required('Teacher is Required'),
    homeroomNumber: yup.string().required('Required'),
})