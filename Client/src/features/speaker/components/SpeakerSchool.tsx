import { FormControl, Grid, InputLabel, MenuItem, Select, Skeleton, Typography, useMediaQuery, useTheme } from "@mui/material";
import { Controller, UseControllerProps } from "react-hook-form";
import useSchools from "../../../app/hooks/useSchools";

interface Props extends UseControllerProps { }

/**
 * Component for setting school speaker last spoke at.
 */
export default function SpeakerSchool({ control }: Props) {
    const { schools, schoolsLoaded } = useSchools()
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))

    return (
        <>
            {!schoolsLoaded ? (
                <Grid container item columnSpacing={2} justifyContent="center">
                    <Grid item xs={12} sm={10} md={8}>
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
                    <Grid item xs={12} sm={10} md={8}>

                        <Grid container item spacing={2} alignItems="center">
                            <Grid item xs={6} sx={{ display: 'flex', justifyContent: 'flex-end' }}>
                                <Typography variant="h6">School Last Spoke At:</Typography>
                            </Grid>

                            <Grid item xs={6}>
                                <FormControl fullWidth size={isMobile ? "small" : "medium"}>
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