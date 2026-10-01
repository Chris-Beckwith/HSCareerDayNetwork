import { Grid, Typography, Paper, useTheme, Tooltip } from "@mui/material";
import { Session } from "../../../app/models/session";
import { Career } from "../../../app/models/career";
import { ScheduleParams } from "../../../app/models/scheduleParams";
import { blue, deepOrange } from "@mui/material/colors";
import { DEFAULT_FONT_SIZE } from "../../../app/util/constants";

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
    const darkMode = useTheme().palette.mode === 'dark'

    function getBgColor(s: Session) {
        return selectedSessions.some(ss => ss.id === s.id)
            ? isAlt || alternateCareers?.some(ac => ac.id === s.subject.id) 
                ? darkMode ? deepOrange[900] : "warning.light" 
                : darkMode ? blue[900] : "primary.light" 
            : !scheduleParams || s.students.length < scheduleParams.maxClassSize 
                ? 'default' 
                : "action.disabled"
    }

    function getHover(s: Session) {
        return !scheduleParams || s.students.length < scheduleParams.maxClassSize
            ? 'action.focus'
            : 'default'
    }
    
    return (
        <Grid container item xs={12} columnSpacing={2}>
            <Grid item xs={12} mt={2}>
                <Typography><strong>{title}</strong></Typography>
            </Grid>
            {periods.map(period => (
                <Grid key={period} container item xs={4}>
                    {sessions.sort((a, b) => a.period - b.period).filter(s => s.period === period).map(s => (
                        <Grid key={s.id} container item xs={12} sx={{ alignItems: 'flex-start' }}>
                            <Paper elevation={8} 
                                onClick={!scheduleParams || s.students.length < scheduleParams.maxClassSize ? () => handleSelectSession(s) : undefined}
                                sx={{ my: 1, p: 1, width: '100%', position: 'relative', fontSize: DEFAULT_FONT_SIZE,
                                    bgcolor: getBgColor(s),
                                    cursor: !scheduleParams || s.students.length < scheduleParams.maxClassSize
                                        ? 'pointer'
                                        : 'not-allowed',
                                    '&:hover': { bgcolor: getHover(s) }
                                }}
                            >
                                <Typography variant="subtitle2" sx={{ position: 'absolute', top: 1, left: 4 }}>{period}</Typography>
                                <Grid item xs={12} sx={{ pl: 1 }}>
                                    <Tooltip title={s.subject.name}>
                                        <Typography color={
                                            selectedSessions.some(ss => ss.id === s.id) ? "default" :
                                            isAlt || alternateCareers?.some(ac => ac.id === s.subject.id) ? "warning.dark" : "primary.dark"
                                        } 
                                        sx={{ whiteSpace: 'nowrap', overflow: 'hidden', textOverflow: 'ellipsis', fontSize: DEFAULT_FONT_SIZE }}
                                        >
                                                <strong>{s.subject.name}</strong>
                                        </Typography>
                                    </Tooltip>
                                    <Typography sx={{ fontSize: DEFAULT_FONT_SIZE }}>Students #: {s.students.length}</Typography>
                                </Grid>
                            </Paper>
                        </Grid>
                    ))}
                </Grid>
            ))}
        </Grid>
    )
}