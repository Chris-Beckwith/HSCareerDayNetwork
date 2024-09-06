import { Box, Button, FormControl, Grid, InputLabel, MenuItem, Paper, Select, SelectChangeEvent, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Typography } from "@mui/material"
import { Career } from "../../app/models/career"
import CareerCard from "./CareerCard"
import { useEffect, useState } from "react"
import useCareers from "../../app/hooks/useCareers"
import { Controller, useForm } from "react-hook-form"
import { toast } from "react-toastify"
import LoadingComponent from "../../app/components/LoadingComponent"
import { Delete } from "@mui/icons-material"
import ConfirmDelete from "../../app/components/ConfirmDelete"
import agent from "../../app/api/agent"
import { useAppDispatch } from "../../app/store/configureStore"
import { reloadCareerSets } from "./careerSlice"

interface Props {
    handleSelectCareer: (career: Career) => void
    hideDescription?: boolean
    hideDelete?: boolean
    eventCareers?: Career[]
    handleSetEventCareers?: (careers: Career[]) => void
}

export default function CareerList({ handleSelectCareer, hideDescription, hideDelete, eventCareers, handleSetEventCareers }: Props) {
    const dispatch = useAppDispatch()
    const { careers, categories, careerSets, careerSetsLoaded } = useCareers()
    const [hiddenCategories, setHiddenCategories] = useState<string[]>([])
    const [selectedCareerSet, setSelectedCareerSet] = useState<number>()
    const [selectedCareerSetName, setSelectedCareerSetName] = useState<string | undefined>('')
    const [showDeletePopup, setShowDeletePopup] = useState<boolean>(false)
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

    if (!careerSetsLoaded) return <LoadingComponent message="Loading Career Sets..." />

    return (
        <Grid container spacing={2}>
            <Grid item display='flex' justifyContent='space-between' xs={12}>
                <Button variant='contained'
                    onClick={() => hideShowAllCategories(hiddenCategories.length !== categories?.length)}>
                        {hiddenCategories.length !== categories?.length ? 'Hide All' : 'Show All'}
                </Button>

                <Grid container item xs={3}>
                    <Grid item xs={3}>
                        {selectedCareerSet && matchesSelectCareerSet() &&
                            <Button color="error" onClick={() => setShowDeletePopup(true)}><Delete /></Button>
                        }
                    </Grid>
                    <Grid item xs={9}>
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
                <Grid item xs={hideDescription ? 3 : 6} key={category}>
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
                                        {!hideDescription && <TableCell>Description</TableCell>}
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
                        handleClose={handleCloseDelete} confirmDelete={confirmDeleteCareerSet}/>
        </Grid>
    )
}