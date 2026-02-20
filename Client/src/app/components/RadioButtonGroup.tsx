import { FormControl, RadioGroup, FormControlLabel, Radio, useTheme, useMediaQuery } from "@mui/material";

interface Props {
    options: any[]
    onChange: (event: any) => void
    selectedValue: string
}

/**
 * Radio button group component to choose between a set of parameters to filter by.
 */
export default function RadioButtonGroup({options, onChange, selectedValue}: Props) {
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))

    return (
        <FormControl>
            <RadioGroup onChange={onChange} value={selectedValue}>
                {options.map(({ value, label }) => (
                    <FormControlLabel value={value} control={<Radio size="small" />} label={label} key={value} 
                        sx={{ '& .MuiFormControlLabel-label': { fontSize: isTablet ? isMobile ? '.80rem' : '.85rem' : '1rem' }, mx: '2px' }}
                    />
                ))}
            </RadioGroup>
        </FormControl>
    )
}