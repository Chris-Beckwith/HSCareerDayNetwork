import { DarkMode, LightMode } from "@mui/icons-material";
import { AppBar, Box, IconButton, Toolbar, Typography, useMediaQuery, useTheme } from "@mui/material";
import { useEffect } from "react";

interface Props {
    darkMode: boolean
    handleThemeChange: () => void
}

/**
 * Header component to display for the survey.
 */
export default function SurveyHeader({darkMode, handleThemeChange}: Props) {
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))

    useEffect(() => {
        const link = document.createElement('link');
        link.href = 'https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap';
        link.rel = 'stylesheet';
        document.head.appendChild(link);
      }, []);

    return (
        <AppBar position='static' sx={{ mb: { xs: 2, md: 4 } }}>
            <Toolbar sx={{ display: 'flex', justifyContent: 'center' }}>
                <Box sx={{ position: 'absolute', top: 5, right: 5 }}>
                    <IconButton onClick={handleThemeChange}>
                        {darkMode ? <DarkMode /> : <LightMode />}
                    </IconButton>
                </Box>
                <Box sx={{ display: 'flex', flexDirection: 'column', alignItems: 'center'}}>
                    <img src="/images/NHSCDN-logo.png" alt="logo" 
                        style= {{ height: isTablet ? isMobile ? 90 : 110 : 132, marginTop: isMobile ? 10 : 15 }} />
                    <Typography variant={isTablet ? isMobile ? "h6" : "h5" : "h4"}
                        sx={{ my: isMobile ? 1 : 0, fontFamily: "Poppins", fontSize: '35', fontWeight: '500',
                            lineHeight: isMobile ? '1.2em' : '1.7em', letterSpacing: '0.5px', textAlign: 'center', textTransform: 'none' }}
                        
                    >
                        National High School Career Day Network
                    </Typography>
                    <Typography variant={isTablet ? isMobile ? "body2" : "body1" : "h6"} sx={{ mb: 2, mt: .5, fontFamily: "Poppins", textAlign: "center" }}>
                        A Non-Profit Dedicated to Helping High School Students Find Their Career Path
                    </Typography>
                </Box>
            </Toolbar>
        </AppBar>
    )
}