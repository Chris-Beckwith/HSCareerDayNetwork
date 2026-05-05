import { Business, Room } from "@mui/icons-material";
import { Classroom } from "../models/classroom";
import { Box } from "@mui/material";
import { DEFAULT_FONT_SIZE } from "./constants";


export function getClassroomText(classroom: Classroom | undefined) {
    return classroom ?
        ( <Box sx={{ display: 'flex', alignItems: 'center', fontSize: {xs: '.8rem', sm: '.9rem', md: '1rem'} }}>
            <Business fontSize="small" sx={{ color: 'chocolate', mb: .2, mr: .4 }} />{classroom.building}
            <Room fontSize="small" sx={{ color: 'red', mb: .2, ml: .5 }}/><Box>{classroom.roomNumber}</Box>
            <Box sx={{ ml: 1, textAlign: 'center' }}>Seats: {classroom.capacity}</Box>
        </Box>
        ) :
        <Box sx={{ fontSize: DEFAULT_FONT_SIZE }}>Not assigned</Box>
}
