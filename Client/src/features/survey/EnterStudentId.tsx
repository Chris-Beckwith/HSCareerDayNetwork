import { Grid, Typography } from "@mui/material";
import { useFormContext } from "react-hook-form";
import AppTextInput from "../../app/components/AppTextInput";

export default function EnterStudentId() {
    const { control } = useFormContext()

    return (
        <>
            <Typography variant="h6">Enter Student ID</Typography>
            <Grid container columnSpacing={4}>
                <Grid item xs={3} sx={{m: 2}}>
                    <AppTextInput control={control} name="studentId" label="Student ID" />
                </Grid>
            </Grid>
        </>
    )
}