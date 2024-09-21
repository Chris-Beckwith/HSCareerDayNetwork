import { Grid, LinearProgress, Typography } from "@mui/material";

interface Props {
    item: any
    maxValue: number
}

export default function SurveyResultLineItem({item, maxValue}: Props) {
    return (
        <Grid container spacing={1} alignItems="center" sx={{ mb: 0.5 }}>
            <Grid item xs={4}>
                <Typography variant="body1">{item.name}</Typography>
            </Grid>
            <Grid item xs={1}>
                <Typography variant="body1">{item.value}</Typography>
            </Grid>
            <Grid item xs={7}>
                <LinearProgress
                    variant="determinate"
                    value={(item.value / maxValue) * 100}
                    sx={{
                        height: '8px',
                        backgroundColor: 'white'
                    }}
                />
            </Grid>
        </Grid>
    )
}