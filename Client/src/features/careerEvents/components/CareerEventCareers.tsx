import { Box, Paper, Switch, Tooltip, Typography, useMediaQuery, useTheme } from "@mui/material"
import { Career } from "../../../app/models/career"
import { useEffect, useState } from "react"
import CareerList from "../../careers/CareerList"
import { Speaker } from "../../../app/models/speaker"
import ConfirmCareerSet from "../../careers/careerSets/ConfirmCareerSet"
import AppButton from "../../../app/components/AppButton"

interface Props {
    careerEventName: string
    careerEventCareers: Career[]
    allowUpdate: boolean
    updateCareerEvent: (speakers?: Speaker[], careers?: Career[]) => void
    back: () => void
}

/**
 * Component to show and change careers choices for an event.
 */
export default function CareerEventCareers({ careerEventName, careerEventCareers, allowUpdate, updateCareerEvent, back }: Props) {
    const [eventCareers, setEventCareers] = useState<Career[]>([])
    const [saveCareerSet, setSaveCareerSet] = useState(false)
    const [openSaveCareerSet, setOpenSaveCareerSet] = useState(false)
    const isMobile = useMediaQuery(useTheme().breakpoints.down('sm'))

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
            back()
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
            <Typography variant={isMobile ? "h4" : "h3"} display='flex' justifyContent='center'>{careerEventName}</Typography>
            
            <Box display='flex' justifyContent='space-between' alignItems='center' sx={{ mt: 2 }}>
                <Box>
                    <AppButton variant="contained" color="inherit" onClick={back} sx={{mr: 2}}>Back</AppButton>
                    <Tooltip title={isSameCareerSet() ? !allowUpdate ? "Survey already open, please do not change careers"
                                : "List of careers is not different" 
                                : !allowUpdate ? "Survey already open, please do not change careers" : ""} arrow>
                        <span>
                            <AppButton variant="contained" 
                                disabled={isSameCareerSet() === true || !allowUpdate}
                                onClick={handleUpdateCareerSet}>
                                Update Careers
                            </AppButton>
                        </span>
                    </Tooltip>
                </Box>
                <Paper sx={{p: isMobile ? 0.4 : 0.7, bgcolor: 'primary.light'}}>
                    <Typography variant="body1" align="center" >Selected Careers will be highlighted</Typography>
                </Paper>
            </Box>
            <Box display='flex' justifyContent='flex-end' sx={{ mr: -1, my: isMobile ? 1 : 0 }}>
                <Typography variant="body1" display='flex' alignItems='center'>Save Career Set</Typography>
                <Switch onChange={handleSaveCareerSet} size={isMobile ? "small" : "medium"} />
            </Box>

            <CareerList handleSelectCareer={handleSelectCareer} eventCareers={eventCareers} handleSetEventCareers={setEventCareers}
                hideDescription={true} hideDelete={true} />

            <ConfirmCareerSet open={openSaveCareerSet} handleClose={handleCloseSaveCareerSet}
                    careerSet={eventCareers} />
        </>
    )
}