import { useMemo, useState } from "react"
import { Session } from "../../app/models/session"
import { Speaker } from "../../app/models/speaker"
import { Box, Button, Dialog, DialogActions, DialogContent, DialogTitle, IconButton, InputAdornment, Table, TableBody, TableCell, TableHead, TableRow, TextField, Typography } from "@mui/material"
import { Delete, Search } from "@mui/icons-material"
import PropagateSpeakerAssign from "./components/PropagateSpeakerAssign"

interface Props {
    session: Session
    availableSpeakers: Speaker[]
    updateSpeakers: (session: Session, speakers: Speaker[], propagate: boolean) => void
    triggerRefresh: () => void
    open: boolean
    handleClose: () => void
}

export default function SessionSpeakers({ session, availableSpeakers, updateSpeakers, triggerRefresh, open, handleClose }: Props) {
    const [currentSpeakers, setCurrentSpeakers] = useState<Speaker[]>(session.speakers)
    const [showPropConfirm, setShowPropConfirm] = useState(false)
    const [searchEventQuery, setSearchEventQuery] = useState('')

    const removeSpeaker = (speaker: Speaker) => {
        setCurrentSpeakers(prev => prev?.filter(s => s.id !== speaker.id))
    }

    const addSpeaker = (speaker: Speaker) => {
        setCurrentSpeakers(prev => [...prev, speaker])
    }

    const isSaveDisabled = useMemo(() => {
        return currentSpeakers.length === session.speakers.length &&
            currentSpeakers.every((speaker, index) => speaker.id === session.speakers[index].id)
    }, [currentSpeakers, session.speakers])

    const saveSpeakers = (propagate: boolean) => {
        updateSpeakers(session, currentSpeakers, propagate)
        triggerRefresh()
        setShowPropConfirm(false)
        handleClose()
    }

    const cancel = () => {
        setCurrentSpeakers(session.speakers)
        handleClose()
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

    const filterSpeakers = useMemo(() => {
        const speakers = availableSpeakers.filter(s => !currentSpeakers.some(sp => sp.id === s.id))

        speakers.push(...session.speakers.filter(s => !currentSpeakers.some(sp => sp.id === s.id)))

        return searchEventQuery ? runFilter(speakers, searchEventQuery) : speakers
    },[availableSpeakers, currentSpeakers, searchEventQuery, session.speakers])

    return (
        <>
            <Dialog open={open} onClose={cancel}>
                <DialogTitle>
                    Edit Speakers for Session {session.period} - {session.subject.name}
                </DialogTitle>
                <DialogContent>
                    <Box>
                        <Typography sx={{ fontStyle: 'italic', textDecoration: 'underline' }}>Current Speakers:</Typography>
                        {currentSpeakers.map(s => 
                            <Typography key={s.id} sx={{ pl: 1, display: 'flex', alignItems: 'center' }}>
                                {s.firstName} {s.middleName} {s.lastName}
                                <IconButton color="error" size="small" sx={{ pl: 1 }}
                                    onClick={() => removeSpeaker(s)}
                                >
                                    <Delete fontSize="small" />
                                </IconButton>
                            </Typography>
                        )}
                    </Box>

                    <Box sx={{ pt: 2, pb: 1, display: 'flex', justifyContent: 'center' }}>
                        <TextField variant="outlined" size="small"
                            value={searchEventQuery}
                            onChange={(e) => setSearchEventQuery(e.target.value)}
                            InputProps={{
                                startAdornment: 
                                    <InputAdornment position="start">
                                        <Search />
                                    </InputAdornment>
                            }}
                        />
                    </Box>

                    <Table>
                        <TableHead>
                            <TableRow>
                                <TableCell>Speaker</TableCell>
                                <TableCell>Careers</TableCell>
                            </TableRow>
                        </TableHead>

                        <TableBody>
                            {filterSpeakers.map(speaker => (
                                    <TableRow key={speaker.id} sx={{ cursor: "pointer"}} hover
                                        onClick={() => addSpeaker(speaker)}
                                    >
                                        <TableCell>{[speaker.firstName, speaker.middleName, speaker.lastName].filter(Boolean).join(" ")}</TableCell>
                                        <TableCell>{speaker.careers?.map(c => c.name).join(", ")}</TableCell>
                                    </TableRow>
                                )
                            )}
                        </TableBody>
                    </Table>
                </DialogContent>
                <DialogActions>
                    <Button onClick={cancel}>Cancel</Button>
                    <Button disabled={isSaveDisabled} onClick={() => {
                        if (currentSpeakers.length > 0)
                            setShowPropConfirm(true)
                        else
                            saveSpeakers(false)
                    }}>
                        Save
                    </Button>
                </DialogActions>
            </Dialog>

            <PropagateSpeakerAssign open={showPropConfirm}
                currentSpeakers={currentSpeakers}
                session={session}
                handleClose={(propagate: boolean) => {
                    saveSpeakers(propagate)
                }}
            />
        </>
    )
}