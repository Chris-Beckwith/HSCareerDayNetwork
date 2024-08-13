import { List } from "@mui/material"
import { Career } from "../../app/models/career"
import CareerCard from "./CareerCard"

interface Props {
    careers: Career[] | null
}

export default function CareerList({careers}: Props) {
    return (
        <List>
            {careers?.map(careers => (
                <CareerCard key={careers.id} career={careers} />
            ))}
        </List>
        
    )
    
}