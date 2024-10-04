import { Box, Grid, Typography, useMediaQuery, useTheme } from "@mui/material";
import { useFormContext } from "react-hook-form";
import AppTextInput from "../../app/components/AppTextInput";

interface Props {
    error: string
}

export default function EnterStudentId({ error }: Props) {
    const { control } = useFormContext()
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))

    return (
        <Grid container display='flex' justifyContent='center'>
            <Typography variant={isMobile ? "h5" : "h4"}>Enter Student ID</Typography>
            <Grid container columnSpacing={4} display='flex' justifyContent='center'>
                <Grid item xs={12} sm={8} md={6} lg={3} sx={{m: 2}}>
                    <Box sx={{ display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
                        <AppTextInput control={control} name="studentNumber" label="Student ID" />
                        {error &&
                            <Typography variant="body1" color="error" 
                                sx={{m: 1, textAlign: 'center', width: { xs: '100%', sm: 300 } }}>
                                {error}
                            </Typography>
                        }
                    </Box>
                </Grid>
            </Grid>
        </Grid>
    )
}