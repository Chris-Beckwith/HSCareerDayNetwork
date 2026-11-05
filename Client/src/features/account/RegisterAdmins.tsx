import Avatar from '@mui/material/Avatar';
import Box from '@mui/material/Box';
import LockOutlinedIcon from '@mui/icons-material/LockOutlined';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';
import { FormControl, FormHelperText, InputLabel, MenuItem, Paper, Select, useMediaQuery, useTheme } from '@mui/material';
import { FieldValues, useForm } from 'react-hook-form';
import agent from '../../app/api/agent';
import { toast } from 'react-toastify';
import { useNavigate } from 'react-router-dom';
import useEvents from '../../app/hooks/useEvents';
import LoadingComponent from '../../app/components/LoadingComponent';
import { useEffect, useState } from 'react';
import { reloadUsers } from './userSlice';
import { useAppDispatch } from '../../app/store/configureStore';
import AppLoadingButton from '../../app/components/AppLoadingButton';
import AppEmailField from '../../app/components/AppEmailField';
import AppUsernameField from '../../app/components/AppUsernameField';
import AppPasswordField from '../../app/components/AppPasswordField';
import AppPassConfirmField from '../../app/components/AppPassConfirmField';
import { handleApiErrors } from '../../app/util/util';

/**
 * Component to register school adminstrator users.
 */
export default function RegisterAdmins() {
    const navigate = useNavigate()
    const dispatch = useAppDispatch()
    const { careerEvents, careerEventsLoaded } = useEvents()
    const [selectedEvent, setSelectedEvent] = useState()
    const { register, handleSubmit, setError, watch, trigger,
        formState: { isSubmitting, errors, isValid, touchedFields } } = useForm({ mode: 'onTouched' })
    const isMobile = useMediaQuery(useTheme().breakpoints.down('sm'))

    const password = watch('password')
    const confirmPassword = watch('confirmPassword')

    useEffect(() => {
        if (touchedFields.confirmPassword) {
            trigger('confirmPassword')
        }
    }, [password, confirmPassword, trigger, touchedFields.confirmPassword])

    async function handleRegister(data: FieldValues) {
        await agent.Account.registerSchoolUser(data)
            .then(() => {
                toast.success('Registration Successful')
                dispatch(reloadUsers())
                navigate('/schoolAdmins')
            })
            .catch(error => handleApiErrors(error, setError))
    }

    if (!careerEventsLoaded) return <LoadingComponent message='Loading Events...' />

    return (
        <Container
            component={Paper} maxWidth="sm"
            sx={{ display: 'flex', flexDirection: 'column', alignItems: 'center', p: 4 }}>
            <Avatar sx={{ m: 1, bgcolor: 'secondary.main' }}>
                <LockOutlinedIcon />
            </Avatar>
            <Typography component="h1" variant={isMobile ? "h6" : "h5"} textAlign="center">
                Register School Administrator
            </Typography>
            <Box component="form"
                onSubmit={handleSubmit(handleRegister)}
                noValidate sx={{ mt: 1 }}
            >
                <AppEmailField register={register} error={errors.email} isMobile={isMobile} />
                <AppUsernameField register={register} error={errors.username} isMobile={isMobile} />
                <AppPasswordField register={register} error={errors.password} isMobile={isMobile} />
                <AppPassConfirmField register={register} error={errors.confirmPassword} password={password} isMobile={isMobile} />
                <FormControl fullWidth sx={{ mt: 2 }} error={!!errors.selectedEvent} 
                    size={isMobile ? 'small' : 'medium'}>
                    <InputLabel>Career Day Event</InputLabel>
                    <Select 
                        label="Career Day Event"
                        value={selectedEvent ? selectedEvent : "" }
                        {...register('eventId', {
                            required: 'Career Day Event is required',
                            pattern: {
                                value: /^\d+$/,
                                message: 'Career Day event is required..'
                            },
                            onChange: (e) => setSelectedEvent(e.target.value)
                        })}
                    >
                        {careerEvents.map((event, index) => (
                            <MenuItem key={index} value={event.id.toString()}>
                                {event.name} - {new Date(event.eventDate).toLocaleDateString()}
                            </MenuItem>
                        ))}
                    </Select>
                    <FormHelperText>{errors?.selectedEvent?.message as string}</FormHelperText>
                </FormControl>
                <AppLoadingButton
                    loading={isSubmitting}
                    disabled={!isValid}
                    type="submit"
                    fullWidth
                    variant="contained"
                    sx={{ mt: 3, mb: 2 }}
                >
                    Register
                </AppLoadingButton>
            </Box>
        </Container>
    );
}