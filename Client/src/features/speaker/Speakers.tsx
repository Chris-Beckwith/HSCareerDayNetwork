import { Button, Typography } from "@mui/material"
import SpeakerList from "./SpeakerList"
import { useEffect } from "react"
import { useAppDispatch, useAppSelector } from "../../app/store/configureStore"
import LoadingComponent from "../../app/components/LoadingComponent"
import { getAllSpeakersAsync, speakerSelectors } from "./speakerSlice"

export default function Speakers() {
    const speakers = useAppSelector(speakerSelectors.selectAll)
    const dispatch = useAppDispatch();
    const { speakersLoaded } = useAppSelector(state => state.speakers)

    useEffect(() => {
        if (!speakersLoaded) dispatch(getAllSpeakersAsync())
    }, [speakersLoaded, dispatch])

    if (!speakersLoaded) return <LoadingComponent message="Loading Speakers.." />

    return (
        <>
            <Typography variant="h3">Speakers</Typography>
            <SpeakerList speakers={speakers} />
            <Button variant="contained">Add Speaker</Button>
        </>
    )
}