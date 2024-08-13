import { Typography } from "@mui/material";
import LoadingComponent from "../../app/components/LoadingComponent";
import CareerList from "./CareerList";
import useCareers from "../../app/hooks/useCareers";

export default function Careers() {
    const {careers, status} = useCareers()

    if (status.includes('pending')) return <LoadingComponent message="Loading Careers.." />

    return (
        <>
            <Typography variant="h3">Careers</Typography>
            <CareerList careers={careers} />
        </>

    )
}