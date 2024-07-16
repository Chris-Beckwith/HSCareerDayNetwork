import { Typography, Grid } from "@mui/material";

export default function InfoVerification() {
  // const { control } = useFormContext()
  return (
    <>
      <Typography variant="h6" gutterBottom>
        Student Address
      </Typography>
      <Grid container spacing={3}>
        <Grid item xs={12} sm={4}>
          FirstNameTest
        </Grid>
        <Grid item xs={12} sm={4}>
          LastNameTest
        </Grid>
        <Grid item xs={12} sm={4}>
          MiddleNameTest
        </Grid>
        <Grid item xs={12}>
          SchoolNameTest
        </Grid>
      </Grid>
    </>
  );
}