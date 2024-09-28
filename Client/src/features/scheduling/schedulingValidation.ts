import * as yup from 'yup';

export const schedulingValidationSchema = yup.object({
    stdRoomSize: yup.number()
        .typeError("Please enter standard room size")
        .required('Please enter standard room size')
})
