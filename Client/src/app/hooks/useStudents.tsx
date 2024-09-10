import { useEffect } from "react";
import { fetchAllStudentsForEventAsync, studentSelectors } from "../../features/student/studentSlice";
import { useAppDispatch, useAppSelector } from "../store/configureStore";

export default function useStudents(eventId: number) {
    const students = useAppSelector(studentSelectors.selectAll)
    const { studentsLoaded, status, metaData, studentParams } = useAppSelector(state => state.students)
    const dispatch = useAppDispatch()

    useEffect(() => {
        if (!studentsLoaded) dispatch(fetchAllStudentsForEventAsync(eventId))
    }, [dispatch, eventId, studentsLoaded])

    return {
        students,
        studentsLoaded,
        status,
        metaData,
        studentParams
    }
}