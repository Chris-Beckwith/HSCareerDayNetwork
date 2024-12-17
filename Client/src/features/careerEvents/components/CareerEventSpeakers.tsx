import { Box, Typography, TableContainer, Paper, Table, TableHead, TableRow, TableCell, TableBody, Button, TextField, TablePagination } from "@mui/material";
import { Speaker } from "../../../app/models/speaker";
import { SetStateAction, useEffect, useState } from "react";
import useSpeakers from "../../../app/hooks/useSpeakers";
import { Career } from "../../../app/models/career";

interface Props {
    careerEventName: string
    careerEventSpeakers: Speaker[]
    updateCareerEvent: (speakers?: Speaker[], careers?: Career[]) => void
    back: () => void
}

export default function CareerEventSpeakers({careerEventName, careerEventSpeakers, updateCareerEvent, back}: Props) {
    const { speakers } = useSpeakers()
    const [availableSpeakers, setAvailableSpeakers] = useState<Speaker[]>([])
    const [eventSpeakers, setEventSpeakers] = useState<Speaker[]>([])
    const [searchQuery, setSearchQuery] = useState('');
    const [searchEventQuery, setSearchEventQuery] = useState('')
    const [page, setPage] = useState(0);
    const [rowsPerPage, setRowsPerPage] = useState(25);

    useEffect(() => {
        if (eventSpeakers.length == 0)
            setEventSpeakers(careerEventSpeakers)
        setAvailableSpeakers(speakers.filter(s => !eventSpeakers.some(es => s.id === es.id)))
    }, [speakers, careerEventSpeakers, eventSpeakers])

    const updateAvailableSpeakers = () => {
        const updatedSpeakers = speakers.filter(s => !eventSpeakers.some(es => s.id === es.id))
        setAvailableSpeakers(updatedSpeakers)
    }

    const handleAddEventSpeaker = (speaker: Speaker) => {
        const newEventSpeakers = [...eventSpeakers, speaker]
        setEventSpeakers(newEventSpeakers)
        updateAvailableSpeakers()
    }

    const handleRemoveEventSpeaker = (speaker: Speaker) => {
        const newEventSpeakers = eventSpeakers.filter(s => s.id !== speaker.id)
        setEventSpeakers(newEventSpeakers)
        updateAvailableSpeakers()
    }

    const runFilter = (speakers: Speaker[], searchQuery: string) => {
        return speakers.filter(speaker => {
            const fullName = `${speaker.firstName} ${speaker.middleName || ''} ${speaker.lastName}`.toLowerCase();
            return fullName.includes(searchQuery.toLowerCase()) ||
            speaker.email.toLowerCase().includes(searchQuery.toLowerCase()) ||
            speaker.company.toLowerCase().includes(searchQuery.toLowerCase()) ||
            speaker.title.toLowerCase().includes(searchQuery.toLowerCase()) ||
            speaker.phoneNumber.toLowerCase().includes(searchQuery.toLowerCase());
        });
    }

    const filterSpeakers = (speakers: Speaker[], filterEventSpeakers: boolean) => {
        if (filterEventSpeakers) {
            if (!searchEventQuery) return speakers;
            return runFilter(speakers, searchEventQuery)
        } else {
            if (!searchQuery) return speakers;
            return runFilter(speakers, searchQuery)
        }
    };

    const handleChangePage = (newPage: SetStateAction<number> | null) => {
        if (newPage != null)
            setPage(newPage);
    };

    const handleChangeRowsPerPage = (event: any) => {
        setRowsPerPage(parseInt(event.target.value, 10));
        setPage(0);
    };

    const paginatedSpeakers = (speakers: Speaker[], filterEventSpeakers: boolean) => {
        const filtered = filterSpeakers(speakers, filterEventSpeakers);
        return filtered.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage);
    };

    return (
        <>
            <Typography variant="h3" display='flex' justifyContent='center' sx={{mb: 4}}>{careerEventName}</Typography>

            <Box display='flex' justifyContent='space-between' alignItems='center' sx={{ m: 2 }}>
                <Typography variant="h5">Event Speakers</Typography>

                <Box>
                    <TextField
                        label="Search"
                        variant="outlined"
                        size="small"
                        fullWidth
                        value={searchEventQuery}
                        onChange={(e) => setSearchEventQuery(e.target.value)}
                    />
                </Box>

                <Box>
                    <Button variant="contained" color="inherit" onClick={back} sx={{mr: 2}}>Back</Button>
                    <Button variant="contained" onClick={() => updateCareerEvent(eventSpeakers)}>Update Speakers</Button>
                </Box>
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
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {paginatedSpeakers(eventSpeakers, true).map(speaker => (
                            <TableRow
                                key={speaker.id}
                                onClick={() => handleRemoveEventSpeaker(speaker)}
                                sx={{ cursor: "pointer" }}
                                hover
                            >
                                <TableCell component="th" scope="row">
                                    <Box display='flex' alignItems='center'>
                                        <img src={speaker.portraitUrl || "/images/Silhouette_No_Profile_Pic.png"} 
                                            alt={speaker.lastName} style={{ height: 50, marginRight: 20 }} />
                                    </Box>
                                </TableCell>
                                <TableCell>
                                    {speaker.firstName} {speaker.middleName} {speaker.lastName}
                                </TableCell>
                                <TableCell>{speaker.title}</TableCell>
                                <TableCell>{speaker.company}</TableCell>
                                <TableCell>{speaker.email}</TableCell>
                                <TableCell>{speaker.phoneNumber}</TableCell>
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>

            <TablePagination
                rowsPerPageOptions={[5, 10, 25, 50]}
                component="div"
                count={filterSpeakers(eventSpeakers, true).length}
                rowsPerPage={rowsPerPage}
                page={page}
                onPageChange={(_event, page) => handleChangePage(page)}
                onRowsPerPageChange={handleChangeRowsPerPage}
            />

            <Box display='flex' justifyContent='space-between' alignItems='center' sx={{ m: 2 }}>
                <Typography variant="h5">Add Event Speakers</Typography>
                
                <Box>
                    <TextField
                        label="Search"
                        variant="outlined"
                        size="small"
                        fullWidth
                        value={searchQuery}
                        onChange={(e) => setSearchQuery(e.target.value)}
                    />
                </Box>
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
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {paginatedSpeakers(availableSpeakers, false).map(speaker => (
                            <TableRow
                                key={speaker.id}
                                onClick={() => handleAddEventSpeaker(speaker)}
                                sx={{ cursor: "pointer" }}
                                hover
                            >
                                <TableCell component="th" scope="row">
                                    <Box display='flex' alignItems='center'>
                                        <img src={speaker.portraitUrl || "/images/Silhouette_No_Profile_Pic.png"} 
                                            alt={speaker.lastName} style={{ height: 50, marginRight: 20 }} />
                                    </Box>
                                </TableCell>
                                <TableCell>
                                    {speaker.firstName} {speaker.middleName} {speaker.lastName}
                                </TableCell>
                                <TableCell>{speaker.title}</TableCell>
                                <TableCell>{speaker.company}</TableCell>
                                <TableCell>{speaker.email}</TableCell>
                                <TableCell>{speaker.phoneNumber}</TableCell>
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>
            <TablePagination
                rowsPerPageOptions={[5, 10, 25, 50]}
                component="div"
                count={filterSpeakers(availableSpeakers, false).length}
                rowsPerPage={rowsPerPage}
                page={page}
                onPageChange={(_event, page) => handleChangePage(page)}
                onRowsPerPageChange={handleChangeRowsPerPage}
            />
        </>
    )
}