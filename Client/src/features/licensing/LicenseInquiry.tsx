import { Typography, useMediaQuery, useTheme } from "@mui/material";

export default function LicenseInquiry() {
    const isTablet = useMediaQuery(useTheme().breakpoints.down('md'))

    return (
        <Typography align="center" variant={isTablet ? "h4" : "h3"}>
            License Inquiry
        </Typography>
    )
}