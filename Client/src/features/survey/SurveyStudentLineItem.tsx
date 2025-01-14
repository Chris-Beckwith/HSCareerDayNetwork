import { Button, Grid, Typography } from "@mui/material";
import { Survey } from "../../app/models/survey";
import { Edit } from "@mui/icons-material";
import { CareerEvent } from "../../app/models/event";
import { useState } from "react";
import EditSurvey from "./EditSurvey";

interface Props {
    item: Survey
    showAlternate: boolean
    event: CareerEvent
    schoolUser?: boolean
}

export default function SurveyStudentLineItem({ item, showAlternate, event, schoolUser }: Props) {
    const [editSurvey, setEditSurvey] = useState(false)

    return (
        <>
            <Grid container display='flex' alignItems='center' sx={{ my: 0.5, py: 0.2, pl: 0.7, '&:hover': { bgcolor: 'primary.light' } }}>
                <Grid item xs={showAlternate ? 4 : 3}>
                    <Typography variant="body2">
                        {!schoolUser && 
                            <Button sx={{ p: 0, mr: 1, minWidth: 'auto', width: 'fit-content', '&:hover': { color: 'secondary.main' } }}
                                onClick={() => setEditSurvey(true)}>
                                <Edit fontSize="small"/>
                            </Button>
                        }
                        {item.student.lastFirstName}
                    </Typography>
                </Grid>
                {showAlternate ?
                    item.alternateCareers.map((career, index) => (
                        <Grid item xs={4} key={index}>
                            <Typography variant="subtitle2" sx={{ fontSize: '0.7em' }}>{career.courseId}-{career.name}</Typography>
                        </Grid>
                    )) :
                    item.primaryCareers.map((career, index) => (
                        <Grid item xs={3} key={index}>
                            <Typography variant="subtitle2" sx={{ fontSize: '0.7em' }}>{career.courseId}-{career.name}</Typography>
                        </Grid>
                    ))
                }
            </Grid>

            <EditSurvey open={editSurvey} handleClose={() => setEditSurvey(false)} survey={item} event={event}/>
        </>
    )
}