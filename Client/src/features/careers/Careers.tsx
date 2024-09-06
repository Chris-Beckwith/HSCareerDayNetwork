import { Box, Button, Grid, Typography } from "@mui/material";
import LoadingComponent from "../../app/components/LoadingComponent";
import CareerList from "./CareerList";
import useCareers from "../../app/hooks/useCareers";
import { useState } from "react";
import { Career } from "../../app/models/career";
import CareerForm from "./CareerForm";
import ConfirmCareerSet from "./careerSets/ConfirmCareerSet";

export default function Careers() {
    const { status } = useCareers()
    const [editMode, setEditMode] = useState(false)
    const [careerSet, setCareerSet] = useState<Career[]>([])
    const [newCareerSetMode, setNewCareerSetMode] = useState(false)
    const [openSaveCareerSet, setOpenSaveCareerSet] = useState(false)
    const [selectedCareer, setSelectedCareer] = useState<Career | undefined>(undefined)

    if (status.includes('pending')) return <LoadingComponent message="Loading Careers.." />


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
                <Typography variant="h3">Careers</Typography>
                {newCareerSetMode ?
                    <Grid item>
                        <Button variant="contained" color="inherit" onClick={() => setNewCareerSetMode(false)}>Cancel</Button>
                        <Button variant="contained" sx={{ ml: 2 }} onClick={() => setOpenSaveCareerSet(true)}>Save Career Set</Button>
                    </Grid>
                    :
                    <Grid item>
                        <Button variant="contained" onClick={() => setEditMode(true)}>New Career</Button>
                        <Button variant="contained" sx={{ ml: 2 }}
                            onClick={handleCreateCareerSet}>Create Career Set</Button>
                    </Grid>
                }
            </Box>
            <CareerList handleSelectCareer={handleSelectCareer} eventCareers={newCareerSetMode ? careerSet : undefined}
                hideDelete={newCareerSetMode} hideDescription={newCareerSetMode} handleSetEventCareers={setCareerSet} />

            <ConfirmCareerSet open={openSaveCareerSet} handleClose={handleClose}
                careerSet={careerSet} />
        </>

    )
}