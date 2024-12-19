import { Button, Dialog, DialogActions, DialogContent, DialogTitle, Grid } from "@mui/material";
import { CareerEvent } from "../../app/models/event";
import { LoadingButton } from "@mui/lab";
import { useState } from "react";
import agent from "../../app/api/agent";
import { downloadExcel } from "../../app/util/util";

interface Props {
    open: boolean
    careerEvent: CareerEvent
    handleClose: () => void
}

export default function ExportTool({ open, careerEvent, handleClose }: Props) {
    const [loading, setLoading] = useState(false)

    const exportPrimarySchedule = async () => {
        setLoading(true)

        const params = new URLSearchParams()
        params.append('eventId', careerEvent.id.toString())

        await agent.Schedule.exportPrimary(params)
            .then(response => downloadExcel(response))
            .catch(error => console.log(error))
            .finally(() => setLoading(false))
    }

    return (
        <Dialog open={open} onClose={handleClose}>
            <DialogTitle>Choose Schedule to Export for {careerEvent.name}</DialogTitle>
            <DialogContent>
                <Grid container item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                    <LoadingButton loading={loading} onClick={exportPrimarySchedule} variant="contained">
                        Export Primary Schedule
                    </LoadingButton>
                </Grid>
            </DialogContent>
            <DialogActions>
                <Button onClick={handleClose}>Close</Button>
            </DialogActions>
        </Dialog>
    )
}