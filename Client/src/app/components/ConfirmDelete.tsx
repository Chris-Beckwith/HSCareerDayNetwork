import { Button, Dialog, DialogActions, DialogContent, DialogContentText, DialogTitle } from "@mui/material";

interface Props {
    open: boolean
    itemName: string
    itemType: string
    customText?: string
    handleClose: () => void
    confirmDelete: () => Promise<void>
}

export default function ConfirmDelete({ open, itemName, itemType, customText, handleClose, confirmDelete }: Props) {
    const contentText = customText ? customText : `Are you sure you want to delete the ${itemType}: ${itemName}?`
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
                <DialogContentText id="alert-dialog-description">
                    {contentText}
                </DialogContentText>
            </DialogContent>
            <DialogActions>
                <Button onClick={handleClose}>Cancel</Button>
                <Button onClick={confirmDelete} autoFocus>
                    Delete
                </Button>
            </DialogActions>
        </Dialog>
    )
}