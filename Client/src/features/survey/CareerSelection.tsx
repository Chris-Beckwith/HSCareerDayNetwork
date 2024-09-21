import { Typography, Button, Grid, Box, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow } from '@mui/material';
import { useEffect, useState } from 'react';
import { Career } from '../../app/models/career';
import CareerCard from '../careers/CareerCard';
import { toast } from 'react-toastify';

interface Props {
    careers: Career[] | undefined
    primaryCareers: Career[]
    secondaryCareers: Career[]
    onPrimaryCareers: boolean
    updateSelectedCareer: (career: Career, isPrimary: boolean, isAdd: boolean) => void
}

export default function CareerSelection({ careers, primaryCareers, secondaryCareers, onPrimaryCareers,
                                                updateSelectedCareer }: Props) {
    const [categories, setCategories] = useState<string[]>([])
    const [hiddenCategories, setHiddenCategories] = useState<string[]>([])

    useEffect(() => {
        if (careers && careers.length > 0) {
            setCategories(
                Array.from(new Set(
                    careers.map(c => c.category)
                ))
            )
        }
    }, [careers])

    const hideShowCategory = (category: string) => {
        setHiddenCategories(prevItems =>
            prevItems.includes(category)
                ? prevItems.filter(cat => cat !== category)
                : [...prevItems, category]
        )
    }

    const hideShowAllCategories = (hideAll: boolean) => {
        setHiddenCategories(hideAll ? categories : [])
    }

    function handleSelectCareer(career: Career) {
        const isSelected = onPrimaryCareers 
            ? primaryCareers.some(c => c.id === career.id)
            : secondaryCareers.some(c => c.id === career.id)
        if ( !isSelected && ((onPrimaryCareers && primaryCareers.length === 3)
            || (!onPrimaryCareers && secondaryCareers.length === 2)) ) {
            return toast.error("You are at the maximum selections, please remove one to select another")
        }
        updateSelectedCareer(career, onPrimaryCareers, !isSelected)
    }

    return (
        <>
            
            <Typography component="h1" variant="h4" align="center">
                    {onPrimaryCareers ? "Primary Career Choices" : "Secondary Career Choices"}
            </Typography>
            <Typography variant='body1' align='center'>
                {onPrimaryCareers ? "Please select three (3) primary career choices you wish to learn about."
                    : "Please select two (2) secondary career choices as a backup"}
            </Typography>
            <Grid item display='flex' justifyContent='space-between'>
                <Button variant='contained' sx={{m: 2}}
                    onClick={() => hideShowAllCategories(hiddenCategories.length !== categories?.length)}>
                    {hiddenCategories.length !== categories?.length ? 'Hide All' : 'Show All'}
                </Button>
                <Box>
                    <Paper sx={{p: 0.7, bgcolor: 'primary.light', mb: 1}}>
                        <Typography variant='body1'>Primary Selection</Typography>
                    </Paper>
                    {!onPrimaryCareers && <Paper sx={{p: 0.7, bgcolor: 'warning.light', mb: 1}}>
                        <Typography variant='body1'>Secondary Selection</Typography>
                    </Paper>}
                </Box>
            </Grid>
            <Grid container spacing={2}>
                {categories?.map(category => (
                    <Grid item xs={6} key={category}>
                        <TableContainer component={Paper} elevation={8}>
                            <Box display='flex' justifyContent='space-between' sx={{ pt: 1, pl: 2 }}>
                                <Typography variant="h6">{category}</Typography>
                                <Button onClick={() => hideShowCategory(category)} sx={{ pr: 2 }}>
                                    {hiddenCategories.includes(category) ? 'Show' : 'Hide'}
                                </Button>
                            </Box>
                            {!hiddenCategories.includes(category) &&
                                <Table>
                                    <TableHead>
                                        <TableRow>
                                            <TableCell>Course ID - Name</TableCell>
                                            <TableCell>Description</TableCell>
                                        </TableRow>
                                    </TableHead>
                                    <TableBody>
                                        {careers?.filter(career => career.category == category).map(career => (
                                            <CareerCard key={career.id} career={career}
                                                handleSelectCareer={handleSelectCareer}
                                                hideDescription={false} hideDelete={true}
                                                highlightRow={primaryCareers.some(c => c.id === career.id)}
                                                highlightSecondary={secondaryCareers.some(c => c.id === career.id)}
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