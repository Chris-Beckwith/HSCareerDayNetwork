import { Typography, Button, Grid } from '@mui/material';
import { useState } from 'react';

export default function CareerSelection() {
    const [showArts, setShowArts] = useState(false)
    const [showMeds, setShowMeds] = useState(false)
    const [showSciences, setShowSciences] = useState(false)

    return (
        <>
            <Typography variant="h6" gutterBottom>
                Select Career Choices
            </Typography>
            <Button
                variant="contained"
                sx={{ mr: 2, mb: 2 }}
                onClick={() => setShowArts(state => !state)}
            >
                Arts
            </Button>
            <Button
                variant="contained"
                sx={{ mr: 2, mb: 2 }}
                onClick={() => setShowMeds(state => !state)}
            >
                Medical/Health Care/Fitness
            </Button>
            <Button
                variant="contained"
                sx={{ mr: 2, mb: 2 }}
                onClick={() => setShowSciences(state => !state)}
            >
                Sciences/Biotech/Engineering
            </Button>

            {showArts &&
                <>
                    <Typography variant='h6'>Arts</Typography>
                    <Grid>
                        <Grid item>
                            <Button>Actors</Button>
                        </Grid>
                        <Grid item>
                            <Button>Animation</Button>
                        </Grid>
                        <Grid item>
                            <Button>Photography</Button>
                        </Grid>
                        <Grid item>
                            <Button>TV/Film Production</Button>
                        </Grid>
                    </Grid>
                </>
            }
            {showMeds &&
                <>
                    <Typography variant='h6'>Medical/Health Care/Fitness</Typography>
                    <Grid>
                        <Grid item>
                            <Button>Dentistry</Button>
                        </Grid>
                        <Grid item>
                            <Button>Fitness Consultant</Button>
                        </Grid>
                        <Grid item>
                            <Button>Pediatrics</Button>
                        </Grid>
                        <Grid item>
                            <Button>Psychologist</Button>
                        </Grid>
                    </Grid>
                </>
            }
            {showSciences &&
                <>
                    <Typography variant='h6'>Sciences/Biotech/Engineering</Typography>
                    <Grid>
                        <Grid item>
                            <Button>Biotech/Bioengineering</Button>
                        </Grid>
                        <Grid item>
                            <Button>Careers in Engineering</Button>
                        </Grid>
                        <Grid item>
                            <Button>Environmental Science</Button>
                        </Grid>
                        <Grid item>
                            <Button>Robotics</Button>
                        </Grid>
                    </Grid>
                </>
            }
        </>
    );
}