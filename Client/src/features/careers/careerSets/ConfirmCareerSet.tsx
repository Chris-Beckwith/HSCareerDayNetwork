import { Dialog, DialogTitle, DialogContent, DialogContentText, TextField, DialogActions, Button } from "@mui/material";
import { Career } from "../../../app/models/career";
import agent from "../../../app/api/agent";
import { reloadCareerSets } from "../careerSlice";
import { useAppDispatch } from "../../../app/store/configureStore";

interface Props {
    open: boolean
    careerSet: Career[]
    handleClose: () => void
}

export default function ConfirmCareerSet({ open, handleClose, careerSet }: Props) {
    const dispatch = useAppDispatch()

    return (
        <Dialog
            open={open}
            onClose={handleClose}
            PaperProps={{
                component: 'form',
                onSubmit: async (event: React.FormEvent<HTMLFormElement>) => {
                    event.preventDefault()
                    const formData = new FormData(event.currentTarget)
                    const formJson = Object.fromEntries((formData as any).entries())
                    const name = formJson.name
                    await agent.CareerSet.create({name: name, careers: careerSet})
                    dispatch(reloadCareerSets())
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
                />
            </DialogContent>
            <DialogActions>
                <Button onClick={handleClose}>Cancel</Button>
                <Button type="submit">Save Career Set</Button>
            </DialogActions>
        </Dialog>
    )
}