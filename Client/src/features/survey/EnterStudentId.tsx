import { Box, Grid, Typography } from "@mui/material";
import { useFormContext } from "react-hook-form";
import AppTextInput from "../../app/components/AppTextInput";

interface Props {
    error: string
}

export default function EnterStudentId({ error }: Props) {
    const { control } = useFormContext()

    return (
        <Grid container display='flex' justifyContent='center'>
            <Typography variant="h4">Enter Student ID</Typography>
            <Grid container columnSpacing={4} display='flex' justifyContent='center'>
                <Grid item xs={3} sx={{m: 2}}>
                    <Box sx={{ display: 'flex', flexDirection: 'column', alignItems: 'center' }}>
                        <AppTextInput control={control} name="studentNumber" label="Student ID" />
                        {error &&
                            <Typography variant="body1" color="error" 
                                sx={{m: 1, textAlign: 'center', width: 300}}>
                                {error}
                            </Typography>
                        }
                    </Box>
                </Grid>
            </Grid>
        </Grid>
    )
}