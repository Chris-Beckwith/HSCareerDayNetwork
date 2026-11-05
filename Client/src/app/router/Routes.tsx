import { createBrowserRouter } from "react-router-dom";
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
import RegisterAdmins from "../../features/account/RegisterAdmins";
import SchoolAdmins from "../../features/account/SchoolAdmins";
import EventDetails from "../../features/eventDetails/eventDetails";
import Licenses from "../../features/licensing/Licenses";
import LicenseRegistration from "../../features/licensing/LicenseRegistration";
import About from "../../features/about/About";
import LicenseInquiry from "../../features/licensing/LicenseInquiry";
import { ADMIN_ROLE, ADMIN_FULL_SURVEY_ROLES, SCHOOL_USER_ROLE } from "../util/permissions";

export const router = createBrowserRouter([
    {
        path: '/',
        element: <App />,
        children: [
            {element: <RequireAuth roles={[ADMIN_ROLE]} />, children: [
                { path: 'licensing', element: <Licenses /> },
                { path: 'testData', element: <CareerEvents /> },
                { path: 'buggy-test', element: <BuggyTester /> },
            ]},
            {element: <RequireAuth roles={ADMIN_FULL_SURVEY_ROLES} />, children: [
                { path: '', element: <CareerEvents /> },
                { path: 'schools', element: <Schools /> },
                { path: 'careers', element: <Careers /> },
                { path: 'speakers', element: <Speakers /> },
                { path: 'register', element: <RegisterAdmins /> },
                { path: 'schoolAdmins', element: <SchoolAdmins /> },
            ]},
            {element: <RequireAuth roles={[SCHOOL_USER_ROLE]} />, children: [
                { path: 'event-details', element: <EventDetails /> }
            ]},
            { path: 'login', element: <Login /> },
            { path: 'survey/:eventHash', element: <Survey /> },
            { path: 'registration/:inviteToken', element: <LicenseRegistration /> },
            { path: 'about', element: <About /> },
            { path: 'inquiry', element: <LicenseInquiry /> },
            { path: 'server-error', element: <ServerError /> },
            { path: 'not-found', element: <NotFound /> },
            { path: '*', element: <NotFound />}
        ]
    }
])