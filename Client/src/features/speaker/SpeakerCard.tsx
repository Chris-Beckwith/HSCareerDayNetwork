import { ListItem, ListItemText, ListItemAvatar, Avatar } from "@mui/material";
import { Speaker } from "../../app/models/speaker";

interface Props {
    speaker: Speaker
}

export default function SpeakerCard({speaker}: Props) {
    return (
        <ListItem key={speaker.id}>
            <ListItemText>{speaker.firstName} {speaker.middleName} {speaker.lastName}</ListItemText>
            <ListItemText>{speaker.title}</ListItemText>
            <ListItemText>{speaker.company}</ListItemText>
            <ListItemAvatar>
                <Avatar src={speaker.portraitUrl} />
            </ListItemAvatar>
            <ListItemText>{speaker.email}</ListItemText>
            <ListItemText>{speaker.phoneNumber}</ListItemText>
        </ListItem>
    )
}