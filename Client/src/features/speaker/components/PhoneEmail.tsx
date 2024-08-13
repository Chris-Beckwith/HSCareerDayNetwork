import { Grid } from "@mui/material";
import AppTextInput from "../../../app/components/AppTextInput";
import { UseControllerProps } from "react-hook-form";

interface Props extends UseControllerProps { }

export default function PhoneEmail({ control }: Props) {
    return (
        <Grid container item columnSpacing={2} justifyContent="center">
            <Grid item xs={4}>
                <AppTextInput control={control} name="phoneNumber" label="Phone Number" />
            </Grid>
            <Grid item xs={4}>
                <AppTextInput control={control} name="email" label="Email" />
            </Grid>
        </Grid>
    )
}