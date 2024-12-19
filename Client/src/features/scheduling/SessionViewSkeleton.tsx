import { Grid, Typography, Button } from "@mui/material"
import { CareerEvent } from "../../app/models/event"
import SessionCardSkeleton from "./SessionCardSkeleton"

interface Props {
    event: CareerEvent
}

export default function SessionViewSkeleton({ event }: Props) {
    return (
        <Grid container item xs={12}>
            <Grid item xs={12} sx={{ display: 'flex', justifyContent: 'center' }}>
                <Typography variant="h4">{event.name} - Session View</Typography>
            </Grid>
            <Grid item xs={12} sx={{ display: 'flex', alignItems: 'center', justifyContent: 'flex-end' }}>
                <Button sx={{ fontSize: '0.74rem', mb: 1 }} variant="outlined">
                    Unplaced Students
                </Button>
            </Grid>

            <Grid container item xs={12} spacing={2}>
                <Grid container item xs={12} spacing={2}>
                    {Array.from({ length: 3 }, (_, p) => (
                        <Grid key={p} item xs={4}>
                            <Typography variant="body1">
                                Session {p + 1} Classes
                            </Typography>
                            <Grid item>
                                {Array.from({ length: 3 }, (_, index) => (
                                    <Grid item key={index} sx={{ my: 2 }}>
                                        <SessionCardSkeleton />
                                    </Grid>
                                ))}
                            </Grid>
                        </Grid>
                    ))}
                </Grid>
            </Grid>
        </Grid>
    )
}