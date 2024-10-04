import { Box, Typography, Button, Grid, Paper, Divider, Switch } from "@mui/material";
import useSurveys from "../../app/hooks/useSurveys";
import { CareerEvent } from "../../app/models/event";
import { useEffect, useState } from "react";
import SurveyResultLineItem from "./SurveyResultLineItem";

interface Props {
    event: CareerEvent
    back: () => void
}

export default function SurveyResults({ event, back }: Props) {
    const { surveys } = useSurveys(event.id)
    const [sortOption, setSortOption] = useState(false)
    const [primaryCounts, setPrimaryCounts] = useState<{
        name: string; category: string; courseId: number; value: number;
    }[]>([])
    // const [alternateCounts, setAlternateCounts] = useState<{
    //     name: string; category: string; courseId: number; value: number;
    // }[]>([])

    useEffect(() => {
        const initialCareers = event.careers.map(career => ({
            name: career.name,
            category: career.category,
            courseId: career.courseId,
            value: 0
        }))

        setPrimaryCounts([...initialCareers])
        // setAlternateCounts([...initialCareers])
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

        // setAlternateCounts(prevCareerCounts => {
        //     const updatedCounts = prevCareerCounts.map(career => ({
        //         ...career,
        //         value: 0
        //     }))

        //     surveys.forEach(survey => {
        //         survey.alternateCareers.forEach(selectedCareer => {
        //             const careerToUpdate = updatedCounts.find(c => c.name === selectedCareer.name)
        //             if (careerToUpdate) {
        //                 careerToUpdate.value += 1
        //             }
        //         })
        //     })

        //     return updatedCounts
        // })
    }, [surveys])


    const handleSortOption = (event: React.ChangeEvent<HTMLInputElement>) => {
        setSortOption(event.target.checked)
    }


    //Max Values
    let maxValue = Math.max(...primaryCounts.map(c => c.value))
    if (maxValue === 0) maxValue = 1
    // const maxValueWithAlternate = Math.max(
    //     ...primaryCounts.map(pCareer => {
    //         const sCareer = alternateCounts.find(s => s.name === pCareer.name)

    //         const alternateValue = sCareer ? sCareer.value : 0

    //         return pCareer.value + alternateValue
    //     })
    // )
    let currentCategory = ''

    return (
        <>
            <Grid container>

                <Grid item xs={2}>
                    <Box sx={{ display: 'flex', alignItems: 'center', justifyContent: 'flex-start', height: '100%' }}>
                        <Button variant="contained" color="inherit" onClick={back}>Back</Button>
                    </Box>
                </Grid>
                <Grid item xs={8}>
                    <Typography variant="h3" textAlign='center' flexGrow={1}>{event.school.name} Survey Results</Typography>
                </Grid>
                <Grid item xs={2}>
                    <Box sx={{ display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'flex-end', height: '100%' }}>
                        <Switch onChange={handleSortOption} color="default" />
                        <Typography>{sortOption ? "Sort by Value" : "Sort by Category"}</Typography>
                    </Box>
                </Grid>

                <Grid item xs={1}></Grid>
                <Grid item xs={10}>
                    <Paper sx={{ p: 2, m: 2 }}>
                        {sortOption ? (
                            primaryCounts.sort((c, d) => d.value - c.value).map((item, index) => (
                                <Box key={index}>
                                    <SurveyResultLineItem item={item} maxValue={maxValue}/>
                                    {index !== primaryCounts.length - 1 && 
                                        <Divider sx={{ mb: 0.5 }} />
                                    }
                                </Box>
                            ))
                        ) : (
                            primaryCounts.sort((a, b) => {
                                const categoryComparison = a.category.localeCompare(b.category);
                                if (categoryComparison !== 0) return categoryComparison;

                                return a.courseId - b.courseId;
                            }).map((item, index) => {
                                const showCategory = item.category !== currentCategory
                                const isFirst = currentCategory === ''
                                if (showCategory) currentCategory = item.category

                                return (
                                    <Box key={index}>
                                        {showCategory &&
                                            <Divider sx={{ mb: 0.5, mt: isFirst ? 0 : 1 }} textAlign="left">
                                                <Typography variant="body2" sx={{ color: "gray" }}>
                                                    {item.category}
                                                </Typography>
                                            </Divider>
                                        }
                                        <SurveyResultLineItem item={item} maxValue={maxValue}/>
                                    </Box>
                                )
                            })
                        )}
                    </Paper>
                </Grid>
                <Grid item xs={1}></Grid>

            </Grid>
        </>
    )
}