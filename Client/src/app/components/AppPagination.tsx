import { Typography, Pagination, MenuItem, useTheme, useMediaQuery, TextField, Grid } from "@mui/material";
import { MetaData } from "../models/pagination";
import { DEFAULT_FONT_SIZE } from "../util/constants";

interface Props {
    metaData: MetaData;
    onPageChange: (page: number) => void
    onPageSizeChange?: (pageSize: number) => void
    customPageSizes?: number[]
}

export default function AppPagination({metaData, onPageChange, onPageSizeChange, customPageSizes}: Props) {
    const {currentPage, totalCount, totalPages, pageSize} = metaData
    const pageSizes = customPageSizes?.length ? customPageSizes : [10, 20, 50]
    const theme = useTheme()
    const isMobile = useMediaQuery(theme.breakpoints.down('sm'))
    const isTablet = useMediaQuery(theme.breakpoints.down('md'))

    return (
        <Grid container display={totalCount === 0 ? 'none' : 'flex'} alignItems='center'>
            <Grid item display='flex' justifyContent='flex-start' flex={1}>
                <Typography fontSize={DEFAULT_FONT_SIZE} >
                    {!isMobile && 'Displaying '}
                    {(currentPage-1)*pageSize+1}-
                    {currentPage*pageSize > totalCount 
                        ? totalCount 
                        : currentPage*pageSize} of {totalCount} items
                </Typography>
            </Grid>
            {onPageSizeChange &&
                <Grid item display='flex' justifyContent='center' alignItems='center' flex={1}>
                    <Typography fontSize={DEFAULT_FONT_SIZE} pr={1}>
                        Page Size
                    </Typography>
                    <TextField select value={metaData.pageSize} variant="standard"
                        onChange={(event) => onPageSizeChange(Number(event.target.value))}
                        size={isMobile ? "small" : "medium"}
                        sx={{
                            '& .MuiOutlinedInput-input': {
                                fontSize: DEFAULT_FONT_SIZE,
                            },
                            '& .MuiSelect-select': {
                                fontSize: DEFAULT_FONT_SIZE,
                                py: isTablet ? isMobile ? '3px' : '5px' : '7px',
                                pl: isTablet ? isMobile ? '6px' : '7px' : '8px'
                            }
                        }}
                    >
                        {pageSizes.map((value, index) => (
                            <MenuItem key={index} value={value} sx={{ fontSize: DEFAULT_FONT_SIZE }}>{value}</MenuItem>
                        ))}
                    </TextField>
                </Grid>
            }
            <Grid item display='flex' justifyContent='flex-end' flex={1}>
                <Pagination
                    color="secondary"
                    size={isMobile ? "small" : "medium"}
                    count={totalPages}
                    page={currentPage}
                    onChange={(_e, page) => onPageChange(page) }
                />
            </Grid>
        </Grid>
    )
}