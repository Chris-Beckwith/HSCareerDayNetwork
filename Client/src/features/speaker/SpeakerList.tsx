import { List } from "@mui/material";
import { Speaker } from "../../app/models/speaker";
import SpeakerCard from "./SpeakerCard";

interface Props {
    speakers: Speaker[]
}

export default function SpeakerList({speakers}: Props) {
    return (
        <List>
            {speakers.map(speaker => (
                <SpeakerCard key={speaker.id} speaker={speaker} />
            ))}
        </List>
    )
}