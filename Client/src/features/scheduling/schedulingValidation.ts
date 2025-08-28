import * as yup from 'yup';

export const schedulingValidationSchema = yup.object({
    maxClassSize: yup.number()
        .min(1, "Must be at least 1")
        .typeError("Must have Max Class Size")
        .required('Please enter room size'),
    minClassSize: yup.number()
        .nullable()
        .transform((value, originalValue) =>
            String(originalValue).trim() === "" ? 0 : value
        )
        .min(0, "Must be at least 0")
        .notRequired()
})
