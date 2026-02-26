import { Button, ButtonProps, useMediaQuery, useTheme } from "@mui/material";

interface Props extends ButtonProps {}

/**
 * Button for app to handle mobile viewport.
 */
export default function AppButton(props: Props) {
    const isMobile = useMediaQuery(useTheme().breakpoints.down('sm'))

    return (
        <Button
            {...props}
            size={isMobile ? "small" : "medium"}
        />
    )
}