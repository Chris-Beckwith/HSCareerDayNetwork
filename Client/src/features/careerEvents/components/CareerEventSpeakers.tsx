import { Box, Typography, TableContainer, Paper, Table, TableHead, TableRow, TableCell, TableBody, TextField, TablePagination, useMediaQuery, useTheme } from "@mui/material";
import { Speaker } from "../../../app/models/speaker";
import { SetStateAction, useEffect, useMemo, useRef, useState } from "react";
import { Career } from "../../../app/models/career";
import AppButton from "../../../app/components/AppButton";
import useSpeakerPicker from "../../../app/hooks/useSpeakerPicker";
import AppTextSearch from "../../../app/components/AppTextSearch";
import { setSpeakerPickerSearchTerm } from "../../speaker/speakerPickerSlice";

interface Props {
    careerEventName: string
    careerEventSpeakers: Speaker[]
    updateCareerEvent: (speakers?: Speaker[], careers?: Career[]) => void
    back: () => void
}

/**
 * Component to show and change speakers assigned to an event.
 */
export default function CareerEventSpeakers({careerEventName, careerEventSpeakers, updateCareerEvent, back}: Props) {
    const { speakers, status, hasMore, loadMore, speakerParams, metaData } = useSpeakerPicker()
    const [eventSpeakers, setEventSpeakers] = useState<Speaker[]>(() => careerEventSpeakers)
    const [searchEventQuery, setSearchEventQuery] = useState('')
    const [page, setPage] = useState(0)
    const [rowsPerPage, setRowsPerPage] = useState(10)
    const isMobile = useMediaQuery(useTheme().breakpoints.down('sm'))
    const isTablet = useMediaQuery(useTheme().breakpoints.down('md'))
    
    const availableSpeakers = useMemo(() => {
        const ids = new Set(eventSpeakers.map(s => s.id))
        return speakers.filter(s => !ids.has(s.id))
    }, [eventSpeakers, speakers])

    useEffect(() => {
        if (availableSpeakers.length < 10 && hasMore)
            loadMore()
    }, [availableSpeakers.length, hasMore, loadMore])

    const bottomRef = useRef<HTMLTableRowElement | null>(null)

    useEffect(() => {
        if (!bottomRef.current) return

        const observer = new IntersectionObserver(
            entries => {
                if (entries[0].isIntersecting && hasMore && status === 'idle')
                    loadMore()
            },
            {
                rootMargin: '300px',
                threshold: 0
            }
        )

        observer.observe(bottomRef.current)
        return () => observer.disconnect()
    }, [hasMore, loadMore, status])

    const handleAddEventSpeaker = (speaker: Speaker) => {
        const newEventSpeakers = [...eventSpeakers, speaker]
        setEventSpeakers(newEventSpeakers)

        if (availableSpeakers.length < 10 && hasMore)
            loadMore()
    }

    const handleRemoveEventSpeaker = (speaker: Speaker) => {
        const newEventSpeakers = eventSpeakers.filter(s => s.id !== speaker.id)
        setEventSpeakers(newEventSpeakers)
    }

    const runFilter = (speakers: Speaker[], searchQuery: string) => {
        return speakers.filter(speaker => {
            const fullName = `${speaker.firstName} ${speaker.middleName || ''} ${speaker.lastName}`.toLowerCase();
            return fullName?.includes(searchQuery.toLowerCase()) ||
            speaker.email?.toLowerCase().includes(searchQuery.toLowerCase()) ||
            speaker.company?.toLowerCase().includes(searchQuery.toLowerCase()) ||
            speaker.title?.toLowerCase().includes(searchQuery.toLowerCase()) ||
            speaker.phoneNumbers?.some(phone =>
                `${phone.number}${phone.ext ? ` x${phone.ext}` : ""}`
                    .toLowerCase().includes(searchQuery.toLowerCase())
            )
        })
    }

    const filterSpeakers = (speakers: Speaker[]) => {
        if (!searchEventQuery) return speakers
        return runFilter(speakers, searchEventQuery)
    }

    const handleChangePage = (newPage: SetStateAction<number> | null) => {
        if (newPage != null)
            setPage(newPage)
    }

    const handleChangeRowsPerPage = (event: any) => {
        setRowsPerPage(parseInt(event.target.value, 10))
        setPage(0)
    }

    const paginatedSpeakers = (speakers: Speaker[]) => {
        const filtered = filterSpeakers(speakers)
        return filtered.slice(page * rowsPerPage, page * rowsPerPage + rowsPerPage)
    }

    return (
        <>
            <Typography variant={isMobile ? "h5" : "h4"} display='flex' justifyContent='center' sx={{mb: 4}}>{careerEventName}</Typography>

            <Box display='grid' alignItems='center' gridTemplateColumns='1fr auto 1fr' sx={{ m: 2 }}>
                <Box justifySelf="start">
                    <AppButton variant="contained" color="inherit" onClick={back}>Back</AppButton>
                </Box>
                
                <Typography variant={isMobile ? "h6" : "h5"} align="center" justifySelf="center">Event Speakers</Typography>
                
                <Box justifySelf="end">
                    <TextField
                        label="Search"
                        variant="outlined"
                        size={isTablet ? "small" : "medium"}
                        fullWidth
                        value={searchEventQuery}
                        onChange={(e) => setSearchEventQuery(e.target.value)}
                    />
                </Box>
            </Box>
            <TableContainer component={Paper}>
                <Table sx={{ '& .MuiTableCell-root': { fontSize: isMobile ? '0.75rem' : '0.875rem' } }}>
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
                        {paginatedSpeakers(eventSpeakers).map(speaker => (
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
                                <TableCell>{speaker.phoneNumbers[0]?.number}
                                    {speaker.phoneNumbers[0]?.ext && ` x${speaker.phoneNumbers[0]?.ext}` }
                                </TableCell>
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>

            <TablePagination
                rowsPerPageOptions={[5, 10, 25, 50]}
                component="div"
                count={filterSpeakers(eventSpeakers).length}
                rowsPerPage={rowsPerPage}
                page={page}
                onPageChange={(_event, page) => handleChangePage(page)}
                onRowsPerPageChange={handleChangeRowsPerPage}
            />

            <Box display='flex' justifyContent='space-between' alignItems='center' sx={{ m: 2 }}>
                <Typography variant={isMobile ? "h6" : "h5"}>Speakers</Typography>
                <Box>
                    <Typography variant={isMobile ? "body2" : "body1"}>
                        <span style={{ textDecoration: 'underline' }}>Available Speakers:</span>
                        <span style={{ fontWeight: 'bold', textDecorationLine: 'none', paddingLeft: '4px' }}>
                            {metaData && (speakerParams.searchTerm ? metaData?.totalCount : metaData?.totalCount - eventSpeakers.length)}
                        </span>
                    </Typography>
                </Box>
                <Box>
                    <AppTextSearch label="Search Speakers"
                        stateSearchTerm={speakerParams.searchTerm} setParams={setSpeakerPickerSearchTerm} />
                </Box>
            </Box>
            <TableContainer component={Paper} sx={{ maxHeight: isTablet ? isMobile ? 500 : 575 : 650, overflow: 'auto' }}>
                <Table sx={{ '& .MuiTableCell-root': { fontSize: isMobile ? '0.75rem' : '0.875rem' } }} stickyHeader>
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
                        {availableSpeakers.map((speaker, index) => (
                            <TableRow
                                key={speaker.id}
                                onClick={() => handleAddEventSpeaker(speaker)}
                                sx={{ cursor: "pointer" }}
                                ref={index === availableSpeakers.length -1 ? bottomRef : null}
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
                                <TableCell>{speaker.phoneNumbers[0]?.number}
                                    {speaker.phoneNumbers[0]?.ext && ` x${speaker.phoneNumbers[0]?.ext}` }</TableCell>
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>
            
            <Box display='flex' justifyContent="flex-end" sx={{ pt: 1, mb: 2 }}>
                <AppButton variant="contained" onClick={() => {
                        updateCareerEvent(eventSpeakers)
                        back()
                    }}>
                    Update Speakers
                </AppButton>
            </Box>
        </>
    )
}