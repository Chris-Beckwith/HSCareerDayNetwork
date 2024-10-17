import { useEffect } from "react"
import { Student } from "../../app/models/student"
import { FieldValues, useForm } from "react-hook-form"
import { yupResolver } from "@hookform/resolvers/yup"
import { LoadingButton } from "@mui/lab"
import { Paper, Typography, Grid, Button } from "@mui/material"
import AppTextInput from "../../app/components/AppTextInput"
import { studentValidationSchema } from "./studentValidation"
import agent from "../../app/api/agent"
import { reloadStudents } from "./studentSlice"
import { useAppDispatch } from "../../app/store/configureStore"
import { CareerEvent } from "../../app/models/event"

interface Props {
    student?: Student
    cancelEdit: () => void
    event?: CareerEvent
}

export default function StudentForm({ student, cancelEdit, event }: Props) {
    const dispatch = useAppDispatch()
    const { control, reset, handleSubmit, formState: { isDirty, isSubmitting}} = useForm({
        resolver: yupResolver<any>(studentValidationSchema)
    })

    useEffect(() => {
        if (student && !isDirty) {
            reset(student)
        }
    }, [student, reset, isDirty])

    async function handleAddStudent(data: FieldValues) {
        try {
            if (student) {
                await agent.Student.update(data)
            } else {
                if (event) {
                    data.event = event
                    data.school = event.school
                }
                await agent.Student.create(data)
            }
            dispatch(reloadStudents())
            cancelEdit()
        } catch (error) {
            console.log(error)
        }
    }

    return (
        <>
            <Paper variant="outlined" sx={{ my: { xs: 3, md: 6 }, p: { xs: 2, md: 3 } }}>
                <Typography align="center" variant="h3" >{student ? "Edit Student" : "Add New Student"}</Typography>
                <form onSubmit={handleSubmit(handleAddStudent)}>
                    <Grid container rowSpacing={2} sx={{ m: 4 }}>
                        <Grid container item columnSpacing={2} sx={{ mb: 2 }} justifyContent="center">
                            <Grid item xs={3}>
                                <AppTextInput control={control} name="studentNumber" label="Student Number" />
                            </Grid>
                        </Grid>
                        <Grid container item columnSpacing={2} sx={{ mb: 2 }} justifyContent="center">
                            <Grid item xs={4}>
                                <AppTextInput control={control} name="lastFirstName" label="Last First Name" />
                            </Grid>
                            <Grid item xs={3}>
                                <AppTextInput control={control} name="lastName" label="Last Name" />
                            </Grid>
                            <Grid item xs={2}>
                                <AppTextInput control={control} name="firstName" label="First Name" />
                            </Grid>
                        </Grid>

                        <Grid container item columnSpacing={2} sx={{ mb: 2 }} justifyContent="center">
                            <Grid item xs={2}>
                                <AppTextInput control={control} name="gender" label="Gender" />
                            </Grid>
                            <Grid item xs={2}>
                                <AppTextInput control={control} name="grade" label="Grade" />
                            </Grid>
                            <Grid item xs={5}>
                                <AppTextInput control={control} name="email" label="Email" />
                            </Grid>
                        </Grid>

                        <Grid container item columnSpacing={2} sx={{ mb: 2 }} justifyContent="center">
                            <Grid item xs={3} sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }}>
                                {student && <Typography variant="h6">{student.school.name}</Typography>}
                                {event && <Typography variant="h6">{event.school.name}</Typography>}
                            </Grid>
                            <Grid item xs={3}>
                                <AppTextInput control={control} name="homeroomTeacher" label="Homeroom Teacher" />
                            </Grid>
                            <Grid item xs={3}>
                                <AppTextInput control={control} name="homeroomNumber" label="Homeroom Number" />
                            </Grid>
                        </Grid>


                        <Grid container justifyContent="center" sx={{ mt: 2 }}>
                            <Grid item display='flex' justifyContent='space-between' xs={8}>
                                <Button onClick={cancelEdit} variant="contained" color="inherit">Cancel</Button>
                                <LoadingButton
                                    loading={isSubmitting}
                                    variant="contained"
                                    type="submit"
                                    color="success"
                                >
                                    {student ? "Save" : "Add Student"}
                                </LoadingButton>
                            </Grid>
                        </Grid>
                    </Grid>
                </form>
            </Paper>
        </>
    )
}