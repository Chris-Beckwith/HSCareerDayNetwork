import { Download } from "@mui/icons-material";
import { ButtonProps, IconButton, SxProps, Theme, Tooltip, useMediaQuery, useTheme } from "@mui/material";

interface Props extends ButtonProps {
    sx?: SxProps<Theme>
}

export default function AppExportButton(props: Props) {
    const isTablet = useMediaQuery(useTheme().breakpoints.down("md"))

    return (
        <Tooltip title={props.title}>
            <IconButton aria-label="Download" size="small" color="primary" onClick={props.onClick} sx={{ ...props.sx }}>
                <Download fontSize={isTablet ? "small" : "medium"} />
            </IconButton>
        </Tooltip>
    )
}