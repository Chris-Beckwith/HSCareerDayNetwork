import { useEffect } from "react";
import { speakerSelectors, getAllSpeakersAsync } from "../../features/speaker/speakerSlice";
import { useAppSelector, useAppDispatch } from "../store/configureStore";

export default function useSpeakers() {
    const speakers = useAppSelector(speakerSelectors.selectAll)
    const dispatch = useAppDispatch();
    const { speakersLoaded, status, metaData } = useAppSelector(state => state.speakers)
    
    useEffect(() => {
        if (!speakersLoaded) dispatch(getAllSpeakersAsync())
    }, [speakersLoaded, dispatch])

    return {
        speakers,
        speakersLoaded,
        status,
        metaData
    }
}