import * as yup from 'yup';

export const validationSchema = [
    yup.object({
        studentNumber: yup.number()
            .typeError("Please enter your Student Number")
            .required('Please enter your Student Number'),
    }),
    yup.object(),
    yup.object(),
    yup.object(),
    yup.object(),
]