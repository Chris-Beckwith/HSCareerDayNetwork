import { Box, Button, Card, CardActions, CardContent, CardHeader, Paper, Typography } from "@mui/material"
import { CareerEvent } from "../../app/models/event"
import LinearProgressWithLabel from "../../app/components/LinearProgressWithLabel"
import { Edit } from "@mui/icons-material"
import dayjs from "dayjs"

interface Props {
    careerEvent: CareerEvent,
    viewEvent: (event: CareerEvent) => void
    editEvent: (event: CareerEvent) => void
}

export default function CareerEventCard({ careerEvent, viewEvent, editEvent }: Props) {
    const date = dayjs(careerEvent.eventDate).toDate()

    return (
        <Card>
            <CardHeader
                title={careerEvent.name}
                titleTypographyProps={{
                    sx: {fontWeight: 'bold', color: 'primary.main'}
                }}
            />
            <CardContent sx={{ bgcolor: 'primary.light', p: 1 }}>
                <Typography gutterBottom color="secondary" variant="h6" sx={{m: 0}}>
                    {careerEvent.school.name}
                </Typography>
                <Typography variant="body1" color="text.secondary">
                    {date.toLocaleDateString()} @ {date.toLocaleTimeString()}
                </Typography>
                <Paper sx={{outline: 1, p: 1, my: 1, backgroundColor: 'rgba(255, 255, 255, 0.2)' }}>
                    <Typography variant="body2" color="text.secondary">
                        {careerEvent.description}
                    </Typography>
                </Paper>
                <Box sx={{width: '100%'}}>
                    <LinearProgressWithLabel value={careerEvent.surveyCompletePercent} />
                </Box>
                <Typography variant="body1" color="text.secondary">
                    {careerEvent.eventPhase.phaseName}
                </Typography>
            </CardContent>
            <CardActions disableSpacing>
                <Button size="small">Careers</Button>
                <Button sx={{ml: 2}} size="small">Speakers</Button>
                <Button sx={{ml: 1}} onClick={() => viewEvent(careerEvent)} size="small">View</Button>
                <Button sx={{ml: -1, pl: 0}} size="small" onClick={() => editEvent(careerEvent)}><Edit /></Button>
            </CardActions>
        </Card>
    )
}