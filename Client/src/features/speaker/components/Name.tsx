import { Grid } from "@mui/material";
import AppTextInput from "../../../app/components/AppTextInput";
import { UseControllerProps } from "react-hook-form";

interface Props extends UseControllerProps {}

export default function Name({control}: Props) {
    return (
        <Grid container item columnSpacing={2} justifyContent="center">
            <Grid item xs={3}>
                <AppTextInput control={control} name="firstName" label="First Name" />
            </Grid>
            <Grid item xs={2}>
                <AppTextInput control={control} name="middleName" label="Middle Name" />
            </Grid>
            <Grid item xs={3}>
                <AppTextInput control={control} name="lastName" label="Last Name" />
            </Grid>
        </Grid>
    )
}