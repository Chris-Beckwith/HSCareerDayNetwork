import { Box, IconButton, TableCell, TableRow, Typography, useMediaQuery, useTheme } from "@mui/material"
import { Career } from "../../app/models/career"
import { Delete } from "@mui/icons-material"
import { MouseEvent, useState } from "react"
import agent from "../../app/api/agent"
import { useAppDispatch } from "../../app/store/configureStore"
import { reloadCareers } from "./careerSlice"
import ConfirmDelete from "../../app/components/ConfirmDelete"
import { blue, brown, deepOrange, indigo } from "@mui/material/colors"

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

/**
 * Component to display the career name, description and delete button
 * 
 * highlightRow - Set of rows selected (primary selections on survey)
 * highlightAlternate - Only for survey, set of alternate careers selected
 * onPrimaryCareers - Only for survey to denote if selecting primary or alternate careers
 */
export default function CareerCard({ career, handleSelectCareer, hideDescription, hideDelete, 
        highlightRow, highlightAlternate, onPrimaryCareers, survey }: Props) {
    const [loading, setLoading] = useState(false)
    const [showDeletePopup, setShowDeletePopup] = useState(false)
    const [target, setTarget] = useState<Career | undefined>(undefined)
    const dispatch = useAppDispatch()
    const theme = useTheme()
    const darkMode = theme.palette.mode === 'dark'
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
                return highlightRow ? (darkMode ? blue[900] : 'primary.light') : 'inherit'
            } else {
                if (highlightRow) {
                    return darkMode ? blue[900] : 'primary.light'
                } else if (highlightAlternate) {
                    return darkMode ? deepOrange[900] : 'warning.light'
                }
                return 'inherit'
            }
        } else {
            return highlightRow ? (darkMode ? blue[900] : 'primary.light') : 'inherit'
        }
    }

    function getHover() {
        if (survey) {
            if (onPrimaryCareers) {
                return highlightRow ? (darkMode ? indigo[900] : 'primary.main') : 'action.focus'
            } else {
                if (highlightAlternate) {
                    return darkMode ? brown[400] : 'warning.main'
                } else if (highlightRow) {
                    return darkMode ? blue[900] : 'primary.light'
                }
                return 'action.focus'
            }
        } else {
            return highlightRow ? (darkMode ? indigo[900] : 'primary.main') : 'action.focus'
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
                        <Box display='flex' justifyContent='space-between'>
                            <Box>
                                <Typography variant="body1" component="div" sx={{ fontWeight: 'bold' }}>
                                    {career.courseId} - {career.name}
                                </Typography>

                                {!hideDescription && (
                                    <Typography variant="body2" component="div" sx={{ color: 'text.secondary' }}>
                                        {career.description}
                                    </Typography>
                                )}
                            </Box>
                            {!hideDelete && 
                                <IconButton size="small" color='error' onClick={(e) => handleShowConfirmDelete(e, career)}>
                                    <Delete fontSize="small" />
                                </IconButton>
                            }
                        </Box>
                    </TableCell>
                ) : (
                    <>
                        <TableCell>{career.courseId} - {career.name}</TableCell>
                        {!hideDescription && <TableCell sx={{ whiteSpace: 'pre-line' }}>{career.description}</TableCell>}
                        {!hideDelete && <TableCell align="right">
                            <IconButton size="small" color='error' onClick={(e) => handleShowConfirmDelete(e, career)}>
                                <Delete fontSize="small" />
                            </IconButton>
                        </TableCell>}
                    </>
                )}
            </TableRow>

            <ConfirmDelete open={showDeletePopup} itemType="Career" itemName={career.name}
                handleClose={handleCloseDelete} confirmDelete={handleDeleteCareer} loading={loading} />
        </>
    )
}