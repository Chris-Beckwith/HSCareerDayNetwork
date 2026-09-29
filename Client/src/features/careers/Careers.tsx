import { Box, Grid, Typography, useMediaQuery, useTheme } from "@mui/material";
import LoadingComponent from "../../app/components/LoadingComponent";
import CareerList from "./CareerList";
import useCareers from "../../app/hooks/useCareers";
import { useMemo, useState } from "react";
import { Career } from "../../app/models/career";
import CareerForm from "./CareerForm";
import ConfirmCareerSet from "./careerSets/ConfirmCareerSet";
import { CareerSet } from "../../app/models/careerSet";
import agent from "../../app/api/agent";
import AppButton from "../../app/components/AppButton";
import AppLoadingButton from "../../app/components/AppLoadingButton";
import { useAppDispatch } from "../../app/store/configureStore";
import { reloadCareerSets } from "./careerSlice";

/**
 * Display list of careers.
 */
export default function Careers() {
    const { status } = useCareers()
    const dispatch = useAppDispatch()
    const [editMode, setEditMode] = useState(false)
    const [loading, setLoading] = useState(false)
    const [careerSet, setCareerSet] = useState<CareerSet | undefined>(undefined)
    const [initialCareerSet, setInitialCareerSet] = useState<CareerSet | undefined>(undefined)
    const [newCareerSetMode, setNewCareerSetMode] = useState(false)
    const [openSaveCareerSet, setOpenSaveCareerSet] = useState(false)
    const [selectedCareer, setSelectedCareer] = useState<Career | undefined>(undefined)
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const newCareerSet = { id: 0, name: 'New Career Set', careers: []}
    
    const hasChanges = useMemo(() => {
        return JSON.stringify(careerSet) !== JSON.stringify(initialCareerSet)
    },[careerSet, initialCareerSet])

    const handleAddCareer = (career: Career) => {
        if (!careerSet) return

        setCareerSet(({
            ...careerSet,
            careers: [...careerSet.careers, career]
        }))
    }

    const handleRemoveCareer = (career: Career) => {
        if (!careerSet) return

        const newCareers = careerSet.careers.filter(c => c.id !== career.id)
        if (newCareers.length === 0 ) {
            setCareerSet(newCareerSet)
            setInitialCareerSet(newCareerSet)
        } else {
            setCareerSet({
                ...careerSet,
                careers: newCareers
            })
        }
    }

    const handleCreateCareerSet = () => {
        setNewCareerSetMode(true)
        setCareerSet(newCareerSet)
        setInitialCareerSet(newCareerSet)
    }

    const handleSelectCareerSet = (careerSet: CareerSet | undefined) => {
        setCareerSet(careerSet)
        setInitialCareerSet(careerSet)
    }

    function handleSelectCareer(career: Career) {
        if (!newCareerSetMode) {
            setSelectedCareer(career)
            setEditMode(true)
        } else {
            if (careerSet?.careers.some(c => c.id == career.id)) handleRemoveCareer(career)
            else handleAddCareer(career)
        }
    }

    async function updateCareerSet() {
        setLoading(true)
        const careerIds = careerSet?.careers.map(c => c.id)
        await agent.CareerSet.update({id: careerSet?.id, name: careerSet?.name, careerIds: careerIds})
        dispatch(reloadCareerSets())
        setLoading(false)
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
                        <AppButton variant="contained" color="inherit" sx={{ ml: 2 }} onClick={() => setNewCareerSetMode(false)}
                            size={isMobile ? "small" : "medium"}
                        >
                            Cancel
                        </AppButton>
                        <AppLoadingButton loading={loading} variant="contained" sx={{ ml: 2 }} onClick={() => {
                            if (careerSet?.id === 0) {
                                setOpenSaveCareerSet(true)
                            } else {
                                updateCareerSet()
                            }
                        }}
                            size={isMobile ? "small" : "medium"} disabled={!hasChanges}
                        >
                            {careerSet?.id === 0 ? 'Save' : 'Update'} Career Set
                        </AppLoadingButton>
                    </Grid>
                    :
                    <Grid item>
                        <AppButton variant="contained" sx={{ ml: 2 }} onClick={() => setEditMode(true)} size={isMobile ? "small" : "medium"}>
                            New Career
                        </AppButton>
                        <AppButton variant="contained" sx={{ ml: 2 }} onClick={handleCreateCareerSet} size={isMobile ? "small" : "medium"}>
                            Career Sets
                        </AppButton>
                    </Grid>
                }
            </Box>

            {status.includes('pending') ? <LoadingComponent message="Loading Careers..." />
                : <CareerList handleSelectCareer={handleSelectCareer} selectedCareers={newCareerSetMode ? (careerSet ? careerSet?.careers : []) : undefined}
                    handleSetCareerSet={handleSelectCareerSet} selectedCareerSetId={careerSet?.id}
                    hideDelete={newCareerSetMode} hideDescription={newCareerSetMode} hideEdit={newCareerSetMode} />
            }

            <ConfirmCareerSet open={openSaveCareerSet} careerSet={careerSet} handleClose={() => {
                    setOpenSaveCareerSet(false)
                    setNewCareerSetMode(false)
                }}
            />
        </>

    )
}