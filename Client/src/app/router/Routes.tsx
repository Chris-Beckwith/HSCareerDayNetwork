import { Navigate, createBrowserRouter } from "react-router-dom";
import App from "../layout/App";
import Speakers from "../../features/speaker/Speakers";
import Careers from "../../features/careers/Careers";
import Schools from "../../features/school/Schools";
import CareerEvents from "../../features/careerEvents/CareerEvents";
import ServerError from "../errors/ServerError";
import NotFound from "../errors/NotFound";
import Login from "../../features/account/Login";
import Register from "../../features/account/Register";
import RequireAuth from "./RequireAuth";
import Survey from "../../features/survey/Survey";
import BuggyTester from "../../features/buggyTester/BuggyTester";

export const router = createBrowserRouter([
    {
        path: '/',
        element: <App />,
        children: [
            {element: <RequireAuth roles={['Admin']}/>, children: [
                { path: 'speakers', element: <Speakers /> },
                { path: '', element: <CareerEvents /> },
                { path: 'schools', element: <Schools /> },
                { path: 'careers', element: <Careers /> },
                { path: 'buggy-test', element: <BuggyTester /> },
            ]},
            { path: 'login', element: <Login /> },
            { path: 'register', element: <Register /> },
            { path: 'survey/:eventHash', element: <Survey /> },
            { path: 'server-error', element: <ServerError /> },
            { path: 'not-found', element: <NotFound /> },
            { path: '*', element: <Navigate replace to='/not-found' />}
        ]
    }
])