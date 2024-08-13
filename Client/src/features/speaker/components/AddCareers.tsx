import { Grid, Typography, List, ListItem, IconButton, FormControl, InputLabel, Select, MenuItem, Button, SelectChangeEvent } from "@mui/material"
import { useState } from "react"
import DeleteIcon from '@mui/icons-material/Delete';
import { Career } from "../../../app/models/career";

interface Props {
    selectedCareerIds: number[],
    careers: Career[],
    categories: string[],
    onAddSelectedCareer: (careerId: number) => void,
    onRemoveSelectedCareer: (id: number) => void
}

export default function AddCareers({selectedCareerIds, careers, categories,
        onAddSelectedCareer, onRemoveSelectedCareer}: Props) {
    const [category, setCategory] = useState('')
    const [career, setCareer] = useState('')
    

    const handleCategoryChange = (event: SelectChangeEvent) => {
        setCategory(event.target.value as string)
        setCareer('')
    }

    const handleCareerChange = (event: SelectChangeEvent) => {
        setCareer(event.target.value as string)
    }

    return (
        <>
            <Grid container item justifyContent="center">
                <Grid item xs={8}>
                    <Typography variant="h6">Selected Careers</Typography>
                </Grid>
                <Grid item xs={8}>
                    <List sx={{ boxShadow: 1, border: 1 }}>
                        {selectedCareerIds && selectedCareerIds.length > 0 ? careers.filter(c => selectedCareerIds.includes(c.id)).map(career => (
                            <ListItem key={career.id}
                                secondaryAction={
                                    <IconButton edge="end" aria-label="remove"
                                        onClick={() => onRemoveSelectedCareer(career.id)}
                                    >
                                        <DeleteIcon color="error" />
                                    </IconButton>
                                }
                            >
                                {career.courseId + " - " + career.name}
                            </ListItem>
                        )) :
                            <ListItem sx={{ fontStyle: "italic" }}>
                                No Selected Career Subjects
                            </ListItem>
                        }
                    </List>
                </Grid>
            </Grid>

            <Grid container item columnSpacing={2} justifyContent="center">
                <Grid item xs={4}>
                    <FormControl fullWidth>
                        <InputLabel id="category-helper-label">Category</InputLabel>
                        <Select label="Category"
                            labelId="category-helper-label"
                            value={category}
                            onChange={handleCategoryChange}
                        >
                            {categories?.map((category, index) => (
                                <MenuItem key={index} value={category}>{category}</MenuItem>
                            ))}
                        </Select>
                    </FormControl>
                </Grid>

                <Grid item xs={4}>
                    <FormControl fullWidth>
                        <InputLabel id="career-helper-label">Career</InputLabel>
                        <Select label="Career"
                            labelId="career-helper-label"
                            onChange={handleCareerChange}
                            value={career}
                        >
                            {careers?.map(career => {
                                if (career.category == category) {
                                    return (
                                        <MenuItem key={career.id}
                                            value={career.id}
                                        >
                                            {career.courseId} - {career.name}
                                        </MenuItem>
                                    )
                                }
                            })}
                        </Select>
                    </FormControl>
                </Grid>
                <Grid item xs={8} sx={{ display: 'flex', justifyContent: 'flex-end', mt: 2 }}>
                    <Button variant="contained"
                        onClick={() => onAddSelectedCareer(parseInt(career))}
                    >
                        Add Career
                    </Button>
                </Grid>
            </Grid>
        </>
    )
}