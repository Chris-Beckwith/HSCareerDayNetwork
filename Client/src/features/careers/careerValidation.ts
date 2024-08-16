import * as yup from 'yup';

export const careerValidationSchema = yup.object({
    name: yup.string().required('Career subject name required'),
    courseId: yup.string().required('Career course ID requried'),
    category: yup.string().required('Category is required')
})