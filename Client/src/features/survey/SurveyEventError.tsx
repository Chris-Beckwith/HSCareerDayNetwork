import { Paper, Typography } from "@mui/material"

interface Props {
    error: string
}

export default function SurveyEventError({ error }: Props) {
    return (
        <Paper variant="outlined" sx={{ my: { xs: 3, md: 6 }, p: { xs: 2, md: 3 } }}>
                <Typography component="h1" variant="h4" align="center" sx={{ mb: 5 }}>
                    Student Survey
                </Typography>
                <Typography variant="h6" color="error" align="center">{error}</Typography>
        </Paper>
    )
}