import { Save } from "@mui/icons-material";
import { ButtonProps, IconButton, Tooltip } from "@mui/material";

interface Props extends ButtonProps {}

export default function AppSaveButton(props: Props) {
    return (
        <Tooltip title="Save">
            <IconButton
                color="primary"
                size="small"
                onClick={props.onClick}
            >
                <Save fontSize="small" />
            </IconButton>
        </Tooltip>
    )
}