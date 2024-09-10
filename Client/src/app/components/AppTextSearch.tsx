import { useCallback, useState } from "react"
import { useAppDispatch } from "../store/configureStore"
import { debounce, TextField } from "@mui/material"

interface Props<T> {
    label: string
    stateSearchTerm: string | undefined
    setParams: (payload: T) => {
        payload: T
        type: string
    }
}

type SearchParams = {
    searchTerm: string
}

export default function AppTextSearch({ label, stateSearchTerm, setParams }: Props<SearchParams>) {
    const dispatch = useAppDispatch()
    const [searchTerm, setSearchTerm] = useState(stateSearchTerm)

    // eslint-disable-next-line react-hooks/exhaustive-deps
    const debouncedSearch = useCallback(
        debounce((event: any) => {
            dispatch(setParams({searchTerm: event.target.value}))
        }, 1000), [dispatch]
    )

    return (
        <TextField
            label={label}
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