import { Grid, Typography, Paper } from "@mui/material";
import { Session } from "../../../app/models/session";
import { Career } from "../../../app/models/career";

interface Props {
    title: string
    selectedSessions: Session[]
    handleSelectSession: (session: Session) => void
    periods: number[]
    sessions: Session[]
    alternateCareers?: Career[]
    isAlt?: boolean
}

export default function SessionDisplay({title, selectedSessions, handleSelectSession, periods, sessions, alternateCareers, isAlt}: Props) {
    return (
        <Grid container item xs={12}>
            <Grid item xs={12}>
                <Typography><strong>{title}</strong></Typography>
            </Grid>
            {periods.map(period => (
                <Grid key={period} container item xs={4}>
                    {sessions.sort((a, b) => a.period - b.period).filter(s => s.period === period).map(s => (
                        <Grid key={s.id} container item xs={12} sx={{ alignItems: 'flex-start' }}>
                            <Paper elevation={8} onClick={() => handleSelectSession(s)}
                                sx={{ m: 1, p: 1, width: '100%', position: 'relative',
                                bgcolor: selectedSessions.some(ss => ss.id === s.id)
                                    ? isAlt || alternateCareers?.some(ac => ac.id === s.subject.id) 
                                        ? "warning.light" : "primary.light" 
                                    : "default",
                                cursor: 'pointer', '&:hover': { bgcolor: 'lightgray' } }}
                            >
                                <Typography variant="subtitle2" sx={{ position: 'absolute', top: 1, left: 4 }}>{period}</Typography>
                                <Grid item xs={12} sx={{ pl: 1 }}>
                                    <Typography color={
                                        selectedSessions.some(ss => ss.id === s.id) ? "default" :
                                        isAlt || alternateCareers?.some(ac => ac.id === s.subject.id) ? "warning.dark" : "primary.dark"
                                    } 
                                        sx={{ whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis' }}
                                    >
                                            <strong>{s.subject.name}</strong>
                                    </Typography>
                                    <Typography>Students #: {s.students.length}</Typography>
                                </Grid>
                            </Paper>
                        </Grid>
                    ))}
                </Grid>
            ))}
        </Grid>
    )
}