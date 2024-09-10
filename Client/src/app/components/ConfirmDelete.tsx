import { LoadingButton } from "@mui/lab";
import { Button, Dialog, DialogActions, DialogContent, DialogContentText, DialogTitle } from "@mui/material";

interface Props {
    open: boolean
    itemName: string
    itemType: string
    customText?: string
    handleClose: () => void
    confirmDelete: () => Promise<void>
    loading: boolean
}

export default function ConfirmDelete({ open, itemName, itemType, customText, handleClose, confirmDelete, loading }: Props) {
    const contentText = customText ? customText : `Are you sure you want to delete the <strong>${itemType}: ${itemName}</strong>?`

    return (
        <Dialog
            open={open}
            onClose={handleClose}
            aria-labelledby="alert-dialog-title"
            aria-describedby="alert-dialog-description"
        >
            <DialogTitle id="alert-dialog-title">
                {"Are you sure you want to delete "}{itemName}{"?"}
            </DialogTitle>
            <DialogContent>
                <DialogContentText id="alert-dialog-description"
                    dangerouslySetInnerHTML={{ __html: contentText }}
                />
            </DialogContent>
            <DialogActions>
                <Button onClick={handleClose}>Cancel</Button>
                <LoadingButton onClick={confirmDelete} loading={loading} autoFocus>
                    Delete
                </LoadingButton>
            </DialogActions>
        </Dialog>
    )
}