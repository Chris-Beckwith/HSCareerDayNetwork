import { MenuItem, TextField, useMediaQuery, useTheme } from "@mui/material"
import { useController, UseControllerProps } from "react-hook-form"
import { DEFAULT_FONT_SIZE } from "../util/constants";

interface Props extends UseControllerProps {
    label: string;
    items: string[];
}

export default function AppSelectList(props: Props) {
    const {fieldState, field} = useController({...props, defaultValue: ''})
    const isMobile = useMediaQuery(useTheme().breakpoints.down('sm'))
    const isTablet = useMediaQuery(useTheme().breakpoints.down('md'))

    return (
        <TextField select fullWidth label={props.label} value={field.value}
            onChange={field.onChange} error={!!fieldState.error} helperText={fieldState.error?.message}
            size={isMobile ? "small" : "medium"}
            sx={{
                '& .MuiOutlinedInput-input': {
                    fontSize: DEFAULT_FONT_SIZE,
                },
                '& .MuiSelect-select': {
                    paddingTop: isTablet ? isMobile ? '6.2px' : '15.35px' : '16.5px',
                    paddingBottom: isTablet ? isMobile ? '6.2px' : '15.35px' : '16.5px'
                }
            }}
        >
            {props.items.map(item => (
                <MenuItem key={item} value={item} sx={{ fontSize: DEFAULT_FONT_SIZE }}>{item}</MenuItem>
            ))}
        </TextField>
    )
}