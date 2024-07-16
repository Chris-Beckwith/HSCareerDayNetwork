import { Grid } from "@mui/material"
import { CareerEvent } from "../../app/models/event"
import CareerEventCard from "./CareerEventCard"
import { useAppSelector } from "../../app/store/configureStore"
import CareerEventCardSkeleton from "./CareerEventCardSkeleton"

interface Props {
    careerEvents: CareerEvent[] | null
}

export default function CareerEventList({careerEvents}: Props) {
    const {careerEventsLoaded} = useAppSelector(state => state.careerEvents)

    return (
        <Grid container spacing={4}>
            {careerEvents?.map(event => {
                return (
                    <Grid item xs={4} key={event.id}>
                        {!careerEventsLoaded ? (
                            <CareerEventCardSkeleton />
                        ) : (
                            <CareerEventCard careerEvent={event} />
                        )}
                    </Grid>
                )
            })}
        </Grid>
    )
}