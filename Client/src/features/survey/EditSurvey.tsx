import { Button, Dialog, DialogActions, DialogContent, DialogTitle, Grid, MenuItem, Select, Typography } from "@mui/material";
import { Survey } from "../../app/models/survey";
import { CareerEvent } from "../../app/models/event";
import { LoadingButton } from "@mui/lab";
import { useState } from "react";
import { Career } from "../../app/models/career";
import agent from "../../app/api/agent";
import { useAppDispatch } from "../../app/store/configureStore";
import { reloadSurveyResults } from "./surveySlice";

interface Props {
    open: boolean
    handleClose: () => void
    survey: Survey
    event: CareerEvent
}

export default function EditSurvey({open, handleClose, survey, event}: Props) {
    const [loading, setLoading] = useState(false)
    const [updatedPrimaries, setUpdatedPrimaries] = useState<Career[]>(survey.primaryCareers || [])
    const [updatedAlternates, setUpdatedAlternates] = useState<Career[]>(survey.alternateCareers || [])
    const [showErrorMsg, setShowErrorMsg] = useState(false)
    const dispatch = useAppDispatch()

    const errorMsg = "You can not have the same career selected twice"

    const handlePrimaryChange = (index: number, id: number) => {
        setShowErrorMsg(false)
        if (isDuplicateCareer(id)) {
            setShowErrorMsg(true)
            return;
        }

        setUpdatedPrimaries(prevState => {
            const primariesState = [...prevState]
            primariesState[index] = event.careers.find(c => c.id === id)!
            return primariesState
        })
    }

    const handleAlternateChange = (index: number, id: number) => {
        setShowErrorMsg(false)
        if (isDuplicateCareer(id)) {
            setShowErrorMsg(true)
            return;
        }

        setUpdatedAlternates(prevState => {
            const alternatesState = [...prevState]
            alternatesState[index] = event.careers.find(c => c.id === id)!
            return alternatesState
        })
    }

    const isDuplicateCareer = (id: number) => {
        return updatedPrimaries.find(c => c.id === id) !== undefined || updatedAlternates.find(c => c.id === id) !== undefined
    }

    const handleDialogClose = () => {
        handleClose()
        setUpdatedPrimaries([...survey.primaryCareers])
        setUpdatedAlternates([...survey.alternateCareers])
    }

    
    const updateSurvey = async () => {
        setLoading(true)

        const data = {
            id: survey.id,
            primaryCareers: updatedPrimaries,
            alternateCareers: updatedAlternates
        }

        agent.Survey.update(data)
            .then(() => dispatch(reloadSurveyResults()))
            .catch(error => console.log(error))
            .finally(() => {
                setLoading(false)
                handleClose()
            })
    }

    return (
        <Dialog open={open} onClose={handleDialogClose} maxWidth='md' fullWidth={true}>
            <DialogTitle>Edit Survey for {survey.student.lastFirstName} at {event.name}</DialogTitle>

            <DialogContent>
                <Typography variant="body1" sx={{ pl: 4 }}>Primary Choices</Typography>
                {survey.primaryCareers.map((pc, index) => (
                    <Grid container item key={index} xs={12} sx={{ mb: 1 }}>
                        <Grid container item xs={6} sx={{ display: 'flex', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Typography variant="body2" sx={{ pl: 6 }}>{index + 1}. {pc.name}</Typography>
                        </Grid>
                        <Grid container item xs={6} sx={{ display: 'flex', justifyContent: 'flex-start' }}>
                            <Select value={updatedPrimaries[index].id} size="small"
                                onChange={(e) => handlePrimaryChange(index, e.target.value as number)}
                            >
                                {event.careers.map((c, cIndex) => (
                                    <MenuItem key={cIndex} value={c.id}>{c.name}</MenuItem>
                                ))}
                            </Select>
                        </Grid>
                    </Grid>
                ))}
                <Typography variant="body1" sx={{ mt: 1, pl: 4 }}>Alternate Choices</Typography>
                {survey.alternateCareers.map((ac, index) => (
                    <Grid container item key={index} xs={12} sx={{ mb: 1 }}>
                        <Grid container item xs={6} sx={{ display: 'flex', justifyContent: 'flex-start', alignItems: 'center' }}>
                            <Typography variant="body2" sx={{ pl: 6 }}>{index + 1}. {ac.name}</Typography>
                        </Grid>
                        <Grid container item xs={6} sx={{ display: 'flex', justifyContent: 'flex-start' }}>
                            <Select value={updatedAlternates[index].id} size="small"
                                onChange={(e) => handleAlternateChange(index, e.target.value as number)}
                            >
                                {event.careers.map((c, index) => (
                                    <MenuItem key={index} value={c.id}>{c.name}</MenuItem>
                                ))}
                            </Select>
                        </Grid>
                    </Grid>
                ))}

                {showErrorMsg &&
                    <Typography variant="body1" color="error.main" sx={{ display: 'flex', justifyContent: 'center', pt: 2 }}>
                        <strong>{errorMsg}</strong>
                    </Typography>
                }
            </DialogContent>

            <DialogActions>
                <LoadingButton loading={loading} onClick={updateSurvey}>Save</LoadingButton>
                <Button onClick={handleDialogClose}>Cancel</Button>
            </DialogActions>
        </Dialog>
    )
}