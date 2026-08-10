import { LoadingButton } from "@mui/lab";
import { Button, Dialog, DialogActions, DialogContent, DialogTitle, Grid, Switch, Typography } from "@mui/material";
import { useState } from "react";

interface Props {
    open: boolean
    loading: boolean
    isFilterSpeakers: boolean
    handleClose: () => void
    exportSpeakers: (
        portrait: boolean, address: boolean, subjects: boolean,
        lastSchool: boolean, filterSpeakers: boolean
    ) => Promise<void>
}

/**
 * Dialog for exporting speakers.
 * 
 * Options: Filtered speakers, Include: Last School, Portrait, Subjects, Address
 */
export default function ExportSpeakers({ open, loading, isFilterSpeakers, handleClose, exportSpeakers }: Props) {
    const [filterSpeakers, setFilterSpeakers] = useState(true)
    const [portrait, setPortrait] = useState(true)
    const [address, setAddress] = useState(true)
    const [subjects, setSubjects] = useState(true)
    const [lastSchool, setLastSchool] = useState(false)

    return (
        <Dialog open={open} onClose={handleClose}>
            <DialogTitle>
                Please choose the speaker information you wish to export
            </DialogTitle>

            <DialogContent>
                <Grid container spacing={1} display="flex" flexDirection="column" alignContent="center" >
                    {isFilterSpeakers &&
                        <Grid item display="flex" flexDirection="row" alignItems="center" >
                            <Switch onClick={() => setFilterSpeakers(!filterSpeakers)} checked={filterSpeakers} />
                            <Typography>Only Searched Speakers</Typography>
                        </Grid>
                    }
                    <Grid item display="flex" flexDirection="row" alignItems="center">
                        <Switch onClick={() => setPortrait(!portrait)} checked={portrait} />
                        <Typography>Include Portrait</Typography>
                    </Grid>
                    <Grid item display="flex" flexDirection="row" alignItems="center">
                        <Switch onClick={() => setAddress(!address)} checked={address} />
                        <Typography>Include Address</Typography>
                    </Grid>
                    <Grid item display="flex" flexDirection="row" alignItems="center">
                        <Switch onClick={() => setSubjects(!subjects)} checked={subjects} />
                        <Typography>Include Subjects</Typography>
                    </Grid>
                    <Grid item display="flex" flexDirection="row" alignItems="center">
                        <Switch onClick={() => setLastSchool(!lastSchool)} checked={lastSchool} />
                        <Typography>Include Last School Spoke At</Typography>
                    </Grid>
                </Grid>
            </DialogContent>

            <DialogActions>
                <Button onClick={handleClose}>Cancel</Button>
                <LoadingButton onClick={() => exportSpeakers(portrait, address, subjects, lastSchool, filterSpeakers)}
                    loading={loading} autoFocus
                >
                    Export Speakers
                </LoadingButton>
            </DialogActions>
        </Dialog>
    )
}