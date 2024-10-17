import * as yup from 'yup';

export const schoolValidationSchema = yup.object({
    name: yup.string().required('School name is required')
})