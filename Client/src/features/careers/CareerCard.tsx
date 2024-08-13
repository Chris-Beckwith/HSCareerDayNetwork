import { ListItem, ListItemText } from "@mui/material"
import { Career } from "../../app/models/career"

interface Props {
    career: Career
}

export default function CareerCard({career}: Props) {

    return (
        <ListItem key={career.id}>
            <ListItemText>{career.name}</ListItemText>
            <ListItemText>{career.courseId}</ListItemText>
            <ListItemText>{career.category}</ListItemText>
            <ListItemText>{career.description}</ListItemText>
            <ListItemText>{career.note}</ListItemText>
        </ListItem>
        
    )
}