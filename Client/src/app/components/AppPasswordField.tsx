import { TextField } from "@mui/material"
import { UseFormRegister, FieldValues, FieldError, Merge, FieldErrorsImpl } from "react-hook-form"
import { passwordValidation } from "../util/validation"

interface PasswordFieldProps {
    register: UseFormRegister<FieldValues>
    error?: FieldError | Merge<FieldError, FieldErrorsImpl<any>>
    isMobile: boolean
}

export default function AppPasswordField({ register, error, isMobile } : PasswordFieldProps) {
    return (
        <TextField
            margin="normal"
            fullWidth
            label="Password"
            type="password"
            autoComplete='new-password'
            {...register('password', passwordValidation)}
            error={!!error}
            helperText={error?.message as string}
            size={isMobile ? 'small' : 'medium'}
        />
    )
}