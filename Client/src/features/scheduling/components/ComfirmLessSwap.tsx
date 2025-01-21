import { Button, Dialog, DialogActions, DialogContent, DialogTitle, Typography } from "@mui/material";

interface Props {
    open: boolean
    handleClose: () => void
    setShowSwapConfirm: (showConfirm: boolean) => void
}

export default function ConfirmLessSwap({ open, handleClose, setShowSwapConfirm }: Props) {
    return (
        <Dialog open={open} onClose={handleClose}>
            <DialogTitle>You have removed an already assigned Session</DialogTitle>

            <DialogContent>
                <Typography>Are you sure you would like to remove a session?</Typography>
            </DialogContent>

            <DialogActions>
                <Button onClick={() => {
                    handleClose()
                    setShowSwapConfirm(true)
                }}>
                    Yes
                </Button>
                <Button onClick={handleClose}>Cancel</Button>
            </DialogActions>

        </Dialog>
    )
}