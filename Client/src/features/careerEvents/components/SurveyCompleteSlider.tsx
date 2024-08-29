import { Box, FormLabel, Grid, Slider, Input } from "@mui/material";
import { useState } from "react";
import { useAppDispatch } from "../../../app/store/configureStore";
import { setEventParams } from "../careerEventSlice";

interface Props {
    surveyComplete: string
}

export default function SurveyCompleteSlider({surveyComplete}: Props) {
    const [value, setValue] = useState(parseInt(surveyComplete));
    const dispatch = useAppDispatch()

    const handleSliderChange = (_event: Event, newValue: number | number[]) => {
        setValue(newValue as number);
    };

    const handleInputChange = (event: React.ChangeEvent<HTMLInputElement>) => {
        setValue(event.target.value === '' ? 0 : Number(event.target.value));
    };

    const handleBlur = () => {
        if (value < 0) {
            setValue(0);
        } else if (value > 100) {
            setValue(100);
        }
        dispatch(setEventParams({surveyComplete: value}))
    };

    return (
        <Box sx={{ mb: 2, p: 2 }}>
            <FormLabel id="input-slider">
                Minimum Survey Completed
            </FormLabel>
            <Grid container spacing={2} alignItems="center">
                <Grid item xs>
                    <Slider
                        value={typeof value === 'number' ? value : 0}
                        onChange={handleSliderChange}
                        onBlur={handleBlur}
                        aria-labelledby="input-slider"
                    />
                </Grid>
                <Grid item>
                    <Input
                        value={value}
                        size="small"
                        onChange={handleInputChange}
                        onBlur={handleBlur}
                        inputProps={{
                            step: 10,
                            min: 0,
                            max: 100,
                            type: 'number',
                            'aria-labelledby': 'input-slider',
                        }}
                    />
                </Grid>
            </Grid>
        </Box>
    )
}