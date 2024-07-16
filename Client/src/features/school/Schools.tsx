import { Button } from "@mui/material"
import SchoolList from "./SchoolList"
import { useAppDispatch, useAppSelector } from "../../app/store/configureStore"
import { getAllSchoolsAsync, schoolSelectors } from "./schoolSlice"
import { useEffect } from "react"
import LoadingComponent from "../../app/components/LoadingComponent"

export default function Schools() {
    const schools = useAppSelector(schoolSelectors.selectAll)
    const {schoolsLoaded, status} = useAppSelector(state => state.schools)
    const dispatch = useAppDispatch()

    useEffect(() => {
        if (!schoolsLoaded) dispatch(getAllSchoolsAsync())
    }, [schoolsLoaded, dispatch])

    if (status.includes('pending')) return <LoadingComponent message="Loading Schools.." />
    
    return (
        <>
            <SchoolList schools={schools} />
            <Button variant="contained">Add School</Button>
        </>
    )
}