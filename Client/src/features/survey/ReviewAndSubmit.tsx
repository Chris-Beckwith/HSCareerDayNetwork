import { Box, Grid, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Typography } from "@mui/material";
import { Student } from "../../app/models/student";
import { Career } from "../../app/models/career";

interface Props {
  student: Student | undefined
  primaryCareers: Career[]
  secondaryCareers: Career[]
}

export default function ReviewAndSubmit({ student, primaryCareers, secondaryCareers }: Props) {
  return (
    <>
      <Typography component="h1" variant="h6" align="center" gutterBottom>
        Review and Submit
      </Typography>
      <TableContainer sx={{mb: 4}}>
        <Table>
          {/* <TableHead>
            <TableRow>
              <TableCell>Student #</TableCell>
              <TableCell>Name</TableCell>
              <TableCell>Gender</TableCell>
              <TableCell>Grade</TableCell>
              <TableCell>School Email</TableCell>
              <TableCell>Homeroom Teacher</TableCell>
              <TableCell>Homeroom #</TableCell>
            </TableRow>
          </TableHead> */}
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

      <Box display='flex' justifyContent='center'>

        <Grid container item xs={6} spacing={2}>
          <Grid item xs={6} display='flex' justifyContent='center'>
            <TableContainer>
              <Typography variant="h6" component="div">Primary Careers</Typography>
              <Table>
                <TableHead>
                  <TableRow>
                    <TableCell>Course ID</TableCell>
                    <TableCell>Career Name</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {primaryCareers.map(career => (
                    <TableRow key={career.id}>
                      <TableCell>{career.courseId}</TableCell>
                      <TableCell>{career.name}</TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </TableContainer>
          </Grid>

          <Grid item xs={6} display='flex' justifyContent='center'>
            <TableContainer>
              <Typography variant="h6" component="div">Secondary Careers</Typography>
              <Table>
                <TableHead>
                  <TableRow>
                    <TableCell>Course ID</TableCell>
                    <TableCell>Career Name</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {secondaryCareers.map(career => (
                    <TableRow key={career.id}>
                      <TableCell>{career.courseId}</TableCell>
                      <TableCell>{career.name}</TableCell>
                    </TableRow>
                  ))}
                </TableBody>
              </Table>
            </TableContainer>
          </Grid>

        </Grid>

      </Box>
    </>
  );
}