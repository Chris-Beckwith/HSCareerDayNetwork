import { LoadingButton } from "@mui/lab";
import { Button, Dialog, DialogActions, DialogContent, DialogContentText, DialogTitle } from "@mui/material";

interface Props {
    open: boolean
    handleClose: () => void
    isCompleted: boolean
    confirmComplete: () => Promise<void>
    loading: boolean
}

export default function EventCompleted({ open, handleClose, isCompleted, confirmComplete, loading }: Props) {
    return (
        <Dialog
            open={open}
            onClose={handleClose}
            aria-labelledby="alert-dialog-title"
            aria-describedby="alert-dialog-description"
        >
            <DialogTitle id="alert-dialog-title">
                {isCompleted 
                    ? "Do you want to reopen this event?"
                    : "Do you want to mark this event as completed?"
                }
            </DialogTitle>
            <DialogContent>
                <DialogContentText id="alert-dialog-description">
                </DialogContentText>
            </DialogContent>
            <DialogActions>
                <Button onClick={handleClose}>Cancel</Button>
                <LoadingButton onClick={confirmComplete} loading={loading} autoFocus>
                    {isCompleted ? "Reopen Event" : "Mark Completed"}
                </LoadingButton>
            </DialogActions>
        </Dialog>
    )
}