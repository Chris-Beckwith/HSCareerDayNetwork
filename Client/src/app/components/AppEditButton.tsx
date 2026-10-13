import { Edit } from "@mui/icons-material";
import { ButtonProps, IconButton, Tooltip } from "@mui/material";

interface Props extends ButtonProps {}

export default function AppEditButton(props: Props) {

    return (
        <Tooltip title="Edit">
            <IconButton title="Edit"
                color="primary"
                size="small"
                disabled={props.disabled}
                onClick={props.onClick}
            >
                <Edit fontSize="small" />
            </IconButton>
        </Tooltip>
    )
}