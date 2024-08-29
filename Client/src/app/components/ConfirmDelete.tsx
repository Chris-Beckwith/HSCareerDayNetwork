import { Button, Dialog, DialogActions, DialogContent, DialogContentText, DialogTitle } from "@mui/material";

interface Props {
    open: boolean
    itemName: string
    itemType: string
    handleClose: () => void
    confirmDelete: () => Promise<void>
}

export default function ConfirmDelete({ open, itemName, itemType, handleClose, confirmDelete }: Props) {
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
                    Are you sure you want to delete the {itemType}: {itemName}?
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