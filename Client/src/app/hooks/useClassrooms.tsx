import { useEffect } from "react";
import { classroomSelectors, getAllRoomsBySchoolAsync } from "../../features/classroom/classroomSlice";
import { useAppDispatch, useAppSelector } from "../store/configureStore";

export default function useClassrooms(schoolId: number) {
    const classrooms = useAppSelector(classroomSelectors.selectAll)
    const { classroomsLoaded, status, metaData, classroomParams } = useAppSelector(state => state.classrooms)
    const dispatch = useAppDispatch()

    useEffect(() => {
        if (!classroomsLoaded) dispatch(getAllRoomsBySchoolAsync(schoolId))
    }, [classroomsLoaded, dispatch, schoolId])

    return {
        classrooms,
        classroomsLoaded,
        status,
        metaData,
        classroomParams
    }
}