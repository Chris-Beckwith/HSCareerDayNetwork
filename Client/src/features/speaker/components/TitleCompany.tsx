import { Grid } from "@mui/material";
import { UseControllerProps } from "react-hook-form";
import AppTextInput from "../../../app/components/AppTextInput";

interface Props extends UseControllerProps { }

export default function TitleCompany({ control }: Props) {
    return (
        <Grid container item columnSpacing={2} justifyContent="center">
            <Grid item xs={6} sm={5} md={4}>
                <AppTextInput control={control} name="title" label="Title" />
            </Grid>
            <Grid item xs={6} sm={5} md={4}>
                <AppTextInput control={control} name="company" label="Company" />
            </Grid>
        </Grid>
    )
}