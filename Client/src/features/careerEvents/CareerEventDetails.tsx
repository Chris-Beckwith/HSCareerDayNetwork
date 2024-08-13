import { Button, Divider, Grid, Table, TableBody, TableCell, TableContainer, TableRow, Typography } from "@mui/material";
import NotFound from "../../app/errors/NotFound";
import { CareerEvent } from "../../app/models/event";

interface Props {
    careerEvent?: CareerEvent,
    cancelView: () => void
    editEvent: (event: CareerEvent) => void
    cancelEdit: () => void
}

export default function CareerEventDetails({careerEvent, cancelView}: Props) {
    if (!careerEvent) return <NotFound />

    return (
        <Grid container spacing={6}>
            <Grid item xs={6}>
                <Typography variant="h3">{careerEvent.name}</Typography>
                <Divider sx={{mb: 2}} />
                <Typography variant="h4">{careerEvent.school.name}</Typography>
                <TableContainer>
                    <Table>
                        <TableBody>
                            <TableRow>
                                <TableCell>Date</TableCell>
                                <TableCell>{careerEvent.eventDate}</TableCell>
                            </TableRow>
                            <TableRow>
                                <TableCell>Description</TableCell>
                                <TableCell>{careerEvent.description}</TableCell>
                            </TableRow>
                            <TableRow>
                                <TableCell>Surveys Completed</TableCell>
                                <TableCell>{careerEvent.surveyCompletePercent}</TableCell>
                            </TableRow>
                            <TableRow>
                                <TableCell>Event Phase</TableCell>
                                <TableCell>{careerEvent.eventPhase.phaseName}</TableCell>
                            </TableRow>
                        </TableBody>
                    </Table>
                </TableContainer>
            </Grid>
            <Grid item xs={6}>
                <Button 
                    onClick={cancelView}
                    variant="contained" 
                    color="primary">
                        View All Events
                </Button>
            </Grid>
        </Grid>
    )
}