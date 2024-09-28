import { Button, Card, CardActions, CardContent, CardHeader, Typography } from "@mui/material";
import { Session } from "../../app/models/session";

interface Props {
    session: Session
}

export default function SessionCard({ session }: Props) {
    return (
        <Card>
            <CardHeader 
                title={session.subject.name}
                titleTypographyProps={{
                    sx: {fontWeight: 'bold', color: 'primary.main'}
                }}
                sx={{ mb: 0, pb: 0 }}
            />
            <CardContent sx={{ py: 1 }}>
                <Typography variant="body1">Number of Students: {session.students.length}</Typography>
            </CardContent>
            <CardActions sx={{ py: 0, px: 1 }}>
                <Button>
                    View Students
                </Button>
                <Button>
                    Assign Room
                </Button>
            </CardActions>
        </Card>
    )
}