import Avatar from '@mui/material/Avatar';
import TextField from '@mui/material/TextField';
import FormControlLabel from '@mui/material/FormControlLabel';
import Checkbox from '@mui/material/Checkbox';
import Box from '@mui/material/Box';
import LockOutlinedIcon from '@mui/icons-material/LockOutlined';
import Typography from '@mui/material/Typography';
import Container from '@mui/material/Container';
import { Paper } from '@mui/material';
import { FieldValues, useForm } from 'react-hook-form';
import { LoadingButton } from '@mui/lab';
import { useLocation, useNavigate } from 'react-router-dom';
import { useAppDispatch, useAppSelector } from '../../app/store/configureStore';
import { signInUser } from './accountSlice';
import { useEffect } from 'react';

export default function Login() {
    const navigate = useNavigate()
    const location = useLocation()
    const dispatch = useAppDispatch()
    const {register, handleSubmit, formState: {isSubmitting, errors, isValid}} = useForm({
        mode: 'onTouched'
    })
    const {user} = useAppSelector(state => state.account)

    async function submitForm(data: FieldValues) {
        try {
            await dispatch(signInUser(data))
        } catch (error) {
            console.log(error)
        }
    }

    useEffect(() => {
        if (user) {
            if (user.roles?.includes("SchoolUser")) navigate('/event-details')
            else navigate(location.state?.from || '/')
        }
    }, [location.state?.from, navigate, user])

    return (
        <Container
            component={Paper} maxWidth="sm"
            sx={{ display: 'flex', flexDirection: 'column', alignItems: 'center', p: 4 }}>
            <Avatar sx={{ m: 1, bgcolor: 'secondary.main' }}>
                <LockOutlinedIcon />
            </Avatar>
            <Typography component="h1" variant="h5">
                Sign in
            </Typography>
            <Box component="form" onSubmit={handleSubmit(submitForm)} noValidate sx={{ mt: 1 }}>
                <TextField
                    margin="normal"
                    fullWidth
                    label="Username"
                    autoFocus
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
                    autoComplete="current-password"
                    {...register('password', {required: 'Password is required'})}
                    error={!!errors.password}
                    helperText={errors?.password?.message as string}
                />
                <FormControlLabel
                    control={<Checkbox value="remember" color="primary" />}
                    label="Remember me"
                />
                <LoadingButton
                    loading={isSubmitting}
                    disabled={!isValid}
                    type="submit"
                    fullWidth
                    variant="contained"
                    sx={{ mt: 3, mb: 2 }}
                >
                    Sign In
                </LoadingButton>
            </Box>
        </Container>
    );
}