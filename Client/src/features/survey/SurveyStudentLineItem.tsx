import { Grid, IconButton, Typography } from "@mui/material";
import { Survey } from "../../app/models/survey";
import { Edit } from "@mui/icons-material";

interface Props {
    item: Survey
    showAlternate: boolean
    onEdit: () => void
    schoolUser?: boolean
}

/**
 * Component to display a single student's survey results.
 */
export default function SurveyStudentLineItem({ item, showAlternate, onEdit, schoolUser }: Props) {
    return (
        <Grid container display='flex' alignItems='center' sx={{ my: 0.5, py: 0.2, pl: 0.7, '&:hover': { bgcolor: 'primary.light' } }}>
            <Grid item xs={showAlternate ? 6 : 6} sm={showAlternate ? 4 : 3}>
                <Typography variant="body2" sx={{ fontSize: { xs: '.775rem', sm: '.825rem', md: '.875rem' } }}>
                    {!schoolUser && 
                        <IconButton sx={{ p: 0, mr: { xs: 0, sm: 1}, minWidth: 'auto', width: 'fit-content', '&:hover': { color: 'secondary.main' } }}
                            onClick={onEdit}>
                            <Edit fontSize="small" color="primary"/>
                        </IconButton>
                    }
                    {item.student.lastFirstName}
                </Typography>
            </Grid>
            {showAlternate ?
                item.alternateCareers.map((career, index) => (
                    <Grid item xs={3} sm={4} key={index}>
                        <Typography variant="subtitle2" sx={{ fontSize: '0.7em' }}>{career.courseId}-{career.name}</Typography>
                    </Grid>
                )) :
                item.primaryCareers.map((career, index) => (
                    <Grid item xs={2} sm={3} key={index}>
                        <Typography variant="subtitle2" sx={{ fontSize: '0.7em' }}>{career.courseId}-{career.name}</Typography>
                    </Grid>
                ))
            }
        </Grid>
    )
}