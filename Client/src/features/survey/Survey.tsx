import { Box, Button, Paper, Step, StepLabel, Stepper, Typography } from "@mui/material";
import { useState } from "react";
import InfoVerification from "./InfoVerification";
import CareerSelection from "./CareerSelection";
import ReviewAndSubmit from "./ReviewAndSubmit";
import { FieldValues, FormProvider, useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";
import { validationSchema } from "./surveyValidation";
import EnterStudentId from "./EnterStudentId";

const steps = ['Enter Student ID', 'Verify Information', 'Select Career Choices', 'Review and Submit']

function getStepContent(step: number) {
    switch (step) {
        case 0:
            return <EnterStudentId />
        case 1:
            return <InfoVerification />
        case 2:
            return <CareerSelection />
        case 3:
            return <ReviewAndSubmit />
        default:
            throw new Error('Unknown step')
    }
}

export default function CheckoutPage() {
    const [activeStep, setActiveStep] = useState(0)
    
    const currentValidationSchema = validationSchema[activeStep]

    const methods = useForm({
        mode: 'onTouched',
        resolver: yupResolver(currentValidationSchema)
    })

    const handleNext = (data: FieldValues) => {
        if (activeStep === steps.length - 1) {
            console.log(data)
        }
        setActiveStep(activeStep + 1)
    }

    const handleBack = () => {
        setActiveStep(activeStep - 1)
    }

    return (
        <FormProvider {...methods}>
            <Paper variant="outlined" sx={{ my: { xs: 3, md: 6 }, p: { xs: 2, md: 3 } }}>
                <Typography component="h1" variant="h4" align="center">
                    Student Survey
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
                        <>
                            <Typography variant="h5" gutterBottom>
                                Thank you for submitting your survey.
                            </Typography>
                        </>
                    ) : (
                        <form onSubmit={methods.handleSubmit(handleNext)}>
                            {getStepContent(activeStep)}
                            <Box sx={{ display: 'flex', justifyContent: 'flex-end' }}>
                                {activeStep !== 0 && (
                                    <Button onClick={handleBack} sx={{ mt: 3, ml: 1 }}>
                                        Back
                                    </Button>
                                )}
                                <Button
                                    disabled={!methods.formState.isValid}
                                    variant="contained"
                                    type='submit'
                                    sx={{ mt: 3, ml: 1 }}
                                >
                                    {activeStep === steps.length - 1 ? 'Submit Survey' : 'Next'}
                                </Button>
                            </Box>
                        </form>
                    )}
                </>
            </Paper>
        </FormProvider>
    )
}