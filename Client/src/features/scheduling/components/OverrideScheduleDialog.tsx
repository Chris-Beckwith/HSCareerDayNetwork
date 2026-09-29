import { Dialog, DialogActions, DialogContent, DialogTitle, Grid, Typography } from "@mui/material";
import { FieldValues } from "react-hook-form";
import AppButton from "../../../app/components/AppButton";
import { WarningAmber } from "@mui/icons-material";

interface Props {
    data: FieldValues
    generateSchedule: (data: FieldValues) => void
    open: boolean
    handleClose: () => void
}

export default function OverrideScheduleDialog({data, generateSchedule, open, handleClose}: Props) {
    return (
        <Dialog open={open} onClose={handleClose} sx={{ justifyContent: 'center' }}>
            <DialogTitle>
                <Grid container display='flex' justifyContent='center' alignItems='center' >
                    <WarningAmber color="warning" sx={{ fontSize: 32 }} />
                    <Typography pt={.5} px={2} fontWeight="500">Would you like to override the current schedule?</Typography>
                    <WarningAmber color="warning" sx={{ fontSize: 32 }} />
                </Grid>
            </DialogTitle>

            <DialogContent>
                <Typography>Generating a new schedule will override the current schedule</Typography>
                <Typography>This will result in a loss of all assigned rooms and speakers</Typography>
            </DialogContent>

            <DialogActions>
                <AppButton onClick={() => {
                    handleClose()
                    generateSchedule(data)
                }}>
                    Generate New Schedule
                </AppButton>
                <AppButton onClick={handleClose}>Cancel</AppButton>
            </DialogActions>
        </Dialog>
    )
}