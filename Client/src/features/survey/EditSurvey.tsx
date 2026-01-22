import { Button, Dialog, DialogActions, DialogContent, DialogTitle, Grid, IconButton, MenuItem, Select, Typography } from "@mui/material";
import { Survey } from "../../app/models/survey";
import { CareerEvent } from "../../app/models/event";
import { LoadingButton } from "@mui/lab";
import { memo, useEffect, useMemo, useState } from "react";
import { Career } from "../../app/models/career";
import agent from "../../app/api/agent";
import { useAppDispatch } from "../../app/store/configureStore";
import { reloadSurveyResults } from "./surveySlice";
import { SwapVert } from "@mui/icons-material";

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
    const [swapSelection, setSwapSelection] = useState<{section: 'primary' | 'alternate', index: number} | null>(null)
    const [showErrorMsg, setShowErrorMsg] = useState(false)
    const dispatch = useAppDispatch()

    const EMPTY_CAREER: Career = {
        id: 0,
        name: '',
        courseId: 0,
        category: ''
    }

    const hasEmptySelection = updatedPrimaries.some(c => c.id === 0) || updatedAlternates.some(c => c.id === 0)
    const findDuplicateIndex = (list: Career[], id: number) => list.findIndex(c => c.id === id)
    const errorMsg = "You can not have the same career selected twice"

    const careerOptions = useMemo(() => {
        return [
            <MenuItem key={0} value={0} disabled sx={{ display: 'none' }}>-</MenuItem>,
            ...event.careers.map(c => <MenuItem key={c.id} value={c.id}>{c.name}</MenuItem>)
        ]
    }, [event.careers])

    useEffect(() => {
        setUpdatedPrimaries(survey.primaryCareers || [])
        setUpdatedAlternates(survey.alternateCareers || [])
    }, [survey])


    const handlePrimaryChange = (index: number, id: number) => {
        setShowErrorMsg(false)

        setUpdatedPrimaries(prevState => {
            const primariesState = [...prevState]
            const isDuplicate = primariesState.some((c, i) => c.id === id && i !== index)

            if (isDuplicate) {
                setShowErrorMsg(true)
                return prevState
            }

            primariesState[index] = event.careers.find(c => c.id === id)!
            return primariesState
        })

        setUpdatedAlternates(prev => {
            const dupIndex = findDuplicateIndex(prev, id)
            if (dupIndex === -1) return prev

            const next = [...prev]
            next[dupIndex] = EMPTY_CAREER
            return next
        })
    }

    const handleAlternateChange = (index: number, id: number) => {
        setShowErrorMsg(false)

        setUpdatedAlternates(prev => {
            const alternatesState = [...prev]
            const duplicateInAlternates = alternatesState.some((c, i) => c.id === id && i !== index)

            if (duplicateInAlternates) {
                setShowErrorMsg(true)
                return prev
            }

            alternatesState[index] = event.careers.find(c => c.id === id)!
            return alternatesState
        })

        setUpdatedPrimaries(prev => {
            const dupIndex = findDuplicateIndex(prev, id)
            if (dupIndex === -1) return prev

            const next = [...prev]
            next[dupIndex] = EMPTY_CAREER
            return next
        })

    }

    const handleSwapClick = (section: 'primary' | 'alternate', index: number) => {
        if (!swapSelection) {
            setSwapSelection({ section, index })
        } else {
            const first = swapSelection

            // Clicked same swap button, cancel swap
            if (first.section === section && first.index === index) {
                setSwapSelection(null)
                return;
            }

            if (first.section === 'primary' && section === 'alternate') {
                const newPrimaries = [...updatedPrimaries]
                const newAlternates = [...updatedAlternates];
                [newPrimaries[first.index], newAlternates[index]] = [newAlternates[index], newPrimaries[first.index]]
                setUpdatedPrimaries(newPrimaries)
                setUpdatedAlternates(newAlternates)
            } else if (first.section === 'alternate' && section === 'primary') {
                const newPrimaries = [...updatedPrimaries]
                const newAlternates = [...updatedAlternates];
                [newPrimaries[index], newAlternates[first.index]] = [newAlternates[first.index], newPrimaries[index]]
                setUpdatedPrimaries(newPrimaries)
                setUpdatedAlternates(newAlternates)
            } 

            setSwapSelection(null)
        }
    }

    const shouldShowSwapButton = (section: 'primary' | 'alternate', index: number) => {
        if (!swapSelection) return true
        if (swapSelection.section === section && swapSelection.index === index) return true
        if (swapSelection.section !== section) return true
        return false
    }

    const handleDialogClose = () => {
        handleClose()
        setShowErrorMsg(false)
        setSwapSelection(null)
        setUpdatedPrimaries([...survey.primaryCareers])
        setUpdatedAlternates([...survey.alternateCareers])
    }
    
    const updateSurvey = async () => {
        setLoading(true)
        setSwapSelection(null)

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

    const PrimaryRow = memo(({ pc, index }: { pc: Career; index: number }) => (
        <Grid container item key={pc.id} xs={12} sx={{ mb: 1 }}>
            <Grid container item xs={6} sx={{ display: 'flex', justifyContent: 'flex-start', alignItems: 'center' }}>
                <Typography variant="body2" sx={{ pl: 6 }}>{index + 1}. {pc.name}</Typography>
            </Grid>
            <Grid container item xs={6} sx={{ display: 'flex', justifyContent: 'flex-start' }}>
                <Grid item sx={{ width: 25 }}>
                    {shouldShowSwapButton('primary', index) && (
                        <IconButton size="small" onClick={() => handleSwapClick('primary', index)}
                            color={(swapSelection?.section === 'primary' && swapSelection.index === index) ? 'secondary' : 'primary'}>
                            <SwapVert />
                        </IconButton>
                    )}
                </Grid>
                <Grid item sx={{ flex: 1, ml: 1 }}>
                    <Select value={updatedPrimaries[index].id} size="small" onChange={(e) => handlePrimaryChange(index, e.target.value as number)}>
                        {careerOptions}
                    </Select>
                </Grid>
            </Grid>
        </Grid>
    ))

    const AlternateRow = memo(({ ac, index }: { ac: Career; index: number }) => (
        <Grid container item key={ac.id} xs={12} sx={{ mb: 1 }}>
            <Grid container item xs={6} sx={{ display: 'flex', justifyContent: 'flex-start', alignItems: 'center' }}>
                <Typography variant="body2" sx={{ pl: 6 }}>{index + 1}. {ac.name}</Typography>
            </Grid>
            <Grid container item xs={6} sx={{ display: 'flex', justifyContent: 'flex-start' }}>
                <Grid item sx={{ width: 25 }}>
                    {shouldShowSwapButton('alternate', index) && (
                        <IconButton size="small" onClick={() => handleSwapClick('alternate', index)}
                            color={(swapSelection?.section === 'alternate' && swapSelection.index === index) ? 'secondary' : 'primary'}>
                            <SwapVert />
                        </IconButton>
                    )}
                </Grid>
                <Grid item sx={{ flex: 1, ml: 1 }}>
                    <Select value={updatedAlternates[index].id} size="small" onChange={(e) => handleAlternateChange(index, e.target.value as number)}>
                        {careerOptions}
                    </Select>
                </Grid>
            </Grid>
        </Grid>
    ))

    return (
        <Dialog open={open} onClose={handleDialogClose} maxWidth='md' fullWidth={true}>
            <DialogTitle>Edit Survey for {survey.student.lastFirstName} at {event.name}</DialogTitle>

            <DialogContent>
                <Typography variant="body1" sx={{ pl: 4 }}>Primary Choices</Typography>
                {survey.primaryCareers.map((pc, index) => <PrimaryRow key={pc.id} pc={pc} index={index} />)}
                
                <Typography variant="body1" sx={{ mt: 1, pl: 4 }}>Alternate Choices</Typography>
                {survey.alternateCareers.map((ac, index) => <AlternateRow key={ac.id} ac={ac} index={index} />)}

                {showErrorMsg &&
                    <Typography variant="body1" color="error.main" sx={{ display: 'flex', justifyContent: 'center', pt: 2 }}>
                        <strong>{errorMsg}</strong>
                    </Typography>
                }
            </DialogContent>

            <DialogActions>
                <LoadingButton disabled={hasEmptySelection} loading={loading} onClick={updateSurvey}>Save</LoadingButton>
                <Button onClick={handleDialogClose}>Cancel</Button>
            </DialogActions>
        </Dialog>
    )
}