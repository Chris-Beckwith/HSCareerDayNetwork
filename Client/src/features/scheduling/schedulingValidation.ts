import * as yup from 'yup';

export const schedulingValidationSchema = yup.object({
    maxClassSize: yup.string().required('Please enter room size')
})
