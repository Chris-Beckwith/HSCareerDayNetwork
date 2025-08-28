import { Box, Typography, Button, Grid, Paper, Divider, Switch } from "@mui/material";
import useSurveys from "../../app/hooks/useSurveys";
import { CareerEvent } from "../../app/models/event";
import { useEffect, useState } from "react";
import SurveyResultLineItem from "./SurveyResultLineItem";
import SurveyStudentLineItem from "./SurveyStudentLineItem";
import { downloadExcel } from "../../app/util/util";
import agent from "../../app/api/agent";
import { LoadingButton } from "@mui/lab";

interface Props {
    event: CareerEvent
    back: () => void
    schoolUser?: boolean
}

export default function SurveyResults({ event, back, schoolUser }: Props) {
    const { surveys } = useSurveys(event.id)
    const [loading, setLoading] = useState(false)
    const [sortOption, setSortOption] = useState(false)
    const [viewOption, setViewOption] = useState(false)
    const [showAlternate, setShowAlternate] = useState(false)
    const [includeAlternate, setIncludeAlternate] = useState(false)
    const [primaryCounts, setPrimaryCounts] = useState<{
        name: string; category: string; courseId: number; value: number;
    }[]>([])
    const [alternateCounts, setAlternateCounts] = useState<{
        name: string; category: string; courseId: number; value: number;
    }[]>([])

    useEffect(() => {
        const initialCareers = event.careers.map(career => ({
            name: career.name,
            category: career.category,
            courseId: career.courseId,
            value: 0
        }))

        setPrimaryCounts([...initialCareers])
        setAlternateCounts([...initialCareers])
    }, [event.careers])

    useEffect(() => {
        setPrimaryCounts(prevCareerCounts => {
            const updatedCounts = prevCareerCounts.map(career => ({
                ...career,
                value: 0
            }))

            surveys.forEach(survey => {
                survey.primaryCareers.forEach(selectedCareer => {
                    const careerToUpdate = updatedCounts.find(c => c.name === selectedCareer.name)
                    if (careerToUpdate) {
                        careerToUpdate.value += 1
                    }
                })
            })

            return updatedCounts
        })

        setAlternateCounts(prevCareerCounts => {
            const updatedCounts = prevCareerCounts.map(career => ({
                ...career,
                value: 0
            }))

            surveys.forEach(survey => {
                survey.alternateCareers.forEach(selectedCareer => {
                    const careerToUpdate = updatedCounts.find(c => c.name === selectedCareer.name)
                    if (careerToUpdate) {
                        careerToUpdate.value += 1
                    }
                })
            })

            return updatedCounts
        })
    }, [surveys])


    const handleSortOption = (event: React.ChangeEvent<HTMLInputElement>) => {
        setSortOption(event.target.checked)
    }

    const handleExport = async () => {
        setLoading(true)
        const params = new URLSearchParams()
        params.append('eventId', event.id.toString())
        params.append('sortOption', sortOption.toString())
        params.append('viewOption', viewOption.toString())
        params.append('includeAlternate', includeAlternate.toString())
        params.append('showAlternate', showAlternate.toString())

        agent.Survey.export(params)
            .then(response => downloadExcel(response))
            .catch(error => console.log(error))
            .finally(() => setLoading(false))
    }

    //Max Values
    let maxValue = Math.max(...primaryCounts.map(c => c.value))
    if (maxValue === 0) maxValue = 1
    let currentCategory = ''

    return (
        <>
            <Grid container>

                <Grid item xs={2}>
                    <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'flex-start', height: '100%' }}>
                        <Button variant="contained" color="inherit" onClick={back}>{schoolUser ? 'View Students' : 'Back'}</Button>
                    </Box>
                </Grid>
                <Grid item xs={8}>
                    <Typography variant="h3" textAlign='center' flexGrow={1}>{event.school.name} Survey Results</Typography>
                </Grid>
                <Grid item xs={2}></Grid>

                <Grid container item xs={12} sx={{ display: 'flex', justifyContent: 'space-between', mt: 2 }}>
                    <Grid item xs={4} sx={{ display: 'flex', justifyContent: 'flex-start' }}></Grid>
                    <Grid item xs={4} sx={{ display: 'flex', justifyContent: 'center', alignItems: 'center' }}>
                        <Box sx={{ display: 'flex', alignItems: 'center', border: '2px solid #ccc', borderRadius: '8px', overflow: 'hidden' }}>
                            <Button onClick={() => {
                                if (viewOption) setViewOption(!viewOption)
                                }}
                            sx={{
                                variant: viewOption ? '' : 'outlined',
                                    bgcolor: viewOption ? 'lightgray' : 'white',
                                    width: '120px', borderRadius: '4px 0 0 4px',
                                    transition: 'background-color 0.3s',
                                    '&:hover': {
                                        cursor: viewOption ? 'pointer' : 'default',
                                        bgcolor: viewOption ? '' : 'white'
                                    }
                                }}>
                                Categories
                            </Button>
                            <Button onClick={() => {
                                if (!viewOption) setViewOption(!viewOption)
                                }}
                            sx={{
                                variant: viewOption ? 'outlined' : '',
                                bgcolor: viewOption ? 'white' : 'lightgray',
                                width: '120px', borderRadius: '0 4px 4px 0',
                                transition: 'background-color 0.3s',
                                '&:hover': {
                                    cursor: viewOption ? 'default' : 'pointer',
                                    bgcolor: viewOption ? 'white' : ''
                                }
                            }}>
                                Students
                            </Button>
                        </Box>
                    </Grid>
                    <Grid item xs={4} sx={{ display: 'flex', justifyContent: 'flex-end', alignItems: 'center', pr: 2 }}>
                        <LoadingButton loading={loading} variant="contained" onClick={handleExport}>
                            Export
                        </LoadingButton>
                    </Grid>
                </Grid>

                <Grid item xs={12}>
                    {viewOption ? (
                        <Paper sx={{ px: 2, mx: 2, py: 1, my: 2 }}>
                            <Grid container item xs={12}>
                                <Grid container item xs={4} alignItems="center">
                                    <Switch onChange={(e) => setShowAlternate(e.target.checked)} color="default" />
                                    <Typography>{showAlternate ? "Show Primary" : "Show Alternate"}</Typography>
                                </Grid>
                                <Grid container item xs={4} justifyContent="center">
                                    <Typography variant="h6">{showAlternate ? "Alternate Choices" : "Primary Choices"}</Typography>
                                </Grid>
                                <Grid item xs={4}></Grid>
                            </Grid>
                            {surveys.sort((a,b) => a.student.lastFirstName.localeCompare(b.student.lastFirstName)).map((item, index) => (
                                <Box key={index}>
                                    <SurveyStudentLineItem item={item} showAlternate={showAlternate} event={event} schoolUser={schoolUser} />
                                </Box>
                            ))}
                        </Paper>
                    ) : (
                        <Paper sx={{ px: 2, mx: 2, py: 0, my: 1 }}>
                            <Box sx={{ display: 'flex', justifyContent: 'space-between' }}>
                                <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'flex-start', height: '100%' }}>
                                    <Switch onChange={handleSortOption} color="default" />
                                    <Typography>{sortOption ? "Sort by Category" : "Sort by Value"}</Typography>
                                    <Switch onChange={(e) => setIncludeAlternate(e.target.checked)} color="default" />
                                    <Typography>{includeAlternate ? "Exclude Alternate" : "Include Alternate"}</Typography>
                                </Box>
                                <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'flex-end' }}>
                                    Total Surveys: {surveys.length} || Complete: {event.surveyCompletePercent}%
                                </Box>
                            </Box>
                            {sortOption ? (
                                primaryCounts.sort((c, d) => d.value - c.value).map((item, index) => {
                                    const altItem = includeAlternate && alternateCounts.find(c => c.name === item.name)
                                    return (
                                        <Box key={index}>
                                            <SurveyResultLineItem item={item} maxValue={maxValue} altItem={altItem} />
                                            {index !== primaryCounts.length - 1 &&
                                                <Divider sx={{ mb: 0.5 }} />
                                            }
                                        </Box>
                                    )
                                })
                            ) : (
                                primaryCounts.sort((a, b) => {
                                    const categoryComparison = a.category.localeCompare(b.category);
                                    if (categoryComparison !== 0) return categoryComparison;

                                    return a.courseId - b.courseId;
                                }).map((item, index) => {
                                    const showCategory = item.category !== currentCategory
                                    const isFirst = currentCategory === ''
                                    if (showCategory) currentCategory = item.category
                                    const altItem = includeAlternate && alternateCounts.find(c => c.name === item.name)

                                    return (
                                        <Box key={index}>
                                            {showCategory &&
                                                <Divider sx={{ mb: 0.5, mt: isFirst ? 0 : 1 }} textAlign="left">
                                                    <Typography variant="body2" sx={{ color: "gray" }}>
                                                        {item.category}
                                                    </Typography>
                                                </Divider>
                                            }
                                            <SurveyResultLineItem item={item} maxValue={maxValue} altItem={altItem} />
                                        </Box>
                                    )
                                })
                            )}
                        </Paper>
                    )}
                </Grid>

            </Grid>
        </>
    )
}