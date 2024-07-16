import { TextField, debounce } from "@mui/material";
import { useAppDispatch, useAppSelector } from "../../app/store/configureStore";
import { setEventParams } from "./careerEventSlice";
import { useState } from "react";

export default function CareerEventSearch() {
    const {eventParams} = useAppSelector(state => state.careerEvents)
    const dispatch = useAppDispatch()
    const [searchTerm, setSearchTerm] = useState(eventParams.searchTerm)

    const debouncedSearch = debounce((event: any) => {
        dispatch(setEventParams({searchTerm: event.target.value}))
    }, 1000)

    return (
        <TextField
            label='Search Events'
            variant='outlined'
            fullWidth
            value={searchTerm || ''}
            onChange={(event: any) => {
                setSearchTerm(event.target.value)
                debouncedSearch(event)
            }}
        />
    )
}