import { useEffect } from "react"
import { getAllSchoolsAsync, schoolSelectors } from "../../features/school/schoolSlice"
import { useAppSelector, useAppDispatch } from "../store/configureStore"

export default function useSchools() {
    const schools = useAppSelector(schoolSelectors.selectAll)
    const {schoolsLoaded, status, metaData, schoolParams} = useAppSelector(state => state.schools)
    const dispatch = useAppDispatch()

    useEffect(() => {
        if (!schoolsLoaded) dispatch(getAllSchoolsAsync())
    }, [schoolsLoaded, dispatch])

    return {
        schools,
        schoolsLoaded,
        status,
        metaData,
        schoolParams
    }    
}