import { Backdrop, Box, Typography, useMediaQuery, useTheme } from "@mui/material";

interface Props {
    message?: string
}

/**
 * Component to display a loading animation.
 */
export default function LoadingComponent({message = 'Loading...'}: Props) {
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))

    return (
        <Backdrop open={true} invisible={true}>
            <Box display='flex' justifyContent='center' alignItems='center' height='100vh'>
                <img src="/images/Loading.gif" height={isTablet ? isMobile ? '156px' : '176px' : '196px'} />
                <Typography variant={isTablet ? isMobile ? "h6" : "h5" : "h4"} sx={{justifyContent: 'center', position: 'fixed', top: '75%'}}>
                    {message}
                </Typography>
            </Box>
        </Backdrop>
    )
}