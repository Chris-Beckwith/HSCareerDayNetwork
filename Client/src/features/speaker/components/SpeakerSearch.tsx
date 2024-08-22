import { debounce, TextField } from "@mui/material"
import { useCallback, useState } from "react"
import { useAppSelector, useAppDispatch } from "../../../app/store/configureStore"
import { setSpeakerParams } from "../speakerSlice"

export default function SpeakerSearch() {
    const {speakerParams} = useAppSelector(state => state.speakers)
    const dispatch = useAppDispatch()
    const [searchTerm, setSearchTerm] = useState(speakerParams.searchTerm)

    // eslint-disable-next-line react-hooks/exhaustive-deps
    const debouncedSearch = useCallback(
        debounce((event) => {
            dispatch(setSpeakerParams({ searchTerm: event.target.value }));
        }, 1000), [dispatch]
    )

    return (
        <TextField
            label='Search Speakers'
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