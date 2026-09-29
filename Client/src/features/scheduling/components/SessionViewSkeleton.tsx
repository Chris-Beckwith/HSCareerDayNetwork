import { Grid, Typography, Button } from "@mui/material"
import SessionCardSkeleton from "./SessionCardSkeleton"

export default function SessionViewSkeleton() {
    return (
        <Grid container item xs={12}>
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