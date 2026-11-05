import { TextField } from "@mui/material";
import { FieldError, FieldErrorsImpl, FieldValues, Merge, UseFormRegister } from "react-hook-form";
import { emailValidation } from "../util/validation";

interface EmailFieldProps {
    register: UseFormRegister<FieldValues>
    error?: FieldError | Merge<FieldError, FieldErrorsImpl<any>>
    isMobile: boolean
}

export default function AppEmailField({ register, error, isMobile } : EmailFieldProps) {
    return (
        <TextField
            margin="normal"
            fullWidth
            label="Email"
            autoFocus
            autoComplete='email'
            {...register('email', emailValidation)}
            error={!!error}
            helperText={error?.message as string}
            size={isMobile ? 'small' : 'medium'}
        />
    )
}