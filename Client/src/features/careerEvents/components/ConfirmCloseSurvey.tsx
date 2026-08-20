import { Dialog, DialogTitle, DialogContent, DialogContentText, DialogActions } from "@mui/material"
import AppLoadingButton from "../../../app/components/AppLoadingButton"
import AppButton from "../../../app/components/AppButton"

interface Props {
    open: boolean
    loading?: boolean
    handleConfirm: () => void
    handleClose: () => void
}

export default function ConfirmCloseSurvey({open, loading, handleConfirm, handleClose}: Props) {
    return (
        <Dialog
            open={open}
            onClose={handleClose}
            aria-labelledby="alert-dialog-title"
            aria-describedby="alert-dialog-description"
        >
            <DialogTitle id="alert-dialog-title">
                Do you want to go to Close Survey
            </DialogTitle>
            <DialogContent>
                <DialogContentText id="alert-dialog-description">
                    Are you sure you want to close the survey?
                </DialogContentText>
            </DialogContent>
            <DialogActions>
                <AppButton onClick={handleClose} autoFocus>Cancel</AppButton>
                <AppLoadingButton loading={loading} onClick={handleConfirm} autoFocus>
                    Confirm
                </AppLoadingButton>
            </DialogActions>
        </Dialog>
    )
}