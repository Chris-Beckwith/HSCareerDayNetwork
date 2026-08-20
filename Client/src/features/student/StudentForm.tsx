import { useEffect, useRef } from "react"
import { Student } from "../../app/models/student"
import { FieldValues, useForm } from "react-hook-form"
import { yupResolver } from "@hookform/resolvers/yup"
import { Paper, Typography, Grid, useMediaQuery, useTheme } from "@mui/material"
import AppTextInput from "../../app/components/AppTextInput"
import { studentValidationSchema } from "./studentValidation"
import agent from "../../app/api/agent"
import { reloadStudents } from "./studentSlice"
import { useAppDispatch } from "../../app/store/configureStore"
import { CareerEvent } from "../../app/models/event"
import AppBackButton from "../../app/components/AppBackButton"
import { DEFAULT_FONT_SIZE } from "../../app/util/constants"
import AppLoadingButton from "../../app/components/AppLoadingButton"
import AppButton from "../../app/components/AppButton"
import AppNumberInput from "../../app/components/AppNumberInput"

interface Props {
    student?: Student
    cancelEdit: () => void
    event?: CareerEvent
}

export default function StudentForm({ student, cancelEdit, event }: Props) {
    const dispatch = useAppDispatch()
    const { control, watch, setValue, reset, handleSubmit, formState: { isDirty, isSubmitting}} = useForm({
        resolver: yupResolver<any>(studentValidationSchema)
    })
    const isTablet = useMediaQuery(useTheme().breakpoints.down('md'))
    const colSpacing = { xs: 1, sm: 2}

    useEffect(() => {
        if (student && !isDirty) {
            reset(student)
        }
    }, [student, reset, isDirty])

    const firstName = watch('firstName')
    const lastName = watch('lastName')
    const lastFirstName = watch('lastFirstName')
    const generatedName = lastName && firstName ? `${lastName}, ${firstName}` : lastName || firstName || ''
    const lastGeneratedName = useRef('')

    useEffect(() => {
        if (!generatedName) return
        if (lastFirstName === lastGeneratedName.current || !lastFirstName) {
            setValue('lastFirstName', generatedName, {shouldValidate: true, shouldDirty: true})
            lastGeneratedName.current = generatedName
        }
    },[generatedName, lastFirstName, setValue])

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
                <Grid container sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center', position: 'relative', mb: 2 }}>
                    <AppBackButton onClick={cancelEdit} />
                    <Typography align="center" variant={isTablet ? "h4" : "h3"} >{student ? "Edit Student" : "Add Student"}</Typography>
                </Grid>
                <form onSubmit={handleSubmit(handleAddStudent)}>
                    <Grid container rowSpacing={{ xs: 3, sm: 2 }}>
                        <Grid container item justifyContent="center">
                            <Grid item xs={6} sm={4} md={3}>
                                <AppTextInput control={control} name="studentNumber" label="Student Number" tooltip="Student Number" />
                            </Grid>
                        </Grid>

                        <Grid container item columnSpacing={colSpacing} justifyContent="center">
                            <Grid item xs={3} sm={3} md={3}>
                                <AppTextInput control={control} name="firstName" label="First Name" tooltip="First Name" />
                            </Grid>
                            <Grid item xs={3} sm={3} md={3}>
                                <AppTextInput control={control} name="lastName" label="Last Name" tooltip="Last Name" />
                            </Grid>
                            <Grid item xs={6} sm={5} md={3}>
                                <AppTextInput control={control} name="lastFirstName" label="Last, First Name" tooltip="Last, First Name" />
                            </Grid>
                        </Grid>

                        <Grid container item columnSpacing={colSpacing} justifyContent="center">
                            <Grid item xs={2} sm={2} md={2}>
                                <AppTextInput control={control} name="gender" label="Gender" tooltip="Gender" />
                            </Grid>
                            <Grid item xs={2} sm={2} md={2}>
                                <AppNumberInput control={control} name="grade" label="Grade" max={12} min={1} tooltip="Grade" />
                            </Grid>
                            <Grid item xs={8} sm={7} md={5}>
                                <AppTextInput control={control} name="email" label="Email" tooltip="Email" />
                            </Grid>
                        </Grid>

                        <Grid container item columnSpacing={colSpacing} justifyContent="center">
                            <Grid item xs={4} sm={3} md={3}
                                sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center' }}
                            >
                                {student && <Typography variant="h6" fontSize={DEFAULT_FONT_SIZE}>{student.school.name}</Typography>}
                                {event && <Typography variant="h6" fontSize={DEFAULT_FONT_SIZE}>{event.school.name}</Typography>}
                            </Grid>
                            <Grid item xs={5} sm={5} md={4}>
                                <AppTextInput control={control} name="homeroomTeacher" label="Homeroom Teacher" tooltip="Homeroom Teacher" />
                            </Grid>
                            <Grid item xs={3} sm={3} md={2}>
                                <AppTextInput control={control} name="homeroomNumber" label="Homeroom Number" tooltip="Homeroom Number" />
                            </Grid>
                        </Grid>

                        <Grid container justifyContent="center" sx={{ mt: 2 }}>
                            <Grid item display='flex' justifyContent='space-between' xs={12} sm={11} md={9}>
                                <AppButton onClick={cancelEdit} variant="contained" color="inherit">Cancel</AppButton>
                                <AppLoadingButton
                                    loading={isSubmitting}
                                    variant="contained"
                                    type="submit"
                                    color="success"
                                >
                                    {student ? "Save" : "Add Student"}
                                </AppLoadingButton>
                            </Grid>
                        </Grid>
                    </Grid>
                </form>
            </Paper>
        </>
    )
}