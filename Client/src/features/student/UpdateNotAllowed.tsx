import { Button, Dialog, DialogActions, DialogContent, DialogContentText, DialogTitle } from "@mui/material";

interface Props {
    open: boolean
    handleClose: () => void
}


export default function UpdateNotAllowed({open, handleClose}: Props) {
    return (
        <Dialog
            open={open}
            onClose={handleClose}
            aria-labelledby="alert-dialog-title"
            aria-describedby="alert-dialog-description"
        >
            <DialogTitle id="alert-dialog-title">
                Updating Students Not Allowed
            </DialogTitle>
            <DialogContent>
                <DialogContentText id="alert-dialog-description">
                    Please do not update Students once survey has been opened.
                </DialogContentText>
            </DialogContent>
            <DialogActions>
                <Button onClick={handleClose} autoFocus>Close</Button>
            </DialogActions>
        </Dialog>
    )
}