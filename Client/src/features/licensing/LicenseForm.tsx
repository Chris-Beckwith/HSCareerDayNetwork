import { LoadingButton } from "@mui/lab";
import { Paper, Grid, Typography, Button, useMediaQuery, useTheme, FormControl, FormHelperText, InputLabel, MenuItem, Select } from "@mui/material";
import AppBackButton from "../../app/components/AppBackButton";
import AppTextInput from "../../app/components/AppTextInput";
import { Controller, FieldValues, useForm } from "react-hook-form";
import { DEFAULT_FONT_SIZE, LicenseType } from "../../app/util/constants";
import { yupResolver } from "@hookform/resolvers/yup";
import { licenseValidationSchema } from "./licenseValidation";
import { getLicenseTypeText } from "../../app/util/util";
import { DatePicker } from '@mui/x-date-pickers/DatePicker';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
import { LocalizationProvider } from "@mui/x-date-pickers";
import AppNumberInput from "../../app/components/AppNumberInput";
import dayjs from "dayjs";
import agent from "../../app/api/agent";
import { toast } from "react-toastify";

interface Props {
    cancelEdit: () => void
}

export default function LicenseForm({ cancelEdit }: Props) {
    const { control, handleSubmit, formState: { isValid, isSubmitting, errors}} = useForm({
        resolver: yupResolver<any>(licenseValidationSchema),
        defaultValues: {
            type: LicenseType.Full,
            expirationDate: dayjs().add(1, 'year'),
            maxSchools: '5',
            maxEvents: '5',
            email: ''
        }
    })
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))

    const licenseTypeOptions = [
        { label: getLicenseTypeText(LicenseType.Full), value: LicenseType.Full },
        { label: getLicenseTypeText(LicenseType.SurveyOnly), value: LicenseType.SurveyOnly }
    ]

    async function handleCreateLicense(data: FieldValues) {
        data.expirationDate = dayjs(data.expirationDate).format('YYYY-MM-DD')
        await agent.License.create(data)
            .then(() => {
                cancelEdit()
                toast.success("License Invite Created")
            })
            .catch(error => console.log(error))
    }

    //Email, Type, Expiration Date, max schools, max events..
    return (
        <Paper variant="outlined" sx={{ my: { xs: 3, md: 6 }, p: { xs: 2, md: 3 } }}>
            <Grid container sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center', position: 'relative' }}>
                <AppBackButton onClick={cancelEdit} sx={{ left: isMobile ? 4 : 24 }} />
                <Typography align="center" variant={isTablet ? "h4" : "h3"} width="78%">Create New License</Typography>
            </Grid>
            <form onSubmit={handleSubmit(handleCreateLicense)}>
                <Grid container sx={{ my: 4 }}>
                    <Grid container item columnSpacing={2} justifyContent="center">
                        <Grid item xs={4} sm={3} md={3}>
                            <FormControl fullWidth error={!!errors.type} size={isMobile ? "small" : "medium"}>
                                <InputLabel id="type-helper-label">License Type</InputLabel>
                                <Controller
                                    name="type"
                                    control={control}
                                    render={({ field }) => (
                                        <Select {...field} label="License Type"
                                            sx={{
                                                '& .MuiOutlinedInput-input': {
                                                    fontSize: DEFAULT_FONT_SIZE,
                                                },
                                                '& .MuiSelect-select': {
                                                    paddingTop: isTablet ? isMobile ? '6.2px' : '15.35px' : '16.5px',
                                                    paddingBottom: isTablet ? isMobile ? '6.2px' : '15.35px' : '16.5px'
                                                }
                                            }}
                                        >
                                            {licenseTypeOptions.map(option => (
                                                <MenuItem key={option.value} value={option.value}>
                                                    {option.label}
                                                </MenuItem>
                                            ))}
                                        </Select>
                                    )}
                                />
                                <FormHelperText>{errors.type?.message?.toString()}</FormHelperText>
                            </FormControl>
                        </Grid>
                        <Grid item xs={8} sm={6} md={5}>
                            <AppTextInput control={control} name="email" label="User Email" />
                        </Grid>
                    </Grid>

                    <Grid container columnSpacing={2} justifyContent="center" my={2}>
                        <Grid item xs={6} sm={5} md={4}>
                            <FormControl error={!!errors.expirationDate}>
                                <LocalizationProvider dateAdapter={AdapterDayjs}>
                                    <Controller
                                        name="expirationDate"
                                        control={control}
                                        render={({ field }) => (
                                            <DatePicker label="Expiration Date"
                                                {...field}
                                                slotProps={{
                                                    textField: {
                                                        size: isMobile ? 'small' : 'medium',
                                                        error: !!errors.expirationDate
                                                    }
                                                }}
                                                sx={{
                                                    '& .MuiOutlinedInput-input': {
                                                        fontSize: DEFAULT_FONT_SIZE,
                                                    },
                                                    '& .MuiSelect-select': {
                                                        paddingTop: isTablet ? isMobile ? '6.2px' : '15.35px' : '16.5px',
                                                        paddingBottom: isTablet ? isMobile ? '6.2px' : '15.35px' : '16.5px'
                                                    }
                                                }}
                                                value={field.value}
                                                onChange={(newDate) => field.onChange(newDate)}
                                            />
                                        )}
                                    />
                                </LocalizationProvider>
                                <FormHelperText>{errors.expirationDate?.message?.toString()}</FormHelperText>
                            </FormControl>
                        </Grid>

                        <Grid item xs={3} sm={2} md={2}>
                            <AppNumberInput control={control} name="maxSchools" label="Max Schools" min={1}/>
                        </Grid>
                        <Grid item xs={3} sm={2} md={2}>
                            <AppNumberInput control={control} name="maxEvents" label="Max Events" min={1}/>
                        </Grid>
                    
                    </Grid>

                    <Grid container justifyContent="center" sx={{ mt: 2 }}>
                        <Grid item display='flex' justifyContent='space-between' xs={12} sm={9} md={8}>
                            <Button onClick={cancelEdit} variant="contained" color="inherit">Cancel</Button>
                            <LoadingButton
                                loading={isSubmitting}
                                variant="contained"
                                type="submit"
                                color="success"
                                disabled={!isValid}
                            >
                                Create License
                            </LoadingButton>
                        </Grid>
                    </Grid>
                </Grid>
            </form>
        </Paper>
    )
}