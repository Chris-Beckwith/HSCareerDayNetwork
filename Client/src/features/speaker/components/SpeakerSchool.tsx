import { FormControl, Grid, InputLabel, MenuItem, Select, Skeleton, Typography } from "@mui/material";
import { Controller, UseControllerProps } from "react-hook-form";
import useSchools from "../../../app/hooks/useSchools";

interface Props extends UseControllerProps { }

export default function SpeakerSchool({ control }: Props) {
    const { schools, schoolsLoaded } = useSchools()

    return (
        <>
            {!schoolsLoaded ? (
                <Grid container item columnSpacing={2} justifyContent="center">
                    <Grid item xs={8}>
                        <Grid container item spacing={2} alignItems="center">
                            <Grid item xs={6} sx={{ display: 'flex', justifyContent: 'flex-end' }}>
                                <Skeleton animation="wave"></Skeleton>
                            </Grid>
                            
                            <Grid item xs={6}>
                                <Skeleton animation="wave"></Skeleton>
                            </Grid>
                        </Grid>
                    </Grid>
                </Grid>
            ) : (
                <Grid container item columnSpacing={2} justifyContent="center">
                    <Grid item xs={8}>

                        <Grid container item spacing={2} alignItems="center">
                            <Grid item xs={6} sx={{ display: 'flex', justifyContent: 'flex-end' }}>
                                <Typography variant="h6">School Last Spoke At:</Typography>
                            </Grid>

                            <Grid item xs={6}>
                                <FormControl fullWidth>
                                    <InputLabel>School</InputLabel>
                                    <Controller
                                        name="schoolLastSpokeAt"
                                        control={control}
                                        render={({ field }) => (
                                            <Select label="School"
                                                {...field}
                                                value={field.value?.id || ''}
                                                onChange={(event) => {
                                                    const selectedSchool = schools.find(school => school.id === event.target.value)
                                                    field.onChange(selectedSchool)
                                                }}
                                            >
                                                {schools?.map((school, index) => (
                                                    <MenuItem key={index} value={school.id}>
                                                        {school.name}
                                                    </MenuItem>
                                                ))}
                                            </Select>
                                        )}
                                    />
                                </FormControl>
                            </Grid>
                        </Grid>
                    </Grid>
                </Grid>

            )}
        </>
    )
}