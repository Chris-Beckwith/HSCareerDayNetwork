import { Box, Button, FormControl, Grid, IconButton, InputLabel, MenuItem, Paper, Select, SelectChangeEvent, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, TextField, Typography, useMediaQuery, useTheme } from "@mui/material"
import { Career } from "../../app/models/career"
import CareerCard from "./CareerCard"
import { useEffect, useMemo, useState } from "react"
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
import { CareerSet } from "../../app/models/careerSet"

interface Props {
    handleSelectCareer: (career: Career) => void
    hideDescription: boolean
    hideDelete: boolean
    hideEdit: boolean
    blockUpdate?: boolean
    selectedCareers?: Career[]
    handleSetCareerSet: (careerSet: CareerSet | undefined) => void
    selectedCareerSetId: number | undefined
}

/**
 * Component to layout careers and creating career sets.
 */
export default function CareerList({ handleSelectCareer, hideDescription, hideDelete, hideEdit, blockUpdate,
        selectedCareers, handleSetCareerSet, selectedCareerSetId }: Props) {
    const dispatch = useAppDispatch()
    const { careers, categories, careerSets, careerSetsLoaded } = useCareers()
    const [hiddenCategories, setHiddenCategories] = useState<string[]>([])
    const [showDeletePopup, setShowDeletePopup] = useState<boolean>(false)
    const [confirmDeleteLoading, setConfirmDeleteLoading] = useState(false)
    const [editCategory, setEditCategory] = useState('')
    const [updatedCategoryName, setUpdatedCategoryName] = useState('')
    const [careerSetName, setCareerSetName] = useState<string | undefined>('')
    const [loading, setLoading] = useState(false)
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const newCareerSet = { id: 0, name: 'New Career Set', careers: []}
    const careerSetsWithNew = [newCareerSet, ...careerSets]
    
    const { control, reset, getValues } = useForm({
        defaultValues: {
            careerSets: selectedCareerSetId || newCareerSet.id
        }
    })
    
    useEffect(() => {
        if (selectedCareers?.length === 0) {
            reset({
                careerSets: newCareerSet.id
            })
        }
    }, [selectedCareers?.length, reset, newCareerSet.id])

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
            if (getValues("careerSets") !== 0) {
                await agent.CareerSet.delete(getValues("careerSets"))
                dispatch(reloadCareerSets())
            }
        } catch (error) {
            console.log(error)
        }
        setShowDeletePopup(false)
        reset()
        setConfirmDeleteLoading(false)
        if (handleSetCareerSet)
            handleSetCareerSet(newCareerSet)
    }

    const matchesSelectCareerSet = useMemo(() => {
        if (selectedCareers) {
            const cs = careerSets.find(cs => cs.id === getValues("careerSets"))
            return cs?.careers.length === selectedCareers.length
                && cs.careers.every(c => selectedCareers.some(ec => ec.id === c.id))
                && selectedCareers.every(ec => cs.careers.some(c => c.id === ec.id))
        }
        return false
    }, [careerSets, getValues, selectedCareers])

    const handleCareerSetChange = (event: SelectChangeEvent<number>, onChange: (...event: any[]) => void) => {
        if (careerSetsWithNew && handleSetCareerSet) {
            const careerSet = careerSetsWithNew.find(c => c.id === event.target.value)
            setCareerSetName(careerSet?.name)
            handleSetCareerSet(careerSet)
            if (careerSet?.careers) {
                onChange(event.target.value)
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
        <Grid container spacing={2} sx={{ pb: 2 }}>
            <Grid item display='flex' justifyContent='space-between' xs={12}>
                <Button variant='contained' size={isMobile ? "small" : "medium"}
                    onClick={() => hideShowAllCategories(hiddenCategories.length !== categories?.length)}>
                        {hiddenCategories.length !== categories?.length ? 'Hide All' : 'Show All'}
                </Button>

                <Grid container item xs={8} sm={6} md={4}>
                    <Grid item xs={1} display='flex' justifyItems='center'>
                        {getValues("careerSets") !== 0 && matchesSelectCareerSet &&
                            <IconButton size="small" color="error" onClick={() => setShowDeletePopup(true)}>
                                <Delete fontSize="small" />
                            </IconButton>
                        }
                    </Grid>
                    <Grid item xs={11}>
                        {selectedCareers &&
                            <FormControl fullWidth size="small">
                                <InputLabel>Career Sets</InputLabel>
                                <Controller
                                    name="careerSets"
                                    control={control}
                                    render={({ field }) => (
                                        <Select label="Career Sets"
                                            {...field}
                                            value={field.value ?? 0}
                                            fullWidth
                                            onChange={(event) => handleCareerSetChange(event, field.onChange)}
                                        >
                                            {careerSetsWithNew?.map((careerSet, index) => (
                                                <MenuItem key={careerSet.id} value={careerSet.id} 
                                                    sx={{ fontStyle: index === 0 ? 'italic' : 'normal' }}
                                                >
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
                                        <Typography variant="h6">{category}</Typography>
                                        {!hideEdit && (
                                            <IconButton color="primary" onClick={() => {
                                                setEditCategory(category)
                                                setUpdatedCategoryName(category)
                                            }}>
                                                <Edit />
                                            </IconButton>
                                        )}
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
                                            handleSelectCareer={handleSelectCareer} blockUpdate={blockUpdate}
                                            hideDescription={hideDescription} hideDelete={hideDelete}
                                            highlightRow={ selectedCareers?.some(c => c.id == career.id) }
                                        />
                                    ))}
                                </TableBody>
                            </Table>
                        }
                    </TableContainer>
                </Grid>
            ))}
            
            <ConfirmDelete open={showDeletePopup} itemType="Career Set" itemName={careerSetName || ''}
                handleClose={handleCloseDelete} confirmDelete={confirmDeleteCareerSet} loading={confirmDeleteLoading} />
        </Grid>
    )
}