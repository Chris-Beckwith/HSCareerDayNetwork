import Avatar from '@mui/material/Avatar';
import TextField from '@mui/material/TextField';
import Box from '@mui/material/Box';
import LockOutlinedIcon from '@mui/icons-material/LockOutlined';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';
import { FormControl, FormHelperText, InputLabel, MenuItem, Paper, Select } from '@mui/material';
import { FieldValues, useForm } from 'react-hook-form';
import { LoadingButton } from '@mui/lab';
import agent from '../../app/api/agent';
import { toast } from 'react-toastify';
import { useNavigate } from 'react-router-dom';
import useEvents from '../../app/hooks/useEvents';
import LoadingComponent from '../../app/components/LoadingComponent';
import { useState } from 'react';
import { reloadUsers } from './userSlice';
import { useAppDispatch } from '../../app/store/configureStore';

export default function Register() {
    const navigate = useNavigate()
    const dispatch = useAppDispatch()
    const { careerEvents, careerEventsLoaded } = useEvents()
    const [selectedEvent, setSelectedEvent] = useState()
    const { register, handleSubmit, setError, watch, formState: { isSubmitting, errors, isValid } } = useForm({
        mode: 'onTouched'
    })

    function handleApiErrors(errors: any) {
        if (errors) {
            errors.forEach((error: string) => {
                if (error.includes('Password')) {
                    setError('password', {message: error})
                } else if (error.includes('Email')) {
                    setError('email', {message: error})
                } else if (error.includes('Username')) {
                    setError('username', {message: error})
                }
            });
        }
    }

    async function handleRegister(data: FieldValues) {
        agent.Account.register(data)
            .then(() => {
                toast.success('Registration Successful')
                dispatch(reloadUsers())
                navigate('/schoolAdmins')
            })
            .catch(error => handleApiErrors(error))
    }

    if (!careerEventsLoaded) return <LoadingComponent message='Loading Events...' />

    return (
        <Container
            component={Paper} maxWidth="sm"
            sx={{ display: 'flex', flexDirection: 'column', alignItems: 'center', p: 4 }}>
            <Avatar sx={{ m: 1, bgcolor: 'secondary.main' }}>
                <LockOutlinedIcon />
            </Avatar>
            <Typography component="h1" variant="h5">
                Register School Administrator
            </Typography>
            <Box component="form"
                onSubmit={handleSubmit(handleRegister)}
                noValidate sx={{ mt: 1 }}
            >
                <TextField
                    margin="normal"
                    fullWidth
                    label="Email"
                    autoFocus
                    autoComplete='email'
                    {...register('email', {
                        required: 'Email is required',
                        pattern: {
                            value: /^\w+[\w-.]*@\w+((-\w+)|(\w*))\.[a-z]{2,3}$/,
                            message: 'Not a valid email address'
                        }
                    })}
                    error={!!errors.email}
                    helperText={errors?.email?.message as string}
                />
                <TextField
                    margin="normal"
                    fullWidth
                    label="Username"
                    autoComplete="username"
                    {...register('username', {required: 'Username is required'})}
                    error={!!errors.username}
                    helperText={errors?.username?.message as string}
                />
                <TextField
                    margin="normal"
                    fullWidth
                    label="Password"
                    type="password"
                    autoComplete='new-password'
                    {...register('password', {
                        required: 'Password is required',
                        pattern: {
                            value: /(?=^.{6,10}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&amp;*()_+}{&quot;:;'?/&gt;.&lt;,])(?!.*\s).*$/,
                            message: 'Password does not meet requirements'
                        }
                    })}
                    error={!!errors.password}
                    helperText={errors?.password?.message as string}
                />
                <TextField
                    margin="normal"
                    fullWidth
                    label="Confirm Password"
                    type="password"
                    autoComplete='new-password'
                    {...register('confirmPassword', {
                        required: 'Confirm password is required',
                        validate: value =>
                            value === watch('password') || 'Passwords do not match'
                    })}
                    error={!!errors.confirmPassword}
                    helperText={errors?.confirmPassword?.message as string}
                />
                <FormControl fullWidth sx={{ mt: 2 }} error={!!errors.selectedEvent}>
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
                <LoadingButton
                    loading={isSubmitting}
                    disabled={!isValid}
                    type="submit"
                    fullWidth
                    variant="contained"
                    sx={{ mt: 3, mb: 2 }}
                >
                    Register
                </LoadingButton>
            </Box>
        </Container>
    );
}