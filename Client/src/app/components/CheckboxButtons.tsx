import { Checkbox, FormControlLabel, FormGroup, FormLabel, useMediaQuery, useTheme } from "@mui/material";
import { useEffect, useState } from "react";

interface Props {
    label: string
    items: string[]
    checked?: string[]
    onChange: (items: string[]) => void
}

/**
 * Checkbox component used to filter based on parameters.
 */
export default function CheckboxButtons({label, items, checked, onChange}: Props) {
    const [checkedItems, setCheckedItems] = useState(checked || [])
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))

    function handleChecked(value: string) {
        const currentIndex = checkedItems.findIndex(item => item === value)
        let newChecked: string[] = []
        if (currentIndex === -1) newChecked = [...checkedItems, value]
        else newChecked = checkedItems.filter(item => item !== value)
        setCheckedItems(newChecked)
        onChange(newChecked)
    }

    useEffect(() => {
        if (checked)
            setCheckedItems(checked)
    }, [checked])

    return (
        <FormGroup>
            <FormLabel id="demo-radio-buttons-group-label" sx={{ fontSize: isMobile ? '0.9rem' : '1rem' }}>{label}</FormLabel>
            {items.map(item => (
                <FormControlLabel
                    control={<Checkbox 
                        checked={checkedItems.indexOf(item) !== -1}
                        onClick={() => handleChecked(item)}
                        size="small"
                    />}
                    label={item}
                    key={item}
                    componentsProps={{ typography: { sx: { lineHeight: 1.2 } } }}
                    sx={{ mr: 0, pb: '4px', '.MuiFormControlLabel-label': { fontSize: isMobile ? '0.8rem' : '1rem' } }}
                />
            ))}
        </FormGroup>
    )
}