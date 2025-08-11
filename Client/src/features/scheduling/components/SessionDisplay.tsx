import { Grid, Typography, Paper } from "@mui/material";
import { Session } from "../../../app/models/session";
import { Career } from "../../../app/models/career";
import { ScheduleParams } from "../../../app/models/scheduleParams";

interface Props {
    title: string
    selectedSessions: Session[]
    handleSelectSession: (session: Session) => void
    periods: number[]
    sessions: Session[]
    alternateCareers?: Career[]
    isAlt?: boolean
    scheduleParams?: ScheduleParams
}

export default function SessionDisplay({title, selectedSessions, handleSelectSession, periods, sessions, alternateCareers, isAlt, scheduleParams}: Props) {
    return (
        <Grid container item xs={12}>
            <Grid item xs={12}>
                <Typography><strong>{title}</strong></Typography>
            </Grid>
            {periods.map(period => (
                <Grid key={period} container item xs={4}>
                    {sessions.sort((a, b) => a.period - b.period).filter(s => s.period === period).map(s => (
                        <Grid key={s.id} container item xs={12} sx={{ alignItems: 'flex-start' }}>
                            <Paper elevation={8} 
                                onClick={!scheduleParams || s.students.length < scheduleParams.maxClassSize ? () => handleSelectSession(s) : undefined}
                                sx={{ m: 1, p: 1, width: '100%', position: 'relative',
                                bgcolor: selectedSessions.some(ss => ss.id === s.id)
                                    ? isAlt || alternateCareers?.some(ac => ac.id === s.subject.id) 
                                        ? "warning.light" : "primary.light" 
                                    : !scheduleParams || s.students.length < scheduleParams.maxClassSize 
                                        ? 'default' : "darkgray",
                                cursor: !scheduleParams || s.students.length < scheduleParams.maxClassSize
                                    ? 'pointer'
                                    : 'not-allowed',
                                '&:hover': { bgcolor: !scheduleParams || s.students.length < scheduleParams.maxClassSize
                                    ? 'lightgray'
                                    : 'default', } }}
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