import { Box, Typography, Pagination, Select, MenuItem, useTheme, useMediaQuery } from "@mui/material";
import { MetaData } from "../models/pagination";
import { useState } from "react";
import { DEFAULT_FONT_SIZE } from "../util/constants";

interface Props {
    metaData: MetaData;
    onPageChange: (page: number) => void
    onPageSizeChange?: (pageSize: number) => void
}

export default function AppPagination({metaData, onPageChange, onPageSizeChange}: Props) {
    const {currentPage, totalCount, totalPages, pageSize} = metaData
    const [pageNumber, setPageNumber] = useState(currentPage)
    const [rowsPerPage, setRowsPerPage] = useState(metaData.pageSize)
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))

    function handlePageChange(page: number) {
        setPageNumber(page)
        onPageChange(page)
    }

    function handleRowsPerPageChange(event: any) {
        setRowsPerPage(event.target.value)
        if (onPageSizeChange)
            onPageSizeChange(event.target.value)
    }

    return (
        <Box display={totalCount === 0 ? 'none' : 'flex'} justifyContent='space-between' alignItems='center'>
            <Typography fontSize={DEFAULT_FONT_SIZE} >
                Displaying {(currentPage-1)*pageSize+1}-
                {currentPage*pageSize > totalCount 
                    ? totalCount 
                    : currentPage*pageSize} of {totalCount} items
            </Typography>
            {onPageSizeChange &&
                <Box>
                    Rows Per Page:
                    <Select size="small" sx={{ml: 1}}
                        value={rowsPerPage} onChange={handleRowsPerPageChange}>
                        <MenuItem value={10}>10</MenuItem>
                        <MenuItem value={20}>20</MenuItem>
                        <MenuItem value={50}>50</MenuItem>
                    </Select>
                </Box>
            }
            <Pagination
                color="secondary"
                size={isMobile ? "small" : "medium"}
                count={totalPages}
                page={pageNumber}
                onChange={(_e, page) => handlePageChange(page) }
            />
        </Box>
    )
}