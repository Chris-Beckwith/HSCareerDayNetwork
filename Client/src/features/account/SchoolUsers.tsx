import { useEffect, useState } from "react"
import { Box, Button, FormControl, InputLabel, MenuItem, Paper, Select, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Typography } from "@mui/material"
import AppPagination from "../../app/components/AppPagination"
import AppTextSearch from "../../app/components/AppTextSearch"
import { getSchoolUsersAsync, reloadUsers, setPageNumber, setUserParams, userSelectors } from "./userSlice"
import { useAppDispatch, useAppSelector } from "../../app/store/configureStore"
import UserSkeleton from "./UserSkeleton"
import { Edit, Save } from "@mui/icons-material"
import { User } from "../../app/models/user"
import useEvents from "../../app/hooks/useEvents"
import agent from "../../app/api/agent"

export default function SchoolUsers() {
    const users = useAppSelector(userSelectors.selectAll)
    const {usersLoaded, metaData, userParams} = useAppSelector(state => state.user)
    const dispatch = useAppDispatch()
    const { careerEvents, careerEventsLoaded } = useEvents()
    const [selectedEvent, setSelectedEvent] = useState('')
    const [selectedUser, setSelectedUser] = useState<User | undefined>(undefined)

    useEffect(() => {
        if (!usersLoaded) dispatch(getSchoolUsersAsync())
    }, [usersLoaded, dispatch])

    function handleEditUser(user: User) {
        if (selectedUser) setSelectedUser(undefined)
        else setSelectedUser(user)
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

    return (
        <>
            <Box display='flex' justifyContent='space-between' alignItems='center' sx={{mb: 2}}>
                <Typography variant="h3">School Administrators</Typography>
                <Box>
                    <AppTextSearch label="Search School Administrators"
                        stateSearchTerm={userParams.searchTerm} setParams={setUserParams} />
                </Box>
            </Box>
            <TableContainer component={Paper}>
                <Table>
                    <TableHead>
                        <TableRow>
                            <TableCell>Email</TableCell>
                            <TableCell>Username</TableCell>
                            <TableCell>Event</TableCell>
                            <TableCell align="right" width={50}></TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {users.map(user => (
                            <TableRow
                                key={user.id}
                                sx={{cursor: "pointer"}}
                                hover
                            >
                                {!usersLoaded || !careerEventsLoaded || !users ? (
                                    <UserSkeleton />
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
                                                        onChange={(e) => setSelectedEvent(e.target.value)}
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
                                                ? <Button
                                                    startIcon={<Save />}
                                                    color='primary'
                                                    onClick={() => handleSaveUser(user)}
                                                />
                                                : <Button
                                                    startIcon={<Edit />}
                                                    color='error'
                                                    disabled={selectedUser && selectedUser !== user}
                                                    onClick={() => handleEditUser(user)}
                                                />
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