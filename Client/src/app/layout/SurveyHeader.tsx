import { AppBar, Box, Toolbar, Typography, useMediaQuery, useTheme } from "@mui/material";
import { useEffect } from "react";

export default function SurveyHeader() {
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))

    useEffect(() => {
        const link = document.createElement('link');
        link.href = 'https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap';
        link.rel = 'stylesheet';
        document.head.appendChild(link);
      }, []);

    return (
        <AppBar position='static' sx={{ mb: { xs: 2, md: 4 }, bgcolor: '#f0f0f0' }}>
            <Toolbar sx={{ display: 'flex', justifyContent: 'center' }}>
                <Box sx={{ display: 'flex', flexDirection: 'column', alignItems: 'center'}}>
                    <img src="/images/NHSCDN-logo.png" alt="logo" 
                        style= {{ height: isMobile ? 90 : 132, marginTop: isMobile ? 10 : 18 }} />
                    <Typography variant={isMobile ? "h5" : "h4"} color="black" 
                        sx={{ my: isMobile ? 1 : 0, fontFamily: "Poppins", fontSize: '35', fontWeight: '500',
                            lineHeight: isMobile ? '1.2em' : '1.7em', letterSpacing: '0.5px', textAlign: 'center', textTransform: 'none' }}
                        
                    >
                        National High School Career Day Network
                    </Typography>
                    <Typography variant={isMobile ? "body1" : "h6"} color="black" sx={{ mb: 1, fontFamily: "Poppins", textAlign: "center" }}>
                        A Non-Profit Dedicated to Helping High School Students Find Their Career Path
                    </Typography>
                </Box>
            </Toolbar>
        </AppBar>
    )
}