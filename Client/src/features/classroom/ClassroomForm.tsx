import { FieldValues, useForm } from "react-hook-form";
import { Classroom } from "../../app/models/classroom";
import { School } from "../../app/models/school";
import { useAppDispatch } from "../../app/store/configureStore";
import { yupResolver } from "@hookform/resolvers/yup";
import { classroomValidationSchema } from "./classroomValidation";
import { useEffect } from "react";
import agent from "../../app/api/agent";
import { reloadClassrooms } from "./classroomSlice";
import { Paper, Typography, Grid, useTheme, useMediaQuery } from "@mui/material";
import AppTextInput from "../../app/components/AppTextInput";
import AppButton from "../../app/components/AppButton";
import AppLoadingButton from "../../app/components/AppLoadingButton";

interface Props {
    school: School
    selectedRoom: Classroom | undefined
    cancelEdit: () => void
}

/**
 * Form component to add classrooms to a school.
 */
export default function ClassroomForm({ school, selectedRoom, cancelEdit }: Props) {
    const dispatch = useAppDispatch()
    const { control, reset, handleSubmit, formState: { isDirty, isSubmitting } } = useForm({
        resolver: yupResolver<any>(classroomValidationSchema)
    })
    const isMobile = useMediaQuery(useTheme().breakpoints.down('sm'))

    useEffect(() => {
        if (selectedRoom && !isDirty) {
            reset(selectedRoom)
        }
    }, [selectedRoom, isDirty, reset])

    async function handleAddClassroom(data: FieldValues) {
        data.school = school
        try {
            if (Number.isNaN(parseInt(data.overflow))) {
                data.overflow = 0
            }
        } catch (error) {
            console.log(error)
            data.overflow = 0
        }
        try {
            if (selectedRoom) {
                await agent.Classroom.update(data)
            } else {
                await agent.Classroom.create(data)
            }
            dispatch(reloadClassrooms())
            cancelEdit()
        } catch (error) {
            console.log(error)
        }
    }

    return (
        <>
            <Paper variant="outlined" sx={{ my: { xs: 3, md: 6 }, p: { xs: 2, md: 3 } }}>
                <Typography align="center" variant={isMobile ? "h5" : "h4"}>{selectedRoom ? "Edit Classroom" : "Add Classroom"}</Typography>
                <Typography align="center" variant="body1">For</Typography>
                <Typography align="center" variant={isMobile ? "h5" : "h4"}>{school.name}</Typography>
                <form onSubmit={handleSubmit(handleAddClassroom)}>
                    <Grid container rowSpacing={2} sx={{ mt: 2 }}>
                        <Grid container item columnSpacing={2} justifyContent="center">
                            <Grid item xs={6} sm={5} md={4}>
                                <AppTextInput control={control} name="building" label="Building" />
                            </Grid>
                            <Grid item xs={6} sm={5} md={4}>
                                <AppTextInput control={control} name="roomNumber" label="Room Number" />
                            </Grid>
                        </Grid>

                        <Grid container item columnSpacing={2} justifyContent="center">
                            <Grid item xs={6} sm={5} md={4}>
                                <AppTextInput control={control} name="capacity" label="Capacity" />
                            </Grid>
                            <Grid item xs={6} sm={5} md={4}>
                                <AppTextInput control={control} name="overflow" label="Overflow" />
                            </Grid>
                        </Grid>

                        <Grid container item justifyContent='center'>
                            <Grid item xs={6} sm={5} md={4}>
                                <AppButton onClick={cancelEdit} variant="contained" color="inherit">Cancel</AppButton>
                            </Grid>
                            <Grid item xs={6} sm={5} md={4} display="flex" justifyContent="flex-end">
                                <AppLoadingButton
                                    loading={isSubmitting}
                                    variant="contained"
                                    type="submit"
                                    color="success"
                                >
                                    {selectedRoom ? "Save" : "Add Classroom"}
                                </AppLoadingButton>
                            </Grid>
                        </Grid>
                    </Grid>
                </form>
            </Paper>
        </>
    )
}