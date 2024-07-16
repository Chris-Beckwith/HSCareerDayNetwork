import { Box, Button, Card, CardActions, CardContent, CardHeader, Typography } from "@mui/material"
import { CareerEvent } from "../../app/models/event"
import LinearProgressWithLabel from "../../app/components/LinearProgressWithLabel"
import { Link } from "react-router-dom"

interface Props {
    careerEvent: CareerEvent
}

export default function CareerEventCard({ careerEvent }: Props) {
    return (
        <Card>
            <CardHeader
                title={careerEvent.name}
                titleTypographyProps={{
                    sx: {fontWeight: 'bold', color: 'primary.main'}
                }}
            />
            <CardContent sx={{ bgcolor: 'primary.light' }}>
                <Typography gutterBottom color="secondary" variant="h6">
                    {careerEvent.school.name}
                </Typography>
                <Typography variant="body1" color="text.secondary">
                    Date: {careerEvent.eventDate}
                </Typography>
                <Typography variant="body2" color="text.secondary">
                    {careerEvent.description}
                </Typography>
                <Box sx={{width: '100%'}}>
                    <LinearProgressWithLabel value={careerEvent.surveyCompletePercent} />
                </Box>
                <Typography variant="body1" color="text.secondary">
                    {careerEvent.eventPhase.phaseName}
                </Typography>
            </CardContent>
            <CardActions>
                <Button size="small">Speakers</Button>
                <Button component={Link} to={`/event/${careerEvent.id}`} size="small">View</Button>
            </CardActions>
        </Card>
    )
}