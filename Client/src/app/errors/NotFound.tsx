import { Box, Button, Container, Divider, Grid, Paper, Typography } from "@mui/material";
import { Link } from "react-router-dom";

export default function NotFound() {
    return (
        <Container component={Paper}>
            <Typography gutterBottom variant="h3" textAlign="center" sx={{pt: 1}}>Page not found</Typography>
            <Divider sx={{mb: 1}} />
            <Grid container justifyContent='center'>
                <Box component="img" src="/images/err/flyingCat.gif" width="70%"/>
            </Grid>
            
            <Button fullWidth component={Link} to='/'>Home</Button>
        </Container>
    )
}