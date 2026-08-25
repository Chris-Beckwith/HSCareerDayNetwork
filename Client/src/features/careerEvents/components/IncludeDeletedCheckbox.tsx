import { FormGroup, FormControlLabel, Checkbox } from "@mui/material";
import { useAppDispatch } from "../../../app/store/configureStore";
import { setEventParams } from "../careerEventSlice";
import { DEFAULT_FONT_SIZE } from "../../../app/util/constants";

interface Props {
    isChecked: boolean
}

/**
 * Checkbox for showing/hiding delete events.
 */
export default function IncludeDeletedCheckbox({isChecked}: Props) {
    const dispatch = useAppDispatch()

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
                sx={{ mr: 0, '.MuiFormControlLabel-label': { fontSize: DEFAULT_FONT_SIZE } }}
            />
        </FormGroup>
    )
}