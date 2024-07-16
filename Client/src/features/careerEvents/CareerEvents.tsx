import CareerEventList from "./CareerEventList";
import { useAppDispatch, useAppSelector } from "../../app/store/configureStore";
import { careerEventSelectors, fetchEventPhasesAsync, fetchAllCareerEventsAsync, setEventParams, setPageNumber } from "./careerEventSlice";
import { useEffect } from "react";
import LoadingComponent from "../../app/components/LoadingComponent";
import { Grid, Paper } from "@mui/material";
import CareerEventSearch from "./CareerEventSearch";
import RadioButtonGroup from "../../app/components/RadioButtonGroup";
import CheckboxButtons from "../../app/components/CheckboxButtons";
import AppPagination from "../../app/components/AppPagination";
import SurveyCompleteSlider from "./SurveyCompleteSlider";
import IncludeDeletedCheckbox from "./IncludeDeletedCheckbox";

const sortOptions = [
    {value: 'name', label: 'Alphabetical'},
    {value: 'date', label: 'Date - Newest to Oldest'},
    {value: 'dateDesc', label: 'Date - Oldest to Newest'},
    {value: 'surveyComplete', label: 'Survey Complete - Highest to Lowest'},
    {value: 'surveyCompleteDesc', label: 'Survey Complete - Lowest to Highest'},
]

export default function CareerEvents() {
    const careerEvents = useAppSelector(careerEventSelectors.selectAll)
    const {careerEventsLoaded, eventPhasesLoaded, eventPhases, eventParams, metaData} = useAppSelector(state => state.careerEvents)
    const dispatch = useAppDispatch()

    useEffect(() => {
        if (!careerEventsLoaded) dispatch(fetchAllCareerEventsAsync())
    }, [careerEventsLoaded, dispatch])

    useEffect(() => {
        if (!eventPhasesLoaded) dispatch(fetchEventPhasesAsync())
    }, [eventPhasesLoaded, dispatch])

    if (!eventPhasesLoaded) return <LoadingComponent message="Loading Career Events.." />

    return (
        <Grid container columnSpacing={4}>
            <Grid item xs={3}>
                <Paper sx={{mb: 2}}>
                    <CareerEventSearch />
                </Paper>
                <Paper sx={{mb: 2, p: 2 }}>
                    <RadioButtonGroup
                        selectedValue={eventParams.orderBy}
                        options={sortOptions}
                        onChange={(e) => dispatch(setEventParams({orderBy: e.target.value}))}
                    />
                </Paper>
                <Paper sx={{mb: 2, p: 2 }}>
                    <CheckboxButtons
                        items={eventPhases}
                        checked={eventParams.eventPhases}
                        onChange={(items: string[]) => dispatch(setEventParams({eventPhases: items}))}
                    />
                </Paper>
                <Paper>
                    <SurveyCompleteSlider
                        surveyComplete={eventParams.surveyComplete}
                    />
                </Paper>
                <Paper sx={{ mb: 2, p: 2 }}>
                    <IncludeDeletedCheckbox isChecked={eventParams.includeDeleted} />
                </Paper>
            </Grid>
            <Grid item xs={9}>
                <CareerEventList careerEvents={careerEvents} />
            </Grid>
            <Grid item xs={3} />
            <Grid item xs={9} sx={{mb: 2}}>
                {metaData &&
                    <AppPagination
                        metaData={metaData}
                        onPageChange={(page: number) => dispatch(setPageNumber({ pageNumber: page }))}
                    />
                }
            </Grid>
        </Grid>
    )
}