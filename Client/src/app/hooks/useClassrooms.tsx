import { useEffect } from "react";
import { classroomSelectors, getAllRoomsBySchoolAsync, setClassroomParams } from "../../features/classroom/classroomSlice";
import { useAppDispatch, useAppSelector } from "../store/configureStore";

export default function useClassrooms(schoolId: number, pageSize?: number) {
    const classrooms = useAppSelector(classroomSelectors.selectAll)
    const { classroomsLoaded, status, metaData, classroomParams } = useAppSelector(state => state.classrooms)
    const dispatch = useAppDispatch()

    useEffect(() => {
        if (pageSize) dispatch(setClassroomParams({ pageSize: pageSize }))
    }, [dispatch, pageSize])

    useEffect(() => {
        if (!classroomsLoaded) dispatch(getAllRoomsBySchoolAsync(schoolId))
    }, [classroomParams, classroomsLoaded, dispatch, schoolId])

    return {
        classrooms,
        classroomsLoaded,
        status,
        metaData,
        classroomParams
    }
}