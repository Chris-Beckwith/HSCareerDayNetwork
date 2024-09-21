import { useEffect } from "react";
import { getAllSurveysByEvent, surveySelectors } from "../../features/survey/surveySlice";
import { useAppDispatch, useAppSelector } from "../store/configureStore";

export default function useSurveys(eventId: number) {
    const surveys = useAppSelector(surveySelectors.selectAll)
    const { surveyResultsLoaded, status } = useAppSelector(state => state.surveys)
    const dispatch = useAppDispatch()

    useEffect(() => {
        if (!surveyResultsLoaded) dispatch(getAllSurveysByEvent(eventId))
    }, [surveyResultsLoaded, dispatch, eventId])

    return {
        surveys,
        surveyResultsLoaded,
        status
    }
}