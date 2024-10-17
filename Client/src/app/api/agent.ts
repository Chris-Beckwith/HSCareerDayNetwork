import axios, { AxiosError, AxiosResponse } from "axios";
import { toast } from "react-toastify";
import { router } from "../router/Routes";
import { PaginatedResponse } from "../models/pagination";
import { store } from "../store/configureStore";

//Dev only sleep for testing loading animations
const sleep = () => new Promise(resolve => setTimeout(resolve, 250))

axios.defaults.baseURL = import.meta.env.VITE_API_URL
axios.defaults.withCredentials = true

const responseBody = (response: AxiosResponse) => response.data

axios.interceptors.request.use(config => {
    const token = store.getState().account.user?.token
    if (token) config.headers.Authorization = `Bearer ${token}`
    return config
})

axios.interceptors.response.use(async response => {
    if (import.meta.env.DEV) await sleep()
    const pagination = response.headers['pagination']
    if (pagination) {
        response.data = new PaginatedResponse(response.data, JSON.parse(pagination))
        return response
    }
    return response
}, (error: AxiosError) => {
    const {data, status} = error.response as AxiosResponse


    switch (status) {
        case 400:
            if (data.errors) {
                const modelStateErrors: string[] = []
                for (const key in data.errors) {
                    if (data.errors[key]) {
                        modelStateErrors.push(data.errors[key])
                    }
                }
                throw modelStateErrors.flat()
            }
            toast.error(data.title)
            break;
        case 401:
            toast.error(data.title)
            break;
        case 403:
            toast.error("You are not allowed to do that.")
            break;
        case 409:
            toast.error(data.message)
            break;
        case 500:
            router.navigate('/server-error', {state: {error: data}})
            break;
        default:
            break;
    }

    return Promise.reject(error.response)
})

const requests = {
    get: (url: string, params?: URLSearchParams) => axios.get(url, {params}).then(responseBody),
    post: (url: string, body: object) => axios.post(url, body).then(responseBody),
    put: (url: string, body: object) => axios.put(url, body).then(responseBody),
    delete: (url: string) => axios.delete(url).then(responseBody),
    deleteEvent: (url: string) => axios.put(url).then(responseBody),
    postForm: (url: string, data: FormData) => axios.post(url, data, {
        headers: {'Content-Type': 'multipart/form-data'}
    }).then(responseBody),
    putForm: (url: string, data: FormData) => axios.put(url, data, {
        headers: {'Content-Type': 'multipart/form-data'}
    }).then(responseBody),
    getBlob: (url: string, params: URLSearchParams) => 
        axios.get(url, {params, responseType: 'blob'}).then(responseBody)
}

function createFormData(item: any, parentKey?: string) {
    const formData = new FormData()

    function appendFormData(data: any, parentKey?: string) {
        if (data instanceof Object && !(data instanceof File)) {
            for (const key in data) {
                const value = data[key];
                const formKey = parentKey ? `${parentKey}[${key}]` : key;
                if (value instanceof Object && !(data instanceof File)) {
                    appendFormData(value, formKey);
                } else {
                    formData.append(formKey, value);
                }
            }
        } else {
            formData.append(parentKey || '', data);
        }
    }
    
    appendFormData(item, parentKey)
    return formData;
}

function createFileFormData(file: File, eventId: number) {
    const formData = new FormData()
    formData.append('file', file)
    formData.append('eventId', eventId.toString())
    return formData
}

const Event = {
    list: (params: URLSearchParams) => requests.get('events', params),
    details: (id: number) => requests.get(`events/${id}`),
    eventByGuid: (guid: string) => requests.get(`events/GetEventByGuid/${guid}`),
    create: (careerEvent: any) => requests.postForm('events', createFormData(careerEvent)),
    update: (careerEvent: any) => requests.putForm('events/update', createFormData(careerEvent)),
    updatePhase: (eventId: number, phaseId: number) =>
        requests.putForm('events/updatePhase', createFormData({eventId: eventId, phaseId: phaseId})),
    delete: (id: number) => requests.deleteEvent(`events/${id}/${true}`),
    restore: (id: number) => requests.deleteEvent(`events/${id}/${false}`),
    eventPhases: () => requests.get('events/phases')
}

const School = {
    list: (params: URLSearchParams) => requests.get('schools', params),
    details: (id: number) => requests.get(`schools/${id}`),
    create: (school: any) => requests.post('schools', school),
    update: (school: any) => requests.putForm('schools', createFormData(school)),
    delete: (id: number) => requests.delete(`schools/${id}`)
}

const Classroom = {
    listBySchool: (params: URLSearchParams) => requests.get('rooms/bySchool', params),
    create: (classroom: any) => requests.post('rooms', classroom),
    update: (classroom: any) => requests.putForm('rooms', createFormData(classroom)),
    delete: (id: number) => requests.delete(`rooms/${id}`)
}

const Student = {
    list: (params: URLSearchParams) => requests.get('student', params),
    byNumberAndEvent: (eventId: number, studentNumber: string) => 
        requests.get(`student/${eventId}/${studentNumber}`),
    import: (file: File, eventId: number) => 
        requests.postForm('student/ImportStudents', createFileFormData(file, eventId)),
    export: (params: URLSearchParams) => requests.getBlob('student/export', params),
    create: (student: any) => requests.post('student', student),
    update: (student: any) => requests.putForm('student', createFormData(student)),
    submitSurvey: (survey: any) => requests.post('student/submitSurvey', survey),
    deleteAll: (eventId: number) => requests.delete(`student/deleteAll/${eventId}`),
    delete: (id: number) => requests.delete(`student/${id}`)
}

const Speaker = {
    list: (params: URLSearchParams) => requests.get('speakers', params),
    create: (speaker: any) => requests.postForm('speakers', createFormData(speaker)),
    update: (speaker: any) => requests.putForm('speakers', createFormData(speaker)),
    delete: (id: number) => requests.delete(`speakers/${id}`)
}

const Career = {
    list: () => requests.get('careers'),
    categories: () => requests.get('careers/careerCategories'),
    create: (career: any) => requests.post('careers', career),
    update: (career: any) => requests.putForm('careers', createFormData(career)),
    delete: (id: number) => requests.delete(`careers/${id}`)
}

const CareerSet = {
    list: () => requests.get('careerSets'),
    create: (careerSet: any) => requests.post('careerSets', careerSet),
    update: (careerSet: any) => requests.putForm('careerSets', createFormData(careerSet)),
    delete: (id: number) => requests.delete(`careerSets/${id}`)
}

const Account = {
    login: (values: any) => requests.post('account/login', values),
    register: (values: any) => requests.post('account/register', values),
    currentUser: () => requests.get('account/currentUser')
}

const Survey = {
    // submit: (values: any) => requests.put('survey/submit', values)
    listByEvent: (eventId: number) => requests.get(`surveys/${eventId}`),
    deleteSurveysByEvent: (eventId: number) => requests.delete(`surveys/${eventId}`)
}

const Schedule = {
    generateSessions: (generationParams: any) => requests.postForm('scheduling', createFormData(generationParams))
}

const TestErrors = {
    get400Error: () => requests.get('buggy/bad-request'),
    get401Error: () => requests.get('buggy/unauthorized'),
    get404Error: () => requests.get('buggy/not-found'),
    get500Error: () => requests.get('buggy/server-error'),
    getValidationError: () => requests.get('buggy/validation-error'),
}

const agent = {
    Event,
    School,
    Classroom,
    Student,
    Speaker,
    Career,
    CareerSet,
    Account,
    Survey,
    Schedule,
    TestErrors
}

export default agent