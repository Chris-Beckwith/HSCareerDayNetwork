import { Box, Grid, Paper, Skeleton } from "@mui/material";

export default function CareerEventDetailsSkeleton() {
    return (
        <>
            <Grid item xs={12} display='flex' justifyContent='center' sx={{ mt: 5, my: 2}}>
                <Skeleton animation="wave" height={70} width="80%"/>
            </Grid>
            
            <Grid item xs={6} display='flex' justifyContent='center' sx={{ mb: 3}}>
                <Skeleton animation="wave" height={30} width="80%" />
            </Grid>
            <Grid item xs={6} display='flex' justifyContent='center'>
                <Skeleton animation="wave" height={30} width="80%" />
            </Grid>

            <Grid container item xs={6} sx={{ mb: 2}}>
                <Grid item xs={12} display='flex' justifyContent='center'>
                    <Skeleton animation="wave" height={20} width="80%" />
                </Grid>
                <Grid item xs={12} display='flex' justifyContent='center'>
                    <Skeleton animation="wave" height={20} width="80%" />
                </Grid>
            </Grid>
            <Grid container item xs={6} display='flex' justifyContent='center' sx={{ mb: 3 }}>
                <Grid item xs={12}>
                    <Paper sx={{ p: 1, m: 1, backgroundColor: 'rgba(255, 255, 255, 0)' }}>
                        <Skeleton animation="wave" height={40}/>
                    </Paper>
                </Grid>
            </Grid>

            <Grid item xs={12} sx={{ mb: 2 }}>
                <Box display='flex' justifyContent='space-between' alignItems='center' sx={{ mb: 1 }}>
                    <Skeleton animation="wave" height={15} width="30%"/>
                    <Skeleton animation="wave" height={15} width="30%"/>
                </Box>
                <Skeleton animation="wave" height={8} width="100%" />
            </Grid>
        </>
    )
}