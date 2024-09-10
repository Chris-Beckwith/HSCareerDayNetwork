import { Skeleton, TableCell } from "@mui/material";

export default function SpeakerSkeleton() {
    return (
        <>
            <TableCell>
                <Skeleton animation="wave" variant="circular" />
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