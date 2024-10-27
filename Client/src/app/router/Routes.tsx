import { Navigate, createBrowserRouter } from "react-router-dom";
import App from "../layout/App";
import Speakers from "../../features/speaker/Speakers";
import Careers from "../../features/careers/Careers";
import Schools from "../../features/school/Schools";
import CareerEvents from "../../features/careerEvents/CareerEvents";
import ServerError from "../errors/ServerError";
import NotFound from "../errors/NotFound";
import Login from "../../features/account/Login";
import RequireAuth from "./RequireAuth";
import Survey from "../../features/survey/Survey";
import BuggyTester from "../../features/buggyTester/BuggyTester";
import Register from "../../features/account/Register";
import SchoolUsers from "../../features/account/SchoolUsers";
import EventDetails from "../../features/eventDetails/eventDetails";

export const router = createBrowserRouter([
    {
        path: '/',
        element: <App />,
        children: [
            {element: <RequireAuth roles={['Admin']}/>, children: [
                { path: '', element: <CareerEvents /> },
                { path: 'schools', element: <Schools /> },
                { path: 'careers', element: <Careers /> },
                { path: 'speakers', element: <Speakers /> },
                { path: 'register', element: <Register /> },
                { path: 'schoolAdmins', element: <SchoolUsers /> },
                { path: 'buggy-test', element: <BuggyTester /> },
            ]},
            {element: <RequireAuth roles={['SchoolUser']}/>, children: [
                { path: 'event-details', element: <EventDetails /> }
            ]},
            { path: 'login', element: <Login /> },
            { path: 'survey/:eventHash', element: <Survey /> },
            { path: 'server-error', element: <ServerError /> },
            { path: 'not-found', element: <NotFound /> },
            { path: '*', element: <Navigate replace to='/not-found' />}
        ]
    }
])