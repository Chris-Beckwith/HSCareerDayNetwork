import { TextField } from "@mui/material"
import { UseFormRegister, FieldValues, FieldError, Merge, FieldErrorsImpl } from "react-hook-form"
import { passwordConfirmValidation } from "../util/validation"

interface PassConfirmFieldProps {
    register: UseFormRegister<FieldValues>
    error?: FieldError | Merge<FieldError, FieldErrorsImpl<any>>
    password: string
    isMobile: boolean
}

export default function AppPassConfirmField({ register, error, password, isMobile } : PassConfirmFieldProps) {
    return (
        <TextField
            margin="normal"
            fullWidth
            label="Confirm Password"
            type="password"
            autoComplete='new-password'
            {...register('confirmPassword', {...passwordConfirmValidation,
                validate: (value: string) =>
                    value === password || 'Passwords do not match'
            })}
            error={!!error}
            helperText={error?.message as string}
            size={isMobile ? 'small' : 'medium'}
        />
    )
}