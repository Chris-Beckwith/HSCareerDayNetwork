import { Checkbox, FormControlLabel, FormGroup, FormLabel } from "@mui/material";
import { useEffect, useState } from "react";

interface Props {
    label: string
    items: string[]
    checked?: string[]
    onChange: (items: string[]) => void
}

export default function CheckboxButtons({label, items, checked, onChange}: Props) {
    const [checkedItems, setCheckedItems] = useState(checked || [])

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
            <FormLabel id="demo-radio-buttons-group-label">{label}</FormLabel>
            {items.map(item => (
                <FormControlLabel
                    control={<Checkbox 
                        checked={checkedItems.indexOf(item) !== -1}
                        onClick={() => handleChecked(item)}
                    />}
                    label={item}
                    key={item}
                    
                />
            ))}
        </FormGroup>
    )
}