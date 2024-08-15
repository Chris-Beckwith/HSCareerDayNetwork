import { yupResolver } from "@hookform/resolvers/yup"
import { useEffect } from "react"
import { FieldValues, useForm } from "react-hook-form"
import { School } from "../../app/models/school"
import { schoolValidationSchema } from "./schoolValdiation"
import agent from "../../app/api/agent"
import { useAppDispatch } from "../../app/store/configureStore"
import { reloadSchools } from "./schoolSlice"
import { LoadingButton } from "@mui/lab"
import { Paper, Typography, Grid, Button } from "@mui/material"
import AddressInputs from "../../app/components/AddressInputs"
import AppTextInput from "../../app/components/AppTextInput"

interface Props {
    school?: School,
    cancelEdit: () => void
}

export default function SchoolForm({ school, cancelEdit }: Props) {
    const dispatch = useAppDispatch()
    const { control, reset, handleSubmit, formState: { isDirty, isSubmitting } } = useForm({
        resolver: yupResolver<any>(schoolValidationSchema)
    })

    useEffect(() => {
        if (school && !isDirty) {
            reset(school)
        }
    }, [school, reset, isDirty])

    async function handleAddSchool(data: FieldValues) {
        try {
            if (school) {
                await agent.School.update(data)
            } else {
                await agent.School.create(data)
            }
            dispatch(reloadSchools())
            cancelEdit()
        } catch (error) {
            console.log(error)
        }
    }

    return (
        <>
            <Paper variant="outlined" sx={{ my: { xs: 3, md: 6 }, p: { xs: 2, md: 3 } }}>
                <Typography align="center" variant="h3" >{school ? "Edit School" : "Add New School"}</Typography>
                <form onSubmit={handleSubmit(handleAddSchool)}>
                    <Grid container rowSpacing={2} sx={{ m: 4 }}>
                        <Grid container item columnSpacing={2} justifyContent="center">
                            <Grid item xs={6}>
                                <AppTextInput control={control} name="name" label="School Name" />
                            </Grid>
                            <Grid item xs={2}>
                                <AppTextInput control={control} name="estimatedNumOfStudents" label="Estimated Student Count" />
                            </Grid>
                        </Grid>

                        <Grid container item columnSpacing={2} sx={{ mb: 2 }} justifyContent="center">
                            <Grid item xs={3}>
                                <AppTextInput control={control} name="contactName" label="Contact Name" />
                            </Grid>
                            <Grid item xs={2}>
                                <AppTextInput control={control} name="contactPhone" label="Contact Phone" />
                            </Grid>
                            <Grid item xs={3}>
                                <AppTextInput control={control} name="contactEmail" label="Contact Email" />
                            </Grid>
                        </Grid>

                        <AddressInputs control={control} name="address" />

                        <Grid container item justifyContent='center'>
                            <Grid item xs={4}>
                                <Button onClick={cancelEdit} variant="contained" color="inherit">Cancel</Button>
                            </Grid>
                            <Grid item xs={4} display="flex" justifyContent="flex-end">
                                <LoadingButton
                                    loading={isSubmitting}
                                    variant="contained"
                                    type="submit"
                                    color="success"
                                >
                                    {school ? "Save" : "Add School"}
                                </LoadingButton>
                            </Grid>
                        </Grid>
                    </Grid>
                </form>
            </Paper>
        </>
    )
}