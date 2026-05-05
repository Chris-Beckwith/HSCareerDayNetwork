import { Box, Button, Card, CardActions, CardContent, CardHeader, Typography, useMediaQuery, useTheme } from "@mui/material"
import { CareerEvent } from "../../app/models/event"
import LinearProgressWithLabel from "../../app/components/LinearProgressWithLabel"
import { Edit } from "@mui/icons-material"
import dayjs from "dayjs"
import { EVENT_PANEL_BUTTON } from "../../app/util/constants"

interface Props {
    careerEvent: CareerEvent,
    handleEventCardClick: (event: CareerEvent, button: string) => void
}

/**
 * Component to display summary information of career events.
 */
export default function CareerEventCard({ careerEvent, handleEventCardClick }: Props) {
    const date = dayjs(careerEvent.eventDate).toDate()
    const theme = useTheme()
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))
    const isCompact = useMediaQuery(theme.breakpoints.down(1050))

    const actionStyles = {
        minWidth: 0,
        fontSize: isCompact ? 11 : 14
    }

    return (
        <Card>
            <CardHeader
                title={careerEvent.name}
                titleTypographyProps={{
                    sx: {fontWeight: 'bold', color: 'primary.main', fontSize: isCompact ? 20 : 24}
                }}
            />
            <CardContent sx={{ bgcolor: theme.palette.mode === 'dark' ? 'background.paper' : 'primary.light', p: 1 }}>
                <Typography gutterBottom color="secondary" variant="h6" sx={{m: 0, fontSize: isCompact ? 18 : 20}}>
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
            <CardActions disableSpacing sx={{ display: 'flex', justifyContent: 'space-between' }}>
                <Button sx={actionStyles}
                    onClick={() => handleEventCardClick(careerEvent, EVENT_PANEL_BUTTON.CAREERS)}>
                    {EVENT_PANEL_BUTTON.CAREERS}
                </Button>
                <Button sx={actionStyles}
                    onClick={() => handleEventCardClick(careerEvent, EVENT_PANEL_BUTTON.STUDENTS)}>
                    {EVENT_PANEL_BUTTON.STUDENTS}
                </Button>
                <Button sx={actionStyles}
                    onClick={() => handleEventCardClick(careerEvent, EVENT_PANEL_BUTTON.VIEW)}>
                    {EVENT_PANEL_BUTTON.VIEW}
                </Button>
                <Button sx={{ minWidth: 0, pr: 0.5 }}
                    onClick={() => handleEventCardClick(careerEvent, EVENT_PANEL_BUTTON.EDIT)}>
                    <Edit sx={{ fontSize: isCompact && !isTablet ? 15 : 20 }}/>
                </Button>
            </CardActions>
        </Card>
    )
}