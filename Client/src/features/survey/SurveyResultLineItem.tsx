import { Grid, LinearProgress, Typography, useTheme } from "@mui/material";
import { DEFAULT_FONT_SIZE } from "../../app/util/constants";
import { cyan, indigo  } from "@mui/material/colors";

interface Props {
    item: any
    maxValue: number
    altItem: any
}

/**
 * Component to display a career line with a total number and line with length relative to the highest selected career.
 */
export default function SurveyResultLineItem({ item, maxValue, altItem }: Props) {
    const darkMode = useTheme().palette.mode === 'dark'

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
                        '& .MuiLinearProgress-bar': {
                            backgroundColor: darkMode ? indigo[400] : 'primary.main'
                        },
                        height: '8px',
                        backgroundColor: 'background.paper'
                    }}
                />
                {altItem &&
                    <LinearProgress
                        variant="determinate"
                        value={(altItem.value / maxValue) * 100}
                        sx={{
                            '& .MuiLinearProgress-bar': {
                                backgroundColor: darkMode ? cyan[400] : 'secondary.main'
                            },
                            height: '4px',
                            backgroundColor: 'background.paper'
                        }}
                    />
                }
            </Grid>
        </Grid>
    )
}