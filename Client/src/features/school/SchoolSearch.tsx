import { debounce, TextField } from "@mui/material"
import { useCallback, useState } from "react"
import { useAppSelector, useAppDispatch } from "../../app/store/configureStore"
import { setSchoolParams } from "./schoolSlice"

export default function SchoolSearch() {
    const {schoolParams} = useAppSelector(state => state.schools)
    const dispatch = useAppDispatch()
    const [searchTerm, setSearchTerm] = useState(schoolParams.searchTerm)

    // eslint-disable-next-line react-hooks/exhaustive-deps
    const debouncedSearch = useCallback(
        debounce((event) => {
            dispatch(setSchoolParams({ searchTerm: event.target.value }));
        }, 1000), [dispatch]
    )

    return (
        <TextField
            label='Search Schools'
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