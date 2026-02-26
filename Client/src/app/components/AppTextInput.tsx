import { TextField, useMediaQuery, useTheme } from "@mui/material";
import { UseControllerProps, useController } from "react-hook-form";

interface Props extends UseControllerProps {
    label: string
    multiline?: boolean
    rows?: number
    type?: string
    inputProps?: React.InputHTMLAttributes<HTMLInputElement>
}

/**
 * Text Input Component
 */
export default function AppTextInput(props: Props) {
    const {fieldState, field} = useController({...props, defaultValue: ''})
    const isMobile = useMediaQuery(useTheme().breakpoints.down('sm'))

    return (
        <TextField
            {...props}
            {...field}
            value={field.value || ''}
            multiline={props.multiline}
            rows={props.rows}
            type={props.type}
            fullWidth
            variant='outlined'
            error={!!fieldState.error}
            helperText={fieldState.error?.message}
            inputProps={{
                sx: {
                    height: '100%'
                },
                ...props.inputProps
            }}
            size={isMobile ? "small" : "medium"}
            sx={{
                height: '100%',
                '& .MuiInputBase-input': {
                    fontSize: {
                        xs: '0.8rem',
                        sm: '0.9rem',
                        md: '1rem'
                    }
                }
            }}
        />
    )
}