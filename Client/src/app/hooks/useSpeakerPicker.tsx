import { useCallback, useEffect } from "react";
import { useAppSelector, useAppDispatch } from "../store/configureStore";
import { fetchSpeakerPickerPageAsync, setSpeakerPickerParams } from "../../features/speaker/speakerPickerSlice";

export default function useSpeakerPicker() {
    const { speakers, speakersLoaded, status, hasMore, speakerParams, metaData } = useAppSelector(state => state.speakerPicker)
    const dispatch = useAppDispatch()

    const loadMore = useCallback(() => {
        if (status === 'idle' && hasMore) {
            dispatch(setSpeakerPickerParams({pageNumber: speakerParams.pageNumber + 1}))
            dispatch(fetchSpeakerPickerPageAsync())
        }
    }, [dispatch, hasMore, speakerParams.pageNumber, status])

    useEffect(() => {
        if (!speakersLoaded) dispatch(fetchSpeakerPickerPageAsync())
    }, [dispatch, speakersLoaded])

    return {
        speakers,
        status,
        hasMore,
        loadMore,
        speakerParams,
        metaData
    }
}