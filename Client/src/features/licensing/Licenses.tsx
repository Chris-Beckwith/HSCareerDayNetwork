import { Box, Paper, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Typography, useMediaQuery, useTheme } from "@mui/material"
import useLicenses from "../../app/hooks/useLicenses"
import { useAppDispatch } from "../../app/store/configureStore"
import AppTextSearch from "../../app/components/AppTextSearch"
import { setLicenseSearchParams, setPagination } from "./licenseSlice"
import AppButton from "../../app/components/AppButton"
import AppPagination from "../../app/components/AppPagination"
import SchoolSkeleton from "../school/SchoolSkeleton"
import { useState } from "react"
import { formatDate, getLicenseStatusText, getLicenseTypeText } from "../../app/util/util"
import LicenseForm from "./LicenseForm"

export default function Licenses() {
    const { licenses, metaData, licenseParams, licensesLoaded } = useLicenses()
    const dispatch = useAppDispatch()
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))
    const [createLicense, setCreateLicense] = useState(false)

    if (createLicense) return <LicenseForm cancelEdit={() => setCreateLicense(false)} />

    // User.email, type, status, startDate, ExpirationDate, max schools, max events.
    return (
        <>
            <Box display='flex' alignItems='center' sx={{mb: 2}}>
                <Box display='flex' justifyContent='flex-start' flex={1}>
                    <Typography variant={isTablet ? isMobile ? "h5" : "h4" : "h3"}>Licenses</Typography>
                </Box>
                <Box>
                    <AppTextSearch label="Search Licenses"
                        stateSearchTerm={licenseParams.searchTerm} setParams={setLicenseSearchParams} />
                </Box>
                <Box display='flex' justifyContent='flex-end' flex={1}>
                    <AppButton variant="contained" onClick={() => setCreateLicense(true)}
                        sx={{ fontSize: isMobile ? '0.75rem' : '0.875rem', lineHeight: isMobile ? 1.2 : 1.7 }}
                    >
                        Create License Invite
                    </AppButton>
                </Box>
            </Box>

            <TableContainer component={Paper}>
                <Table sx={{ '& .MuiTableCell-root': { fontSize: isTablet ? '0.75rem' : '0.875rem' } }}>
                    <TableHead>
                        <TableRow>
                            <TableCell>User Emails</TableCell>
                            <TableCell>Type</TableCell>
                            <TableCell>Status</TableCell>
                            <TableCell>Start Date</TableCell>
                            <TableCell>Expiration Date</TableCell>
                            <TableCell align="center">Max Schools</TableCell>
                            <TableCell align="center">Max Events</TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {licenses.map(license => (
                            <TableRow
                                key={license.id}
                                // onClick={() => handleSelectLicense(license)}
                                // sx={{cursor: "pointer"}}
                                hover
                            >
                                {!licensesLoaded ? (
                                    <SchoolSkeleton />
                                ) : (
                                    <>
                                        <TableCell>{license.users[0] &&
                                            (<span>{license.users[0].email}</span>)}
                                            {license.users[1] && (<>
                                                <br /><span>{license.users[1].email}</span>
                                            </>)}
                                        </TableCell>
                                        <TableCell>{getLicenseTypeText(license.type)}</TableCell>
                                        <TableCell>{getLicenseStatusText(license.status)}</TableCell>
                                        <TableCell>{formatDate(license.startDate)}</TableCell>
                                        <TableCell>{formatDate(license.expirationDate)}</TableCell>
                                        <TableCell align="center">{license.maxSchools}</TableCell>
                                        <TableCell align="center">{license.maxEvents}</TableCell>
                                    </>
                                )}
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>
            <Box sx={{ my: 2 }}>
                {metaData &&
                    <AppPagination
                        metaData={metaData}
                        onPageChange={(page: number) => dispatch(setPagination({ pageNumber: page }))}
                        onPageSizeChange={(pageSize: number) => dispatch(setPagination({ pageSize: pageSize, pageNumber: 1 }))}
                    />
                }
            </Box>
        </>
    )
}