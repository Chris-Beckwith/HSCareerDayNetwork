import { Classroom } from "../models/classroom";

export function getCookie(key: string) {
    const b = document.cookie.match("(^|;)\\s*" + key + "\\s*=\\s*([^;]+)");
    return b ? b.pop() : "";
}

export function getClassroomText(classroom: Classroom | undefined) {
    return classroom 
        ? classroom.building + classroom.roomNumber 
            + " - Capacity: " + classroom.capacity
        : "Not assigned"
}

export function downloadExcel(response: any) {
    const blob = new Blob([response.file], { type: response.contentType })
    const link = document.createElement('a')
    const url = window.URL.createObjectURL(blob)

    link.href = url
    link.download = response.fileName
    
    document.body.appendChild(link)
    
    link.click()
    
    document.body.removeChild(link)
}