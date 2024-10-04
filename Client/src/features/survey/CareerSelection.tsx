import { Typography, Button, Grid, Box, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, ButtonBase, useTheme, useMediaQuery, Divider, keyframes } from '@mui/material';
import { useEffect, useState } from 'react';
import { Career } from '../../app/models/career';
import CareerCard from '../careers/CareerCard';
import { toast } from 'react-toastify';
import { ArrowBack } from '@mui/icons-material';

interface Props {
    careers: Career[] | undefined
    primaryCareers: Career[]
    alternateCareers: Career[]
    onPrimaryCareers: boolean
    updateSelectedCareer: (career: Career, isPrimary: boolean, isAdd: boolean) => void
}

export default function CareerSelection({ careers, primaryCareers, alternateCareers, onPrimaryCareers,
                                                updateSelectedCareer }: Props) {
    const [categories, setCategories] = useState<string[]>([])
    const [hiddenCategories, setHiddenCategories] = useState<string[]>([])
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'));
    const [isFlashing, setIsFlashing] = useState(true)
    const [showHelperText, setShowHelperText] = useState(true)

    const pulseAnimation = keyframes`
        0% {
            transform: scale(1);
            // box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }
        50% {
            transform: scale(1.2);
            // box-shadow: 0 0 15px rgba(0, 0, 0, 0.6);
        }
        100% {
            transform: scale(1);
            // box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }
        `

    useEffect(() => {
        const timer = setTimeout(() => {
            setIsFlashing(false)
        }, 3000)

        return () => clearTimeout(timer)
    }, [])

    useEffect(() => {
        if (careers && careers.length > 0) {
            setCategories(
                Array.from(new Set(
                    careers.map(c => c.category)
                ))
            )
            setHiddenCategories(
                Array.from(new Set(
                    careers.map(c => c.category)
                ))
            )
        }
    }, [careers])

    const hideShowCategory = (category: string) => {
        setShowHelperText(false)
        setHiddenCategories(prevItems =>
            prevItems.includes(category)
                ? prevItems.filter(cat => cat !== category)
                : [...prevItems, category]
        )
    }

    const hideShowAllCategories = (hideAll: boolean) => {
        setShowHelperText(false)
        setHiddenCategories(hideAll ? categories : [])
    }

    function handleSelectCareer(career: Career) {
        const isSelected = onPrimaryCareers 
            ? primaryCareers.some(c => c.id === career.id)
            : alternateCareers.some(c => c.id === career.id)
        if ( !isSelected && ((onPrimaryCareers && primaryCareers.length === 3)
            || (!onPrimaryCareers && alternateCareers.length === 2)) ) {
            return toast.error("You are at the maximum selections, please remove one to select another")
        }
        updateSelectedCareer(career, onPrimaryCareers, !isSelected)
    }

    return (
        <>
            
            <Typography component="h1" variant={isMobile ? "h5" : "h4"} align="center">
                    {onPrimaryCareers ? "Primary Career Choices" : "Alternate Career Choices"}
            </Typography>
            <Typography variant='body1' align='center'>
                {onPrimaryCareers ? "Please select three (3) primary career choices you wish to learn about."
                    : "Please select two (2) alternate career choices as a backup"}
            </Typography>
            
            <Typography variant='body1' sx={{ display: showHelperText && isMobile ? 'flex' : 'none', alignItems: "center", textAlign: 'center', mt: 2 }}>
                <strong>Hit show all to display all available career choices</strong>
            </Typography>
            <Grid item sx={{ display:'flex', justifyContent:'space-between', mb: 2, mt: 1 }}>
                <Box sx={{ display: 'flex', flexDirection: 'row', alignItems: 'center', justifyContent: 'flex-start', textAlign: 'center' }}>
                    <Button variant='contained'
                        sx={{ animation: isFlashing ? `${pulseAnimation} 1s ease-in-out infinite` : "none",
                             transition: "background-color 0.5s ease-in-out", mr: 2 }}
                        onClick={() => hideShowAllCategories(hiddenCategories.length !== categories?.length)}>
                        {hiddenCategories.length !== categories?.length ? 'Hide All' : 'Show All'}
                    </Button>
                    <Typography variant='body1' sx={{ display: showHelperText && !isMobile ? 'flex' : 'none', alignItems: "center" }}>
                        <ArrowBack /> <strong>Hit show all to display all available career choices</strong>
                    </Typography>
                </Box>
                <Box sx={{ display: 'flex', flexDirection: 'column', justifyContent: onPrimaryCareers ? 'center' : 'flex-start'}}>
                    <Paper sx={{p: 0.7, bgcolor: 'primary.light', mb: !onPrimaryCareers ? 1 : 0, alignContent: 'center' }}>
                        <Typography variant='body1'>Primary Selection</Typography>
                    </Paper>
                    {!onPrimaryCareers && <Paper sx={{p: 0.7, bgcolor: 'warning.light', mb: 1}}>
                        <Typography variant='body1'>Alternate Selection</Typography>
                    </Paper>}
                </Box>
            </Grid>
            <Grid container spacing={2}>
                {categories?.map(category => (
                    <Grid item xs={12} md={6} key={category}>
                        <TableContainer component={Paper} elevation={8}>
                            <ButtonBase onClick={() => hideShowCategory(category)}
                                sx={{ width: '100%', textAlign: 'left', pl: 1 }}
                            >
                                <Box sx={{ display:'flex', justifyContent: 'space-between', width: '100%' }}>
                                    <Typography variant={isMobile ? "body1" : "h6"} sx={{ alignContent: 'center' }}>{category}</Typography>
                                    <Typography
                                        variant="button"
                                        color="primary"
                                        sx={{ pr: 2, cursor: 'pointer', alignSelf: 'center' }}>
                                        {hiddenCategories.includes(category) ? 'Show' : 'Hide'}
                                    </Typography>
                                </Box>
                            </ButtonBase>
                            {!hiddenCategories.includes(category) &&
                                <Table>
                                    <TableHead>
                                        <TableRow>
                                            {isMobile ? (
                                                <Divider />
                                            ) : (

                                                <>
                                                    <TableCell>Course ID - Name</TableCell>
                                                    <TableCell>Description</TableCell>
                                                </>
                                            )}
                                        </TableRow>
                                    </TableHead>
                                    <TableBody>
                                        {careers?.filter(career => career.category == category).map(career => (
                                            <CareerCard key={career.id} career={career}
                                                handleSelectCareer={handleSelectCareer}
                                                hideDescription={false} hideDelete={true}
                                                highlightRow={primaryCareers.some(c => c.id === career.id)}
                                                highlightAlternate={alternateCareers.some(c => c.id === career.id)}
                                                onPrimaryCareers={onPrimaryCareers}
                                                survey={true}
                                            />
                                        ))}
                                    </TableBody>
                                </Table>
                            }
                        </TableContainer>
                    </Grid>
                ))}
            </Grid>
        </>
    );
}