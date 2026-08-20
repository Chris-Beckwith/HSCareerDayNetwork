import { ArrowBackIosNew } from "@mui/icons-material";
import { ButtonProps, IconButton, SxProps, Theme, useMediaQuery, useTheme } from "@mui/material";

interface Props extends ButtonProps {
    sx?: SxProps<Theme>
}

export default function AppBackButton(props: Props) {
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))

    return (
        <IconButton onClick={props.onClick} aria-label="Back" title="Back"
            sx={{ position: 'absolute', left: 4, ...props.sx,
                '& svg': {
                    transform: 'translateX(-1.5px)',
                }
            }}
        >
            <ArrowBackIosNew fontSize={isMobile ? "small" : isTablet ? "medium" : "large" } />
        </IconButton>
    )
}