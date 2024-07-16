import { Backdrop, Box, Typography } from "@mui/material";

interface Props {
    message?: string
}

export default function LoadingComponent({message = 'Loading...'}: Props) {
    return (
        <Backdrop open={true} invisible={true}>
            <Box display='flex' justifyContent='center' alignItems='center' height='100vh'>
                <img src="/images/Loading.gif" />
                <Typography variant="h4" sx={{justifyContent: 'center', position: 'fixed', top: '75%'}}>
                    {message}
                </Typography>
            </Box>
        </Backdrop>
    )
}