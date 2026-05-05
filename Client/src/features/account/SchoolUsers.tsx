import { useEffect, useState } from "react"
import { Box, FormControl, IconButton, InputLabel, MenuItem, Paper, Select, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Typography, useMediaQuery, useTheme } from "@mui/material"
import AppPagination from "../../app/components/AppPagination"
import AppTextSearch from "../../app/components/AppTextSearch"
import { getSchoolUsersAsync, reloadUsers, setPageNumber, setUserParams, userSelectors } from "./userSlice"
import { useAppDispatch, useAppSelector } from "../../app/store/configureStore"
import SchoolUserSkeleton from "./SchoolUserSkeleton"
import { AddCircleOutline, Edit, Save } from "@mui/icons-material"
import { User } from "../../app/models/user"
import useEvents from "../../app/hooks/useEvents"
import agent from "../../app/api/agent"
import { useNavigate } from "react-router-dom"

/**
 * Component to display school adminstrator users.
 */
export default function SchoolUsers() {
    const users = useAppSelector(userSelectors.selectAll)
    const {usersLoaded, metaData, userParams} = useAppSelector(state => state.user)
    const dispatch = useAppDispatch()
    const { careerEvents, careerEventsLoaded } = useEvents()
    const [selectedEvent, setSelectedEvent] = useState('')
    const [selectedUser, setSelectedUser] = useState<User | undefined>(undefined)
    const navigate = useNavigate()
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))

    useEffect(() => {
        if (!usersLoaded) dispatch(getSchoolUsersAsync())
    }, [usersLoaded, dispatch])

    function handleEditUser(user: User) {
        if (selectedUser) setSelectedUser(undefined)
        else setSelectedUser(user)
    
        setSelectedEvent('')
    }

    async function handleSaveUser(user: User) {
        try {
            if (user.eventId !== parseInt(selectedEvent)) {
                const updateUser = {
                    Id: user.id,
                    EventId: parseInt(selectedEvent)
                }
                await agent.Account.update(updateUser)
                dispatch(reloadUsers())
            }
        } catch (error) {
            console.log(error)
        }
        setSelectedUser(undefined)
        setSelectedEvent('')
    }

    async function handleNavigateToRegister() {
        navigate('/register')
    }
    
    return (
        <>
            <Box display='flex' justifyContent='space-between' alignItems='center' sx={{mb: 2}}>
                <Typography variant={isTablet ? isMobile ? "h5" : "h4" : "h3"}>School Administrators</Typography>
                <Box>
                    <AppTextSearch label="Search School Administrators"
                        stateSearchTerm={userParams.searchTerm} setParams={setUserParams} />
                </Box>
            </Box>
            <TableContainer component={Paper}>
                <Table sx={{ '& .MuiTableCell-root': { fontSize: isMobile ? '0.75rem' : '0.875rem' } }}>
                    <TableHead>
                        <TableRow>
                            <TableCell>Email</TableCell>
                            <TableCell>Username</TableCell>
                            <TableCell>Event</TableCell>
                            <TableCell align="right" width={50}>
                                <IconButton
                                    color="success"
                                    size="small"
                                    onClick={() => handleNavigateToRegister()}>
                                        <AddCircleOutline fontSize="small" />
                                </IconButton>
                            </TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {users.map(user => (
                            <TableRow
                                key={user.id}
                                sx={{cursor: "pointer"}}
                                hover
                                onClick={() => handleEditUser(user)}
                            >
                                {!usersLoaded || !careerEventsLoaded || !users ? (
                                    <SchoolUserSkeleton />
                                ) : (
                                    <>
                                        <TableCell>{user.email}</TableCell>
                                        <TableCell>{user.userName}</TableCell>
                                        {selectedUser && selectedUser === user 
                                            ? <TableCell sx={{ width: 300 }}>
                                                <FormControl fullWidth>
                                                    <InputLabel>Career Day Event</InputLabel>
                                                    <Select 
                                                        label="Career Day Event"
                                                        value={selectedEvent ? selectedEvent : user.event?.id.toString() }
                                                        onChange={(e) => {
                                                            e.stopPropagation()
                                                            setSelectedEvent(e.target.value)
                                                        }}
                                                        onClick={(e) => e.stopPropagation()}
                                                        sx={{ height: '40px' }}
                                                    >
                                                        {careerEvents.map((event, index) => (
                                                            <MenuItem key={index} value={event.id.toString()}>
                                                                {event.name} - {new Date(event.eventDate).toLocaleDateString()}
                                                            </MenuItem>
                                                        ))}
                                                    </Select>
                                                </FormControl>
                                            </TableCell>
                                            : <TableCell sx={{ width: 300 }}>{user.event?.name}</TableCell>
                                        }
                                        <TableCell align="right">
                                            {selectedUser && selectedUser === user
                                                ? <IconButton
                                                    color="primary"
                                                    size="small"
                                                    onClick={() => handleSaveUser(user)}
                                                >
                                                    <Save fontSize="small" />
                                                </IconButton>
                                                : <IconButton
                                                    color='primary'
                                                    size="small"
                                                    disabled={selectedUser && selectedUser !== user}
                                                    onClick={() => handleEditUser(user)}>
                                                        <Edit fontSize="small" />
                                                </IconButton>
                                            }
                                        </TableCell>
                                    </>
                                )}
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>
            <Box sx={{ mt: 2 }}>
                {metaData &&
                    <AppPagination
                        metaData={metaData}
                        onPageChange={(page: number) => dispatch(setPageNumber({ pageNumber: page }))}
                    />
                }
            </Box>
        </>
    )
}