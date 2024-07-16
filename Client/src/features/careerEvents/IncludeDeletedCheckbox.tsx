import { FormGroup, FormControlLabel, Checkbox } from "@mui/material";
import { useAppDispatch } from "../../app/store/configureStore";
import { setEventParams } from "./careerEventSlice";

interface Props {
    isChecked: boolean
}

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
                />}
                label="Include Deleted Events"
                key="isDeleted"
            />
        </FormGroup>
    )
}