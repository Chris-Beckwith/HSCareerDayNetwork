import { TextField } from "@mui/material"
import { UseFormRegister, FieldValues, FieldError, Merge, FieldErrorsImpl } from "react-hook-form"
import { usernameValidation } from "../util/validation"

interface UsernameFieldProps {
    register: UseFormRegister<FieldValues>
    error?: FieldError | Merge<FieldError, FieldErrorsImpl<any>>
    isMobile: boolean
}

export default function AppEmailField({ register, error, isMobile } : UsernameFieldProps) {
    return (
        <TextField
            margin="normal"
            fullWidth
            label="Username"
            autoComplete="username"
            {...register('username', usernameValidation)}
            error={!!error}
            helperText={error?.message as string}
            size={isMobile ? 'small' : 'medium'}
        />
    )
}