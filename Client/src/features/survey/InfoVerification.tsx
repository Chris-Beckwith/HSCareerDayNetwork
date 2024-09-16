import { Typography, TableContainer, TableHead, Table, TableCell, TableRow, TableBody } from "@mui/material";
import { Student } from "../../app/models/student";

interface Props {
  student: Student | undefined
}

export default function InfoVerification({ student }: Props) {
  return (
    <>
      <Typography variant="h4" align="center" gutterBottom>
        Verify Information
      </Typography>
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
    </>
  );
}