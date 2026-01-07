import { Box, Button, Paper, Step, StepLabel, Stepper, Typography, useMediaQuery, useTheme } from "@mui/material";
import { useEffect, useState } from "react";
import InfoVerification from "./InfoVerification";
import CareerSelection from "./CareerSelection";
import ReviewAndSubmit from "./ReviewAndSubmit";
import { FieldValues, FormProvider, useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";
import { validationSchema } from "./surveyValidation";
import EnterStudentId from "./EnterStudentId";
import { useParams } from "react-router-dom";
import { CareerEvent } from "../../app/models/event";
import agent from "../../app/api/agent";
import LoadingComponent from "../../app/components/LoadingComponent";
import { Student } from "../../app/models/student";
import { LoadingButton } from "@mui/lab";
import { Career } from "../../app/models/career";
import { toast } from "react-toastify";
import SurveyEventError from "./SurveyEventError";
import { EVENT_PHASES } from "../../app/util/constants";

const steps = [
    { labelMD: 'Enter Student ID', labelXS: 'Student ID' },
    { labelMD: 'Verify Information', labelXS: 'Verify Identity' },
    { labelMD: 'Select Career Choices', labelXS: 'Select Careers' },
    { labelMD: 'Review and Submit', labelXS: 'Review & Submit' }
]

export default function Survey() {
    const [activeStep, setActiveStep] = useState(0)
    const currentValidationSchema = validationSchema[activeStep]
    const { eventHash } = useParams()
    const [event, setEvent] = useState<CareerEvent | undefined>(undefined)
    const [student, setStudent] = useState<Student | undefined>(undefined)
    const [primaryCareers, setPrimaryCareers] = useState<Career[]>([])
    const [alternateCareers, setAlternateCareers] = useState<Career[]>([])
    const [onPrimaryCareers, setOnPrimaryCareers] = useState(true)
    const [loading, setLoading] = useState(false)
    const [error, setError] = useState('')
    const [eventError, setEventError] = useState('')
    const [loadingStep, setLoadingStep] = useState(false)
    const theme = useTheme()
    const isXS = useMediaQuery(theme.breakpoints.down('md'))
    const isNarrow = useMediaQuery('(max-width: 370px)')

    useEffect(() => {
        setLoading(true)
        if (eventHash) {
            agent.Event.eventByGuid(eventHash)
                .then(response => {
                    setEvent(response)
                    if (response.eventPhase.phaseName != EVENT_PHASES.SURVEYINPROGRESS) {
                        setEventError("Event Survey is not open")
                    }
                })
                .then(() => {
                })
                .catch(error => {
                    console.log(error)
                    if (error.status === 404) {
                        setEventError("Event Not Found")
                    } else {
                        setEventError("Event Error " + error.statusText)
                    }
                })
                .finally(() => setLoading(false))
        }
    }, [eventHash])


    const getStepContent = (step: number) => {
        switch (step) {
            case 0:
                return <EnterStudentId error={error} />
            case 1:
                return <InfoVerification student={student} />
            case 2:
                return <CareerSelection careers={event?.careers}
                    updateSelectedCareer={updateSelectedCareer} onPrimaryCareers={onPrimaryCareers}
                    primaryCareers={primaryCareers} alternateCareers={alternateCareers} />
            case 3:
                return <ReviewAndSubmit student={student}
                    primaryCareers={primaryCareers} alternateCareers={alternateCareers} />
            default:
                throw new Error('Unknown step')
        }
    }

    const methods = useForm({
        mode: 'onTouched',
        resolver: yupResolver(currentValidationSchema),
        defaultValues: {
            primaryCareers: [],
            alternateCareers: []
        }
    })

    const updateSelectedCareer = (career: Career, isPrimary: boolean, isAdd: boolean) => {
        if (isPrimary) {
            if (isAdd) {
                //Check if career is in Alternate, if so remove it.
                const secondCareer = alternateCareers.find(c => c.id === career.id)
                if (secondCareer) setAlternateCareers(prev => prev.filter(c => c.id !== secondCareer.id))
                setPrimaryCareers(prev => [...prev, career])
            } else {
                setPrimaryCareers(prev => prev.filter(c => c.id !== career.id))
            }
        } else {
            if (isAdd) {
                setAlternateCareers(prev => [...prev, career])
            } else {
                setAlternateCareers(prev => prev.filter(c => c.id !== career.id))
            }
        }
    }

    const handleNext = async (data: FieldValues) => {
        setLoadingStep(true)
        setError('')

        if (event) {
            if (activeStep === 0) {  //Student Number
                await agent.Student.byNumberAndEvent(event.id, data.studentNumber)
                    .then(response => {
                        if (response) {
                            if (response.surveyComplete) {
                                setError("You've already completed the survey")
                            } else {
                                setStudent(response)
                                setActiveStep(activeStep + 1)
                            }
                        } else {
                            setError("Could not find Student Number")
                        }
                    })
                    .catch(error => console.log(error))
                    .finally(() => setLoadingStep(false))
            } else if (activeStep === 1) {  //Verify Information
                setActiveStep(activeStep + 1)
            } else if (activeStep === 2) {  //Select Careers
                if (onPrimaryCareers && primaryCareers.length !== 3) {
                    setLoadingStep(false)
                    return toast.error("Please select 3 primary careers")
                }
                if (!onPrimaryCareers && alternateCareers.length !== 2) {
                    setLoadingStep(false)
                    return toast.error("Please select 2 alternate careers")
                }
                if (onPrimaryCareers) {
                    setOnPrimaryCareers(false)
                    window.scrollTo({ top: 250, behavior: 'smooth'})
                } else {
                    setActiveStep(activeStep + 1)
                    window.scrollTo({ top: 250, behavior: 'smooth'})
                }
            } else if (activeStep === 3) {  //Survey Submitted
                const studentId = student?.id
                const dataWithStudent = {
                    ...data,
                    student,
                    studentId,
                    primaryCareers,
                    alternateCareers
                }

                await agent.Student.submitSurvey(dataWithStudent)
                    .finally(() => setLoadingStep(false))
                setActiveStep(activeStep + 1)
            }
        }
        setLoadingStep(false)
    }

    const handleBack = () => {
        if (activeStep === 2 && !onPrimaryCareers) setOnPrimaryCareers(true)
        else setActiveStep(activeStep - 1)
    }

    if (loading) return <LoadingComponent message="Loading Survey..." />

    if (eventError) return <SurveyEventError error={eventError} />

    return (
        <FormProvider {...methods}>
            <Paper variant="outlined" sx={{ my: { xs: 3, md: 6 }, p: { xs: 2, md: 3 } }}>
                <Typography component="h1" variant="h4" align="center"
                    sx={{ fontSize: { xs: '1.5rem', md: '2.125rem' } }}
                >
                    Student Survey
                </Typography>
                <Typography variant="body1" align="center"
                    sx={{ fontSize: { xs: '1.5rem', md: '2.125rem' } }}
                >
                    for
                </Typography>
                <Typography component="h1" variant="h4" align="center"
                    sx={{ fontSize: { xs: '1.5rem', md: '2.125rem' } }}
                >
                    {event?.school.name}
                </Typography>
                <Stepper activeStep={activeStep}
                    sx={{
                        pt: { xs: 2, md: 3 }, pb: { xs: 2, md: 5 }, flexWrap: { xs: 'wrap', md: 'nowrap', },
                        '.MuiStepConnector-lineVertical': { minHeight: 6, },
                    }}
                    orientation={isNarrow ? 'vertical' : 'horizontal'}
                >
                    {steps.map((step, index) => (
                        <Step key={index} sx={{ mb: { xs: isNarrow ? 0 : 0.75, md: 0 } }}>
                            <StepLabel>{isXS ? step.labelXS : step.labelMD}</StepLabel>
                        </Step>
                    ))}
                </Stepper>
                {activeStep === steps.length ? (
                    <Box display='flex' justifyContent='center'>
                        {error ? (
                            <Box>
                                <Typography variant="h4" sx={{ mb: 2 }} gutterBottom>There was an issue submitting your survey</Typography>
                                <Typography variant="h6" display='flex' justifyContent='center'
                                    color="error" gutterBottom>{error}</Typography>
                            </Box>
                        ) :
                            isXS ?
                            <Typography variant="body1" sx={{ fontWeight: 'bold', fontSize: '18px' }} gutterBottom>Thank you for submitting your survey</Typography>
                            : <Typography variant="h4" gutterBottom>Thank you for submitting your survey</Typography>
                        }
                    </Box>
                ) : (
                    <form onSubmit={methods.handleSubmit(handleNext)}>
                        {getStepContent(activeStep)}
                        <Box sx={{ display: 'flex', justifyContent: 'flex-end' }}>
                            {activeStep !== 0 && (
                                <Button onClick={handleBack} sx={{ mt: 3, ml: 1 }}>
                                    Back
                                </Button>
                            )}
                            <LoadingButton
                                loading={loadingStep}
                                disabled={!methods.formState.isValid}
                                variant="contained"
                                type='submit'
                                sx={{ mt: 3, ml: 1 }}
                            >
                                {activeStep === steps.length - 1 ? 'Submit Survey' : 'Next'}
                            </LoadingButton>
                        </Box>
                    </form>
                )}
            </Paper>
        </FormProvider>
    )
}