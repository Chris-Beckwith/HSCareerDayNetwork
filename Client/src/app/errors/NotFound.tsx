import { Box, Button, Container, Divider, Grid, Paper, Typography, useMediaQuery, useTheme } from "@mui/material";
import { Link } from "react-router-dom";

/**
 * Component to display when a page does not exist
 */
export default function NotFound() {
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))

    return (
        <Container component={Paper}>
            <Typography gutterBottom variant={isTablet ? isMobile ? "h5" : "h4" : "h3"} textAlign="center" sx={{pt: 1}}>Page not found</Typography>
            <Divider sx={{mb: 1}} />
            <Grid container justifyContent='center'>
                <Box component="img" src="/images/err/flyingCat.gif" width="70%"/>
            </Grid>
            
            <Button fullWidth component={Link} to='/'>Home</Button>
        </Container>
    )
}