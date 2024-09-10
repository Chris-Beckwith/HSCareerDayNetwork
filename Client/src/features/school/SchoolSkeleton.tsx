import { Skeleton, TableCell } from "@mui/material";

export default function SchoolSkeleton() {
    return (
        <>
            <TableCell>
                <Skeleton animation="wave" />
            </TableCell>
            <TableCell>
                <Skeleton animation="wave" />
            </TableCell>
            <TableCell>
                <Skeleton animation="wave" />
            </TableCell>
            <TableCell>
                <Skeleton animation="wave" />
            </TableCell>
            <TableCell>
                <Skeleton animation="wave" />
            </TableCell>
            <TableCell>
                <Skeleton animation="wave" />
            </TableCell>
            <TableCell>
                <Skeleton animation="wave" />
            </TableCell>
        </>
    )
}