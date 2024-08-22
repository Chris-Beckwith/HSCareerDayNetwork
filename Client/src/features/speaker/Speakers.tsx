import { Box, Button, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Typography } from "@mui/material"
import { MouseEvent, useEffect, useState } from "react"
import { useAppDispatch, useAppSelector } from "../../app/store/configureStore"
import LoadingComponent from "../../app/components/LoadingComponent"
import { getAllSpeakersAsync, removeSpeaker, setPageNumber, speakerSelectors } from "./speakerSlice"
import { Speaker } from "../../app/models/speaker"
import SpeakerForm from "./SpeakerForm"
import { Delete } from "@mui/icons-material"
import { LoadingButton } from "@mui/lab"
import agent from "../../app/api/agent"
import AppPagination from "../../app/components/AppPagination"
import SpeakerSearch from "./components/SpeakerSearch"

export default function Speakers() {
    const speakers = useAppSelector(speakerSelectors.selectAll)
    const dispatch = useAppDispatch();
    const { speakersLoaded, status, metaData } = useAppSelector(state => state.speakers)
    const [editMode, setEditMode] = useState(false)
    const [loading, setLoading] = useState(false)
    const [target, setTarget] = useState(0)
    const [selectedSpeaker, setSelectedSpeaker] = useState<Speaker | undefined>(undefined)

    useEffect(() => {
        if (!speakersLoaded) dispatch(getAllSpeakersAsync())
    }, [speakersLoaded, dispatch])

    function handleSelectSpeaker(speaker: Speaker) {
        setSelectedSpeaker(speaker)
        setEditMode(true)
    }

    function handleDeleteSpeaker(event: MouseEvent<HTMLButtonElement, globalThis.MouseEvent>, id: number) {
        event.stopPropagation()
        setLoading(true);
        setTarget(id);
        agent.Speaker.delete(id)
            .then(() => dispatch(removeSpeaker(id)))
            .catch(error => console.log(error))
            .finally(() => setLoading(false))
    }

    function cancelEdit() {
        if (selectedSpeaker) setSelectedSpeaker(undefined)
        setEditMode(false)
    }

    if (!speakersLoaded && status != 'idle') return <LoadingComponent message="Loading Speakers.." />

    if (editMode) return <SpeakerForm speaker={selectedSpeaker} cancelEdit={cancelEdit} />

    return (
        <>
            <Box display='flex' justifyContent='space-between' alignItems='center' sx={{mb: 2}}>
                <Typography variant="h3">Speakers</Typography>
                <Box>
                    <SpeakerSearch />
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
                                    <LoadingButton
                                            loading={loading && target === speaker.id}
                                            startIcon={<Delete />}
                                            color='error'
                                            onClick={(e) => handleDeleteSpeaker(e, speaker.id)}
                                    />
                                </TableCell>
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
        </>
    )
}