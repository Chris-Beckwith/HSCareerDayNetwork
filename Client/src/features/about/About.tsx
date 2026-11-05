import { Typography, useMediaQuery, useTheme } from "@mui/material";

export default function About() {
    const isTablet = useMediaQuery(useTheme().breakpoints.down('md'))

    return (
        <Typography align="center" variant={isTablet ? "h4" : "h3"}>
            About Product
        </Typography>
    )
}