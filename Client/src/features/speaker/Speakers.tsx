import { Box, Button, IconButton, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Typography, useMediaQuery, useTheme } from "@mui/material"
import { MouseEvent, useState } from "react"
import { useAppDispatch } from "../../app/store/configureStore"
import { reloadSpeakers, setPageNumber, setSpeakerSearchParams } from "./speakerSlice"
import { Speaker } from "../../app/models/speaker"
import SpeakerForm from "./SpeakerForm"
import { Delete, UploadFile } from "@mui/icons-material"
import agent from "../../app/api/agent"
import AppPagination from "../../app/components/AppPagination"
import useSpeakers from "../../app/hooks/useSpeakers"
import AppTextSearch from "../../app/components/AppTextSearch"
import ConfirmDelete from "../../app/components/ConfirmDelete"
import SpeakerSkeleton from "./components/SpeakerSkeleton"
import ExportSpeakers from "../../app/components/ExportSpeakers"
import { downloadExcel } from "../../app/util/util"

/**
 * Component to display the list of speakers added.
 */
export default function Speakers() {
    const dispatch = useAppDispatch()
    const { speakers, speakersLoaded, metaData, speakerParams } = useSpeakers()
    const [editMode, setEditMode] = useState(false)
    const [loading, setLoading] = useState(false)
    const [showDeleteDialog, setShowDeleteDialog] = useState(false)
    const [showExportDialog, setShowExportDialog] = useState(false)
    const [selectedSpeaker, setSelectedSpeaker] = useState<Speaker | undefined>(undefined)
    const theme = useTheme()
    const isDark = theme.palette.mode === 'dark'
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))

    function handleSelectSpeaker(speaker: Speaker) {
        const normalizedSpeaker: Speaker = {
            id: speaker.id ?? '',
            firstName: speaker.firstName ?? '',
            middleName: speaker.middleName ?? '',
            lastName: speaker.lastName ?? '',
            title: speaker.title ?? '',
            company: speaker.company ?? '',
            schoolLastSpokeAt: speaker.schoolLastSpokeAt ?? null,
            phoneNumbers: speaker.phoneNumbers,
            email: speaker.email ?? '',
            portraitUrl: speaker.portraitUrl ?? '',
            careers: speaker.careers ?? [],
            careerIds: speaker.careerIds ?? [],
            publicId: speaker.publicId ?? '',
            address: {
                id: speaker.address?.id ?? '',
                address1: speaker.address?.address1 ?? '',
                address2: speaker.address?.address2 ?? '',
                city: speaker.address?.city ?? '',
                state: speaker.address?.state ?? '',
                zip: speaker.address?.zip ?? '',
            }
        }
        setSelectedSpeaker(normalizedSpeaker)
        setEditMode(true)
    }

    function handleShowDeletePopup(event: MouseEvent<HTMLButtonElement, globalThis.MouseEvent>, speaker: Speaker) {
        event.stopPropagation()
        setSelectedSpeaker(speaker)
        setShowDeleteDialog(true)
    }

    async function handleDeleteSpeaker() {
        setLoading(true)
        if (selectedSpeaker) {
            await agent.Speaker.delete(selectedSpeaker.id)
                .then(() => dispatch(reloadSpeakers()))
                .catch(error => console.log(error))
                .finally(() => {
                    setLoading(false)
                    setShowDeleteDialog(false)
                    setSelectedSpeaker(undefined)
                })
        }
    }

    function handleCloseDelete() {
        if (selectedSpeaker) setSelectedSpeaker(undefined)
        setShowDeleteDialog(false)
    }

    function cancelEdit() {
        if (selectedSpeaker) setSelectedSpeaker(undefined)
        setEditMode(false)
    }

    async function exportSpeakers(portrait: boolean, address: boolean,
        subjects: boolean, lastSchool: boolean, filterSpeakers: boolean)
    {
        setLoading(true)

        const params = {
            searchTerm: filterSpeakers ? speakerParams.searchTerm : "",
            includeLastSchool: lastSchool,
            includePortrait: portrait,
            includeSubjects: subjects,
            includeAddress: address
        }

        await agent.Export.exportSpeakers(params)
            .then(response => downloadExcel(response))
            .catch(error => console.log(error))
            .finally(() => {
                setLoading(false)
                setShowExportDialog(false)
        })
    }

    if (editMode) return <SpeakerForm speaker={selectedSpeaker} cancelEdit={cancelEdit} />

    return (
        <>
            <Box display='flex' justifyContent='space-between' alignItems='center' sx={{mb: 2}}>
                <Typography variant={isTablet ? "h4" : "h3"}>Speakers</Typography>
                <Box>
                    <AppTextSearch label="Search Speakers"
                        stateSearchTerm={speakerParams.searchTerm} setParams={setSpeakerSearchParams} />
                </Box>
                <Button variant="contained" onClick={() => setEditMode(true)}
                    sx={{ fontSize: isMobile ? '0.75rem' : '0.875rem' }}
                >
                    New Speaker
                </Button>
            </Box>
            <TableContainer component={Paper}>
                <Table sx={{ '& .MuiTableCell-root': { fontSize: isTablet ? '0.75rem' : '0.875rem' } }}>
                    <TableHead>
                        <TableRow>
                            <TableCell>Photo</TableCell>
                            <TableCell>Name</TableCell>
                            <TableCell>Title</TableCell>
                            <TableCell>Company</TableCell>
                            <TableCell>Email</TableCell>
                            <TableCell>Phone Number</TableCell>
                            <TableCell align="right" sx={{ p: 0, pr: 2 }}>
                                <IconButton size="small" color="primary" onClick={() => setShowExportDialog(true)}>
                                    <UploadFile fontSize={isTablet ? "small" : "medium"} />
                                </IconButton>
                            </TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {speakers.map(speaker => (
                            <TableRow
                                key={speaker.id}
                                onClick={() => handleSelectSpeaker(speaker)}
                                sx={{cursor: "pointer"}}
                                hover
                            >
                                {!speakersLoaded ? (
                                    <SpeakerSkeleton />
                                ) : (
                                    <>
                                        <TableCell component="th" scope="row">
                                            <Box display='flex' alignItems='center'>
                                                <img src={speaker.portraitUrl || "/images/Silhouette_No_Profile_Pic.png"} alt={speaker.lastName} 
                                                    style={{ height: 50, marginRight: 20, 
                                                        filter: (isDark && !speaker.portraitUrl) ? 'invert(1) opacity(0.7)' : 'none'
                                                    }}
                                                />
                                            </Box>
                                        </TableCell>
                                        <TableCell>
                                            {speaker.firstName} {speaker.middleName} {speaker.lastName}
                                        </TableCell>
                                        <TableCell>{speaker.title}</TableCell>
                                        <TableCell>{speaker.company}</TableCell>
                                        <TableCell>{speaker.email}</TableCell>
                                        <TableCell>{speaker.phoneNumbers[0]?.number}
                                            {speaker.phoneNumbers[0]?.ext && ` x${speaker.phoneNumbers[0]?.ext}` }
                                        </TableCell>
                                        <TableCell align="right">
                                            <IconButton size="small" color='error' onClick={(e) => handleShowDeletePopup(e, speaker)}>
                                                <Delete fontSize="small" />
                                            </IconButton>
                                        </TableCell>
                                    </>
                                )}
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>
            <Box sx={{ my: 2 }}>
                {metaData &&
                    <AppPagination
                        metaData={metaData}
                        onPageChange={(page: number) => dispatch(setPageNumber({ pageNumber: page }))}
                    />
                }
            </Box>
            
            <ConfirmDelete open={showDeleteDialog} itemType="Speaker" itemName={`${selectedSpeaker?.firstName || ''} ${selectedSpeaker?.lastName || ''}`}
                handleClose={handleCloseDelete} confirmDelete={handleDeleteSpeaker} loading={loading} />
            <ExportSpeakers open={showExportDialog} handleClose={() => setShowExportDialog(false)} loading={loading}
                exportSpeakers={exportSpeakers} isFilterSpeakers={!!speakerParams.searchTerm} />
        </>
    )
}