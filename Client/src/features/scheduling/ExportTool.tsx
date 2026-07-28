import { Button, Dialog, DialogActions, DialogContent, DialogTitle, Grid } from "@mui/material";
import { CareerEvent } from "../../app/models/event";
import { LoadingButton } from "@mui/lab";
import { useMemo, useState } from "react";
import agent from "../../app/api/agent";
import { downloadExcel } from "../../app/util/util";

interface Props {
    open: boolean
    careerEvent: CareerEvent
    handleClose: () => void
}

export default function ExportTool({ open, careerEvent, handleClose }: Props) {
    const [primaryLoading, setPrimaryLoading] = useState(false)
    const [studentLoading, setStudentLoading] = useState(false)
    const [speakerLoading, setSpeakerLoading] = useState(false)
    const [teacherLoading, setTeacherLoading] = useState(false)
    
    const params = useMemo(() => {
        const p = new URLSearchParams()
        p.append('eventId', careerEvent.id.toString())
        return p
    },[careerEvent.id])

    const exportPrimarySchedule = async () => {
        setPrimaryLoading(true)

        await agent.Export.exportPrimary(params)
            .then(response => downloadExcel(response))
            .catch(error => console.log(error))
            .finally(() => setPrimaryLoading(false))
    }

    const exportStudentsSchedule = async () => {
        setStudentLoading(true)

        await agent.Export.exportStudentSchedule(params)
            .then(response => downloadExcel(response))
            .catch(error => console.log(error))
            .finally(() => setStudentLoading(false))
    }

    const exportSpeakersSchedule = async () => {
        setSpeakerLoading(true)
        
        await agent.Export.exportSpeakerSchedule(params)
            .then(response => downloadExcel(response))
            .catch(error => console.log(error))
            .finally(() => setSpeakerLoading(false))
    }

    const exportTeachersSchedule = async () => {
        setTeacherLoading(true)

        await agent.Export.exportRoomSchedule(params)
            .then(response => downloadExcel(response))
            .catch(error => console.log(error))
            .finally(() => setTeacherLoading(false))
    }

    return (
        <Dialog open={open} onClose={handleClose}>
            <DialogTitle>Choose Schedule to Export for {careerEvent.name}</DialogTitle>
            <DialogContent>
                <Grid container item xs={12} spacing={3}>
                    <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                        <LoadingButton loading={primaryLoading} onClick={exportPrimarySchedule} variant="contained">
                            Export Primary Schedule
                        </LoadingButton>
                    </Grid>
                    <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                        <LoadingButton loading={studentLoading} onClick={exportStudentsSchedule} variant="contained">
                            Export Student Schedules
                        </LoadingButton>
                    </Grid>
                    <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                        <LoadingButton loading={speakerLoading} onClick={exportSpeakersSchedule} variant="contained">
                            Export Speaker Schedules
                        </LoadingButton>
                    </Grid>
                    <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                        <LoadingButton loading={teacherLoading} onClick={exportTeachersSchedule} variant="contained">
                            Export Teacher/Room Schedules
                        </LoadingButton>
                    </Grid>
                </Grid>
            </DialogContent>
            <DialogActions>
                <Button onClick={handleClose}>Close</Button>
            </DialogActions>
        </Dialog>
    )
}