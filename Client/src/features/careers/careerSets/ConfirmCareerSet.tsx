import { Dialog, DialogTitle, DialogContent, DialogContentText, TextField, DialogActions, Button } from "@mui/material";
import agent from "../../../app/api/agent";
import { reloadCareerSets } from "../careerSlice";
import { useAppDispatch } from "../../../app/store/configureStore";
import { LoadingButton } from "@mui/lab";
import { useEffect, useRef, useState } from "react";
import useCareers from "../../../app/hooks/useCareers";
import { CareerSet } from "../../../app/models/careerSet";

interface Props {
    open: boolean
    handleClose: () => void
    careerSet: CareerSet | undefined
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
    const inputRef = useRef<HTMLInputElement>(null)

    useEffect(() => {
        if (open) {
            setName("")
            setError(false)
            setTimeout(() => inputRef.current?.focus(), 0)
        }
    }, [open])

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
                    try {
                        if (careerSet?.id !== 0) {
                            const careerIds = careerSet?.careers.map(c => c.id)
                            await agent.CareerSet.update({id: careerSet?.id, name: careerSet?.name, careerIds: careerIds})
                        } else {
                            await agent.CareerSet.create({name: name, careers: careerSet.careers})
                        }
                    } catch (error) {
                        console.log(error)
                    } finally {
                        dispatch(reloadCareerSets())
                        setLoading(false)
                        handleClose()
                    }
                },
            }}
        >
            <DialogTitle>{careerSet?.id !== 0 ? 'Update' : 'Save'} Career Set</DialogTitle>
            {careerSet?.id === 0 &&
                <DialogContent>
                    <DialogContentText>
                        Please Enter a Name for the Career Set
                    </DialogContentText>
                    <TextField
                        autoFocus
                        inputRef={inputRef}
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
            }
            <DialogActions>
                <Button onClick={handleClose}>Cancel</Button>
                <LoadingButton loading={loading} type="submit">{careerSet?.id ? 'Update' : 'Save'} Career Set</LoadingButton>
            </DialogActions>
        </Dialog>
    )
}