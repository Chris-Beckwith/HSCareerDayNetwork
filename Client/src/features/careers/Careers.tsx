import { Box, Button, Typography } from "@mui/material";
import LoadingComponent from "../../app/components/LoadingComponent";
import CareerList from "./CareerList";
import useCareers from "../../app/hooks/useCareers";
import { useState } from "react";
import { Career } from "../../app/models/career";
import CareerForm from "./CareerForm";

export default function Careers() {
    const {careers, categories, status} = useCareers()
    const [editMode, setEditMode] = useState(false)
    const [selectedCareer, setSelectedCareer] = useState<Career | undefined>(undefined)

    if (status.includes('pending')) return <LoadingComponent message="Loading Careers.." />

    function handleSelectCareer(career: Career) {
        setSelectedCareer(career)
        setEditMode(true)
    }

    function cancelEdit() {
        if (selectedCareer) setSelectedCareer(undefined)
        setEditMode(false)
    }

    if (editMode) return <CareerForm selectedCareer={selectedCareer} categories={categories} cancelEdit={cancelEdit} />

    return (
        <>
            <Box display='flex' justifyContent='space-between' alignItems='center' sx={{mb: 2}}>
                <Typography variant="h3">Careers</Typography>
                <Button variant="contained" onClick={() => setEditMode(true)}>New Career</Button>
            </Box>
            <CareerList careers={careers} categories={categories} handleSelectCareer={handleSelectCareer} />
        </>

    )
}