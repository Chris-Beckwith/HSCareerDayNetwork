import { Box, FormLabel, Grid, Slider, Input, useTheme, useMediaQuery, IconButton, InputAdornment, debounce, Typography } from "@mui/material";
import { useCallback, useEffect, useMemo, useRef, useState } from "react";
import { useAppDispatch } from "../../../app/store/configureStore";
import { setEventParams } from "../careerEventSlice";
import { ArrowDropDown, ArrowDropUp } from "@mui/icons-material";
import { DEFAULT_FONT_SIZE } from "../../../app/util/constants";

interface Props {
    surveyComplete: string
}

/**
 * Slider bar for filtering career events by percent of survey completion.
 */
export default function SurveyCompleteSlider({surveyComplete}: Props) {
    const [value, setValue] = useState(parseInt(surveyComplete))
    const sliderRef = useRef<HTMLDivElement>(null)
    const inputRef = useRef<HTMLDivElement>(null)
    const dispatch = useAppDispatch()
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))

    // eslint-disable-next-line react-hooks/exhaustive-deps
    const debouncedSlider = useMemo(() =>
        debounce((newValue: number) => {
            dispatch(setEventParams({surveyComplete: newValue}))
        }, 1000), [dispatch]
    )

    const handleSliderChange = (_event: Event, newValue: number | number[]) => {
        if (newValue as number !== value) {
            setValue(newValue as number)
            debouncedSlider(newValue as number)
        }
    }

    const handleInputChange = (event: React.ChangeEvent<HTMLInputElement>) => {
        if (event.target.value !== '') {
            let newValue = Number(event.target.value)
            if (newValue > 100) newValue = 100
            if (newValue < 0) newValue = 0
            if (newValue !== value) {
                setValue(newValue)
                debouncedSlider(newValue)
            }
        } else {
            if (value !== 0) {
                setValue(0)
                debouncedSlider(0)
            }
        }
    }

    const handleArrowChange = (isUp: boolean) => {
        const newValue = isUp ? Math.min(value + 10, 100) : Math.max(value - 10, 0)
        if (newValue !== value) {
            setValue(newValue)
            debouncedSlider(newValue)
        }
    }

    const handleWheelChange = useCallback((event: WheelEvent) => {
        event.preventDefault()
        event.stopPropagation()

        const amount = event.deltaY < 0 ? 1 : event.deltaY > 0 ?  -1 : 0
            
        let newValue = value + amount
        if (newValue > 100) newValue = 100
        if (newValue < 0) newValue = 0
        if (newValue !== value) {
            setValue(newValue)
            debouncedSlider(newValue)
        }
    },[debouncedSlider, value])


    useEffect(() => {
        const elements = [sliderRef.current, inputRef.current]

        const handleWheel = (event: WheelEvent) => {
            event.preventDefault()
            event.stopPropagation()
            
            handleWheelChange(event)
        }

        elements.forEach(element => {
            element?.addEventListener('wheel', handleWheel, { passive: false })
        })

        return () => {
            elements.forEach(element => {
                element?.removeEventListener('wheel', handleWheel)
            })
        }
    }, [handleWheelChange])

    useEffect(() => {
        return () => {
            debouncedSlider.clear()
        }
    }, [debouncedSlider])

    useEffect(() => {
        setValue(parseInt(surveyComplete))
    }, [surveyComplete])

    return (
        <Box sx={{ mb: 2, p: 2 }}>
            <FormLabel id="input-slider" sx={{ fontSize: isMobile ? "0.85rem" : "1rem" }}>
                <Typography fontSize={DEFAULT_FONT_SIZE}>
                    % Survey Completed
                </Typography>
            </FormLabel>
            <Grid container spacing={2} alignItems="center">
                <Grid item xs>
                    <Slider
                        value={typeof value === 'number' ? value : 0}
                        size={isMobile ? "small" : "medium"}
                        sx={{ mt: 1 }}
                        onChange={handleSliderChange}
                        aria-labelledby="input-slider"
                    />
                </Grid>
                <Grid item>
                    <Box ref={sliderRef}>
                        <Input
                            value={value}
                            size="small"
                            onChange={handleInputChange}
                            sx={{
                                fontSize: DEFAULT_FONT_SIZE,
                                width: '50px',
                                '& input::-webkit-outer-spin-button, & input::-webkit-inner-spin-button': {
                                    WebkitAppearance: 'none',
                                    margin: 0,
                                },
                                '& input[type=number]': {
                                    MozAppearance: 'textfield',
                                },
                            }}
                            inputProps={{
                                min: 0,
                                max: 100,
                                type: 'number',
                                'aria-labelledby': 'input-slider',
                            }}
                            endAdornment={
                                <InputAdornment position="end" sx={{ position: 'relative' }}>
                                    <Box sx={{ display: 'flex', flexDirection: 'column' }}>
                                        <IconButton
                                            size="small"
                                            onClick={() => handleArrowChange(true)}
                                            sx={{ p: 0, height: '14px' }}
                                        >
                                            <ArrowDropUp sx={{ fontSize: 16 }} />
                                        </IconButton>

                                        <IconButton
                                            size="small"
                                            onClick={() => handleArrowChange(false)}
                                            sx={{ p: 0, height: '14px' }}
                                        >
                                            <ArrowDropDown sx={{ fontSize: 16}} />
                                        </IconButton>
                                    </Box>
                                </InputAdornment>
                            }
                        />
                    </Box>
                </Grid>
            </Grid>
        </Box>
    )
}