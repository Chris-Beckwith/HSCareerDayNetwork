import { Grid, LinearProgress, Typography } from "@mui/material";
import { DEFAULT_FONT_SIZE } from "../../app/util/constants";

interface Props {
    item: any
    maxValue: number
    altItem: any
}

/**
 * Component to display a career line with a total number and line with length relative to the highest selected career.
 */
export default function SurveyResultLineItem({ item, maxValue, altItem }: Props) {
    return (
        <Grid container spacing={1} alignItems="center" sx={{ mb: 0.5 }}>
            <Grid item xs={4}>
                <Typography variant="body1" sx={{ fontSize: DEFAULT_FONT_SIZE }}>{item.name}</Typography>
            </Grid>
            <Grid item xs={1}>
                <Typography variant="body1" sx={{ fontSize: DEFAULT_FONT_SIZE }}>{item.value}</Typography>
            </Grid>
            <Grid item xs={7}>
                <LinearProgress
                    variant="determinate"
                    value={(item.value / maxValue) * 100}
                    sx={{
                        height: '8px',
                        backgroundColor: 'white'
                    }}
                />
                {altItem &&
                    <LinearProgress
                        variant="determinate"
                        color="warning"
                        value={(altItem.value / maxValue) * 100}
                        sx={{
                            height: '4px',
                            backgroundColor: 'white'
                        }}
                    />
                }
            </Grid>
        </Grid>
    )
}