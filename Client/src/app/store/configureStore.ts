import { configureStore } from "@reduxjs/toolkit";
import { TypedUseSelectorHook, useDispatch, useSelector } from "react-redux";
import { careerEventSlice } from "../../features/careerEvents/careerEventSlice";
import { schoolSlice } from "../../features/school/schoolSlice";
import { accountSlice } from "../../features/account/accountSlice";
import { speakerSlice } from "../../features/speaker/speakerSlice";
import { careerSlice } from "../../features/careers/careerSlice";
import { studentSlice } from "../../features/student/studentSlice";
import { classroomSlice } from "../../features/classroom/classroomSlice";
import { surveySlice } from "../../features/survey/surveySlice";
import { userSlice } from "../../features/account/userSlice";

export const store = configureStore({
    reducer: {
        careerEvents: careerEventSlice.reducer,
        schools: schoolSlice.reducer,
        classrooms: classroomSlice.reducer,
        students: studentSlice.reducer,
        surveys: surveySlice.reducer,
        speakers: speakerSlice.reducer,
        careers: careerSlice.reducer,
        account: accountSlice.reducer,
        user: userSlice.reducer
    }
})

export type RootState = ReturnType<typeof store.getState>
export type AppDispatch = typeof store.dispatch

export const useAppDispatch = () => useDispatch<AppDispatch>()
export const useAppSelector: TypedUseSelectorHook<RootState> = useSelector