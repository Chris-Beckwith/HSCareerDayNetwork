import { useEffect } from "react"
import { careerSelectors, getAllCareerCategoriesAsync, getAllCareersAsync, getAllCareerSetsAsync } from "../../features/careers/careerSlice"
import { useAppSelector, useAppDispatch } from "../store/configureStore"

export default function useCareers() {
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
        if (!careerSetsLoaded) dispatch(getAllCareerSetsAsync())
    }, [careerSetsLoaded, dispatch])

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