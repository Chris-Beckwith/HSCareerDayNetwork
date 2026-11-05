import { useEffect, useState } from "react"
import { useNavigate, useParams } from "react-router-dom"
import agent from "../../app/api/agent"
import { LicenseInvite } from "../../app/models/license"
import { FieldValues, useForm } from "react-hook-form"
import { Box, Card, CardContent, Chip, Grid, Paper, Typography, useMediaQuery, useTheme } from "@mui/material"
import { formatDate, getLicenseTypeText, handleApiErrors } from "../../app/util/util"
import AppPassConfirmField from "../../app/components/AppPassConfirmField"
import AppPasswordField from "../../app/components/AppPasswordField"
import AppUsernameField from "../../app/components/AppUsernameField"
import { DEFAULT_FONT_SIZE, LicenseType } from "../../app/util/constants"
import { EmailOutlined, Event, HolidayVillage } from "@mui/icons-material"
import AppLoadingButton from "../../app/components/AppLoadingButton"
import { toast } from "react-toastify"
import dayjs from "dayjs"
import LoadingComponent from "../../app/components/LoadingComponent"

export default function LicenseRegistration() {
    const { inviteToken } = useParams()
    const navigate = useNavigate()
    const [loading, setLoading] = useState(false)
    const [licenseInvite, setLicenseInvite] = useState<LicenseInvite | undefined>(undefined)
    const { register, handleSubmit, watch, trigger, reset, setError,
        formState: { isSubmitting, errors, isValid, touchedFields } } = useForm<FieldValues>({ 
            mode: 'onTouched'
        })
    const password = watch('password')
    const confirmPassword = watch('confirmPassword')

    useEffect(() => {
        if (touchedFields.confirmPassword) {
            trigger('confirmPassword')
        }
    }, [password, confirmPassword, trigger, touchedFields.confirmPassword])

    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))
    const darkMode = theme.palette.mode === 'dark'

    useEffect(() => {
        setLoading(true)
        if (inviteToken) {
            agent.License.licenseInvite(inviteToken)
                .then(response => {
                    console.log("response: ", response)
                    setLicenseInvite(response)
                    reset({username: response.email})
                })
                .catch(error => {
                    console.log(error)
                })
                .finally(() => setLoading(false))
        }
    },[reset, inviteToken])

    const completeRegistration = async (data: FieldValues) => {
        const dataWithToken = {
            ...data,
            inviteToken
        }
        await agent.License.registerUser(dataWithToken)
            .then(() => {
                toast.success("Registration Successful")
                navigate('/login')
            })
            .catch(error => handleApiErrors(error, setError))
    }

    const licenseDetailsText = (type: LicenseType) => {
        switch (type) {
            case 0: return "Full Career Day platform access"
            case 1: return "Only survey access, no scheduling features"
        }
    }

    //TODO Add links to contact us/lincense inquery page.  Are they the same??
    if (licenseInvite?.usedAt || dayjs().isAfter(dayjs(licenseInvite?.expirationDate)) ) {
        return (
            <Paper variant="outlined" sx={{ width: isTablet ? isMobile ? '100%' : '85%' : '80%', mx: 'auto', my: { xs: 3, md: 6 }, p: { xs: 1, sm: 2 } }}>
                <Typography align="center" color="error" variant={isTablet ? isMobile ? "h6" : "h5" : "h4"}>
                    The License Invitation is no longer valid
                </Typography>
                <Typography align="center" variant="body1" fontSize={DEFAULT_FONT_SIZE}>
                    Contact Us
                </Typography>
            </Paper>
        )
    }

    if ((!inviteToken || !licenseInvite) && !loading) {
        return (
            <Paper variant="outlined" sx={{ width: isTablet ? isMobile ? '100%' : '85%' : '80%', mx: 'auto', my: { xs: 3, md: 6 }, p: { xs: 1, sm: 2 } }}>
                <Typography align="center" variant={isTablet ? "h5" : "h4"} color="error" mt={2}>
                    Could not find license to complete registration
                </Typography>
                <Typography align="center" variant="body1" fontSize={DEFAULT_FONT_SIZE}>
                    Link to inquery page/Contact Us
                </Typography>
            </Paper>
        )
    }
    
    return (
        <Paper variant="outlined" sx={{ width: isTablet ? isMobile ? '100%' : '85%' : '72%', mx: 'auto', my: { xs: 1, md: 2 }, p: { xs: 1, sm: 2 } }}>
            <Grid container sx={{ display: 'flex', alignItems: 'center', justifyContent: 'center', flexDirection: 'column' }}>
                <Typography align="center" variant={isTablet ? isMobile ? "h6" : "h5" : "h4"}>Register Your Career Day License</Typography>
                <Typography align="center" variant="body1" fontSize={DEFAULT_FONT_SIZE} mt={2} sx={{ mb: { xs: 1, sm: 0 }}}>
                    Review license details and create your account to get started.
                </Typography>
            </Grid>

            {loading || !licenseInvite ? (
                <Grid sx={{ display: 'flex', justifyContent: 'center', mt: 2 }}>
                    <LoadingComponent message="Loading License Invite.."  />
                </Grid>
            ) : ( <>
                <Card variant="outlined" sx={{ px: { sm: .5, md: 2}, m: { xs: 2, sm: 3, md: 4} }}>
                    <CardContent sx={{ '&:last-child': { paddingBottom: 2 } }}>
                        <Grid sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                            <Typography fontWeight="bold" pr={1}>License</Typography>
                            <Chip label={getLicenseTypeText(licenseInvite.license.type)} variant="outlined" color="success" />
                        </Grid>
                        <Grid pt={1}>
                            <Typography variant="caption">{licenseDetailsText(licenseInvite.license.type)}</Typography>
                        </Grid>
                        <Grid sx={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', pt: 4 }}>
                            <Typography variant="caption">Expiration Date</Typography>
                            <Box sx={{ flexGrow: 1, mx: 3, height: '1px', background: (theme) =>
                                    `linear-gradient(90deg, transparent, ${darkMode ? theme.palette.grey[800] : theme.palette.grey[400]}, transparent)`, 
                                }}
                            />
                            <Typography>{formatDate(licenseInvite.license.expirationDate)}</Typography>
                        </Grid>
                        <Grid sx={{ display: 'flex', justifyContent: 'space-evenly', pt: 5 }}>
                            <Grid container direction="column" alignItems="center">
                                <HolidayVillage sx={{ mb: '4px' }}/>
                                <Typography>{licenseInvite.license.maxSchools}</Typography>
                                <Typography variant="caption" align="center" >Maximum Schools</Typography>
                            </Grid>
                            <Grid container direction="column" alignItems="center">
                                <Event sx={{ mb: '4px' }}/>
                                <Typography>{licenseInvite.license.maxEvents}</Typography>
                                <Typography variant="caption" align="center">Maximum Events</Typography>
                            </Grid>
                        </Grid>
                        <Grid pt={4}>
                            <Typography variant="caption">Registered Email</Typography>
                            <Grid container alignItems="center" sx={{ mt: 1 }}>
                                <EmailOutlined fontSize="small" sx={{ mr: 1 }}/>
                                <Typography>{licenseInvite.email}</Typography>
                            </Grid>
                        </Grid>
                    </CardContent>
                </Card>
                
                <Grid sx={{ px: { xs: 2, sm: 2.5, md: 4}, m: { xs: 2, sm: 3, md: 4} }}>
                    <Grid>
                        <Typography fontWeight="bold">Create Your Account</Typography>
                        <Typography mt={1} mb={2} fontSize={DEFAULT_FONT_SIZE}>You may use your username or email to access your account.</Typography>
                    </Grid>
                            
                    <form onSubmit={handleSubmit(completeRegistration)}>
                        <Grid container item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                            <AppUsernameField register={register} error={errors.username} isMobile={isMobile} />
                            <Grid item xs={12} alignContent="left" px={2}>
                                <Typography variant="caption" color="info.main">You can change this to a different username.</Typography>
                            </Grid>
                            <AppPasswordField register={register} error={errors.password} isMobile={isMobile} />
                            <AppPassConfirmField register={register} error={errors.confirmPassword} password={password} isMobile={isMobile} />
                        </Grid>

                        <Grid container justifyContent="center" sx={{ mt: 2 }}>
                            <Grid item display='flex' justifyContent='center'>
                                <AppLoadingButton
                                    loading={isSubmitting}
                                    variant="contained"
                                    type="submit"
                                    color="success"
                                    disabled={!isValid}
                                >
                                    Complete Registration
                                </AppLoadingButton>
                            </Grid>
                        </Grid>
                    </form>
                </Grid>
                <Grid display='flex' justifyContent='center' sx={{ mt: { sm: -1, md: -2 }, mb: { xs: 1, sm: 0 } }}>
                    <Typography color="GrayText" variant="caption" align="center">
                        By completing registration, your account will be created and associated with this license.
                    </Typography>
                </Grid>
            </> )}
        </Paper>
    )
}