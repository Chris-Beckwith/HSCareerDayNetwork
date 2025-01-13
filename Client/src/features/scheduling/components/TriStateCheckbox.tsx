import { CheckBox } from "@mui/icons-material";
import { Checkbox } from "@mui/material";

interface Props {
    value: 0 | 1 | 2
    handleChange: () => void
}

export default function TriStateCheckbox({ value, handleChange }: Props) {
    const isChecked = value === 1
    const isIndeterminate = value === 2

    return (
        <Checkbox size="small" sx={{ p: 0 }}
            checked={isChecked}
            indeterminate={isIndeterminate}
            onChange={handleChange}
            color={isIndeterminate ? "error" : "primary"}
            indeterminateIcon={<CheckBox />}
        />
    )
}