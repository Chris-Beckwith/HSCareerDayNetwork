import { Typography, TableContainer, TableHead, Table, TableCell, TableRow, TableBody, Box, useMediaQuery, useTheme } from "@mui/material";
import { Student } from "../../app/models/student";

interface Props {
  student: Student | undefined
}

export default function InfoVerification({ student }: Props) {
  const theme = useTheme()
  const isMobile = useMediaQuery(theme.breakpoints.down('sm'));

  return (
    <>
      <Typography variant={isMobile ? "h5" : "h4"} align="center" gutterBottom>
        Verify Information
      </Typography>
      {isMobile ? (
        <Box sx={{ p: 0 }}>
          <Typography variant="body1"><strong>Student #:</strong> {student?.studentNumber}</Typography>
          <Typography variant="body1"><strong>Name:</strong> {student?.lastFirstName}</Typography>
          <Typography variant="body1"><strong>Gender:</strong> {student?.gender}</Typography>
          <Typography variant="body1"><strong>Grade:</strong> {student?.grade}</Typography>
          <Typography variant="body1"><strong>School Email:</strong> {student?.email}</Typography>
          <Typography variant="body1"><strong>Homeroom Teacher:</strong> {student?.homeroomTeacher}</Typography>
          <Typography variant="body1"><strong>Homeroom #:</strong> {student?.homeroomNumber}</Typography>
        </Box>
      ) : (
        <TableContainer>
          <Table>
            <TableHead>
              <TableRow>
                <TableCell>Student #</TableCell>
                <TableCell>Name</TableCell>
                <TableCell>Gender</TableCell>
                <TableCell>Grade</TableCell>
                <TableCell>School Email</TableCell>
                <TableCell>Homeroom Teacher</TableCell>
                <TableCell>Homeroom #</TableCell>
              </TableRow>
            </TableHead>
            <TableBody>
              <TableRow>
                <TableCell>{student?.studentNumber}</TableCell>
                <TableCell>{student?.lastFirstName}</TableCell>
                <TableCell>{student?.gender}</TableCell>
                <TableCell>{student?.grade}</TableCell>
                <TableCell>{student?.email}</TableCell>
                <TableCell>{student?.homeroomTeacher}</TableCell>
                <TableCell>{student?.homeroomNumber}</TableCell>
              </TableRow>
            </TableBody>
          </Table>
        </TableContainer>
      )}
    </>
  )
}