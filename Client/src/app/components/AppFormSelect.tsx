import { FormControl, FormHelperText, InputLabel, MenuItem, Select } from "@mui/material";
import { Controller, useController, UseControllerProps } from "react-hook-form";

interface Props extends UseControllerProps {
    label: string,
    children: string[]
}

export default function AppFormSelect(props: Props) {
    const {fieldState, field} = useController({...props, defaultValue: ''})
    
    return (
        <FormControl {...props} {...field} fullWidth>
            <FormHelperText error={!!fieldState.error}>{fieldState.error?.message}</FormHelperText>
            <InputLabel>{props.label}</InputLabel>
            <Controller
                render={(fieldState) =>
                    <Select name={props.name} value={fieldState.field.value}>
                        {props.children.map(child => (
                            <MenuItem key={child}>{child}</MenuItem>
                        ))}
                    </Select>
                }
                name={props.name}
                control={props.control}
                defaultValue={props.defaultValue}
            />
        </FormControl>
    )
}