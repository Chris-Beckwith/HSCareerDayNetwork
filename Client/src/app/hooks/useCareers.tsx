import { useEffect } from "react"
import { careerSelectors, getAllCareerCategoriesAsync, getAllCareersAsync, getAllCareerSetsAsync } from "../../features/careers/careerSlice"
import { useAppSelector, useAppDispatch } from "../store/configureStore"
import { canManageCareerSets } from "../util/permissions"

export default function useCareers() {
    const { user } = useAppSelector(state => state.account)
    const careers = useAppSelector(careerSelectors.selectAll)
    const { careersLoaded, categoriesLoaded, categories, careerSetsLoaded, careerSets, status } = useAppSelector(state => state.careers)
    const dispatch = useAppDispatch()

    useEffect(() => {
        if (!careersLoaded) dispatch(getAllCareersAsync())
    }, [careersLoaded, dispatch])

    useEffect(() => {
        if (!categoriesLoaded) dispatch(getAllCareerCategoriesAsync())
    }, [categoriesLoaded, dispatch])

    useEffect(() => {
        if (!canManageCareerSets(user)) return
        if (!careerSetsLoaded) dispatch(getAllCareerSetsAsync())
    }, [careerSetsLoaded, dispatch, user])

    return {
        careers,
        careersLoaded,
        categories,
        categoriesLoaded,
        careerSets,
        careerSetsLoaded,
        status
    }
}