import { Card, CardHeader, CardContent, Typography, CardActions, Skeleton } from "@mui/material";


export default function SessionCardSkeleton() {
    return (
        <Card>
            <CardHeader
                title={<Skeleton variant="text" width="60%" />}
            />
            <CardContent sx={{ py: 0 }}>
                <Typography variant="body1" sx={{ display: 'flex', alignItems: 'center', alignContent: 'center' }}>
                    <Skeleton variant="text" width="50%" />
                    <Skeleton variant="rectangular" width={32} height={28} sx={{ ml: 1, borderRadius: '4px' }} />
                </Typography>
                <Typography variant="body1">
                    <Skeleton variant="text" width="70%" />
                </Typography>
                <Typography variant="body1">
                    <Skeleton variant="text" width="80%" />
                </Typography>
            </CardContent>
            <CardActions sx={{ py: 0, px: 1, m: 1 }}>
                <Skeleton variant="rectangular" width="100px" height="22px" sx={{ mr: 2, borderRadius: '4px' }} />
                <Skeleton variant="rectangular" width="140px" height="22px" sx={{ borderRadius: '4px' }} />
            </CardActions>
        </Card>
    )
}