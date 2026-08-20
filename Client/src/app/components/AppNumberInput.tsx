import { ArrowDropUp, ArrowDropDown } from "@mui/icons-material"
import { useMediaQuery, Tooltip, TextField, InputAdornment, Box, IconButton, useTheme } from "@mui/material"
import { useController, UseControllerProps } from "react-hook-form"
import { DEFAULT_FONT_SIZE } from "../util/constants"
import { useEffect, useRef } from "react"

interface Props extends UseControllerProps {
    label: string
    multiline?: boolean
    rows?: number
    type?: string
    inputProps?: React.InputHTMLAttributes<HTMLInputElement>
    min?: number
    max?: number
    tooltip?: string
}

export default function AppNumberInput(props: Props) {
    const {fieldState, field} = useController({...props, defaultValue: ''})
    const holdTimer = useRef<ReturnType<typeof setTimeout> | null>(null)
    const repeatTimer = useRef<ReturnType<typeof setTimeout> | null>(null)
    const valueRef = useRef(field.value || '')
    const inputRef = useRef<HTMLInputElement | null>(null)
    const isMobile = useMediaQuery(useTheme().breakpoints.down('sm'))

    useEffect(() => {
        valueRef.current = field.value || ''
    }, [field.value])

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        let value = e.target.value

        // Remove everything except digits
        value = value.replace(/\D/g, "")

        //Min/Max value check
        if (props.min !== undefined && Number(value) < props.min) return
        if (props.max !== undefined && Number(value) > props.max) return

        // Add commas
        if (value) value = Number(value).toLocaleString("en-US")

        field.onChange(value)
    }

    const changeNumber = (amount: number) => {
        const current = Number(valueRef.current?.replace(/,/g, '') || 0)
        const newValue = current + amount

        if (props.min === undefined && newValue < 0) return
        if (props.min !== undefined && newValue < props.min) return
        if (props.max !== undefined && newValue > props.max) return

        const formattedValue = newValue.toLocaleString()

        valueRef.current = formattedValue
        field.onChange(formattedValue)
    }

    const startChanging = (amount: number) => {
        changeNumber(amount)

        //Accelerating change speed
        let delay = 150
        const repeat = () => {
            changeNumber(amount)
            delay = Math.max(5, delay * 0.95)
            repeatTimer.current = setTimeout(repeat, delay)
        }

        holdTimer.current = setTimeout(repeat, 400)
    }

    const stopChanging = () => {
        if (holdTimer.current) {
            clearTimeout(holdTimer.current)
            holdTimer.current = null
        }

        if (repeatTimer.current) {
            clearInterval(repeatTimer.current)
            repeatTimer.current = null
        }
    }

    const changeRef = useRef(changeNumber)
    changeRef.current = changeNumber

    useEffect(() => {
        const input = inputRef.current
        if (!input) return

        const handleWheel = (e: WheelEvent) => {
            if (document.activeElement !== input) return
            e.preventDefault()
            changeRef.current(e.deltaY < 0 ? 1 : -1)
        }

        input.addEventListener('wheel', handleWheel, { passive: false })

        return () => {
            input.removeEventListener('wheel', handleWheel)
        }
    }, [])

    return (
        <Tooltip title={props.tooltip}>
            <TextField
                {...props}
                {...field}
                onChange={handleChange}
                inputRef={inputRef}
                value={field.value || ''}
                fullWidth
                variant='outlined'
                error={!!fieldState.error}
                helperText={fieldState.error?.message}
                inputProps={{
                    inputMode: "numeric",
                    ...props.inputProps
                }}
                InputProps={{
                    endAdornment: (
                        <InputAdornment position="end" sx={{ position: 'relative' }}>
                            <Box sx={{ display: 'flex', flexDirection: 'column' }}>
                                <IconButton
                                    size="small"
                                    onMouseDown={() => startChanging(1)}
                                    onMouseUp={stopChanging}
                                    onMouseLeave={stopChanging}
                                    sx={{ p: 0 }}
                                >
                                    <ArrowDropUp fontSize="small" />
                                </IconButton>
                                <IconButton
                                    size="small"
                                    onMouseDown={() => startChanging(-1)}
                                    onMouseUp={stopChanging}
                                    onMouseLeave={stopChanging}
                                    sx={{ p: 0 }}
                                >
                                    <ArrowDropDown fontSize="small" />
                                </IconButton>
                            </Box>
                        </InputAdornment>
                    )
                }}
                size={isMobile ? "small" : "medium"}
                sx={{
                    height: '100%',
                    '& .MuiInputBase-input': {
                        fontSize: DEFAULT_FONT_SIZE
                    },
                    ...(isMobile && {
                        '& .MuiInputLabel-root': {
                            transform: 'translate(14px, 7px) scale(1)',
                        },
                        '& .MuiInputLabel-shrink': {
                            transform: 'translate(14px, -10px) scale(0.75)',
                        },
                    })
                }}
            />
        </Tooltip>
    )
}