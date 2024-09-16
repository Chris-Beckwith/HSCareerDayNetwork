import { Box, Button, Paper, Step, StepLabel, Stepper, Typography } from "@mui/material";
import { useEffect, useState } from "react";
import InfoVerification from "./InfoVerification";
import CareerSelection from "./CareerSelection";
import ReviewAndSubmit from "./ReviewAndSubmit";
import { FieldValues, FormProvider, useFieldArray, useForm } from "react-hook-form";
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

const steps = ['Enter Student ID', 'Verify Information', 'Select Career Choices', 'Review and Submit']

export default function Survey() {
    const [activeStep, setActiveStep] = useState(0)
    const currentValidationSchema = validationSchema[activeStep]
    const { eventHash } = useParams()
    const [event, setEvent] = useState<CareerEvent | undefined>(undefined)
    const [student, setStudent] = useState<Student | undefined>(undefined)
    const [primaryCareers, setPrimaryCareers] = useState<Career[]>([])
    const [secondaryCareers, setSecondaryCareers] = useState<Career[]>([])
    const [onPrimaryCareers, setOnPrimaryCareers] = useState(true)
    const [loading, setLoading] = useState(false)
    const [error, setError] = useState('')
    const [eventError, setEventError] = useState('')
    const [loadingStep, setLoadingStep] = useState(false)
    
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
                    setEventError("Event " + error.statusText)
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
                    primaryCareers={primaryCareers} secondaryCareers={secondaryCareers} />
            case 3:
                return <ReviewAndSubmit student={student} 
                    primaryCareers={primaryCareers} secondaryCareers={secondaryCareers} />
            default:
                throw new Error('Unknown step')
        }
    }

    const methods = useForm({
        mode: 'onTouched',
        resolver: yupResolver(currentValidationSchema),
        defaultValues: {
            primaryCareers: [],
            secondaryCareers: []
        }
    })

    const { control } = methods
    const { append: appendPrimary } = useFieldArray({
        control,
        name: 'primaryCareers',
        keyName: 'key'
    } as never)
    const { append: appendSecondary } = useFieldArray({
        control,
        name: 'secondaryCareers',
        keyName: 'key'
    } as never)

    const updateSelectedCareer = (career: Career, isPrimary: boolean, isAdd: boolean) => {
        if (isPrimary) {
            if (isAdd) {
                //Check if career is in Secondary, if so remove it.
                const secondCareer = secondaryCareers.find(c => c.id === career.id)
                if (secondCareer) setSecondaryCareers(prev => prev.filter(c => c.id !== secondCareer.id))
                setPrimaryCareers(prev => [...prev, career])
            } else {
                setPrimaryCareers(prev => prev.filter(c => c.id !== career.id))
            }
        } else {
            if (isAdd) {
                setSecondaryCareers(prev => [...prev, career])
            } else {
                setSecondaryCareers(prev => prev.filter(c => c.id !== career.id))
            }
        }
    }

    const handleNext = async (data: FieldValues) => {
        setLoadingStep(true)
        setError('')
        
        console.log("next: ", data)
        if (event) {
            if (activeStep === 0) {  //Student Number
                await agent.Student.byNumberAndEvent(event.id, data.studentNumber)
                    .then(response => {
                        if (response) {
                            console.log(response)
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
                if (!onPrimaryCareers && secondaryCareers.length !== 2) {
                    setLoadingStep(false)
                    return toast.error("Please select 2 secondary careers")
                }
                if (onPrimaryCareers) setOnPrimaryCareers(false)
                else setActiveStep(activeStep + 1)
            } else if (activeStep === 3) {  //Survey Submitted
                primaryCareers.forEach(c => appendPrimary(c))
                secondaryCareers.forEach(c => appendSecondary(c))
                // setError('This is a test error')
                const studentId = student?.id
                const dataWithStudent = {
                    ...data,
                    student,
                    studentId
                }
                console.log("next: ", dataWithStudent)

                await agent.Student.submitSurvey(dataWithStudent)
                    .catch(error => {
                        console.log(error)
                        setError(error)
                    })
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
                <Typography component="h1" variant="h4" align="center">
                    Student Survey
                </Typography>
                <Typography variant="body1" align="center">for</Typography>
                <Typography component="h1" variant="h4" align="center">
                    {event?.school.name}
                </Typography>
                <Stepper activeStep={activeStep} sx={{ pt: 3, pb: 5 }}>
                    {steps.map((label) => (
                        <Step key={label}>
                            <StepLabel>{label}</StepLabel>
                        </Step>
                    ))}
                </Stepper>
                <>
                    {activeStep === steps.length ? (
                        <Box display='flex' justifyContent='center'>
                            {error ? (
                                <Box>
                                    <Typography variant="h4" sx={{ mb: 2 }} gutterBottom>There was an issue submitting your survey</Typography>
                                    <Typography variant="h6" display='flex' justifyContent='center'
                                        color="error" gutterBottom>{error}</Typography>
                                </Box>
                            ) :
                                <Typography variant="h4" gutterBottom>Thank you for submitting your survey</Typography>
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
                </>
            </Paper>
        </FormProvider>
    )
}