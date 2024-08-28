import { useEffect } from "react"
import { careerEventSelectors, fetchAllCareerEventsAsync, fetchEventPhasesAsync } from "../../features/careerEvents/careerEventSlice"
import { useAppSelector, useAppDispatch } from "../store/configureStore"

export default function useEvents() {
    const careerEvents = useAppSelector(careerEventSelectors.selectAll)
    const { careerEventsLoaded, eventPhases, eventPhasesLoaded, eventParams, metaData } = useAppSelector(state => state.careerEvents)
    const dispatch = useAppDispatch()

    useEffect(() => {
        if (!careerEventsLoaded) dispatch(fetchAllCareerEventsAsync())
    }, [careerEventsLoaded, dispatch])

    useEffect(() => {
        if (!eventPhasesLoaded) dispatch(fetchEventPhasesAsync())
    }, [eventPhasesLoaded, dispatch])

    return {
        careerEvents,
        careerEventsLoaded,
        eventPhases,
        eventPhasesLoaded,
        eventParams,
        metaData
    }
}