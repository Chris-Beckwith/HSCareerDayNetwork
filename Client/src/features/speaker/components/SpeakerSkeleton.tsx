import { Skeleton, TableCell } from "@mui/material";

export default function SpeakerSkeleton() {
    return (
        <>
            <TableCell>
                <Skeleton animation="wave" variant="circular" height={50} width={50}/>
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