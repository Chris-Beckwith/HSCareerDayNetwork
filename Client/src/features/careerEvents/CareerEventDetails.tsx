import { Button, Divider, Grid, Table, TableBody, TableCell, TableContainer, TableRow, Typography } from "@mui/material";
import { useAppSelector } from "../../app/store/configureStore";
import { careerEventSelectors, fetchCareerEventAsync } from "./careerEventSlice";
import { Link, useParams } from "react-router-dom";
import { useEffect } from "react";
import { useAppDispatch } from "../../app/store/configureStore";
import LoadingComponent from "../../app/components/LoadingComponent";
import NotFound from "../../app/errors/NotFound";

export default function CareerEventDetails() {
    const dispatch = useAppDispatch()
    const {id} = useParams<{id: string}>()
    const currentEvent = useAppSelector(state => careerEventSelectors.selectById(state, parseInt(id!)))
    const {status} = useAppSelector(state => state.careerEvents)

    useEffect(() => {
        if (!currentEvent && id) dispatch(fetchCareerEventAsync(parseInt(id)))
    }, [currentEvent, id, dispatch])

    if (status.includes('pending')) return <LoadingComponent message="Loading Career Event.." />
    
    if (!currentEvent) return <NotFound />

    return (
        <Grid container spacing={6}>
            <Grid item xs={6}>
                <Typography variant="h3">{currentEvent.name}</Typography>
                <Divider sx={{mb: 2}} />
                <Typography variant="h4">{currentEvent.school.name}</Typography>
                <TableContainer>
                    <Table>
                        <TableBody>
                            <TableRow>
                                <TableCell>Date</TableCell>
                                <TableCell>{currentEvent.eventDate}</TableCell>
                            </TableRow>
                            <TableRow>
                                <TableCell>Description</TableCell>
                                <TableCell>{currentEvent.description}</TableCell>
                            </TableRow>
                            <TableRow>
                                <TableCell>Surveys Completed</TableCell>
                                <TableCell>{currentEvent.surveyCompletePercent}</TableCell>
                            </TableRow>
                            <TableRow>
                                <TableCell>Event Phase</TableCell>
                                <TableCell>{currentEvent.eventPhase.phaseName}</TableCell>
                            </TableRow>
                        </TableBody>
                    </Table>
                </TableContainer>
            </Grid>
            <Grid item xs={6}>
                <Button 
                    component={Link}
                    to="/"
                    variant="contained" 
                    color="primary">
                        View All Events
                </Button>
            </Grid>
        </Grid>
    )
}