import { configureStore } from "@reduxjs/toolkit";
import { TypedUseSelectorHook, useDispatch, useSelector } from "react-redux";
import { careerEventSlice } from "../../features/careerEvents/careerEventSlice";
import { schoolSlice } from "../../features/school/schoolSlice";
import { accountSlice } from "../../features/account/accountSlice";
import { speakerSlice } from "../../features/speaker/speakerSlice";

export const store = configureStore({
    reducer: {
        careerEvents: careerEventSlice.reducer,
        schools: schoolSlice.reducer,
        speakers: speakerSlice.reducer,
        account: accountSlice.reducer
    }
})

export type RootState = ReturnType<typeof store.getState>
export type AppDispatch = typeof store.dispatch

export const useAppDispatch = () => useDispatch<AppDispatch>()
export const useAppSelector: TypedUseSelectorHook<RootState> = useSelector