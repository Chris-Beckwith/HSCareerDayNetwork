import { Button, FormControl, FormHelperText, Grid, InputLabel, MenuItem, Paper, Select, SelectChangeEvent, TextField, Typography, useMediaQuery, useTheme } from "@mui/material";
import { Career } from "../../app/models/career";
import { Controller, FieldValues, useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";
import { careerValidationSchema } from "./careerValidation";
import AppTextInput from "../../app/components/AppTextInput";
import { useEffect, useState } from "react";
import { LoadingButton } from "@mui/lab";
import agent from "../../app/api/agent";
import { useAppDispatch } from "../../app/store/configureStore";
import { reloadCareers } from "./careerSlice";
import useCareers from "../../app/hooks/useCareers";
import { normalizeNewline } from "../../app/util/util";

interface Props {
    selectedCareer: Career | undefined
    cancelEdit: () => void
}

/**
 * Component to add/edit a career.
 */
export default function CareerForm({ selectedCareer, cancelEdit }: Props) {
    const { categories } = useCareers()
    const [category, setCategory] = useState('')
    const dispatch = useAppDispatch()
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))
    const { control, reset, handleSubmit, formState: { isDirty, isSubmitting, errors } } = useForm({
        defaultValues: {
            category: ''
        },
        resolver: yupResolver<any>(careerValidationSchema)
    })

    const addNewCategory = 'Add New Category'

    const categoriesWithNew = [addNewCategory, ...categories]

    useEffect(() => {
        if (selectedCareer && !isDirty) {
            const sanitizedCareer = {
                ...selectedCareer,
                courseId: selectedCareer.courseId.toString(),
                description: normalizeNewline(selectedCareer.description)
            }
            reset(sanitizedCareer)
        }
    }, [selectedCareer, reset, isDirty])

    async function handleAddCareer(data: FieldValues) {
        if (data.category === addNewCategory) data.category = data.newCategory
        if (data.description == null) data.description = ''
        try {
            if (selectedCareer) {
                await agent.Career.update(data)
            } else {
                await agent.Career.create(data)
            }
            dispatch(reloadCareers())
            cancelEdit()
        } catch (error) {
            console.log(error)
        }
    }

    const handleCategoryChange = (event: SelectChangeEvent, onChange: { (...event: any[]): void; (arg0: SelectChangeEvent): void; }) => {
        if (category == addNewCategory) setCategory('')
        else setCategory(event.target.value as string)
        onChange(event)
    }

    return (
        <Paper variant="outlined" sx={{ my: { xs: 3, md: 4 }, p: { xs: 2, md: 2 } }}>
            <Typography align="center" variant={isTablet ? isMobile ? "h5" : "h4" : "h3"}>{selectedCareer ? "Edit Career" : "Add Career"}</Typography>
            <form onSubmit={handleSubmit(handleAddCareer)}>
                <Grid container rowSpacing={2}>
                    <Grid container item spacing={2} justifyContent="center" mt={0}>
                        <Grid item xs={12} sm={9} md={7}>
                            <FormControl fullWidth error={!!errors.category}>
                                <InputLabel>Category</InputLabel>
                                <Controller
                                    name="category"
                                    control={control}
                                    render={({ field }) => (
                                        <Select label="Category"
                                            {...field}
                                            onChange={(event) => handleCategoryChange(event, field.onChange)}
                                            sx={{
                                                '& .MuiInputBase-input': {
                                                    fontSize: {
                                                        xs: '0.8rem',
                                                        sm: '0.9rem',
                                                        md: '1rem'
                                                    }
                                                }
                                            }}
                                        >                                
                                        {categoriesWithNew?.map((category, index) => (
                                            <MenuItem key={index} value={category} 
                                                sx={{ fontStyle: index === 0 ? 'italic' : 'normal' }}
                                            >
                                                {category}
                                            </MenuItem>      
                                        ))}
                                        </Select>
                                    )}
                                />
                                {errors.category && (
                                    <FormHelperText>{String(errors.category.message)}</FormHelperText>
                                )}
                            </FormControl>
                        </Grid>
                        {category === addNewCategory &&
                            <Grid item xs={12} sm={9} md={7}>
                                <Controller
                                    name="newCategory"
                                    control={control}
                                    render={({ field }) => (
                                        <TextField
                                            label="New Category"
                                            {...field}
                                            variant="outlined"
                                            fullWidth
                                            sx={{
                                                '& .MuiInputBase-input': {
                                                    fontSize: {
                                                        xs: '0.8rem',
                                                        sm: '0.9rem',
                                                        md: '1rem'
                                                    }
                                                }
                                            }}
                                            // Ensure TextField is empty when adding new category
                                            value={field.value || ''}
                                            error={!!errors.newCategory}
                                            helperText={String(errors.newCategory?.message ?? '')}
                                        />
                                    )}
                                />
                            </Grid>
                        }
                    </Grid>
                    <Grid container item spacing={2} justifyContent="center">
                        <Grid item xs={3} sm={2}>
                            <AppTextInput control={control} name="courseId" label="Course ID"/>
                        </Grid>
                        <Grid item xs={9} sm={7} md={5}>
                            <AppTextInput control={control} name="name" label="Course Name"/>
                        </Grid>
                    </Grid>
                    <Grid container item justifyContent="center">
                        <Grid item xs={12} sm={9} md={7}>
                            <AppTextInput control={control} multiline={true} rows={4} name="description" label="Description"/>
                        </Grid>
                    </Grid>
                    <Grid container item justifyContent='center'>
                        <Grid item xs={6} sm={4} md={3}>
                            <Button onClick={cancelEdit} size={isMobile ? "small" : "medium"} variant="contained" color="inherit">Cancel</Button>
                        </Grid>
                        <Grid item xs={6} sm={5} md={4} display="flex" justifyContent="flex-end">
                            <LoadingButton
                                loading={isSubmitting}
                                variant="contained"
                                type="submit"
                                color="success"
                                disabled={!isDirty}
                                size={isMobile ? "small" : "medium"}
                            >
                                {selectedCareer ? "Save" : "Add Career"}
                            </LoadingButton>
                        </Grid>
                    </Grid>
                </Grid>
            </form>
        </Paper>
    )
}