import { Button, TableCell, TableRow, Typography, useMediaQuery, useTheme } from "@mui/material"
import { Career } from "../../app/models/career"
import { Delete } from "@mui/icons-material"
import { MouseEvent, useState } from "react"
import agent from "../../app/api/agent"
import { useAppDispatch } from "../../app/store/configureStore"
import { reloadCareers } from "./careerSlice"
import ConfirmDelete from "../../app/components/ConfirmDelete"

interface Props {
    career: Career
    handleSelectCareer: (career: Career) => void
    hideDescription?: boolean
    hideDelete?: boolean
    highlightRow?: boolean
    highlightAlternate?: boolean
    onPrimaryCareers?: boolean
    survey?: boolean
}

export default function CareerCard({ career, handleSelectCareer, hideDescription, hideDelete, 
        highlightRow, highlightAlternate, onPrimaryCareers, survey }: Props) {
    const [loading, setLoading] = useState(false)
    const [showDeletePopup, setShowDeletePopup] = useState(false)
    const [target, setTarget] = useState<Career | undefined>(undefined)
    const dispatch = useAppDispatch()
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))

    
    function handleShowConfirmDelete(event: MouseEvent<HTMLButtonElement, globalThis.MouseEvent>, deleteCareer: Career) {
        event.stopPropagation()
        setTarget(deleteCareer)
        setShowDeletePopup(true)
    }

    async function handleDeleteCareer() {
        setLoading(true)
        if (target) {
            await agent.Career.delete(target.id)
                .then(() => dispatch(reloadCareers()))
                .catch(error => console.log(error))
                .finally(() => {
                    setLoading(false)
                    setTarget(undefined)
                    setShowDeletePopup(false)
                })
        }
    }

    function handleCloseDelete() {
        if (target) setTarget(undefined)
        setShowDeletePopup(false)
    }

    function getHighlight() {
        if (survey) {
            if (onPrimaryCareers) {
                return highlightRow ? "primary.light" : "inherit"
            } else {
                if (highlightRow) {
                    return "primary.main"
                } else if (highlightAlternate) {
                    return "warning.light"
                }
                return "inherit"
            }
        } else {
            return highlightRow ? "primary.light" : "inherit"
        }
    }

    function getHover() {
        if (survey) {
            if (onPrimaryCareers) {
                return highlightRow ? 'primary.main' : 'rgba(0, 0, 0, 0.07)'
            } else {
                if (highlightAlternate) {
                    return 'warning.main'
                } else if (highlightRow) {
                    return 'primary.main'
                }
                return 'inherit'
            }
        } else {
            return highlightRow ? 'primary.main' : 'rgba(0, 0, 0, 0.07)'
        }
    }

    function handleOnClick(career: Career) {
        if (survey && !onPrimaryCareers && highlightRow) {
            return;
        } else {
            handleSelectCareer(career)
        }
    }

    return (
        <>
            <TableRow key={career.id}
                onClick={() => handleOnClick(career)}
                hover
                sx={{
                    cursor: survey ? (!onPrimaryCareers && highlightRow ? "inherit" : "pointer") : "pointer",
                    bgcolor: getHighlight(),
                    '&.MuiTableRow-root:hover': {
                        bgcolor: getHover(),
                    },
                }}
            >
                {isMobile ? (
                    <TableCell sx={{ display: 'flex', flexDirection: 'column', p: '8px' }}>
                        <Typography variant="body1" component="div" sx={{ fontWeight: 'bold' }}>
                            {career.courseId} - {career.name}
                        </Typography>

                        {!hideDescription && (
                            <Typography variant="body2" component="div" sx={{ color: 'text.secondary' }}>
                                {career.description}
                            </Typography>
                        )}
                    </TableCell>
                ) : (
                    <>
                        <TableCell>{career.courseId} - {career.name}</TableCell>
                        {!hideDescription && <TableCell>{career.description}</TableCell>}
                        {!hideDelete && <TableCell align="right">
                            <Button
                                startIcon={<Delete />}
                                color='error'
                                onClick={(e) => handleShowConfirmDelete(e, career)}
                            />
                        </TableCell>}
                    </>
                )}
            </TableRow>

            <ConfirmDelete open={showDeletePopup} itemType="Career" itemName={career.name}
                handleClose={handleCloseDelete} confirmDelete={handleDeleteCareer} loading={loading} />
        </>
    )
}