import { Box, Button, Paper, Typography } from "@mui/material"
import { Career } from "../../../app/models/career"
import { useEffect, useState } from "react"
import CareerList from "../../careers/CareerList"
import { Speaker } from "../../../app/models/speaker"

interface Props {
    careerEventName: string
    careerEventCareers: Career[]
    updateCareerEvent: (speakers?: Speaker[], careers?: Career[]) => void
    back: () => void
}

export default function CareerEventCareers({ careerEventName, careerEventCareers, updateCareerEvent, back }: Props) {
    const [eventCareers, setEventCareers] = useState<Career[]>([])

    useEffect(() => {
        setEventCareers(careerEventCareers)
    }, [careerEventCareers])

    const handleAddEventCareer = (career: Career) => {
        const newEventCareers = [...eventCareers, career]
        setEventCareers(newEventCareers)
    }

    const handleRemoveEventCareer = (career: Career) => {
        const newEventCareers = eventCareers.filter(c => c.id !== career.id)
        setEventCareers(newEventCareers)
    }

    const handleSelectCareer = (career: Career) => {
        if (eventCareers.some(c => c.id == career.id)) handleRemoveEventCareer(career)
        else handleAddEventCareer(career)
    }

    return (
        <>
            <Typography variant="h3" display='flex' justifyContent='center'>{careerEventName}</Typography>
            
            <Box display='flex' justifyContent='space-between' alignItems='center' sx={{ my: 2 }}>
                <Paper sx={{p: 0.7, bgcolor: 'primary.light'}}>
                    <Typography variant="body1">Selected Careers will be highlighted</Typography>
                </Paper>
                <Box>
                    <Button variant="contained" color="inherit" onClick={back} sx={{mr: 2}}>Back</Button>
                    <Button variant="contained" onClick={() => updateCareerEvent(undefined, eventCareers)}>Update Careers</Button>
                </Box>
            </Box>

            <CareerList handleSelectCareer={handleSelectCareer} eventCareers={eventCareers} 
                hideDescription={true} hideDelete={true} />
        </>
    )
}