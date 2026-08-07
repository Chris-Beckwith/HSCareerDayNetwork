import { Dialog, DialogTitle, DialogContent, DialogContentText, TextField, DialogActions, Button } from "@mui/material";
import { Career } from "../../../app/models/career";
import agent from "../../../app/api/agent";
import { reloadCareerSets } from "../careerSlice";
import { useAppDispatch } from "../../../app/store/configureStore";
import { LoadingButton } from "@mui/lab";
import { useState } from "react";
import useCareers from "../../../app/hooks/useCareers";

interface Props {
    open: boolean
    careerSet: Career[]
    handleClose: () => void
}

/**
 * Confirmation dialog for saving a career set.
 */
export default function ConfirmCareerSet({ open, handleClose, careerSet }: Props) {
    const dispatch = useAppDispatch()
    const { careerSets } = useCareers()
    const [name, setName] = useState('')
    const [error, setError] = useState(false)
    const [loading, setLoading] = useState(false)

    const handleChange = (value: string) => {
        setName(value)

        if (careerSets.some(cs => cs.name === value))
            setError(true)
        else
            setError(false)
    }

    return (
        <Dialog
            open={open}
            onClose={handleClose}
            PaperProps={{
                component: 'form',
                onSubmit: async (event: React.FormEvent<HTMLFormElement>) => {
                    setLoading(true)
                    event.preventDefault()
                    const formData = new FormData(event.currentTarget)
                    const formJson = Object.fromEntries((formData as any).entries())
                    const name = formJson.name
                    await agent.CareerSet.create({name: name, careers: careerSet})
                    dispatch(reloadCareerSets())
                    setLoading(false)
                    handleClose()
                },
            }}
        >
            <DialogTitle>Save Career Set</DialogTitle>
            <DialogContent>
                <DialogContentText>
                    Please Enter a Name for the Career Set
                </DialogContentText>
                <TextField
                    autoFocus
                    required
                    margin="dense"
                    id="name"
                    name="name"
                    label="Name"
                    fullWidth
                    variant="standard"
                    value={name}
                    onChange={(e) => handleChange(e.target.value)}
                    error={error}
                    helperText={error ? "Career Set name must be unique" : ""}
                />
            </DialogContent>
            <DialogActions>
                <Button onClick={handleClose}>Cancel</Button>
                <LoadingButton loading={loading} type="submit">Save Career Set</LoadingButton>
            </DialogActions>
        </Dialog>
    )
}