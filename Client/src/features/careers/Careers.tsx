import { Box, Button, Grid, Typography, useMediaQuery, useTheme } from "@mui/material";
import LoadingComponent from "../../app/components/LoadingComponent";
import CareerList from "./CareerList";
import useCareers from "../../app/hooks/useCareers";
import { useState } from "react";
import { Career } from "../../app/models/career";
import CareerForm from "./CareerForm";
import ConfirmCareerSet from "./careerSets/ConfirmCareerSet";

/**
 * Display list of careers.
 */
export default function Careers() {
    const { status } = useCareers()
    const [editMode, setEditMode] = useState(false)
    const [careerSet, setCareerSet] = useState<Career[]>([])
    const [newCareerSetMode, setNewCareerSetMode] = useState(false)
    const [openSaveCareerSet, setOpenSaveCareerSet] = useState(false)
    const [selectedCareer, setSelectedCareer] = useState<Career | undefined>(undefined)
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))

    const handleAddCareer = (career: Career) => {
        const newCareerSet = [...careerSet, career]
        setCareerSet(newCareerSet)
    }

    const handleRemoveCareer = (career: Career) => {
        const newEventCareers = careerSet.filter(c => c.id !== career.id)
        setCareerSet(newEventCareers)
    }

    const handleClose = () => {
        setOpenSaveCareerSet(false)
        setNewCareerSetMode(false)
    }

    const handleCreateCareerSet = () => {
        setNewCareerSetMode(true)
        setCareerSet([])
    }

    function handleSelectCareer(career: Career) {
        if (!newCareerSetMode) {
            setSelectedCareer(career)
            setEditMode(true)
        } else {
            if (careerSet.some(c => c.id == career.id)) handleRemoveCareer(career)
            else handleAddCareer(career)
        }
    }

    function cancelEdit() {
        if (selectedCareer) setSelectedCareer(undefined)
        setEditMode(false)
    }

    if (editMode) return <CareerForm selectedCareer={selectedCareer} cancelEdit={cancelEdit} />

    return (
        <>
            <Box display='flex' justifyContent='space-between' alignItems='center' sx={{mb: 2}}>
                <Typography variant={isMobile ? "h4" : "h3"}>Careers</Typography>
                {newCareerSetMode ?
                    <Grid item>
                        <Button variant="contained" color="inherit" sx={{ ml: 2 }} onClick={() => setNewCareerSetMode(false)}
                            size={isMobile ? "small" : "medium"}
                        >
                            Cancel
                        </Button>
                        <Button variant="contained" sx={{ ml: 2 }} onClick={() => setOpenSaveCareerSet(true)}
                            size={isMobile ? "small" : "medium"}
                        >
                            Save Career Set
                        </Button>
                    </Grid>
                    :
                    <Grid item>
                        <Button variant="contained" sx={{ ml: 2 }} onClick={() => setEditMode(true)} size={isMobile ? "small" : "medium"}>
                            New Career
                        </Button>
                        <Button variant="contained" sx={{ ml: 2 }} onClick={handleCreateCareerSet} size={isMobile ? "small" : "medium"}>
                            Create Career Set
                        </Button>
                    </Grid>
                }
            </Box>

            {status.includes('pending') ? 
                <LoadingComponent message="Loading Careers..." /> :
                <CareerList handleSelectCareer={handleSelectCareer} eventCareers={newCareerSetMode ? careerSet : undefined}
                    hideDelete={newCareerSetMode} hideDescription={newCareerSetMode} handleSetEventCareers={setCareerSet} />
            }

            <ConfirmCareerSet open={openSaveCareerSet} handleClose={handleClose}
                careerSet={careerSet} />
        </>

    )
}