import { Box, Grid, Table, TableBody, TableCell, TableContainer, TableHead, TableRow, Typography, useMediaQuery, useTheme } from "@mui/material";
import { Student } from "../../app/models/student";
import { Career } from "../../app/models/career";

interface Props {
  student: Student | undefined
  primaryCareers: Career[]
  alternateCareers: Career[]
}

export default function ReviewAndSubmit({ student, primaryCareers, alternateCareers }: Props) {
  const theme = useTheme()
  const isMobile = useMediaQuery(theme.breakpoints.down(820))

  return (
    <>
      <Typography component="h1" variant="h6" align="center" gutterBottom>
        Review and Submit
      </Typography>
      {isMobile ? (
        <Box sx={{ mb: 4 }}>
          <Typography variant="body1"><strong>Student #:</strong> {student?.studentNumber}</Typography>
          <Typography variant="body1"><strong>Name:</strong> {student?.lastFirstName}</Typography>
          <Typography variant="body1"><strong>Gender:</strong> {student?.gender}</Typography>
          <Typography variant="body1"><strong>Grade:</strong> {student?.grade}</Typography>
          <Typography variant="body1"><strong>School Email:</strong> {student?.email}</Typography>
          <Typography variant="body1"><strong>Teacher:</strong> {student?.homeroomTeacher}</Typography>
          <Typography variant="body1"><strong>Room #:</strong> {student?.homeroomNumber}</Typography>
        </Box>
      ) : (
        <TableContainer sx={{ mb: 4 }}>
          <Table>
            <TableHead>
              <TableRow>
                <TableCell>Student #</TableCell>
                <TableCell>Name</TableCell>
                <TableCell>Gender</TableCell>
                <TableCell>Grade</TableCell>
                <TableCell>School Email</TableCell>
                <TableCell>Teacher</TableCell>
                <TableCell>Room #</TableCell>
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

      <Box display='flex' justifyContent='center'>

        <Grid container item xs={12} spacing={2}>
          
          <Grid item xs={12} md={6} display='flex' justifyContent='center'>
            <TableContainer>
              <Typography variant="h6" component="div">Primary Career Choices</Typography>
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

          <Grid item xs={12} md={6} display='flex' justifyContent='center'>
            <TableContainer>
              <Typography variant="h6" component="div">Alternate Career Choices</Typography>
              <Table>
                <TableHead>
                  <TableRow>
                    <TableCell>Course ID</TableCell>
                    <TableCell>Career Name</TableCell>
                  </TableRow>
                </TableHead>
                <TableBody>
                  {alternateCareers.map(career => (
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
  )
}