import { Box, Typography, Pagination, Select, MenuItem } from "@mui/material";
import { MetaData } from "../models/pagination";
import { useState } from "react";

interface Props {
    metaData: MetaData;
    onPageChange: (page: number) => void
    onPageSizeChange?: (pageSize: number) => void
}

export default function AppPagination({metaData, onPageChange, onPageSizeChange}: Props) {
    const {currentPage, totalCount, totalPages, pageSize} = metaData
    const [pageNumber, setPageNumber] = useState(currentPage)
    const [rowsPerPage, setRowsPerPage] = useState(metaData.pageSize)

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
        <Box display='flex' justifyContent='space-between' alignItems='center'>
            <Typography>
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
                size="large"
                count={totalPages}
                page={pageNumber}
                onChange={(_e, page) => handlePageChange(page) }
            />
        </Box>
    )
}