import { Box, Button, Card, CardActions, CardContent, CardHeader, Typography, useTheme } from "@mui/material"
import { CareerEvent } from "../../app/models/event"
import LinearProgressWithLabel from "../../app/components/LinearProgressWithLabel"
import { Edit } from "@mui/icons-material"
import dayjs from "dayjs"
import { EVENT_PANEL_BUTTON } from "../../app/util/constants"

interface Props {
    careerEvent: CareerEvent,
    handleEventCardClick: (event: CareerEvent, button: string) => void
}

export default function CareerEventCard({ careerEvent, handleEventCardClick }: Props) {
    const date = dayjs(careerEvent.eventDate).toDate()
    const theme = useTheme()

    return (
        <Card>
            <CardHeader
                title={careerEvent.name}
                titleTypographyProps={{
                    sx: {fontWeight: 'bold', color: 'primary.main'}
                }}
            />
            <CardContent sx={{ bgcolor: theme.palette.mode === 'dark' ? 'background.paper' : 'primary.light', p: 1 }}>
                <Typography gutterBottom color="secondary" variant="h6" sx={{m: 0}}>
                    {careerEvent.school.name}
                </Typography>
                <Typography variant="body1" color="text.secondary">
                    {date.toLocaleDateString()}
                </Typography>
                <Box sx={{width: '100%'}}>
                    <LinearProgressWithLabel value={careerEvent.surveyCompletePercent} />
                </Box>
                <Typography variant="body1" color="text.secondary">
                    {careerEvent.eventPhase.phaseName}
                </Typography>
            </CardContent>
            <CardActions disableSpacing>
                <Button sx={{ ml: 0.5 }}
                    onClick={() => handleEventCardClick(careerEvent, EVENT_PANEL_BUTTON.CAREERS)}>
                    {EVENT_PANEL_BUTTON.CAREERS}
                </Button>
                <Button sx={{ ml: 2.5 }}
                    onClick={() => handleEventCardClick(careerEvent, EVENT_PANEL_BUTTON.STUDENTS)}>
                    {EVENT_PANEL_BUTTON.STUDENTS}
                </Button>
                <Button sx={{ ml: 1 }}
                    onClick={() => handleEventCardClick(careerEvent, EVENT_PANEL_BUTTON.VIEW)}>
                    {EVENT_PANEL_BUTTON.VIEW}
                </Button>
                <Button sx={{ ml: -1.2, pl: 0 }}
                    onClick={() => handleEventCardClick(careerEvent, EVENT_PANEL_BUTTON.EDIT)}>
                    <Edit />
                </Button>
            </CardActions>
        </Card>
    )
}