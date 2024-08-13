import * as yup from 'yup';

export const speakerValidationSchema = yup.object({
    firstName: yup.string().required('First name is required'),
    lastName: yup.string().required('Last name is required'),
    title: yup.string().required(),
    company: yup.string().required(),
    email: yup.string().email().required()
})