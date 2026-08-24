import { FormControl, RadioGroup, FormControlLabel, Radio } from "@mui/material";
import { DEFAULT_FONT_SIZE } from "../util/constants";

interface Props {
    options: any[]
    onChange: (event: any) => void
    selectedValue: string
}

/**
 * Radio button group component to choose between a set of parameters to filter by.
 */
export default function RadioButtonGroup({options, onChange, selectedValue}: Props) {
    return (
        <FormControl>
            <RadioGroup onChange={onChange} value={selectedValue}>
                {options.map(({ value, label }) => (
                    <FormControlLabel value={value} control={<Radio size="small" sx={{ py: '6px' }} />} label={label} key={value}
                        sx={{ '& .MuiFormControlLabel-label': { fontSize: DEFAULT_FONT_SIZE }, mx: '2px' }}
                    />
                ))}
            </RadioGroup>
        </FormControl>
    )
}