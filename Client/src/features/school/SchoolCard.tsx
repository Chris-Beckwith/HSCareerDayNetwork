import { ListItem, ListItemText } from "@mui/material"
import { School } from "../../app/models/school"

interface Props {
    school: School
}

export default function SchoolCard({school}: Props) {

    return (
        <ListItem key={school.id}>
            <ListItemText>{school.name}</ListItemText>
            <ListItemText>{school.address.address1}</ListItemText>
            <ListItemText>{school.address.city} {school.address.state}</ListItemText>
            <ListItemText>{school.address.zip} {school.address.country}</ListItemText>
            <ListItemText>{school.estimatedNumOfStudents}</ListItemText>
        </ListItem>
        
    )
}