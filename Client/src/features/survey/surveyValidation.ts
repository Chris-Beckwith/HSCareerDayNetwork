import * as yup from 'yup';

export const validationSchema = [
    yup.object({
        studentId: yup.number().required('Please enter you student Id')
    }),
    yup.object({
        // firstName: yup.string().required('First name is required'),
        // lastName: yup.string().required('Last name is required'),
        // middleName: yup.string().required('Middle name is required'),
        // school: yup.string().required(),
    }),
    yup.object(),
    yup.object()
]