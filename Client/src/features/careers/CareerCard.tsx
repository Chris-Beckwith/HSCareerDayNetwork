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
    hideDescription?: boolean
    hideDelete?: boolean
    highlightRow?: boolean
}

export default function CareerCard({ career, handleSelectCareer, hideDescription, hideDelete, highlightRow }: Props) {
    const [loading, setLoading] = useState(false)
    const [target, setTarget] = useState(0)
    const dispatch = useAppDispatch()

    function handleDeleteCareer(event: MouseEvent<HTMLButtonElement, globalThis.MouseEvent>, id: number) {
        event.stopPropagation()
        setLoading(true)
        setTarget(id)
        agent.Career.delete(id)
            .then(() => dispatch(reloadCareers()))
            .catch(error => console.log(error))
            .finally(() => setLoading(false))
    }

    return (
        <TableRow key={career.id}
            onClick={() => handleSelectCareer(career)}
            hover
            sx={{
                cursor: "pointer",
                bgcolor: highlightRow ? "primary.light" : "inherit",
                '&.MuiTableRow-root:hover': {
                    bgcolor: highlightRow ? 'primary.main' : 'rgba(0, 0, 0, 0.07)',
                },
            }}
        >
            <TableCell>{career.courseId} - {career.name}</TableCell>
            {!hideDescription && <TableCell>{career.description}</TableCell>}
            {!hideDelete && <TableCell align="right">
                <LoadingButton
                    loading={loading && target === career.id}
                    startIcon={<Delete />}
                    color='error'
                    onClick={(e) => handleDeleteCareer(e, career.id)}
                />
            </TableCell>}
        </TableRow>

    )
}