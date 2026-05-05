import { LoadingButton, LoadingButtonProps } from "@mui/lab";
import { useMediaQuery, useTheme } from "@mui/material";

interface Props extends LoadingButtonProps {}

/**
 * App loading button to handles mobile viewport.
 */
export default function AppLoadingButton(props: Props) {
    const isMobile = useMediaQuery(useTheme().breakpoints.down('sm'))

    return (
        <LoadingButton
            {...props}
            size={isMobile ? "small" : "medium"}
        />
    )
}