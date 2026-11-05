import { useEffect } from "react";
import { getAllLicensesAsync, licenseSelectors } from "../../features/licensing/licenseSlice";
import { useAppDispatch, useAppSelector } from "../store/configureStore";

export default function useLicenses() {
    const licenses = useAppSelector(licenseSelectors.selectAll)
    const {licensesLoaded, status, metaData, licenseParams} = useAppSelector(state => state.licenses)
    const dispatch = useAppDispatch()

    useEffect(() => {
        if (!licensesLoaded) dispatch(getAllLicensesAsync())
    }, [dispatch, licensesLoaded])

    return {
        licenses,
        licensesLoaded,
        status,
        metaData,
        licenseParams
    }
}