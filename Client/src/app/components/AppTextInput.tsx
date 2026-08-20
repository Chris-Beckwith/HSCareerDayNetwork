import { TextField, Tooltip, useMediaQuery, useTheme } from "@mui/material";
import { UseControllerProps, useController } from "react-hook-form";
import { DEFAULT_FONT_SIZE } from "../util/constants";
import { MaskedInput } from "../util/MaskedInput";

interface Props extends UseControllerProps {
    label: string
    multiline?: boolean
    rows?: number
    type?: string
    inputProps?: React.InputHTMLAttributes<HTMLInputElement>
    format?: string
    tooltip?: string
}

/**
 * Text Input Component
 */
export default function AppTextInput(props: Props) {
    const {fieldState, field} = useController({...props, defaultValue: ''})
    const isMobile = useMediaQuery(useTheme().breakpoints.down('sm'))
    const phoneMask = [{mask: "(000) 000-0000"}, {mask: "(000) 000-0000 x000000"}]

    return (
        <Tooltip title={props.tooltip}>
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
                inputProps={{...props.inputProps}}
                InputProps={ props.format === "phone" ? {
                    inputComponent: MaskedInput as any,
                    inputProps: {
                        mask: phoneMask
                    }
                } : undefined }
                size={isMobile ? "small" : "medium"}
                sx={{
                    height: '100%',
                    '& .MuiInputBase-input': {
                        fontSize: DEFAULT_FONT_SIZE
                    },
                    ...(isMobile && {
                        '& .MuiInputLabel-root': {
                            transform: 'translate(14px, 7px) scale(1)',
                        },
                        '& .MuiInputLabel-shrink': {
                            transform: 'translate(14px, -10px) scale(0.75)',
                        },
                    })
                }}
            />
        </Tooltip>
    )
}