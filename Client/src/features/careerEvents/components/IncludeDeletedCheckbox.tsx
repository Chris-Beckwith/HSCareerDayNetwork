import { FormGroup, FormControlLabel, Checkbox, useTheme, useMediaQuery } from "@mui/material";
import { useAppDispatch } from "../../../app/store/configureStore";
import { setEventParams } from "../careerEventSlice";

interface Props {
    isChecked: boolean
}

/**
 * Checkbox for showing/hiding delete events.
 */
export default function IncludeDeletedCheckbox({isChecked}: Props) {
    const dispatch = useAppDispatch()
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))

    function handleOnClick(event: any) {
        dispatch(setEventParams({includeDeleted: event.target.checked}))
    }

    return (
        <FormGroup>
            <FormControlLabel
                control={<Checkbox
                    onClick={handleOnClick}
                    checked={isChecked}
                    size="small"
                />}
                label="Include Deleted Events"
                key="isDeleted"
                sx={{ mr: 0, '.MuiFormControlLabel-label': { fontSize: isMobile ? ".85rem" : "1rem" } }}
            />
        </FormGroup>
    )
}