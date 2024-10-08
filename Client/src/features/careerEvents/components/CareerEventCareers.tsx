import { Box, Button, Paper, Switch, Tooltip, Typography } from "@mui/material"
import { Career } from "../../../app/models/career"
import { useEffect, useState } from "react"
import CareerList from "../../careers/CareerList"
import { Speaker } from "../../../app/models/speaker"
import ConfirmCareerSet from "../../careers/careerSets/ConfirmCareerSet"

interface Props {
    careerEventName: string
    careerEventCareers: Career[]
    allowUpdate: boolean
    updateCareerEvent: (speakers?: Speaker[], careers?: Career[]) => void
    back: () => void
}

export default function CareerEventCareers({ careerEventName, careerEventCareers, allowUpdate, updateCareerEvent, back }: Props) {
    const [eventCareers, setEventCareers] = useState<Career[]>([])
    const [saveCareerSet, setSaveCareerSet] = useState(false)
    const [openSaveCareerSet, setOpenSaveCareerSet] = useState(false)

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

    const handleSaveCareerSet = (event: React.ChangeEvent<HTMLInputElement>) => {
        setSaveCareerSet(event.target.checked)
    }

    const handleUpdateCareerSet = () => {
        if (saveCareerSet) {
            setOpenSaveCareerSet(true)
        } else {
            updateCareerEvent(undefined, eventCareers)
        }
    }

    const handleCloseSaveCareerSet = () => {
        setOpenSaveCareerSet(false)
        updateCareerEvent(undefined, eventCareers)
    }

    const isSameCareerSet = () => {
        return careerEventCareers.length === eventCareers.length
            && careerEventCareers.every(c => eventCareers.some(ec => ec.id === c.id))
            && eventCareers.every(ec => careerEventCareers.some(c => c.id === ec.id))
    }

    return (
        <>
            <Typography variant="h3" display='flex' justifyContent='center'>{careerEventName}</Typography>
            
            <Box display='flex' justifyContent='space-between' alignItems='center' sx={{ mt: 2 }}>
                <Box>
                    <Button variant="contained" color="inherit" onClick={back} sx={{mr: 2}}>Back</Button>
                    <Tooltip title={isSameCareerSet() ? !allowUpdate ? "Survey already open, please do not change careers"
                                : "List of careers is not different" 
                                : !allowUpdate ? "Survey already open, please do not change careers" : ""} arrow>
                        <span>
                            <Button variant="contained" disabled={isSameCareerSet() === true || !allowUpdate}
                                onClick={handleUpdateCareerSet}>
                                Update Careers
                            </Button>
                        </span>
                    </Tooltip>
                </Box>
                <Paper sx={{p: 0.7, bgcolor: 'primary.light'}}>
                    <Typography variant="body1">Selected Careers will be highlighted</Typography>
                </Paper>
            </Box>
            <Box display='flex' justifyContent='flex-end' sx={{ mt: 0.5, mr: -1 }}>
                <Typography variant="body1" display='flex' alignItems='center'>Save Career Set</Typography>
                <Switch onChange={handleSaveCareerSet} />
            </Box>

            <CareerList handleSelectCareer={handleSelectCareer} eventCareers={eventCareers} handleSetEventCareers={setEventCareers}
                hideDescription={true} hideDelete={true} />

            <ConfirmCareerSet open={openSaveCareerSet} handleClose={handleCloseSaveCareerSet}
                    careerSet={eventCareers} />
        </>
    )
}