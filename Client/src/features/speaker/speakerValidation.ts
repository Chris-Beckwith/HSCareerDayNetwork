import * as yup from 'yup';

export const speakerValidationSchema = yup.object({
    firstName: yup.string().required('First name is required'),
    lastName: yup.string().required('Last name is required'),
    title: yup.string().required(),
    company: yup.string().required(),
    email: yup.string().email().required(),
    phoneNumbers: yup.array().of(
        yup.object({
            number: yup.string().test(
                "phone-complete",
                "",
                value => {
                    if (!value) return true
                    return value.replace(/\D/g, "").length >= 10
                }
            ),
            type: yup.string().required()
        })
    )
})