import { Box, Grid, Paper, Switch, Tooltip, Typography, useMediaQuery, useTheme } from "@mui/material"
import { Career } from "../../../app/models/career"
import { useEffect, useMemo, useState } from "react"
import CareerList from "../../careers/CareerList"
import { Speaker } from "../../../app/models/speaker"
import ConfirmCareerSet from "../../careers/careerSets/ConfirmCareerSet"
import AppButton from "../../../app/components/AppButton"
import AppBackButton from "../../../app/components/AppBackButton"
import { blue } from "@mui/material/colors"
import { CareerEvent } from "../../../app/models/event"
import { EVENT_PHASES } from "../../../app/util/constants"
import { CareerSet } from "../../../app/models/careerSet"
import agent from "../../../app/api/agent"
import { useAppDispatch } from "../../../app/store/configureStore"
import { reloadCareerSets } from "../../careers/careerSlice"

interface Props {
    careerEvent: CareerEvent
    updateCareerEvent: (speakers?: Speaker[], careers?: Career[]) => void
    back: () => void
}

/**
 * Component to show and change careers choices for an event.
 */
export default function CareerEventCareers({ careerEvent, updateCareerEvent, back }: Props) {
    const dispatch = useAppDispatch()
    const [eventCareers, setEventCareers] = useState<Career[]>([])
    const [saveCareerSet, setSaveCareerSet] = useState(false)
    const [openSaveCareerSet, setOpenSaveCareerSet] = useState(false)
    const [careerSet, setCareerSet] = useState<CareerSet | undefined>()
    const [initialCareerSet, setInitialCareerSet] = useState<CareerSet | undefined>(undefined)
    const theme = useTheme()
    const darkMode = theme.palette.mode === 'dark'
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))

    const hasChanges = useMemo(() => {
        return JSON.stringify(careerSet) !== JSON.stringify(initialCareerSet)
    },[careerSet, initialCareerSet])

    useEffect(() => {
        setEventCareers(careerEvent.careers)
        setCareerSet({id: 0, name: 'EventCareerSet', careers: careerEvent.careers})
    }, [careerEvent.careers])

    const handleAddEventCareer = (career: Career) => {
        const newEventCareers = [...eventCareers, career]
        setEventCareers(newEventCareers)
        updateCareerSet(newEventCareers )
    }

    const handleRemoveEventCareer = (career: Career) => {
        const newEventCareers = eventCareers.filter(c => c.id !== career.id)
        setEventCareers(newEventCareers)
        updateCareerSet(newEventCareers)
    }

    const updateCareerSet = (careers: Career[]) => {
        if (careerSet && careers.length > 0) {
            setCareerSet({
                ...careerSet,
                careers: careers
            })
        } else {
            setCareerSet({id: 0, name: 'New Career Set', careers: []})
            setInitialCareerSet({id: 0, name: 'New Career Set', careers: []})
        }
    }

    const handleSelectCareer = (career: Career) => {
        if (eventCareers.some(c => c.id == career.id)) handleRemoveEventCareer(career)
        else handleAddEventCareer(career)
    }

    const handleSaveCareerSet = (event: React.ChangeEvent<HTMLInputElement>) => {
        setSaveCareerSet(event.target.checked)
    }

    async function handleUpdateCareerSet() {
        if (saveCareerSet && careerSet?.id === 0) {
            setOpenSaveCareerSet(true)
        } else if (saveCareerSet && hasChanges) {
            const careerIds = careerSet?.careers.map(c => c.id)
            await agent.CareerSet.update({id: careerSet?.id, name: careerSet?.name, careerIds: careerIds})
            dispatch(reloadCareerSets())
            updateCareerEvent(undefined, eventCareers)
            back()
        } else {
            updateCareerEvent(undefined, eventCareers)
            back()
        }
    }

    const handleSetCareerSet = (careerSet: CareerSet | undefined) => {
        setCareerSet(careerSet)
        setInitialCareerSet(careerSet)
        if (careerSet?.id === 0)
            setEventCareers(careerEvent.careers)
        else if (careerSet?.careers)
            setEventCareers(careerSet?.careers)
    }

    const handleCloseSaveCareerSet = () => {
        setOpenSaveCareerSet(false)
        updateCareerEvent(undefined, eventCareers)
        back()
    }

    const isSameCareerSet = () => {
        return careerEvent.careers.length === eventCareers.length
            && careerEvent.careers.every(c => eventCareers.some(ec => ec.id === c.id))
            && eventCareers.every(ec => careerEvent.careers.some(c => c.id === ec.id))
    }

    //Only in setup are you allowed to change careers.
    const allowUpdateCareers = () => {
        return careerEvent.eventPhase.phaseName === EVENT_PHASES.SETUP
    }

    return (
        <>
            <Grid container item xs={12} display='flex' justifyContent='center' position='relative' alignItems='center'>
                <AppBackButton onClick={back} />
                <Typography variant={isTablet ? isMobile ? "h5" : "h4" : "h3"} display='flex' justifyContent='center' align='center' maxWidth= '86%'>
                    {careerEvent.name}
                </Typography>
            </Grid>
            
            <Box display='flex' justifyContent='space-between' alignItems='center' sx={{ mt: 2 }}>
                <Box>
                    <Tooltip title={isSameCareerSet() ? !allowUpdateCareers() ? "Survey careers cannot be changed, please return to Setup phase"
                                : "List of careers is not different" 
                                : !allowUpdateCareers ? "Survey careers cannot be changed, please return to Setup phase" : ""} arrow>
                        <span>
                            <AppButton variant="contained" 
                                disabled={isSameCareerSet() === true || !allowUpdateCareers()}
                                onClick={handleUpdateCareerSet}>
                                Update Event Careers
                            </AppButton>
                        </span>
                    </Tooltip>
                </Box>
                <Paper sx={{py: isMobile ? 0.4 : 0.7, px: isMobile ? 0.7 : 1, bgcolor: darkMode ? blue[900] : 'primary.light'}}>
                    <Typography variant="body1" align="center">Selected Careers will be highlighted</Typography>
                </Paper>
            </Box>
            <Box display='flex' justifyContent='flex-end' sx={{ mr: -1, my: isMobile ? 1 : 0 }}>
                <Typography variant="body1" display='flex' alignItems='center'>{careerSet?.id === 0 ? 'Save' : 'Update'} Career Set</Typography>
                <Switch onChange={handleSaveCareerSet} size={isMobile ? "small" : "medium"} />
            </Box>

            <CareerList handleSelectCareer={handleSelectCareer} selectedCareers={eventCareers} handleSetCareerSet={handleSetCareerSet}
                hideDescription={true} hideDelete={true} hideEdit={true} selectedCareerSetId={careerSet?.id}
                blockUpdate={!allowUpdateCareers()} />

            <ConfirmCareerSet open={openSaveCareerSet} handleClose={handleCloseSaveCareerSet}
                    careerSet={careerSet} />
        </>
    )
}