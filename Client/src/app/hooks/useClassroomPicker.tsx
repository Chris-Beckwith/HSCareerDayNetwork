import { useCallback, useEffect } from "react";
import { useAppDispatch, useAppSelector } from "../store/configureStore";
import { fetchClassroomPickerPageAsync, setClassroomPickerParams } from "../../features/classroom/classroomPickerSlice";

export default function useClassroomPicker(schoolId: number) {
    const { classrooms, classroomsLoaded, status, hasMore, classroomParams, metaData } = useAppSelector(state => state.classroomPicker)
    const dispatch = useAppDispatch()

    const loadMore = useCallback(() => {
        if (status === 'idle' && hasMore) {
            dispatch(setClassroomPickerParams({pageNumber: classroomParams.pageNumber + 1}))
            dispatch(fetchClassroomPickerPageAsync(schoolId))
        }
    }, [classroomParams.pageNumber, dispatch, hasMore, schoolId, status])

    useEffect(() => {
        if (!classroomsLoaded) dispatch(fetchClassroomPickerPageAsync(schoolId))
    }, [classroomsLoaded, dispatch, schoolId])

    return {
        classrooms,
        status,
        hasMore,
        loadMore,
        classroomParams,
        metaData
    }
}