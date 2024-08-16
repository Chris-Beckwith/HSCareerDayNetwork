import { TableCell, TableRow } from "@mui/material"
import { Career } from "../../app/models/career"
import { Delete } from "@mui/icons-material"
import { LoadingButton } from "@mui/lab"
import { MouseEvent, useState } from "react"
import agent from "../../app/api/agent"
import { useAppDispatch } from "../../app/store/configureStore"
import { reloadCareers } from "./careerSlice"

interface Props {
    career: Career
    handleSelectCareer: (career: Career) => void
}

export default function CareerCard({ career, handleSelectCareer }: Props) {
    const [loading, setLoading] = useState(false)
    const [target, setTarget] = useState(0)
    const dispatch = useAppDispatch()

    function handleDeleteCareer(event: MouseEvent<HTMLButtonElement, globalThis.MouseEvent>, id: number) {
        event.stopPropagation()
        setLoading(true);
        setTarget(id);
        console.log("Delete Clicked")
        agent.Career.delete(id)
            .then(() => dispatch(reloadCareers()))
            .catch(error => console.log(error))
            .finally(() => setLoading(false))
    }

    return (
        <TableRow key={career.id}
            onClick={() => handleSelectCareer(career)}
            sx={{ cursor: "pointer" }}
            hover
        >
            <TableCell>{career.courseId} - {career.name}</TableCell>
            <TableCell>{career.description}</TableCell>
            <TableCell align="right">
                <LoadingButton
                    loading={loading && target === career.id}
                    startIcon={<Delete />}
                    color='error'
                    onClick={(e) => handleDeleteCareer(e, career.id)}
                />
            </TableCell>
        </TableRow>

    )
}