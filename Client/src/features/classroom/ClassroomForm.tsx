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
import AppBackButton from "../../app/components/AppBackButton";
import AppNumberInput from "../../app/components/AppNumberInput";

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
            reset({...selectedRoom,
                capacity: selectedRoom.capacity.toLocaleString(),
                overflow: selectedRoom.overflow.toLocaleString()
            })
        }
    }, [selectedRoom, isDirty, reset])

    async function handleAddClassroom(data: FieldValues) {
        data.school = school
        data.capacity = data.capacity.replace(/,/g, "")
        data.overflow = data.overflow?.replace(/,/g, "")
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
                <Grid container sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center', position: 'relative' }}>
                    <AppBackButton onClick={cancelEdit} sx={{ left: isMobile ? 4 : 24 }} />
                </Grid>
                <Typography align="center" variant="body1">For</Typography>
                <Typography align="center" variant={isMobile ? "h5" : "h4"}>{school.name}</Typography>
                <form onSubmit={handleSubmit(handleAddClassroom)}>
                    <Grid container rowSpacing={2} sx={{ mt: 2 }}>
                        <Grid container item columnSpacing={2} justifyContent="center">
                            <Grid item xs={6} sm={5} md={4}>
                                <AppTextInput control={control} name="building" label="Building" inputProps={{ maxLength: 24 }} />
                            </Grid>
                            <Grid item xs={6} sm={5} md={4}>
                                <AppTextInput control={control} name="roomNumber" label="Room Number" inputProps={{ maxLength: 24 }} />
                            </Grid>
                        </Grid>

                        <Grid container item columnSpacing={2} justifyContent="center">
                            <Grid item xs={6} sm={5} md={4}>
                                <AppNumberInput control={control} name="capacity" label="Capacity" max={200000}/>
                            </Grid>
                            <Grid item xs={6} sm={5} md={4}>
                                <AppNumberInput control={control} name="overflow" label="Overflow" max={20000} />
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