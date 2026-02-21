import { Grid, Typography } from "@mui/material";
import AppTextInput from "./AppTextInput";
import { UseControllerProps } from "react-hook-form";

interface Props extends UseControllerProps { }

/**
 * Component to display an address form
 */
export default function AddressInputs({ control }: Props) {

    return (
        <Grid container rowSpacing={2}>
            <Grid container item justifyContent="center">
                <Grid item xs={12} sm={10} md={8}>
                    <Typography variant="h6">Address</Typography>
                </Grid>
            </Grid>
            <Grid container item spacing={2} justifyContent="center">
                <Grid item xs={12} sm={10} md={8}>
                    <AppTextInput control={control} name="address.address1" label="Address Line 1" />
                </Grid>
            </Grid>
            <Grid container item spacing={2} justifyContent="center">
                <Grid item xs={12} sm={10} md={8}>
                    <AppTextInput control={control} name="address.address2" label="Address Line 2" />
                </Grid>
            </Grid>
            <Grid container columnSpacing={2} sx={{mt: 2}} justifyContent="center">
                <Grid item xs={7} sm={6} md={4}>
                    <AppTextInput control={control} name="address.city" label="City" />
                </Grid>
                <Grid item xs={2}>
                    <AppTextInput control={control} name="address.state" label="State" />
                </Grid>
                <Grid item xs={3} sm={2}>
                    <AppTextInput control={control} name="address.zip" label="Zip Code" />
                </Grid>
            </Grid>
        </Grid>
    )
}