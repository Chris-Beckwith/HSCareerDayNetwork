import { AppBar, Box, Toolbar, Typography } from "@mui/material";
import { useEffect } from "react";

export default function SurveyHeader() {

    useEffect(() => {
        const link = document.createElement('link');
        link.href = 'https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap';
        link.rel = 'stylesheet';
        document.head.appendChild(link);
      }, []);

    return (
        <AppBar position='static' sx={{ mb: 4, bgcolor: '#f0f0f0' }}>
            <Toolbar sx={{ display: 'flex', justifyContent: 'center' }}>
                <Box sx={{ display: 'flex', flexDirection: 'column', alignItems: 'center'}}>
                    <img src="../../public/images/NHSCDN-logo.png" alt="logo" style= {{ height: 132, marginTop: 18 }} />
                    <Typography variant="h4" color="black" 
                        sx={{ my: 0, fontFamily: "Poppins", fontSize: '35', fontWeight: '500',
                            lineHeight: '1.7em', letterSpacing: '0.5px', textTransform: 'none' }}>
                        National High School Career Day Network
                    </Typography>
                    <Typography variant="h6" color="black" sx={{ mb: 1, fontFamily: "Poppins" }}>
                        A Non-Profit Dedicated to Helping High School Students Find Their Career Path
                    </Typography>
                </Box>
            </Toolbar>
        </AppBar>
    )
}