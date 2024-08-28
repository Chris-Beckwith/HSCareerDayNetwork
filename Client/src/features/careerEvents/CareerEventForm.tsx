import { yupResolver } from "@hookform/resolvers/yup";
import { useEffect, useState } from "react";
import { useForm, FieldValues, Controller, ControllerRenderProps } from "react-hook-form";
import agent from "../../app/api/agent";
import { CareerEvent } from "../../app/models/event";
import { useAppDispatch } from "../../app/store/configureStore";
import { reloadEvents } from "./careerEventSlice";
import { eventValidationSchema } from "./eventValidation";
import { Button, FormControl, FormHelperText, Grid, InputLabel, MenuItem, Paper, Select, SelectChangeEvent, Typography } from "@mui/material";
import useSchools from "../../app/hooks/useSchools";
import dayjs, { Dayjs } from 'dayjs';
import { DatePicker } from '@mui/x-date-pickers/DatePicker';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
import { LocalizationProvider } from "@mui/x-date-pickers";
import AppTextInput from "../../app/components/AppTextInput";
import { LoadingButton } from "@mui/lab";
import LoadingComponent from "../../app/components/LoadingComponent";
import useEvents from "../../app/hooks/useEvents";

interface Props {
    selectedEvent?: CareerEvent
    cancelEdit: () => void
    saveEdit: () => void
}

export default function CareerEventForm({ selectedEvent, cancelEdit, saveEdit }: Props) {
    const dispatch = useAppDispatch()
    const { schools, schoolsLoaded } = useSchools()
    const { eventPhases } = useEvents()
    const [date, setDate] = useState<Dayjs | null>(null)
    const { control, reset, handleSubmit, formState: { isDirty, isSubmitting, errors }, setValue } = useForm({
        resolver: yupResolver<any>(eventValidationSchema)
    })

    useEffect(() => {
        if (selectedEvent && !isDirty && schoolsLoaded) {
            setDate(dayjs(selectedEvent.eventDate))
            reset({
                ...selectedEvent,
                eventDate: dayjs(selectedEvent.eventDate).toDate()
            })
        }
    }, [selectedEvent, reset, isDirty, schoolsLoaded, setDate])

    async function handleAddEvent(data: FieldValues) {
        data.eventDate = dayjs(data.eventDate).toISOString()
        try {
            if (selectedEvent) {
                await agent.Event.update(data)
            } else {
                data.eventPhase = eventPhases.find(p => p.phaseName === "Created")
                await agent.Event.create(data)
            }
            dispatch(reloadEvents())
            saveEdit()
        } catch (error) {
            console.log(error)
        }
    }

    const handleSchoolChange = (event: SelectChangeEvent<any>, field: ControllerRenderProps<any, "school">) => {
        field.onChange(event.target.value)
        const selectedSchool = schools.find(s => s.id === event.target.value)
        setValue('school', selectedSchool)
    }
    
    if (!schoolsLoaded) return <LoadingComponent message="Loading..." />

    return (
        <>
            <Paper variant="outlined" sx={{ my: { xs: 3, md: 6 }, p: { xs: 2, md: 3 } }}>
                <Typography align="center" variant="h3">{selectedEvent ? "Edit Event" : "Add New Event"}</Typography>
                <form onSubmit={handleSubmit(handleAddEvent)}>
                    <Grid container justifyContent='center' sx={{mt: 2}}>
                        <Grid container item xs={9} spacing={2}>
                            <Grid item xs={6}>
                                <FormControl fullWidth error={!!errors.school}>
                                    <InputLabel id="school-helper-label">School</InputLabel>
                                    <Controller
                                        name="school"
                                        control={control}
                                        render={({ field }) => (
                                            <Select
                                                {...field}
                                                label="School"
                                                value={field.value ? field.value.id : ''}
                                                onChange={(event) => handleSchoolChange(event, field)}
                                            >
                                                {schools?.map((school) => (
                                                    <MenuItem key={school.id} value={school.id}>{school.name}</MenuItem>
                                                ))}
                                            </Select>
                                        )}
                                    />
                                    <FormHelperText>{errors.school?.message?.toString()}</FormHelperText>
                                </FormControl>
                            </Grid>
                            <Grid item xs={6}>
                                <AppTextInput control={control} label="Name" name="name"/>
                            </Grid>
                            
                            <Grid item xs={6} justifyContent='center' display='flex' mt={3}>
                                <FormControl error={!!errors.eventDate}>
                                    <LocalizationProvider dateAdapter={AdapterDayjs}>
                                        <Controller
                                            name="eventDate"
                                            control={control}
                                            render={({ field }) => (
                                                <DatePicker label="Event Date"
                                                    {...field}
                                                    disablePast
                                                    slotProps={{
                                                        textField: {
                                                            error: !!errors.eventDate
                                                        }
                                                    }}
                                                    value={date}
                                                    onChange={(newDate) => field.onChange(newDate?.toDate())}
                                                />
                                            )}
                                        />
                                    </LocalizationProvider>
                                    <FormHelperText>{errors.eventDate?.message?.toString()}</FormHelperText>
                                </FormControl>
                            </Grid>
                            <Grid item xs={6}>
                                <AppTextInput control={control} label="Description" name="description" multiline rows={4}/>
                            </Grid>

                            <Grid container item justifyContent='center'>
                                <Grid item xs={6}>
                                    <Button onClick={cancelEdit} variant="contained" color="inherit">Cancel</Button>
                                </Grid>
                                <Grid item xs={6} display="flex" justifyContent="flex-end">
                                    <LoadingButton
                                        loading={isSubmitting}
                                        variant="contained"
                                        type="submit"
                                        color="success"
                                    >
                                        {selectedEvent ? "Save Event" : "Add Event"}
                                    </LoadingButton>
                                </Grid>
                            </Grid>
                        </Grid>
                    </Grid>
                </form>
            </Paper>
        </>
    )
}