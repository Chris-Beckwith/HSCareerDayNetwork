import { useEffect } from "react"
import { careerSelectors, getAllCareerCategoriesAsync, getAllCareersAsync } from "../../features/careers/careerSlice"
import { useAppSelector, useAppDispatch } from "../store/configureStore"

export default function useCareers() {
    const careers = useAppSelector(careerSelectors.selectAll)
    const {careersLoaded, categoriesLoaded, categories, status} = useAppSelector(state => state.careers)
    const dispatch = useAppDispatch()

    useEffect(() => {
        if (!careersLoaded) dispatch(getAllCareersAsync())
    }, [careersLoaded, dispatch])

    useEffect(() => {
        if (!categoriesLoaded) dispatch(getAllCareerCategoriesAsync())
    }, [categoriesLoaded, dispatch])

    return {
        careers,
        careersLoaded,
        categories,
        categoriesLoaded,
        status
    }
}