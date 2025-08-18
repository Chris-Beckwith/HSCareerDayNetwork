import * as yup from 'yup';

export const careerValidationSchema = yup.object({
    name: yup.string().required('Career subject name required'),
    courseId: yup.number().typeError('Course ID must be a number').required('Career course ID requried'),
    category: yup.string().required('Category is required'),
    newCategory: yup.string().when('category', {
        is: (val: string) => val === 'Add New Category',
        then: (schema) => schema.required('New category name is required'),
        otherwise: (schema) => schema.notRequired()
    })
})