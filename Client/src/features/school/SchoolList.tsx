import { List } from "@mui/material"
import { School } from "../../app/models/school"
import SchoolCard from "./SchoolCard"

interface Props {
    schools: School[] | null
}

export default function SchoolList({schools}: Props) {
    return (
        <List>
            {schools?.map(school => (
                <SchoolCard key={school.id} school={school} />
            ))}
        </List>
        
    )
    
}