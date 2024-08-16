import { Box, Button, Grid, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Typography } from "@mui/material"
import { Career } from "../../app/models/career"
import CareerCard from "./CareerCard"
import { useState } from "react"

interface Props {
    careers: Career[] | null
    categories: string[] | null
    handleSelectCareer: (career: Career) => void
}

export default function CareerList({ careers, categories, handleSelectCareer }: Props) {
    const [hiddenCategories, setHiddenCategories] = useState<string[]>([])

    const hideShowCategory = (category: string) => {
        if (hiddenCategories.includes(category))
            setHiddenCategories(prevItems => prevItems.filter(cat => cat !== category))
        else
            setHiddenCategories([...hiddenCategories, category])
    }

    const hideShowAllCategories = (hideAll: boolean) => {
        if (hideAll && categories) setHiddenCategories(categories)
        else setHiddenCategories([])
    }

    return (
        <Grid container spacing={2}>
            <Grid item display='flex' justifyContent='flex-start' xs={12}>
                <Button variant='contained' onClick={() => hideShowAllCategories(hiddenCategories.length !== categories?.length)}>
                    {hiddenCategories.length !== categories?.length ? 'Hide All' : 'Show All'}
                </Button>
            </Grid>
            {categories?.map(category => (
                <Grid item xs={6} key={category}>
                    <TableContainer component={Paper}>
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
                                        <TableCell></TableCell>
                                    </TableRow>
                                </TableHead>
                                <TableBody>
                                    {careers?.filter(career => career.category == category).map(career => (
                                        <CareerCard key={career.id} career={career}
                                            handleSelectCareer={handleSelectCareer} />
                                    ))}
                                </TableBody>
                            </Table>
                        }
                    </TableContainer>
                </Grid>
            ))}
        </Grid>
    )
}