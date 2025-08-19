import { Box, Button, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Typography } from "@mui/material"
import { MouseEvent, useState } from "react"
import { useAppDispatch } from "../../app/store/configureStore"
import { reloadSpeakers, setPageNumber, setSpeakerParams } from "./speakerSlice"
import { Speaker } from "../../app/models/speaker"
import SpeakerForm from "./SpeakerForm"
import { Delete } from "@mui/icons-material"
import agent from "../../app/api/agent"
import AppPagination from "../../app/components/AppPagination"
import useSpeakers from "../../app/hooks/useSpeakers"
import AppTextSearch from "../../app/components/AppTextSearch"
import ConfirmDelete from "../../app/components/ConfirmDelete"
import SpeakerSkeleton from "./components/SpeakerSkeleton"

export default function Speakers() {
    const dispatch = useAppDispatch();
    const { speakers, speakersLoaded, metaData, speakerParams } = useSpeakers()
    const [editMode, setEditMode] = useState(false)
    const [loading, setLoading] = useState(false)
    const [showDeletePopup, setShowDeletePopup] = useState(false)
    const [selectedSpeaker, setSelectedSpeaker] = useState<Speaker | undefined>(undefined)

    function handleSelectSpeaker(speaker: Speaker) {
        const normalizedSpeaker: Speaker = {
            id: speaker.id ?? '',
            firstName: speaker.firstName ?? '',
            middleName: speaker.middleName ?? '',
            lastName: speaker.lastName ?? '',
            title: speaker.title ?? '',
            company: speaker.company ?? '',
            schoolLastSpokeAt: speaker.schoolLastSpokeAt ?? null,
            phoneNumber: speaker.phoneNumber ?? '',
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
        setShowDeletePopup(true)
    }

    async function handleDeleteSpeaker() {
        setLoading(true)
        if (selectedSpeaker) {
            await agent.Speaker.delete(selectedSpeaker.id)
                .then(() => dispatch(reloadSpeakers()))
                .catch(error => console.log(error))
                .finally(() => {
                    setLoading(false)
                    setShowDeletePopup(false)
                    setSelectedSpeaker(undefined)
                })
        }
    }

    function handleCloseDelete() {
        if (selectedSpeaker) setSelectedSpeaker(undefined)
        setShowDeletePopup(false)
    }

    function cancelEdit() {
        if (selectedSpeaker) setSelectedSpeaker(undefined)
        setEditMode(false)
    }

    if (editMode) return <SpeakerForm speaker={selectedSpeaker} cancelEdit={cancelEdit} />

    return (
        <>
            <Box display='flex' justifyContent='space-between' alignItems='center' sx={{mb: 2}}>
                <Typography variant="h3">Speakers</Typography>
                <Box>
                    <AppTextSearch label="Search Speakers"
                        stateSearchTerm={speakerParams.searchTerm} setParams={setSpeakerParams} />
                </Box>
                <Button variant="contained" onClick={() => setEditMode(true)}>New Speaker</Button>
            </Box>
            <TableContainer component={Paper}>
                <Table>
                    <TableHead>
                        <TableRow>
                            <TableCell>Photo</TableCell>
                            <TableCell>Name</TableCell>
                            <TableCell>Title</TableCell>
                            <TableCell>Company</TableCell>
                            <TableCell>Email</TableCell>
                            <TableCell>Phone Number</TableCell>
                            <TableCell align="right" width={160}></TableCell>
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
                                                {speaker.portraitUrl ?
                                                    <img src={speaker.portraitUrl} alt={speaker.lastName} style={{ height: 50, marginRight: 20 }} />
                                                    :
                                                    <img src="/images/Silhouette_No_Profile_Pic.png" alt={speaker.lastName} style={{ height: 50, marginRight: 20 }} />
                                                }
                                            </Box>
                                        </TableCell>
                                        <TableCell>
                                            {speaker.firstName} {speaker.middleName} {speaker.lastName}
                                        </TableCell>
                                        <TableCell>{speaker.title}</TableCell>
                                        <TableCell>{speaker.company}</TableCell>
                                        <TableCell>{speaker.email}</TableCell>
                                        <TableCell>{speaker.phoneNumber}</TableCell>
                                        <TableCell align="right">
                                            <Button
                                                startIcon={<Delete />}
                                                color='error'
                                                onClick={(e) => handleShowDeletePopup(e, speaker)}
                                            />
                                        </TableCell>
                                    </>
                                )}
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>
            <Box sx={{ mt: 2 }}>
                {metaData &&
                    <AppPagination
                        metaData={metaData}
                        onPageChange={(page: number) => dispatch(setPageNumber({ pageNumber: page }))}
                    />
                }
            </Box>
            
            <ConfirmDelete open={showDeletePopup} itemType="Speaker" itemName={`${selectedSpeaker?.firstName || ''} ${selectedSpeaker?.lastName || ''}`}
                handleClose={handleCloseDelete} confirmDelete={handleDeleteSpeaker} loading={loading} />
        </>
    )
}