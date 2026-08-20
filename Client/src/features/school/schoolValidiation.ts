import * as yup from 'yup';

export const schoolValidationSchema = yup.object({
    name: yup.string().required('School name is required'),
    contactEmail: yup.string().email("Invalid Email").notRequired(),
    contactPhone: yup.string().test("phone-complete", "Invalid Phone Number",
        value => {
            if (!value) return true
            return value.replace(/\D/g, "").length >= 10
        }
    )
})