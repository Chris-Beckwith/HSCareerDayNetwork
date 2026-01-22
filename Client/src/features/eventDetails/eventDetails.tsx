import { useState } from "react";
import SurveyResults from "../survey/SurveyResults";
import Students from "../student/Students";
import { useAppSelector } from "../../app/store/configureStore";
import { Typography } from "@mui/material";


export default function EventDetails() {
    const { user } = useAppSelector((state: { account: any; }) => state.account)
    const [showSurvey, setShowSurvey] = useState(true)

    const event = user?.event

    function switchView() {
        setShowSurvey(!showSurvey)
    }

    return (
        event ?
            showSurvey 
                ? <SurveyResults event={event} back={switchView} schoolUser={true} />
                : <Students event={event} back={switchView} schoolUser={true} />
            : <Typography variant="h3">Could not load event details</Typography>
    )
}