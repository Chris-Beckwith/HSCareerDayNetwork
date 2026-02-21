import { Box, Button, FormControl, Grid, IconButton, InputLabel, MenuItem, Paper, Select, SelectChangeEvent, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, TextField, Typography, useMediaQuery, useTheme } from "@mui/material"
import { Career } from "../../app/models/career"
import CareerCard from "./CareerCard"
import { useEffect, useState } from "react"
import useCareers from "../../app/hooks/useCareers"
import { Controller, useForm } from "react-hook-form"
import { toast } from "react-toastify"
import LoadingComponent from "../../app/components/LoadingComponent"
import { Delete, Edit } from "@mui/icons-material"
import ConfirmDelete from "../../app/components/ConfirmDelete"
import agent from "../../app/api/agent"
import { useAppDispatch } from "../../app/store/configureStore"
import { reloadCareers, reloadCareerSets } from "./careerSlice"
import { LoadingButton } from "@mui/lab"

interface Props {
    handleSelectCareer: (career: Career) => void
    hideDescription?: boolean
    hideDelete?: boolean
    eventCareers?: Career[]
    handleSetEventCareers?: (careers: Career[]) => void
}

/**
 * Component to layout careers and creating career sets.
 */
export default function CareerList({ handleSelectCareer, hideDescription, hideDelete, eventCareers, handleSetEventCareers }: Props) {
    const dispatch = useAppDispatch()
    const { careers, categories, careerSets, careerSetsLoaded } = useCareers()
    const [hiddenCategories, setHiddenCategories] = useState<string[]>([])
    const [selectedCareerSet, setSelectedCareerSet] = useState<number>()
    const [selectedCareerSetName, setSelectedCareerSetName] = useState<string | undefined>('')
    const [showDeletePopup, setShowDeletePopup] = useState<boolean>(false)
    const [confirmDeleteLoading, setConfirmDeleteLoading] = useState(false)
    const [editCategory, setEditCategory] = useState('')
    const [updatedCategoryName, setUpdatedCategoryName] = useState('')
    const [loading, setLoading] = useState(false)
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const { control, reset } = useForm({
        defaultValues: {
            careerSets: ''
        }
    })

    useEffect(() => {
        if (eventCareers?.length === 0) {
            reset({
                careerSets: ''
            })
        }
    }, [reset, eventCareers])

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

    const handleCloseDelete = () => {
        setShowDeletePopup(false)
    }

    async function confirmDeleteCareerSet() {
        setConfirmDeleteLoading(true)
        try {
            if (selectedCareerSet) {
                await agent.CareerSet.delete(selectedCareerSet)
                dispatch(reloadCareerSets())
            }
        } catch (error) {
            console.log(error)
        }
        setShowDeletePopup(false)
        setSelectedCareerSet(undefined)
        setSelectedCareerSetName(undefined)
        setConfirmDeleteLoading(false)
        if (handleSetEventCareers)
            handleSetEventCareers([])
    }

    const matchesSelectCareerSet = () => {
        if (eventCareers && selectedCareerSet) {
            const cs = careerSets.find(cs => cs.id === selectedCareerSet)
            return cs?.careers.length === eventCareers.length
                && cs.careers.every(c => eventCareers.some(ec => ec.id === c.id))
                && eventCareers.every(ec => cs.careers.some(c => c.id === ec.id))
        }
        return false
    }

    const handleCareerSetChange = (event: SelectChangeEvent<string>, onChange: (...event: any[]) => void) => {
        if (careerSets && handleSetEventCareers) {
            const careerSet = careerSets.find(c => c.name == event.target.value)
            setSelectedCareerSet(careerSet?.id)
            setSelectedCareerSetName(careerSet?.name)
            if (careerSet?.careers) {
                handleSetEventCareers(careerSet.careers)
                onChange(event)
            } else {
                toast.error("Unable to find careers associated to career set")
            }
        } else {
            toast.error("Unable to find career set with that name")
        }
    }

    async function updateCategoryName(category: string) {
        setLoading(true)

        if (updatedCategoryName.length > 0 && category !== updatedCategoryName) {
            const careersToUpdate = careers.filter(career => career.category == category)

            if (careersToUpdate.length > 0) {
                try {
                    await Promise.all(careersToUpdate.map(async career => {
                        const updatedCareer = { ...career, category: updatedCategoryName}
                        await agent.Career.update(updatedCareer)
                    }))
                } catch (error) {
                    console.log(error)
                }
            }
            dispatch(reloadCareers())
        }
        
        setLoading(false)
        setEditCategory('')
    }

    if (!careerSetsLoaded) return <LoadingComponent message="Loading Career Sets..." />

    return (
        <Grid container spacing={2}>
            <Grid item display='flex' justifyContent='space-between' xs={12}>
                <Button variant='contained' size={isMobile ? "small" : "medium"}
                    onClick={() => hideShowAllCategories(hiddenCategories.length !== categories?.length)}>
                        {hiddenCategories.length !== categories?.length ? 'Hide All' : 'Show All'}
                </Button>

                <Grid container item xs={8} sm={6} md={4}>
                    <Grid item xs={1} display='flex' justifyItems='center'>
                        {selectedCareerSet && matchesSelectCareerSet() &&
                            <IconButton size="small" color="error" onClick={() => setShowDeletePopup(true)}>
                                <Delete fontSize="small" />
                            </IconButton>
                        }
                    </Grid>
                    <Grid item xs={11}>
                        {eventCareers &&
                            <FormControl fullWidth size="small">
                                <InputLabel>Career Sets</InputLabel>
                                <Controller
                                    name="careerSets"
                                    control={control}
                                    render={({ field }) => (
                                        <Select label="Career Sets"
                                            {...field}
                                            value={field.value || ''}
                                            fullWidth
                                            onChange={(event) => handleCareerSetChange(event, field.onChange)}
                                        >
                                            {careerSets && careerSets.map(careerSet => (
                                                <MenuItem key={careerSet.id} value={careerSet.name}>
                                                    {careerSet.name}
                                                </MenuItem>
                                            ))}
                                        </Select>
                                    )}
                                />
                            </FormControl>
                        }
                    </Grid>
                </Grid>
            </Grid>

            {categories?.map(category => (
                <Grid item xs={12} sm={hideDescription ? 6 : 12} md={hideDescription ? 4 : 6} key={category}>
                    <TableContainer component={Paper}>
                        <Box display='flex' justifyContent='space-between' sx={{ pt: 1, pl: 2 }}>
                            {editCategory && editCategory === category ? (
                                <Box display='flex'>
                                    <TextField label="Category"
                                        name="editCategory"
                                        value={updatedCategoryName}
                                        onChange={(e) => setUpdatedCategoryName(e.target.value)}
                                        variant="outlined"
                                        sx={{
                                            width: '300px',
                                            '& .MuiOutlinedInput-input': {
                                              padding: '6px 8px',
                                            }
                                          }}
                                    />
                                    <LoadingButton loading={loading} onClick={() => updateCategoryName(category)}>
                                        Save
                                    </LoadingButton>
                                </Box>
                            ) : (
                                    <Box display='flex' alignItems='center'>
                                        <Box display='flex' justifyContent='flex-start'>
                                            <Typography variant="h6">{category}</Typography>
                                        </Box>
                                        <Box display='flex' justifyContent='flex-end'>
                                            <IconButton color="primary" onClick={() => {
                                                setEditCategory(category)
                                                setUpdatedCategoryName(category)
                                            }}>
                                                <Edit />
                                            </IconButton>
                                        </Box>
                                    </Box>
                            )}
                            <Button onClick={() => hideShowCategory(category)} sx={{ pr: 2 }}>
                                {hiddenCategories.includes(category) ? 'Show' : 'Hide'}
                            </Button>
                        </Box>
                        {!hiddenCategories.includes(category) &&
                            <Table>
                                <TableHead>
                                    <TableRow>
                                        {!isMobile && 
                                            <>
                                                <TableCell>Course ID - Name</TableCell>
                                                {!hideDescription && <TableCell>Description</TableCell>}
                                            </>
                                        }
                                        {!hideDelete && <TableCell></TableCell>}
                                    </TableRow>
                                </TableHead>
                                <TableBody>
                                    {careers?.filter(career => career.category == category).map(career => (
                                        <CareerCard key={career.id} career={career}
                                            handleSelectCareer={handleSelectCareer}
                                            hideDescription={hideDescription} hideDelete={hideDelete}
                                            highlightRow={ eventCareers?.some(c => c.id == career.id) }
                                        />
                                    ))}
                                </TableBody>
                            </Table>
                        }
                    </TableContainer>
                </Grid>
            ))}
            
            <ConfirmDelete open={showDeletePopup} itemType="Career Set" itemName={selectedCareerSetName || ''}
                        handleClose={handleCloseDelete} confirmDelete={confirmDeleteCareerSet} loading={confirmDeleteLoading} />
        </Grid>
    )
}