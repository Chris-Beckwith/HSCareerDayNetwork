--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE careerday;
ALTER ROLE careerday WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:3nTmWNRKb2wY9K4y43yEKA==$UqTHHtj61kcvzaArmGofHfdTPcbTdpqNmstb7UpmeAs=:1xto+pGngSvaNu26/C1odMpEq59Z7oXQQl6PEDXh0zc=';
CREATE ROLE careerday_db;
ALTER ROLE careerday_db WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:z2Ch7qSQ/+IufzoRs0612Q==$cwuXXPD7hZMpOITuBajaaX+egbWyijB3H6/4imhnVik=:rZZdxmrs2DNVpNP2TrP98+Kqz9gpOWNQ1U+RYvOpb9k=';
CREATE ROLE careerday_restored;
ALTER ROLE careerday_restored WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:xic32um3HItXebKi+LEsuQ==$hURWloHbPKk3ti57eivH6VVfCK713ORcKBZFiwjjFlY=:/ODfASxR9973Cu48HFvx2ay16vfKsg+7GZm6Sq8QPZg=';
CREATE ROLE flypgadmin;
ALTER ROLE flypgadmin WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:X+aiGnt5qh2+Zb77MsS97w==$5Gaj32KXd4Jkua1yVhkfZ48JXCpxj8hmskOG2rqpy8Q=:rm5baEWJyxGOaosyUVLfos7PLCQI2QcuYVCXDpJaC00=';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:DzKqAzLTKrrl+OMkqDGo5w==$CPNZ6Aah4fCA8HXGhmwwa3B9plZz9etImcHnxVrDbUQ=:ZNNuQyKGcUJVRhKxGauS4QpVehO5eZL839aowQJ7czc=';
CREATE ROLE repmgr;
ALTER ROLE repmgr WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'SCRAM-SHA-256$4096:aDKbyZ283PeyxxurbxJ5ew==$hjahMTEszAiK8rFEKBLTkoTn4vpvbEJj7HrZnk6ua1k=:mOa2y5HPj0+SK7eeMIOdyv1c9OyAJE+u/hVyUUikahQ=';

--
-- User Configurations
--








--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6 (Debian 15.6-1.pgdg120+2)
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- PostgreSQL database dump complete
--

--
-- Database "careerday" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6 (Debian 15.6-1.pgdg120+2)
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: careerday; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE careerday WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE careerday OWNER TO postgres;

\connect careerday

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: careerday; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE careerday SET default_transaction_read_only TO 'false';


\connect careerday

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "careerday?sslmode=disable" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6 (Debian 15.6-1.pgdg120+2)
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: careerday?sslmode=disable; Type: DATABASE; Schema: -; Owner: careerday
--

CREATE DATABASE "careerday?sslmode=disable" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE "careerday?sslmode=disable" OWNER TO careerday;

\connect -reuse-previous=on "dbname='careerday?sslmode=disable'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: careerday?sslmode=disable; Type: DATABASE PROPERTIES; Schema: -; Owner: careerday
--

ALTER DATABASE "careerday?sslmode=disable" SET default_transaction_read_only TO 'false';


\connect -reuse-previous=on "dbname='careerday?sslmode=disable'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: AspNetRoleClaims; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."AspNetRoleClaims" (
    "Id" integer NOT NULL,
    "RoleId" text NOT NULL,
    "ClaimType" text,
    "ClaimValue" text
);


ALTER TABLE public."AspNetRoleClaims" OWNER TO careerday;

--
-- Name: AspNetRoleClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: careerday
--

ALTER TABLE public."AspNetRoleClaims" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."AspNetRoleClaims_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: AspNetRoles; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."AspNetRoles" (
    "Id" text NOT NULL,
    "Name" character varying(256),
    "NormalizedName" character varying(256),
    "ConcurrencyStamp" text
);


ALTER TABLE public."AspNetRoles" OWNER TO careerday;

--
-- Name: AspNetUserClaims; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."AspNetUserClaims" (
    "Id" integer NOT NULL,
    "UserId" text NOT NULL,
    "ClaimType" text,
    "ClaimValue" text
);


ALTER TABLE public."AspNetUserClaims" OWNER TO careerday;

--
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE; Schema: public; Owner: careerday
--

ALTER TABLE public."AspNetUserClaims" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."AspNetUserClaims_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: AspNetUserLogins; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."AspNetUserLogins" (
    "LoginProvider" text NOT NULL,
    "ProviderKey" text NOT NULL,
    "ProviderDisplayName" text,
    "UserId" text NOT NULL
);


ALTER TABLE public."AspNetUserLogins" OWNER TO careerday;

--
-- Name: AspNetUserRoles; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."AspNetUserRoles" (
    "UserId" text NOT NULL,
    "RoleId" text NOT NULL
);


ALTER TABLE public."AspNetUserRoles" OWNER TO careerday;

--
-- Name: AspNetUserTokens; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."AspNetUserTokens" (
    "UserId" text NOT NULL,
    "LoginProvider" text NOT NULL,
    "Name" text NOT NULL,
    "Value" text
);


ALTER TABLE public."AspNetUserTokens" OWNER TO careerday;

--
-- Name: AspNetUsers; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."AspNetUsers" (
    "Id" text NOT NULL,
    "UserName" character varying(256),
    "NormalizedUserName" character varying(256),
    "Email" character varying(256),
    "NormalizedEmail" character varying(256),
    "EmailConfirmed" boolean NOT NULL,
    "PasswordHash" text,
    "SecurityStamp" text,
    "ConcurrencyStamp" text,
    "PhoneNumber" text,
    "PhoneNumberConfirmed" boolean NOT NULL,
    "TwoFactorEnabled" boolean NOT NULL,
    "LockoutEnd" timestamp with time zone,
    "LockoutEnabled" boolean NOT NULL,
    "AccessFailedCount" integer NOT NULL,
    "EventId" integer
);


ALTER TABLE public."AspNetUsers" OWNER TO careerday;

--
-- Name: CareerCareerSet; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."CareerCareerSet" (
    "CareerSetId" integer NOT NULL,
    "CareersId" integer NOT NULL
);


ALTER TABLE public."CareerCareerSet" OWNER TO careerday;

--
-- Name: CareerEvent; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."CareerEvent" (
    "CareersId" integer NOT NULL,
    "EventId" integer NOT NULL
);


ALTER TABLE public."CareerEvent" OWNER TO careerday;

--
-- Name: CareerSets; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."CareerSets" (
    "Id" integer NOT NULL,
    "Name" text
);


ALTER TABLE public."CareerSets" OWNER TO careerday;

--
-- Name: CareerSets_Id_seq; Type: SEQUENCE; Schema: public; Owner: careerday
--

ALTER TABLE public."CareerSets" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."CareerSets_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: CareerSpeaker; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."CareerSpeaker" (
    "CareersId" integer NOT NULL,
    "SpeakerId" integer NOT NULL
);


ALTER TABLE public."CareerSpeaker" OWNER TO careerday;

--
-- Name: Careers; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."Careers" (
    "Id" integer NOT NULL,
    "Name" text DEFAULT ''::text NOT NULL,
    "Description" text,
    "Category" text DEFAULT ''::text NOT NULL,
    "CourseId" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."Careers" OWNER TO careerday;

--
-- Name: Careers_Id_seq; Type: SEQUENCE; Schema: public; Owner: careerday
--

ALTER TABLE public."Careers" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Careers_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Classrooms; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."Classrooms" (
    "Id" integer NOT NULL,
    "SchoolId" integer DEFAULT 0 NOT NULL,
    "RoomNumber" text DEFAULT ''::text NOT NULL,
    "Building" text,
    "Capacity" integer NOT NULL,
    "Overflow" integer NOT NULL
);


ALTER TABLE public."Classrooms" OWNER TO careerday;

--
-- Name: Classrooms_Id_seq; Type: SEQUENCE; Schema: public; Owner: careerday
--

ALTER TABLE public."Classrooms" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Classrooms_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: EventPhases; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."EventPhases" (
    "Id" integer NOT NULL,
    "PhaseName" text
);


ALTER TABLE public."EventPhases" OWNER TO careerday;

--
-- Name: EventPhases_Id_seq; Type: SEQUENCE; Schema: public; Owner: careerday
--

ALTER TABLE public."EventPhases" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."EventPhases_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: EventSpeaker; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."EventSpeaker" (
    "EventId" integer NOT NULL,
    "SpeakersId" integer NOT NULL
);


ALTER TABLE public."EventSpeaker" OWNER TO careerday;

--
-- Name: Events; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."Events" (
    "Id" integer NOT NULL,
    "SchoolId" integer NOT NULL,
    "EventDate" timestamp with time zone NOT NULL,
    "Name" text,
    "Description" text,
    "SurveyCompletePercent" integer NOT NULL,
    "EventPhaseId" integer NOT NULL,
    "IsDeleted" boolean NOT NULL,
    "GUID" text,
    "PublicId" text,
    "QRCodeUrl" text
);


ALTER TABLE public."Events" OWNER TO careerday;

--
-- Name: Events_Id_seq; Type: SEQUENCE; Schema: public; Owner: careerday
--

ALTER TABLE public."Events" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Events_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Schools; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."Schools" (
    "Id" integer NOT NULL,
    "Name" text NOT NULL,
    "Address_Address1" text,
    "Address_Address2" text,
    "Address_City" text,
    "Address_State" text,
    "Address_Zip" text,
    "Address_Country" text,
    "EstimatedNumOfStudents" integer NOT NULL,
    "ContactEmail" text,
    "ContactName" text,
    "ContactPhone" text
);


ALTER TABLE public."Schools" OWNER TO careerday;

--
-- Name: Schools_Id_seq; Type: SEQUENCE; Schema: public; Owner: careerday
--

ALTER TABLE public."Schools" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Schools_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Sessions; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."Sessions" (
    "Id" integer NOT NULL,
    "ClassroomId" integer,
    "Period" integer NOT NULL,
    "SubjectId" integer,
    "EventId" integer NOT NULL
);


ALTER TABLE public."Sessions" OWNER TO careerday;

--
-- Name: Sessions_Id_seq; Type: SEQUENCE; Schema: public; Owner: careerday
--

ALTER TABLE public."Sessions" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Sessions_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SpeakerAddress; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."SpeakerAddress" (
    "Id" integer NOT NULL,
    "Address1" text,
    "Address2" text,
    "City" text,
    "State" text,
    "Zip" text,
    "Country" text
);


ALTER TABLE public."SpeakerAddress" OWNER TO careerday;

--
-- Name: Speakers; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."Speakers" (
    "Id" integer NOT NULL,
    "FirstName" text,
    "MiddleName" text,
    "LastName" text,
    "Title" text,
    "Company" text,
    "PortraitUrl" text,
    "Email" text,
    "PhoneNumber" text,
    "PublicId" text,
    "SchoolLastSpokeAtId" integer,
    "SessionId" integer
);


ALTER TABLE public."Speakers" OWNER TO careerday;

--
-- Name: Speakers_Id_seq; Type: SEQUENCE; Schema: public; Owner: careerday
--

ALTER TABLE public."Speakers" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Speakers_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Students; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."Students" (
    "Id" integer NOT NULL,
    "FirstName" text,
    "LastName" text,
    "StudentNumber" text,
    "SchoolId" integer,
    "Email" text,
    "EventId" integer DEFAULT 0 NOT NULL,
    "Gender" text,
    "Grade" integer DEFAULT 0 NOT NULL,
    "HomeroomNumber" text,
    "HomeroomTeacher" text,
    "LastFirstName" text,
    "SurveyComplete" boolean DEFAULT false NOT NULL,
    "SessionId" integer
);


ALTER TABLE public."Students" OWNER TO careerday;

--
-- Name: Students_Id_seq; Type: SEQUENCE; Schema: public; Owner: careerday
--

ALTER TABLE public."Students" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Students_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: SurveyAlternateCareers; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."SurveyAlternateCareers" (
    "AlternateCareersId" integer NOT NULL,
    "Survey1Id" integer NOT NULL
);


ALTER TABLE public."SurveyAlternateCareers" OWNER TO careerday;

--
-- Name: SurveyPrimaryCareers; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."SurveyPrimaryCareers" (
    "PrimaryCareersId" integer NOT NULL,
    "SurveyId" integer NOT NULL
);


ALTER TABLE public."SurveyPrimaryCareers" OWNER TO careerday;

--
-- Name: Surveys; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."Surveys" (
    "Id" integer NOT NULL,
    "StudentId" integer NOT NULL,
    "CreatedAt" timestamp with time zone DEFAULT '-infinity'::timestamp with time zone NOT NULL
);


ALTER TABLE public."Surveys" OWNER TO careerday;

--
-- Name: Surveys_Id_seq; Type: SEQUENCE; Schema: public; Owner: careerday
--

ALTER TABLE public."Surveys" ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Surveys_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: careerday
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO careerday;

--
-- Data for Name: AspNetRoleClaims; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."AspNetRoleClaims" ("Id", "RoleId", "ClaimType", "ClaimValue") FROM stdin;
\.


--
-- Data for Name: AspNetRoles; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."AspNetRoles" ("Id", "Name", "NormalizedName", "ConcurrencyStamp") FROM stdin;
26a8eac8-f02a-46e3-923a-11ccd8a42cb1	Admin	ADMIN	\N
28f040ce-d05d-4996-b30f-674ed9e3eda4	SchoolUser	SCHOOLUSER	\N
\.


--
-- Data for Name: AspNetUserClaims; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."AspNetUserClaims" ("Id", "UserId", "ClaimType", "ClaimValue") FROM stdin;
\.


--
-- Data for Name: AspNetUserLogins; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."AspNetUserLogins" ("LoginProvider", "ProviderKey", "ProviderDisplayName", "UserId") FROM stdin;
\.


--
-- Data for Name: AspNetUserRoles; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."AspNetUserRoles" ("UserId", "RoleId") FROM stdin;
f43b9af3-4637-4f5c-be87-76484932962b	26a8eac8-f02a-46e3-923a-11ccd8a42cb1
7b12bb47-42e5-492e-b42f-b791fd59dfa3	28f040ce-d05d-4996-b30f-674ed9e3eda4
\.


--
-- Data for Name: AspNetUserTokens; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."AspNetUserTokens" ("UserId", "LoginProvider", "Name", "Value") FROM stdin;
\.


--
-- Data for Name: AspNetUsers; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."AspNetUsers" ("Id", "UserName", "NormalizedUserName", "Email", "NormalizedEmail", "EmailConfirmed", "PasswordHash", "SecurityStamp", "ConcurrencyStamp", "PhoneNumber", "PhoneNumberConfirmed", "TwoFactorEnabled", "LockoutEnd", "LockoutEnabled", "AccessFailedCount", "EventId") FROM stdin;
7b12bb47-42e5-492e-b42f-b791fd59dfa3	Test	TEST	Test@test.com	TEST@TEST.COM	f	AQAAAAIAAYagAAAAEJ8MZ+qV4udWI/5fHF3FEgTQgN7rcfdKT0Fuck7xIixMidHJndc3ErklnKJX+asWFA==	FZIGZBNGIVWU42NAUHP4VTFN5KOMLQOL	f9bc950d-ab4d-443c-a868-8556accdeb44	\N	f	f	\N	t	0	15
f43b9af3-4637-4f5c-be87-76484932962b	CareerDayAdmin	CAREERDAYADMIN	srappaport@hscareerdaynetwork.com	SRAPPAPORT@HSCAREERDAYNETWORK.COM	f	AQAAAAIAAYagAAAAEN+WgAuVAL5QwRWwyNbsXG6xjFASVfNllClf9jaTHZ25c/2ndxZkdgJdg2w0DeX0IQ==	O5F3TPWSINOFHYCV2ESQ6GHKOTWT33I6	0d729509-71c1-4c30-a6f0-24c99a9f3ea9	\N	f	f	\N	t	0	\N
\.


--
-- Data for Name: CareerCareerSet; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."CareerCareerSet" ("CareerSetId", "CareersId") FROM stdin;
3	9
3	10
3	11
3	12
3	13
3	14
3	15
3	16
3	17
3	18
3	19
3	20
3	21
3	22
3	23
3	24
3	25
3	26
3	28
3	29
3	30
3	31
3	32
3	33
3	34
3	35
3	36
3	37
3	38
3	39
3	40
3	41
3	42
3	43
3	44
3	45
3	46
3	47
3	48
3	49
3	50
3	51
3	52
3	54
3	55
3	56
3	57
3	58
3	59
3	64
3	65
3	66
3	67
3	68
3	69
3	70
3	71
3	72
3	73
3	74
3	75
3	76
3	77
3	78
3	79
3	80
3	81
3	82
3	83
3	84
3	85
3	86
3	87
3	88
4	9
4	11
4	12
4	13
4	14
4	15
4	17
4	18
4	19
4	20
4	21
4	22
4	23
4	24
4	25
4	26
4	28
4	29
4	30
4	31
4	32
4	35
4	37
4	38
4	39
4	40
4	41
4	43
4	44
4	45
4	46
4	47
4	48
4	49
4	50
4	51
4	52
4	54
4	55
4	56
4	57
4	58
4	59
4	64
4	65
4	67
4	68
4	69
4	70
4	71
4	72
4	73
4	74
4	76
4	77
4	78
4	79
4	80
4	81
4	82
4	83
4	84
4	85
4	86
4	87
4	88
4	90
4	93
\.


--
-- Data for Name: CareerEvent; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."CareerEvent" ("CareersId", "EventId") FROM stdin;
9	21
11	21
12	21
16	21
18	21
19	21
20	21
21	21
22	21
23	21
24	21
25	21
26	21
28	21
30	21
31	21
9	5
10	5
11	5
12	5
13	5
14	5
15	5
16	5
17	5
18	5
19	5
20	5
21	5
22	5
23	5
24	5
25	5
26	5
32	21
28	5
29	5
30	5
31	5
32	5
33	5
34	5
35	5
36	5
37	5
38	5
39	5
40	5
41	5
42	5
43	5
44	5
45	5
46	5
47	5
48	5
49	5
50	5
51	5
52	5
33	21
54	5
55	5
56	5
57	5
58	5
59	5
64	5
65	5
66	5
67	5
68	5
69	5
70	5
71	5
72	5
73	5
74	5
75	5
76	5
77	5
78	5
79	5
80	5
81	5
82	5
83	5
84	5
85	5
86	5
87	5
88	5
9	7
10	7
11	7
12	7
13	7
14	7
15	7
16	7
17	7
18	7
19	7
20	7
21	7
22	7
23	7
24	7
25	7
26	7
34	21
28	7
29	7
30	7
31	7
32	7
33	7
34	7
35	7
36	7
37	7
38	7
39	7
40	7
41	7
42	7
43	7
44	7
45	7
46	7
47	7
48	7
49	7
50	7
51	7
52	7
35	21
54	7
55	7
56	7
57	7
58	7
59	7
64	7
65	7
66	7
67	7
68	7
69	7
70	7
71	7
72	7
73	7
74	7
75	7
76	7
77	7
78	7
79	7
80	7
81	7
82	7
83	7
84	7
85	7
86	7
87	7
88	7
36	21
37	21
38	21
39	21
40	21
41	21
42	21
43	21
44	21
45	21
46	21
47	21
48	21
49	21
50	21
51	21
52	21
54	21
55	21
56	21
57	21
58	21
59	21
64	21
65	21
66	21
67	21
68	21
69	21
70	21
71	21
72	21
73	21
74	21
75	21
76	21
77	21
78	21
79	21
80	21
81	21
82	21
83	21
84	21
85	21
86	21
87	21
88	21
9	13
11	13
12	13
13	13
14	13
15	13
17	13
18	13
19	13
20	13
21	13
22	13
23	13
24	13
25	13
26	13
28	13
29	13
30	13
31	13
32	13
35	13
37	13
38	13
39	13
40	13
41	13
43	13
44	13
45	13
46	13
47	13
48	13
49	13
50	13
51	13
52	13
54	13
55	13
56	13
57	13
58	13
59	13
64	13
65	13
67	13
68	13
69	13
70	13
71	13
72	13
73	13
74	13
76	13
77	13
78	13
79	13
80	13
81	13
82	13
83	13
84	13
85	13
86	13
87	13
88	13
90	13
93	13
9	15
11	15
12	15
13	15
14	15
15	15
17	15
18	15
19	15
20	15
21	15
22	15
23	15
24	15
25	15
26	15
28	15
29	15
30	15
31	15
32	15
35	15
37	15
38	15
39	15
40	15
41	15
43	15
44	15
45	15
46	15
47	15
48	15
49	15
50	15
51	15
52	15
54	15
55	15
56	15
57	15
58	15
59	15
64	15
65	15
67	15
68	15
69	15
70	15
71	15
72	15
73	15
74	15
76	15
77	15
78	15
79	15
80	15
81	15
82	15
83	15
84	15
85	15
86	15
87	15
88	15
90	15
93	15
\.


--
-- Data for Name: CareerSets; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."CareerSets" ("Id", "Name") FROM stdin;
3	All Careers
4	Leuzinger High School Career Day
\.


--
-- Data for Name: CareerSpeaker; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."CareerSpeaker" ("CareersId", "SpeakerId") FROM stdin;
\.


--
-- Data for Name: Careers; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."Careers" ("Id", "Name", "Description", "Category", "CourseId") FROM stdin;
9	Animal Science	veterinary medicine, vet tech, animal trainer, zoologist	Agriculture, Food & Natural Resources	101
10	Food Science	nutritionist, food production, packaging engineer	Agriculture, Food & Natural Resources	102
11	Acting	television/commercials, film, stage	Arts, Audio/Video Technology & Communications	301
12	Architecture	architect, urban planner, landscape design, historic preservation	Architecture & Construction	201
16	Communications/Public Relations	writing press releases, brand management	Arts, Audio/Video Technology & Communications	302
17	Fashion	designer, buyer, merchandise	Arts, Audio/Video Technology & Communications	303
18	Fine Arts	animators, painters, sculptors, illustrators	Arts, Audio/Video Technology & Communications	304
25	Entrepreneur	business owner	Business, Management & Administration	401
24	Writer/Author	\N	Arts, Audio/Video Technology & Communications	312
23	TV/Film Production	\N	Arts, Audio/Video Technology & Communications	311
22	TV/Film Writer	\N	Arts, Audio/Video Technology & Communications	310
21	Photography/Audio/Video	photographer, videographer, sound engineer, lighting engineer, video drone operator	Arts, Audio/Video Technology & Communications	309
20	Music	composers, performers, producers	Arts, Audio/Video Technology & Communications	308
28	Media Arts	animators, special effects	Arts, Audio/Video Technology & Communications	307
19	Journalism	print, internet, broadcast reporting	Arts, Audio/Video Technology & Communications	306
30	High School/University	professor, teacher, administrator	Education & Training	501
31	Accounting	auditor, tax account, bookkeeper, financial analyst	Finance	601
33	Insurance	actuary, fire & casualty agent, life & disability agent	Finance	603
35	Preschool/Elementary	teacher, administrator	Education & Training	502
36	Foreign Service	consular officer, diplomat, economic officer	Government & Public Administration	701
37	Government/Public Service	legislators, jobs in local, state, and national government	Government & Public Administration	702
39	Diagnostic Services	X-ray, MRI, CT tech	Health Science	802
41	Nurse Practitioner/Physician Assistant		Health Science	804
42	Ophthalmology/Optometry		Health Science	805
43	Pharmacist/Pharmaceuticals/Pharmacy Tech		Health Science	806
44	Physician/Surgeon		Health Science	807
45	Physical Therapist		Health Science	808
46	Radiology		Health Science	809
47	Registered Nurse		Health Science	810
48	Ultrasound Technician		Health Science	811
49	Event Planning/Hospitality	venue/entertainment manager, catering, hotel occupations	Hospitality and Tourism	901
51	Sports/Business Management	athlete, coach, recreation, sports business careers	Hospitality and Tourism	903
57	IT/Cyber Security		Information Technology	1102
58	Video Game Design/Development		Information Technology	1103
64	Air Force/Space Force/Navy/Coast Guard	\N	Law, Public Safety, Corrections & Security	1201
65	Army/Marines		Law, Public Safety, Corrections & Security	1202
66	Customs and Border Patrol		Law, Public Safety, Corrections & Security	1203
67	Firefighter/Paramedic		Law, Public Safety, Corrections & Security	1204
68	Law	lawyer, paralegal, court reporter	Law, Public Safety, Corrections & Security	1205
69	Law Enforcement/Security	police, FBI, private security	Law, Public Safety, Corrections & Security	1206
70	Lifeguard/EMT		Law, Public Safety, Corrections & Security	1207
34	Securities and Investments	stockbroker	Finance	605
74	Social Media/Influencer		Marketing, Sales & Service	1403
75	Astrophysics		Science, Technology, Engineering & Mathematics (STEM)	1501
76	Biomedical Science		Science, Technology, Engineering & Mathematics (STEM)	1502
77	Chemistry/Biometrics/DNA	scientist, chemist, biochemist	Science, Technology, Engineering & Mathematics (STEM)	1503
78	CSI/Forensics		Science, Technology, Engineering & Mathematics (STEM)	1504
54	Psychology	psychologist, marriage & family counselor	Human Services	1004
13	Environmental Protection	park ranger, natural resource tech, marine biologist, meteorologist, water conservationist	Agriculture, Food & Natural Resources	103
14	Building Construction & Development	contractor, project manager, building inspector	Architecture & Construction	202
15	Interior Design	\N	Architecture & Construction	204
29	Floral Design	designer, florist, nursery	Arts, Audio/Video Technology & Communications	305
40	Medical Assistant	Performs EKGs and lab tests, assists doctors with exams and procedures, takes and records vital signs and medical histories, schedules appointments	Health Science	803
32	Financial Services	banking, business finance, securities, and investments	Finance	602
50	Culinary Arts	restaurants, chefs, and food and beverage services	Hospitality and Tourism	902
52	Beauty	hair stylist, make-up artist, cosmetologist, esthetician, manicurist	Human Services	1001
56	AI/Computer Science	using technology as a tool for analysis and development	Information Technology	1101
71	Trades	electrician, plumber, welder, carpenter	Manufacturing	1301
59	Web Design/Development 	\N	Information Technology	1104
72	Marketing/Sales	marketing, distribution, sales management, advertising, public relations, communications	Marketing, Sales & Service	1401
80	Aerospace Engineering		Science, Technology, Engineering & Mathematics (STEM)	1506
82	Electrical Engineering		Science, Technology, Engineering & Mathematics (STEM)	1508
83	Mechanical Engineering		Science, Technology, Engineering & Mathematics (STEM)	1509
84	Structural/Architectural Engineering		Science, Technology, Engineering & Mathematics (STEM)	1510
85	Systems/Process Engineering	Systems engineers oversee the entire life cycle of a project. A process or manufacturing process engineer designs and implements systems and equipment procedures used in manufacturing facilities.	Science, Technology, Engineering & Mathematics (STEM)	1511
86	Automotive	mechanic, automobile sales, automobile services	Transportation, Distribution & Logistics	1601
87	Aviation	pilot, flight attendant, air traffic controller, airport administration	Transportation, Distribution & Logistics	1602
38	Dentistry	dentist, dental hygienist, oral surgeon, periodontist, endodontist	Health Science	801
55	Social Services	humanitarian, nonprofit. social worker	Human Services	1005
89	Education		Education & Training	503
90	Money Management		Finance	604
91	Military		Law, Public Safety, Corrections & Security	1208
93	Civil Engineer	deals with the design, construction, and maintenance of roads, bridges, airports, and structural components of buildings	Architecture & Construction	203
26	Business Management	general management, human resource management, labor relations	Business, Management & Administration	402
88	Fitness/Wellness	personal trainer, healthy living, life coach, chiropractor, massage therapist	Human Services	1002
73	Real Estate	residential/commercial agent, mortgage broker, loan officer, appraiser, leasing agent, escrow officer, property manager	Marketing, Sales & Service	1402
79	Data Scientist/Statistics	statistical analyst, data engineer, data scientist, database administrator	Science, Technology, Engineering & Mathematics (STEM)	1505
81	Computer Software Engineering	design, integration, and maintenance of software, hardware, and networks	Science, Technology, Engineering & Mathematics (STEM)	1507
\.


--
-- Data for Name: Classrooms; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."Classrooms" ("Id", "SchoolId", "RoomNumber", "Building", "Capacity", "Overflow") FROM stdin;
6	5	101	A	35	0
\.


--
-- Data for Name: EventPhases; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."EventPhases" ("Id", "PhaseName") FROM stdin;
1	Created
2	Survey In Progress
3	Survey Closed
4	Sessions Generated
5	Rooms Assigned
6	Speakers Assigned
7	Ready for Schedule Export
8	Completed
9	Cancelled
\.


--
-- Data for Name: EventSpeaker; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."EventSpeaker" ("EventId", "SpeakersId") FROM stdin;
21	1
21	2
\.


--
-- Data for Name: Events; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."Events" ("Id", "SchoolId", "EventDate", "Name", "Description", "SurveyCompletePercent", "EventPhaseId", "IsDeleted", "GUID", "PublicId", "QRCodeUrl") FROM stdin;
7	1	2024-11-12 08:00:00+00	El Segundo High School	null	0	2	f	1e001fa6-7643-4af6-9fa3-35c8be0be70b	eazvqip9ozcp9zhubfyw	https://res.cloudinary.com/da7nuaie7/image/upload/v1726879321/eazvqip9ozcp9zhubfyw.png
5	5	2025-02-20 08:00:00+00	Demo High	Career Day 2025	100	3	f	d4f5e771-5d05-403a-bc4a-2b7f43636f62	faqa7ypcg9dmwitnxnv5	https://res.cloudinary.com/da7nuaie7/image/upload/v1726532450/faqa7ypcg9dmwitnxnv5.png
21	5	2024-10-18 07:00:00+00	test school	null	0	2	f	fe6cbc84-b445-4f0c-9d99-20887e7849f6	ehqbpisiudzzoy7byu7q	https://res.cloudinary.com/da7nuaie7/image/upload/v1729317774/ehqbpisiudzzoy7byu7q.png
13	8	2025-03-13 07:00:00+00	Leuzinger High School Career Day	null	0	2	f	dcdb61f5-72bc-4415-9644-3dc4c7c38e8a	srmtttzvqdj3lnbh4u93	https://res.cloudinary.com/da7nuaie7/image/upload/v1729294755/srmtttzvqdj3lnbh4u93.png
15	4	2025-02-20 08:00:00+00	Hawthorne High School Career Day	null	0	2	f	4c04feee-c5a3-4827-ad04-80b28cbcf4ed	eokamfihyv5qvzxt7z5n	https://res.cloudinary.com/da7nuaie7/image/upload/v1729294819/eokamfihyv5qvzxt7z5n.png
\.


--
-- Data for Name: Schools; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."Schools" ("Id", "Name", "Address_Address1", "Address_Address2", "Address_City", "Address_State", "Address_Zip", "Address_Country", "EstimatedNumOfStudents", "ContactEmail", "ContactName", "ContactPhone") FROM stdin;
5	test school	1912 Grismer Ave	Unit B	Burbank	CA	91504	\N	123	Cbeckwit1@gmail.com	Chris Beckwith	3106920400
7	Lawndale High School	14901 S. Inglewood Avenue	\N	Lawndale	CA	90260	null	1652	vareer@cvuhsd.org	Dr. Rosalyn Varee	310-263-3103
1	El Segundo High School	640 Main St.	null	El Segundo	CA	90245	USA	0	bcvejic@esusd.net	Branka Cvejic	310-615-2662
4	Hawthorne High School	4859 W. El Segundo Blvd.	null	Hawthorne	CA	90250	null	0	saenezm@cvuhsd.org	Matt Saenez	310-263-4403
8	Leuzinger High School	4118 West Rosecrans Avenue	\N	Lawndale	CA	90260	null	0	estradae@cvuhsd.org	Erin Estrada	310-263-2203
\.


--
-- Data for Name: Sessions; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."Sessions" ("Id", "ClassroomId", "Period", "SubjectId", "EventId") FROM stdin;
\.


--
-- Data for Name: SpeakerAddress; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."SpeakerAddress" ("Id", "Address1", "Address2", "City", "State", "Zip", "Country") FROM stdin;
1	123 Test St	\N	Testcity	CA	90000	USA
7	\N	\N	\N	\N	\N	\N
2	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: Speakers; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."Speakers" ("Id", "FirstName", "MiddleName", "LastName", "Title", "Company", "PortraitUrl", "Email", "PhoneNumber", "PublicId", "SchoolLastSpokeAtId", "SessionId") FROM stdin;
1	First	Middle	Test	TitleTest	CompanyTest	/images/cure.jpg	Test@test.com	12345678900	\N	\N	\N
3	Sacha	Baron	Cohen	Documentarian	Cultural Learnings of America for Make Benefit Glorius Nation of Kazakhstan	/images/borat.jpg	Borat@Kazakhstan.com	12345678900	\N	\N	\N
4	Captain	Pirate	Hook	Pirate Captain	Black Pearl	/images/pirate.jpg	Pirate@Hook.com	12345678900	\N	\N	\N
5	Wat	What	Wut	Journalist	NBC	/images/wat.jpg	wat@nbc.gov	12345678900	\N	\N	\N
6	NewFirst	NewMiddle	NewTest	NewTitle	NewCompanyTest	/images/pirate.jpg	NewTest@newTest.com	12345678900	\N	\N	\N
7	ATest1	\N	Speaker	Title	Company	https://res.cloudinary.com/da7nuaie7/image/upload/v1723584199/ecmeyg3koodedptqddxg.jpg	asdf@asdf.com	\N	ecmeyg3koodedptqddxg	\N	\N
2	Chris	William	Beckwith	Lead Developer	Foil Forest	/images/chris.png	Cbeckwit1@gmail.com	12345678900	\N	1	\N
\.


--
-- Data for Name: Students; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."Students" ("Id", "FirstName", "LastName", "StudentNumber", "SchoolId", "Email", "EventId", "Gender", "Grade", "HomeroomNumber", "HomeroomTeacher", "LastFirstName", "SurveyComplete", "SessionId") FROM stdin;
6274	Tenarri	Adams	59305	4	t.adams305@cvuhsd.org	15	F	9	J-112	Levine, Allison A	Adams, Tenarri Dennay	f	\N
6275	Andre	Aguilar Lopez	58594	4	a.aguilarlopez594@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Aguilar Lopez, Andre Raul	f	\N
6276	Miguel	Aguilar Sanchez	59078	4	m.aguilarsanchez078@cvuhsd.org	15	M	9	C-106	Howard Johnson, Crystal	Aguilar Sanchez, Miguel Angel	f	\N
6277	Michael	Aguirre	58910	4	m.aguirre910@cvuhsd.org	15	M	9	M-213	Traylor, Dean S.	Aguirre, Michael Adalberto	f	\N
6278	Lucia	Ake	59237	4	l.ake237@cvuhsd.org	15	F	9	K-115	Poland, Susan M.	Ake, Lucia Guadalupe	f	\N
6279	Andy	Alatorre	57652	4	a.alatorre652@cvuhsd.org	15	M	9	F-106	Givens, Kathy E.	Alatorre, Andy Joshua	f	\N
6280	Tahjay	Allen	58550	4	t.allen550@cvuhsd.org	15	M	9	D-108	Infante Razo, Carlos	Allen, Tahjay Cortes	f	\N
6281	Clara	Altamirano	57903	4	c.altamirano903@cvuhsd.org	15	F	9	M-213	Traylor, Dean S.	Altamirano, Clara	f	\N
6282	Akemi Leikai'a Trinity Sakura	Alvarado	59201	4	a.alvarado201@cvuhsd.org	15	F	9	C-203	Duran, Dominic J	Alvarado, Akemi Leikai'a Trinity Sakura	f	\N
6283	Fernando	Alvarado	58551	4	f.alvarado551@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Alvarado, Fernando Robert	f	\N
6284	Jaehlyn	Alvarado	59060	4	j.alvarado060@cvuhsd.org	15	F	9	L-103	Castillo, Amy	Alvarado, Jaehlyn Allesia	f	\N
6285	Isaac	Alvarez Arriaga	57659	4	i.alvarezarriaga659@cvuhsd.org	15	M	9	C-106	Howard Johnson, Crystal	Alvarez Arriaga, Isaac Alvarez Arriaga	f	\N
6286	Alexis	Alvarez Munguia	57648	4	a.alvarezmunguia648@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Alvarez Munguia, Alexis	f	\N
6287	German	Antonio	58512	4	g.antonio512@cvuhsd.org	15	M	9	C-106	Howard Johnson, Crystal	Antonio, German	f	\N
6288	Axel	Apolinario	57683	4	a.apolinario683@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Apolinario, Axel Damir	f	\N
6289	Daryl	Apolinario	57607	4	d.apolinario607@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Apolinario, Daryl Azael	f	\N
6290	Lennyn	Aquila-Sirias	58183	4	l.aquilasirias183@cvuhsd.org	15	M	9	F-106	Givens, Kathy E.	Aquila-Sirias, Lennyn Alexander	f	\N
6291	August	Arabia	58021	4	a.arabia021@cvuhsd.org	15	M	9	K-202	Allen, Richard E	Arabia, August Aiden	f	\N
6292	Chrystopher	Arana	58747	4	c.arana747@cvuhsd.org	15	M	9	M-213	Traylor, Dean S.	Arana, Chrystopher Daniels	f	\N
6293	Carmen	Araya	57716	4	c.araya716@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Araya, Carmen Isabella	f	\N
6294	Cassie	Archibald	57645	4	c.archibald645@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Archibald, Cassie Megan	f	\N
6295	Esteban	Arteaga	58191	4	e.arteaga191@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	Arteaga, Esteban Fernando	f	\N
6296	Ezequiel	Ayon	59133	4	e.ayon133@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Ayon, Ezequiel	f	\N
6297	Angelina Joy	Ayudan	58977	4	a.ayudan977@cvuhsd.org	15	F	9	L-201	Haynes, Cordell	Ayudan, Angelina Joy Cruz	f	\N
6298	Bella	Baez	58913	4	b.baez913@cvuhsd.org	15	F	9	C-106	Howard Johnson, Crystal	Baez, Bella Elizabeth	f	\N
6299	Brian	Banton	58579	4	b.banton579@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Banton, Brian Justin	f	\N
6300	Itzela	Banuelos Jauregui	58557	4	i.banuelosjaureg557@cvuhsd.org	15	F	9	C-203	Duran, Dominic J	Banuelos Jauregui, Itzela	f	\N
6301	Christopher	Barba	57904	4	c.barba904@cvuhsd.org	15	M	9	M-110	Segovia, Jose M	Barba, Christopher Alexander	f	\N
6302	Leonardo	Barrera LLanes	57836	4	l.barrerallanes836@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Barrera LLanes, Leonardo Enrique	f	\N
6303	Angel	Barrera	59194	4	a.barrera194@cvuhsd.org	15	M	9	K-105	Gonzalez, Alejandra	Barrera, Angel Ricardo	f	\N
6304	Andy	Barrios	57661	4	a.barrios661@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	Barrios, Andy	f	\N
6305	Audrey	Barron	58749	4	a.barron749@cvuhsd.org	15	F	9	E-107	Takamoto, Jason K.	Barron, Audrey Giselle	f	\N
6306	Jonatan	Bazan	58655	4	j.bazan655@cvuhsd.org	15	M	9	M-110	Segovia, Jose M	Bazan, Jonatan Ruben	f	\N
6307	Jacob	Becerra	57662	4	j.becerra662@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Becerra, Jacob Andrew	f	\N
6308	Gavin	Bermudez	58537	4	g.bermudez537@cvuhsd.org	15	M	9	J-118	Gray, Ron	Bermudez, Gavin Joshua	f	\N
6309	Genesis	Beteta Diaz	59202	4	g.betetadiaz202@cvuhsd.org	15	F	9	L-102	Farkouh, Raphael M.	Beteta Diaz, Genesis Eunice	f	\N
6310	Lucian	Blanco	57900	4	l.blanco900@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Blanco, Lucian Altair	f	\N
6311	Sebastian	Boehler Rivera	57803	4	s.boehlerrivera803@cvuhsd.org	15	M	9	D-108	Infante Razo, Carlos	Boehler Rivera, Sebastian Alexander	f	\N
6312	Loren	Borges Frometa	58620	4	l.borgesfrometa620@cvuhsd.org	15	M	9	L-103	Castillo, Amy	Borges Frometa, Loren David	f	\N
6313	Julian	Bracamonte	59080	4	j.bracamonte080@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	Bracamonte, Julian Angel	f	\N
6314	Fernando	Bravo	59134	4	f.bravo134@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Bravo, Fernando Abel	f	\N
6315	Ma'Kyih	Brown	58695	4	m.brown695@cvuhsd.org	15	M	9	J-112	Levine, Allison A	Brown, Ma'Kyih Isaiah	f	\N
6316	Justin	Bruce	58704	4	j.bruce704@cvuhsd.org	15	M	9	M-110	Segovia, Jose M	Bruce, Justin Daniel	f	\N
6317	Jonah	Burell	58497	4	j.burell497@cvuhsd.org	15	M	9	C-106	Howard Johnson, Crystal	Burell, Jonah Jasiah	f	\N
6318	Christopher	Cabrera	58849	4	c.cabrera849@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Cabrera, Christopher Alexander	f	\N
6319	Julian	Cabrera	58358	4	j.cabrera358@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Cabrera, Julian Jaime	f	\N
6320	Levi	Cameron	59082	4	l.cameron082@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Cameron, Levi Wari	f	\N
6321	Ian	Campos-Nino	57797	4	i.camposnino797@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	Campos-Nino, Ian Alexander	f	\N
2662	Trinitee	Agricourt	20802	1	tagricourt_27@esusdstudents.org	5	F	9	B100	Strawn, April	Agricourt, Trinitee Nevaeh	t	\N
2664	Tina	Akleh	22460	1	takleh_27@esusdstudents.org	5	F	9	R101	Hansen, Bjorn	Akleh, Tina	t	\N
2665	Fernanda	Alanis-Sanchez	20752	1	falanis-sanchez_27@esusdstudents.org	5	F	9	A101	Daegele, Kimberly	Alanis-Sanchez, Fernanda Gabriella	t	\N
2666	Devin	Alavez	17382	1	dalavez_27@esusdstudents.org	5	M	9	A101	Daegele, Kimberly	Alavez, Devin Thomas	t	\N
2667	Sienna	Alcus	17538	1	salcus_27@esusdstudents.org	5	F	9	A101	Daegele, Kimberly	Alcus, Sienna Porta	t	\N
6322	Brissa	Canche Noh	57998	4	b.canchenoh998@cvuhsd.org	15	F	9	L-103	Castillo, Amy	Canche Noh, Brissa Haymar	f	\N
2668	Dean	Ali	21061	1	dali_27@esusdstudents.org	5	M	9	North Gym	Smith, Rainy	Ali, Dean Maliq	t	\N
2669	Mackenzie	Anderson	22874	1	manderson_27@esusdstudents.org	5	F	9	A104	Sidwell, Glenn	Anderson, Mackenzie Vanessa	t	\N
2671	Madison	Antonelli	18157	1	mantonelli_27@esusdstudents.org	5	F	9	B203	O'Keefe, Amy Ann	Antonelli, Madison Rosemary	t	\N
2672	Jayleen	Arias	19099	1	jarias_27@esusdstudents.org	5	F	9	C100	Kadonaga, Theresa M	Arias, Jayleen	t	\N
2673	Landon	Aubert	16703	1	laubert_27@esusdstudents.org	5	M	9	K201	Kojima, Tyler	Aubert, Landon Reese	t	\N
2674	Rami	Awada	15596	1	rawada_27@esusdstudents.org	5	M	9	B203	O'Keefe, Amy Ann	Awada, Rami Ali	t	\N
2675	Thomas	Ayoub	21914	1	tayoub_27@esusdstudents.org	5	M	9	South Gym	March, David	Ayoub, Thomas Mena	t	\N
2676	Sonja	Bandy	16485	1	sbandy_27@esusdstudents.org	5	F	9	K201	Kojima, Tyler	Bandy, Sonja Kat	t	\N
2677	Elijah	Barnes	22637	1	ebarnes_27@esusdstudents.org	5	M	9	Engineerin	Zwissler, Darwin	Barnes, Elijah James	t	\N
2678	Rhodes	Baron	17396	1	rbaron_27@esusdstudents.org	5	M	9	B104	Gaxiola, Gabriela	Baron, Rhodes Atwater	t	\N
2680	Alexa	Barry	21997	1	abarry_27@esusdstudents.org	5	F	9	A210	Doering, Mark Edward	Barry, Alexa Grace	t	\N
2681	Luke	Bartholomew	16146	1	lbartholomew_27@esusdstudents.org	5	M	9	North Gym	Smith, Rainy	Bartholomew, Luke Aaron	t	\N
2682	Leonie	Basterretche	18696	1	lbasterretche_27@esusdstudents.org	5	F	9	K100	Jeon, Paul	Basterretche, Leonie Catherine	t	\N
2683	Isabella	Beltramo	17523	1	ibeltramo_27@esusdstudents.org	5	F	9	A101	Daegele, Kimberly	Beltramo, Isabella Rose	t	\N
2684	Wyatt	Benson	17411	1	wbenson_27@esusdstudents.org	5	M	9	A103	Page, Jessica L.	Benson, Wyatt Kobe	t	\N
2685	Kira	Bernauer	17515	1	kbernauer_27@esusdstudents.org	5	F	9	K217	Turner, Lauren Alissa	Bernauer, Kira Celeste	t	\N
2686	Valentina	Bogan	19901	1	vbogan_27@esusdstudents.org	5	F	9	B202	Adams, Nicole	Bogan, Valentina	t	\N
2687	Lillian	Booterbaugh	21685	1	lbooterbaugh2_27@esusdstudents.org	5	F	9	A101	Daegele, Kimberly	Booterbaugh, Lillian Noelani	t	\N
2688	Luke	Booterbaugh	21686	1	lbooterbaugh_27@esusdstudents.org	5	M	9	A101	Daegele, Kimberly	Booterbaugh, Luke Nakoa	t	\N
2689	Elizabeth	Bosco	22386	1	ebosco_27@esusdstudents.org	5	F	9	R101	Hansen, Bjorn	Bosco, Elizabeth Alessandra	t	\N
2690	Colin	Boushell	16677	1	cboushell_27@esusdstudents.org	5	M	9	A104	Sidwell, Glenn	Boushell, Colin Hutchison	t	\N
2691	Molly	Boushell	16679	1	mboushell_27@esusdstudents.org	5	F	9	B104	Gaxiola, Gabriela	Boushell, Molly Claire	t	\N
2692	Samantha	Brady	17413	1	sbrady_27@esusdstudents.org	5	F	9	A101	Daegele, Kimberly	Brady, Samantha Lee	t	\N
2693	Reef	Brock	22441	1	rbrock_27@esusdstudents.org	5	M	9	K201	Kojima, Tyler	Brock, Reef Wilder	t	\N
2695	Lucas	Bryant	16682	1	lbryant_27@esusdstudents.org	5	M	9	A104	Sidwell, Glenn	Bryant, Lucas	t	\N
2696	Alexander	Caban	17525	1	acaban_27@esusdstudents.org	5	M	9	R103	Moeller, Jill	Caban, Alexander Michael	t	\N
2697	Ernest	Cabrera	19829	1	ecabrera_27@esusdstudents.org	5	M	9	A101	Daegele, Kimberly	Cabrera, Ernest	t	\N
2698	Dane	Canvin	22436	1	dcanvin_27@esusdstudents.org	5	M	9	A104	Sidwell, Glenn	Canvin, Dane Sequoia	t	\N
2699	Isabella	Cardenas	22875	1	icardenas_27@esusdstudents.org	5	F	9	R101	Hansen, Bjorn	Cardenas, Isabella Grace	t	\N
2700	Sadie	Carrigan	18698	1	scarrigan_27@esusdstudents.org	5	F	9	A104	Sidwell, Glenn	Carrigan, Sadie Machelle	t	\N
2701	Lindzy	Carroll	18052	1	lcarroll_27@esusdstudents.org	5	F	9	K201	Kojima, Tyler	Carroll, Lindzy Rachel	t	\N
2702	Ethan	Casper	20781	1	ecasper_27@esusdstudents.org	5	M	9	B203	O'Keefe, Amy Ann	Casper, Ethan Marcus	t	\N
2703	Justin	Castellanos	22876	1	jcastellanos_27@esusdstudents.org	5	M	9	R101	Hansen, Bjorn	Castellanos, Justin Phillip	t	\N
2704	Ava	Cecconi	17415	1	acecconi_27@esusdstudents.org	5	F	9	B202	Adams, Nicole	Cecconi, Ava Lilyanna	t	\N
2705	Brayden	Chang	18054	1	bchang_27@esusdstudents.org	5	M	9	Engineerin	Zwissler, Darwin	Chang, Brayden	t	\N
2707	Oliver	Chartier	18644	1	ochartier_27@esusdstudents.org	5	M	9	B100	Strawn, April	Chartier, Oliver Keene	t	\N
2708	Owen	Chasez	18634	1	ochasez_27@esusdstudents.org	5	M	9	A101	Daegele, Kimberly	Chasez, Owen	t	\N
2709	Mario	Chavarin	21062	1	mchavarin_27@esusdstudents.org	5	M	9	B205	Nieto Viteri, Grace	Chavarin, Mario Guilian	t	\N
2710	Sienna	Chavez	20793	1	schavez_27@esusdstudents.org	5	F	9	A101	Daegele, Kimberly	Chavez, Sienna Isabel	t	\N
2711	Sonia	Cheung	20753	1	scheung_27@esusdstudents.org	5	F	9	North Gym	Smith, Rainy	Cheung, Sonia Wing-Jun	t	\N
2712	Eliza	Chiavaro	20748	1	echiavaro_27@esusdstudents.org	5	F	9	B100	Strawn, April	Chiavaro, Eliza Madeline	t	\N
2713	Chloe	Chung	20754	1	cchung_27@esusdstudents.org	5	F	9	R101	Hansen, Bjorn	Chung, Chloe Ke Xin	t	\N
2714	Sophie	Clifton	19739	1	sclifton_27@esusdstudents.org	5	F	9	K100	Jeon, Paul	Clifton, Sophie Sky	t	\N
2715	Carlin	Cliver	20788	1	ccliver_27@esusdstudents.org	5	M	9	K217	Turner, Lauren Alissa	Cliver, Carlin James	t	\N
2716	Brogan	Comer	21270	1	bcomer_27@esusdstudents.org	5	M	9	A104	Sidwell, Glenn	Comer, Brogan Rey	t	\N
2717	Nyla	Cooley	18227	1	ncooley_27@esusdstudents.org	5	F	9	R103	Moeller, Jill	Cooley, Nyla Shea	t	\N
2718	Sasha	Cotrufo	17421	1	scotrufo_27@esusdstudents.org	5	F	9	B100	Strawn, April	Cotrufo, Sasha J.	t	\N
2719	Bradley	Cryer	22468	1	bcryer_27@esusdstsudents.org	5	M	9	K100	Jeon, Paul	Cryer, Bradley James	t	\N
2721	Georgia	Dame	20786	1	gdame_27@esusdstudents.org	5	F	9	R101	Hansen, Bjorn	Dame, Georgia Kate	t	\N
6323	Blake	Cannon	59210	4	b.cannon210@cvuhsd.org	15	M	9	M-118	Aguilar Hernandez, Leslie	Cannon, Blake Carl	f	\N
2723	Quinn	Davis-Boozer	22754	1	qdavis-boozer_27@esusdstudents.org	5	M	9	R103	Moeller, Jill	Davis-Boozer, Quinn Henry	t	\N
2724	Finneas	Day	22739	1	fday_27@esusdstudents.org	5	M	9	B104	Gaxiola, Gabriela	Day, Finneas Boyer	t	\N
2725	Alton	DeBlanc	20806	1	adeblanc_27@esusdstudents.org	5	M	9	K201	Kojima, Tyler	DeBlanc, Alton Henri	t	\N
2726	Parie	Desai	20801	1	pdesai_27@esusdstudents.org	5	F	9	R101	Hansen, Bjorn	Desai, Parie Niraj	t	\N
2727	Jake	DiMaria	22449	1	jdimaria_27@esusdstudents.org	5	M	9	K201	Kojima, Tyler	DiMaria, Jake Dashiell	t	\N
2728	Grace	Dominick	17511	1	gdominick_27@esusdstudents.org	5	F	9	A104	Sidwell, Glenn	Dominick, Grace Marie	t	\N
2729	Alisyn	Duarte	21023	1	aduarte_27@esusdstudents.org	5	F	9	B205	Nieto Viteri, Grace	Duarte, Alisyn Janiece	t	\N
2730	Kylie	Duarte	22454	1	kduarte_27@esusdstudents.org	5	F	9	R101	Hansen, Bjorn	Duarte, Kylie Sydney	t	\N
2731	Ellen	Dull	16147	1	edull_27@esusdstudents.org	5	F	9	North Gym	Smith, Rainy	Dull, Ellen	t	\N
2733	Lauren	Dysim	21901	1	ldysim_27@esusdstudents.org	5	F	9	B203	O'Keefe, Amy Ann	Dysim, Lauren Tomiko	t	\N
2734	Adeline	Eagen	22452	1	aeagen_27@esusdstudents.org	5	F	9	K201	Kojima, Tyler	Eagen, Adeline Brooke Alexandra	t	\N
2735	Ryker	Eastcott	20795	1	reastcott_27@esusdstudents.org	5	M	9	R101	Hansen, Bjorn	Eastcott, Ryker Liam	t	\N
2736	Olivia	Engel	18151	1	oengel_27@esusdstudents.org	5	F	9	R101	Hansen, Bjorn	Engel, Olivia Adison	t	\N
2737	Lydia	Engler	22461	1	lengler_27@esusdstudents.org	5	F	9	B100	Strawn, April	Engler, Lydia Jane	t	\N
2738	Sabrina	Esayas	21346	1	sesayas_27@esusdstudents.org	5	F	9	A104	Sidwell, Glenn	Esayas, Sabrina	t	\N
2739	Vitka	Escala Boehm	20794	1	vescalaboehm_27@esusdstudents.org	5	F	9	B100	Strawn, April	Escala Boehm, Vitka Mercedes	t	\N
2740	Camila	Faccini	22862	1	cfaccini_27@esusdstudents.org	5	F	9	K201	Kojima, Tyler	Faccini, Camila	t	\N
2741	Sara	Farah	22307	1	sfarah_27@esusdstudents.org	5	F	9	K201	Kojima, Tyler	Farah, Sara	t	\N
2742	Isabella	Fernandez	22834	1	ifernandez_27@esusdstudents.org	5	F	9	K201	Kojima, Tyler	Fernandez, Isabella Victoria	t	\N
2743	Marissa	Fisette	17539	1	mfisette_27@esusdstudents.org	5	F	9	K100	Jeon, Paul	Fisette, Marissa Grace	t	\N
2745	Skyler	Foell	21626	1	sfoell_27@esusdstudents.org	5	F	9	K100	Jeon, Paul	Foell, Skyler Fern	t	\N
2746	Noah	Forthuber	18647	1	nforthuber_27@esusdstudents.org	5	M	9	R101	Hansen, Bjorn	Forthuber, Noah Daniel	t	\N
2747	Ryan	Fosmore	21256	1	rfosmore_27@esusdstudents.org	5	M	9	C100	Kadonaga, Theresa M	Fosmore, Ryan Scott	t	\N
2748	Hank	Froemke	17432	1	hfroemke_27@esusdstudents.org	5	M	9	A104	Sidwell, Glenn	Froemke, Hank Thomas	t	\N
2749	Annika	Fuchs	16882	1	afuchs_27@esusdstudents.org	5	F	9	B100	Strawn, April	Fuchs, Annika Christin	t	\N
2750	Noah	Fuentes	17652	1	nfuentes_27@esusdstudents.org	5	M	9	K100	Jeon, Paul	Fuentes, Noah	t	\N
2751	Blake	Gaines	21658	1	bgaines_27@esusdstudents.org	5	M	9	A104	Sidwell, Glenn	Gaines, Blake Logan Winston	t	\N
2752	Olivia	Galaviz	21321	1	ogalaviz_27@esusdstudents.org	5	F	9	C100	Kadonaga, Theresa M	Galaviz, Olivia Marie	t	\N
2753	Min-Jee	Gales	20431	1	mgales_27@esusdstudents.org	5	F	9	B100	Strawn, April	Gales, Min-Jee Kim	t	\N
2754	Bella	Gharibeh	21593	1	bgharibeh_27@esusdstudents.org	5	F	9	R101	Hansen, Bjorn	Gharibeh, Bella Jolie	t	\N
2755	Kyra	Goldfarb	17435	1	kgoldfarb_27@esusdstudents.org	5	F	9	K217	Turner, Lauren Alissa	Goldfarb, Kyra Grace	t	\N
2756	Nury	Gomez	17553	1	ngomez_27@esusdstudents.org	5	F	9	R103	Moeller, Jill	Gomez, Nury Esther	t	\N
2757	Anthony	Gonzalez	22055	1	agonzalez_27@esusdstudents.org	5	M	9	K100	Jeon, Paul	Gonzalez, Anthony Ethan	t	\N
2758	Nathan	Gonzalez	22935	1	ngonzalez_27@esusdstudents.org	5	M	9			Gonzalez, Nathan Joel	t	\N
2760	Konstantine	Goumas	16708	1	kgoumas_27@esusdstudents.org	5	M	9	A104	Sidwell, Glenn	Goumas, Konstantine Alexander	t	\N
2761	Sadie	Gramajo	22046	1	sgramajo_27@esusdstudents.org	5	F	9	R101	Hansen, Bjorn	Gramajo, Sadie Danielle	t	\N
2762	William	Graziadei	17441	1	wgraziadei_27@esusdstudents.org	5	M	9	R103	Moeller, Jill	Graziadei, William Daniel	t	\N
2763	Nathaniel	Guerrero	17444	1	nguerrero_27@esusdstudents.org	5	M	9	K100	Jeon, Paul	Guerrero, Nathaniel Albert	t	\N
2764	Alana	Gutierrez	22457	1	agutierrez_27@esusdstudents.org	5	F	9	B100	Strawn, April	Gutierrez, Alana Valenzuela	t	\N
2765	Lailah	Guzman	17448	1	lguzman_27@esusdstudents.org	5	F	9	K100	Jeon, Paul	Guzman, Lailah	t	\N
2766	Megan	Hachiya	19663	1	mhachiya_27@esusdstudents.org	5	F	9	North Gym	Smith, Rainy	Hachiya, Megan Satomi	t	\N
2767	Caden	Hahn	17527	1	chahn_27@esusdstudents.org	5	M	9	R101	Hansen, Bjorn	Hahn, Caden Austin	t	\N
2768	Cole	Hajt	20556	1	chajt_27@esusdstudents.org	5	M	9	B100	Strawn, April	Hajt, Cole Franklin	t	\N
2770	Liam	Halpine	20554	1	lhalpine_27@esusdstudents.org	5	M	9	A208	Munger, Judith Ann	Halpine, Liam John	t	\N
2771	Mackenzie	Hamilton	18770	1	mhamilton_27@esusdstudents.org	5	F	9	A104	Sidwell, Glenn	Hamilton, Mackenzie	t	\N
2772	Malcolm	Hamilton	18769	1	mhamilton2_27@esusdstudents.org	5	M	9	A104	Sidwell, Glenn	Hamilton, Malcolm	t	\N
2774	Kevin	Hardy	15208	1	khardy_27@esusdstudents.org	5	M	9	R103	Moeller, Jill	Hardy, Kevin Daniel	t	\N
2775	Camie	Haug	15594	1	chaug_27@esusdstudents.org	5	F	9	B203	O'Keefe, Amy Ann	Haug, Camie	t	\N
2776	Maxwell	Hellwig	17455	1	mhellwig_27@esusdstudents.org	5	M	9	K201	Kojima, Tyler	Hellwig, Maxwell	t	\N
2769	Townsend	Hale	15544	1	thale_27@esusdstudents.org	5	M	9	A104	Sidwell, Glenn	Hale, Townsend Kann	t	\N
6324	Angel	Cardenas Torres	58850	4	a.cardenastorres850@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Cardenas Torres, Angel	f	\N
2778	Jeremy	Hernandez	19336	1	jhernandez_27@esusdstudents.org	5	M	9	R103	Moeller, Jill	Hernandez, Jeremy Isaiah	t	\N
2779	Kristie	Herrera	21127	1	kherrera_27@esusdstudents.org	5	F	9	B203	O'Keefe, Amy Ann	Herrera, Kristie	t	\N
2780	William	Hodges	21744	1	whodges_27@esusdstudents.org	5	M	9	A101	Daegele, Kimberly	Hodges, William Scott	t	\N
2781	Roland	Hoffman	16661	1	rhoffman_27@esusdstudents.org	5	M	9	R101	Hansen, Bjorn	Hoffman, Roland Desiderio	t	\N
2782	Austin	Hohman	20796	1	ahohman_27@esusdstudents.org	5	M	9	A101	Daegele, Kimberly	Hohman, Austin Fletcher	t	\N
2783	Gianna	Holm	17620	1	gholm_27@esusdstudents.org	5	F	9	A101	Daegele, Kimberly	Holm, Gianna Brily	t	\N
2784	Tyonna	Horton	21095	1	thorton_27@esusdstudents.org	5	F	9	K100	Jeon, Paul	Horton, Tyonna Mileah So Young	t	\N
2785	Jack	Howard	18702	1	jhoward_27@esusdstudents.org	5	M	9	R101	Hansen, Bjorn	Howard, Jack	t	\N
2787	Liam	Hurley	17459	1	lhurley_27@esusdstudents.org	5	M	9	K201	Kojima, Tyler	Hurley, Liam James	t	\N
2788	Joy	Ihezuoh	22445	1	jihezuoh_27@esusdstudents.org	5	F	9	A104	Sidwell, Glenn	Ihezuoh, Joy Chiamaka	t	\N
2789	Arshawn	Jabbari	20429	1	ajabbari_27@esusdstudents.org	5	M	9	K217	Turner, Lauren Alissa	Jabbari, Arshawn	t	\N
2790	Julian	Jaranilla	18768	1	jjaranilla_27@esusdstudents.org	5	M	9	A104	Sidwell, Glenn	Jaranilla, Julian	t	\N
2791	Malani	Javelona	22354	1	mjavelona_27@esusdstudents.org	5	F	9	R101	Hansen, Bjorn	Javelona, Malani Ibarra	t	\N
2792	Gael	Jimenez	22811	1	gjimenez_27@esusdstudents.org	5	M	9	A101	Daegele, Kimberly	Jimenez, Gael Ulysses	t	\N
2793	Kiarod	Karimi	19265	1	kkarimi_27@esusdstudents.org	5	M	9	B100	Strawn, April	Karimi, Kiarod Reza	t	\N
2794	Arabella	Katz	22440	1	akatz_27@esusdstudents.org	5	F	9	B205	Nieto Viteri, Grace	Katz, Arabella Elena	t	\N
2795	Jasmine	Kaur	17460	1	jkaur_27@esusdstudents.org	5	F	9	K100	Jeon, Paul	Kaur, Jasmine	t	\N
2796	Kailey	Keith	17462	1	kkeith_27@esusdstudents.org	5	F	9	B203	O'Keefe, Amy Ann	Keith, Kailey	t	\N
2797	Malia	Kenton	16666	1	mkenton_27@esusdstudents.org	5	F	9	B100	Strawn, April	Kenton, Malia Rose Sueoka	t	\N
2798	Zoyah	Khan	20785	1	zkhan_27@esusdstudents.org	5	F	9	R103	Moeller, Jill	Khan, Zoyah Anwer	t	\N
2800	Caleb	Kimm	17554	1	ckimm_27@esusdstudents.org	5	M	9	A104	Sidwell, Glenn	Kimm, Caleb Jun	t	\N
2801	Hunter	Kingsley	16688	1	hkingsley_27@esusdstudents.org	5	M	9	B100	Strawn, April	Kingsley, Hunter Michael	t	\N
2802	Daniel	Kinnison Smith	16671	1	dkinnisonsmith_27@esusdstudents.org	5	M	9	K201	Kojima, Tyler	Kinnison Smith, Daniel Alan	t	\N
2803	Rosemary	Klug	17463	1	rklug_27@esusdstudents.org	5	F	9	K217	Turner, Lauren Alissa	Klug, Rosemary	t	\N
2804	Andrew	Kroskrity	17579	1	akroskrity_27@esusdstudents.org	5	M	9	R103	Moeller, Jill	Kroskrity, Andrew Joseph	t	\N
2805	Colton	Ksieski	20800	1	cksieski_27@esusdstudents.org	5	M	9	K201	Kojima, Tyler	Ksieski, Colton Sean	t	\N
2806	Lilyanna	Kvitek	17461	1	lkvitek_27@esusdstudents.org	5	F	9	A101	Daegele, Kimberly	Kvitek, Lilyanna	t	\N
2807	Amelia	Lackey	21032	1	alackey_27@esusdstudents.org	5	F	9	R101	Hansen, Bjorn	Lackey, Amelia Frances	t	\N
2808	Kathleen	Lane	17465	1	klane_27@esusdstudents.org	5	F	9	R103	Moeller, Jill	Lane, Kathleen Mary	t	\N
2809	Luke	Lanyi	17557	1	llanyi_27@esusdstudents.org	5	M	9	A101	Daegele, Kimberly	Lanyi, Luke George	t	\N
2810	Kiara	Lavalle	17467	1	klavalle_27@esusdstudents.org	5	F	9	B100	Strawn, April	Lavalle, Kiara Camila	t	\N
2811	Til	Lavelle	16689	1	tlavelle_27@esusdstudents.org	5	M	9	K207	Horvath, Daniel	Lavelle, Til Ray	t	\N
2813	Kaelynn	Lee	20433	1	klee_27@esusdstudents.org	5	F	9	R101	Hansen, Bjorn	Lee, Kaelynn Soohyun	t	\N
2814	Lundin	Leitch	17528	1	lleitch_27@esusdstudents.org	5	F	9	B104	Gaxiola, Gabriela	Leitch, Lundin Renee	t	\N
2815	Clarita	Letang	15209	1	cletang_27@esusdstudents.org	5	F	9	B201	Reese, Julie Ann	Letang, Clarita	t	\N
2816	Avery	Liguori	17559	1	aliguori_27@esusdstudents.org	5	F	9	B104	Gaxiola, Gabriela	Liguori, Avery Olivia	t	\N
2817	Liam	Lipsey	16678	1	llipsey_27@esusdstudents.org	5	M	9	A104	Sidwell, Glenn	Lipsey, Liam Harrison	t	\N
2818	Maksim	Lody	20792	1	mlody_27@esusdstudents.org	5	M	9	B104	Gaxiola, Gabriela	Lody, Maksim Elek	t	\N
2819	Blake	Long	19409	1	blong_27@esusdstudents.org	5	M	9	North Gym	Smith, Rainy	Long, Blake Rory	t	\N
2820	Wyatt	Longshore	22221	1	wlongshore_27@esusdstudents.org	5	M	9	R103	Moeller, Jill	Longshore, Wyatt Joseph	t	\N
2821	Ivan	Lopez	20648	1	ilopez_27@esusdstudents.org	5	M	9	B104	Gaxiola, Gabriela	Lopez, Ivan Blake	t	\N
2822	Jesse	Lowe	22442	1	jgebhart-lowe_27@esusdstudents.org	5	M	9	K217	Turner, Lauren Alissa	Lowe, Jesse Daniel	t	\N
2823	Penelope	Luczywo	22738	1	pluczywo_27@esusdstudents.org	5	F	9	B100	Strawn, April	Luczywo, Penelope Taylor	t	\N
2825	Marcus	Machado	17468	1	mmachado_27@esusdstudents.org	5	M	9	K100	Jeon, Paul	Machado, Marcus	t	\N
2826	Samuel	Maguire	19846	1	smaguire_27@esusdstudents.org	5	M	9	A103	Page, Jessica L.	Maguire, Samuel Kent	t	\N
2827	Lily	Manoukian	22448	1	lmanoukian_27@esusdstudents.org	5	F	9	B100	Strawn, April	Manoukian, Lily Anna	t	\N
2828	Zoey	Markarian	16686	1	zmarkarian_27@esusdstudents.org	5	F	9	R103	Moeller, Jill	Markarian, Zoey Abigail	t	\N
2829	Kai	Masri	15543	1	kmasri_27@esusdstudents.org	5	M	9	B203	O'Keefe, Amy Ann	Masri, Kai	t	\N
2830	Chase	Mattoon	18056	1	cmattoon_27@esusdstudents.org	5	M	9	K201	Kojima, Tyler	Mattoon, Chase Matthew	t	\N
2831	Molly	McAndrews	17426	1	mmcandrews_27@esusdstudents.org	5	F	9	C100	Kadonaga, Theresa M	McAndrews, Molly	t	\N
2881	Sara	Rivas	22447	1	srivas_27@esusdstudents.org	5	F	9	B203	O'Keefe, Amy Ann	Rivas, Sara Angelina	t	\N
2882	Jahshua	Rivera	16706	1	jrivera_27@esusdstudents.org	5	M	9	A104	Sidwell, Glenn	Rivera, Jahshua Danelle	t	\N
2883	Sora	Robinson	16695	1	srobinson_27@esusdstudents.org	5	F	9	A101	Daegele, Kimberly	Robinson, Sora Pak	t	\N
2884	Carson	Rollins	17634	1	crollins_27@esusdstudents.org	5	M	9	B203	O'Keefe, Amy Ann	Rollins, Carson Vann	t	\N
2885	Timofei	Roth	22466	1	troth_27@esusdstudents.org	5	M	9	K201	Kojima, Tyler	Roth, Timofei Jett	t	\N
2849	Sanjay	Nataraj	19101	1	snataraj_27@esusdstudents.org	5	M	9	A210	Doering, Mark Edward	Nataraj, Sanjay	t	\N
2850	Casey	Navarro	16716	1	cnavarro_27@esusdstudents.org	5	M	9	A104	Sidwell, Glenn	Navarro, Casey	t	\N
2851	Sydney	Neely	17531	1	sneely_27@esusdstudents.org	5	F	9	B100	Strawn, April	Neely, Sydney Ann	t	\N
2852	Omar	Nessary	21099	1	onessary_27@esusdstudents.org	5	M	9	R103	Moeller, Jill	Nessary, Omar	t	\N
2853	Danielle Erica	Noble	22831	1	dnoble_27@esusdstudents.org	5	F	9	A101	Daegele, Kimberly	Noble, Danielle Erica Horlador	t	\N
2854	Annabelle	Noda	21768	1	anoda_27@esusdstudents.org	5	F	9	R103	Moeller, Jill	Noda, Annabelle Diana	t	\N
2855	Natalia	Noonan-Heikes	20441	1	nnoonan-heikes_27@esusdstudents.org	5	F	9	B100	Strawn, April	Noonan-Heikes, Natalia Hudson	t	\N
2856	Eduardo	Olivo	22464	1	eolivo_27@esusdstudents.org	5	M	9	B104	Gaxiola, Gabriela	Olivo, Eduardo Julian	t	\N
2857	Jake	Olsen	22006	1	jolsen_27@esusdstudents.org	5	M	9	B104	Gaxiola, Gabriela	Olsen, Jake Ray	t	\N
2859	Annalise	Oulashian	16718	1	aoulashian_27@esusdstudents.org	5	F	9	K217	Turner, Lauren Alissa	Oulashian, Annalise Sofia	t	\N
3807	Khalila	Masri	15323	1	kmasri_24@esusdstudents.org	5	F	12	B202	Adams, Nicole	Masri, Khalila	t	\N
2860	Kimora	Palacio	22940	1	kpalacio_27@esusdstudents.org	5	F	9			Palacio, Kimora Allegra	t	\N
2861	Joey	Parisi	16722	1	jparisi_27@esusdstudents.org	5	M	9	R101	Hansen, Bjorn	Parisi, Joey John	t	\N
2862	Anastasia	Parker	17639	1	aparker_27@esusdstudents.org	5	F	9	A104	Sidwell, Glenn	Parker, Anastasia Jun	t	\N
2863	Shaan	Patel	17562	1	spatel_27@esusdstudents.org	5	M	9	Engineerin	Zwissler, Darwin	Patel, Shaan Ty	t	\N
2864	Lee	Paulson	22465	1	lpaulson_27@esusdstudents.org	5	M	9	R103	Moeller, Jill	Paulson, Lee Kohl	t	\N
2833	Marilyn	McCaverty	16693	1	mmccaverty_27@esusdstudents.org	5	F	9	K201	Kojima, Tyler	McCaverty, Marilyn	t	\N
2834	Isla	McCullough	17427	1	imccullough_27@esusdstudents.org	5	F	9	K201	Kojima, Tyler	McCullough, Isla	t	\N
2835	Lola	McFadden	16694	1	lmcfadden_27@esusdstudents.org	5	F	9	A104	Sidwell, Glenn	McFadden, Lola Marie	t	\N
2836	Sara	McKinney	17560	1	smckinney_27@esusdstudents.org	5	F	9	R103	Moeller, Jill	McKinney, Sara Ann	t	\N
2838	Tano-Michael	Mendiola	22437	1	tmendiola_27@esusdstudents.org	5	M	9	A101	Daegele, Kimberly	Mendiola, Tano-Michael Matua	t	\N
2839	Elijah	Merica-Jones	22444	1	emerica-jones_27@esusdstudents.org	5	M	9	Engineerin	Zwissler, Darwin	Merica-Jones, Elijah Litton	t	\N
2840	Austin	Miller	20790	1	amiller_27@esusdstudents.org	5	M	9	R103	Moeller, Jill	Miller, Austin Thomas	t	\N
2841	Alina	Miranda	20427	1	amiranda_27@esusdstudents.org	5	F	9	K201	Kojima, Tyler	Miranda, Alina Duque	t	\N
2842	Sana	Miyashita-Tsai	20782	1	smiyashita-tsai_27@esusdstudents.org	5	F	9	R101	Hansen, Bjorn	Miyashita-Tsai, Sana Madison	t	\N
2843	Dylan	Monera	20544	1	dmonera_27@esusdstudents.org	5	F	9	B203	O'Keefe, Amy Ann	Monera, Dylan Zoe	t	\N
2844	Zane	Moore	17565	1	zmoore_27@esusdstudents.org	5	M	9	B100	Strawn, April	Moore, Zane Sipantzi	t	\N
2865	Carmelo	Peterson	21241	1	cpeterson_27@esusdstudents.org	5	M	9	K100	Jeon, Paul	Peterson, Carmelo Matthew	t	\N
2866	Luke	Phillips	20422	1	lphillips_27@esusdstudents.org	5	M	9	K201	Kojima, Tyler	Phillips, Luke David	t	\N
2867	Makayla	Phillips	22458	1	mphillips_27@esusdstudents.org	5	F	9	B100	Strawn, April	Phillips, Makayla Nicole	t	\N
2845	Yuzuki	Moreno	19665	1	ymoreno_27@esusdstudents.org	5	F	9	K100	Jeon, Paul	Moreno, Yuzuki	t	\N
2846	Ryan	Moszkiewicz	19267	1	rmoszkiewicz_27@esusdstudents.org	5	F	9	B100	Strawn, April	Moszkiewicz, Ryan Noelle	t	\N
2847	Charlie	Mull	17429	1	cmull_27@esusdstudents.org	5	F	9	K100	Jeon, Paul	Mull, Charlie	t	\N
2848	Ahren	Nagpal	17430	1	anagpal_27@esusdstudents.org	5	M	9	B100	Strawn, April	Nagpal, Ahren Singh	t	\N
2871	Cody	Raichlen	20851	1	craichlen_27@esusdstudents.org	5	M	9	B104	Gaxiola, Gabriela	Raichlen, Cody Joshua	t	\N
2869	Avinash	Prasad	18717	1	aprasad_27@esusdstudents.org	5	M	9	R101	Hansen, Bjorn	Prasad, Avinash Shankar	t	\N
2872	Quinn	Ramirez	18726	1	qramirez_27@esusdstudents.org	5	F	9	Engineerin	Zwissler, Darwin	Ramirez, Quinn Aida	t	\N
2870	William	Prevett	17520	1	wprevett_27@esusdstudents.org	5	M	9	K201	Kojima, Tyler	Prevett, William Michael	t	\N
2873	Zuma	Raymond	19268	1	zraymond_27@esusdstudents.org	5	M	9	A210	Doering, Mark Edward	Raymond, Zuma Cruz	t	\N
2874	Lorenzo	Recalde	20440	1	lrecalde_27@esusdstudents.org	5	M	9	K100	Jeon, Paul	Recalde, Lorenzo Andres	t	\N
2875	Ashley	Reed	17563	1	areed_27@esusdstudents.org	5	F	9	Engineerin	Zwissler, Darwin	Reed, Ashley Celeste	t	\N
2876	Catherine	Reed	21050	1	creed_27@esusdstudents.org	5	F	9	B100	Strawn, April	Reed, Catherine Jane	t	\N
2877	Roman	Reinis	20797	1	rreinis_27@esusdstudents.org	5	M	9	B104	Gaxiola, Gabriela	Reinis, Roman Emanuel	t	\N
2878	Bella	Rexon	22673	1	brexon_27@esusdstudents.org	5	F	9	B205	Nieto Viteri, Grace	Rexon, Bella Anne	t	\N
2832	Joslyn	McCarthy	22453	1	jmccarthy_27@esusdstudents.org	5	F	9	K201	Kojima, Tyler	McCarthy, Joslyn Rae	t	\N
6325	Angel	Carrillo	57837	4	a.carrillo837@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Carrillo, Angel Joseph	f	\N
2887	Hayden	Russo	17438	1	hrusso_27@esusdstudents.org	5	M	9	North Gym	Smith, Rainy	Russo, Hayden	t	\N
2889	Ella	Sabosky	17439	1	esabosky_27@esusdstudents.org	5	F	9	R101	Hansen, Bjorn	Sabosky, Ella Kate	t	\N
2891	Aditya	Sahu	17743	1	asahu_27@esusdstudents.org	5	M	9	Engineerin	Zwissler, Darwin	Sahu, Aditya	t	\N
2892	Hawk	Sanders	17532	1	hsanders_27@esusdstudents.org	5	M	9	R101	Hansen, Bjorn	Sanders, Hawk Tai	t	\N
2893	Khloe	Sanders	16744	1	ksanders_27@esusdstudents.org	5	F	9	B202	Adams, Nicole	Sanders, Khloe Cynthia	t	\N
2894	Omar	Santiago	20969	1	osantiago_27@esusdstudents.org	5	M	9	B104	Gaxiola, Gabriela	Santiago, Omar	t	\N
2895	Ezekiel	Sea	16148	1	esea_27@esusdstudents.org	5	M	9	B104	Gaxiola, Gabriela	Sea, Ezekiel Steve Danny	t	\N
2896	Annalisa	Seli	18632	1	aseli_27@esusdstudents.org	5	F	9	B100	Strawn, April	Seli, Annalisa Domenica	t	\N
2897	Kiana	Shelton	19378	1	kshelton_27@esusdstudents.org	5	F	9	K201	Kojima, Tyler	Shelton, Kiana Andrea	t	\N
2898	Julian	Sheridan	20789	1	jsheridan_27@esusdstudents.org	5	M	9	A101	Daegele, Kimberly	Sheridan, Julian Ho Cheung	t	\N
2900	Pravaksha	Singh	20759	1	psingh_27@esusdstudents.org	5	M	9	A210	Doering, Mark Edward	Singh, Pravaksha Na	t	\N
2901	Brody	Skura	22451	1	bskura_27@esusdstudents.org	5	M	9	K201	Kojima, Tyler	Skura, Brody Marek	t	\N
2902	Jordan	Slavens	16696	1	jslavens_27@esusdstudents.org	5	M	9	A104	Sidwell, Glenn	Slavens, Jordan Lee	t	\N
2904	Jonah	Smigelski	17707	1	jsmigelski_27@esusdstudents.org	5	M	9	B100	Strawn, April	Smigelski, Jonah Thomas	t	\N
2905	Dane	Smith	20808	1	dsmith_27@esusdstudents.org	5	M	9	A101	Daegele, Kimberly	Smith, Dane Charles	t	\N
2906	Ethan	Smith	21671	1	esmith_27@esusdstudents.org	5	M	9	C100	Kadonaga, Theresa M	Smith, Ethan Matthew	t	\N
2907	Joshua	Smith	17637	1	jsmith_27@esusdstudents.org	5	M	9	North Gym	Smith, Rainy	Smith, Joshua Chase Yaw Owusu	t	\N
2908	Reese	Smith	20807	1	rsmith_27@esusdstudents.org	5	F	9	K217	Turner, Lauren Alissa	Smith, Reese Abigail	t	\N
2890	Oscar	Sackaroff	18727	1	osackaroff_27@esusdstudents.org	5	M	9	B205	Nieto Viteri, Grace	Sackaroff, Oscar Howard	t	\N
2899	Luka	Simunac	17578	1	lsimunac_27@esusdstudents.org	5	M	9	B100	Strawn, April	Simunac, Luka	t	\N
2909	Hailey	Song	17442	1	hsong_27@esusdstudents.org	5	F	9	R103	Moeller, Jill	Song, Hailey Constance	t	\N
2910	Hunter	Sprick	20760	1	hsprick_27@esusdstudents.org	5	M	9	R101	Hansen, Bjorn	Sprick, Hunter Lee	t	\N
2911	Ishaan	Srivastava	20543	1	isrivastava_27@esusdstudents.org	5	M	9	Engineerin	Zwissler, Darwin	Srivastava, Ishaan	t	\N
2912	Dylan	Stenberg	17573	1	dstenberg_27@esusdstudents.org	5	M	9	K201	Kojima, Tyler	Stenberg, Dylan Kenneth	t	\N
2913	Elliott	Strong	17999	1	estrong_27@esusdstudents.org	5	M	9	North Gym	Smith, Rainy	Strong, Elliott Montgomery	t	\N
2914	Eva	Sun	22443	1	esun_27@esusdstudents.org	5	F	9	K201	Kojima, Tyler	Sun, Eva Qiying	t	\N
2916	Ivana Jean	Sze	19269	1	isze_27@esusdstudents.org	5	F	9	K217	Turner, Lauren Alissa	Sze, Ivana Jean Ong	t	\N
2917	Sale	Talanoa	16820	1	stalanoa_27@esusdstudents.org	5	M	9	South Gym	March, David	Talanoa, Sale Vincent	t	\N
2918	Catherine	Tanner	22672	1	ctanner_27@esusdstudents.org	5	F	9	B100	Strawn, April	Tanner, Catherine Anna	t	\N
2919	Jrei	Tausaga	22844	1	jtausaga_27@esusdstudents.org	5	M	9	B104	Gaxiola, Gabriela	Tausaga, Jrei Kaliopasi	t	\N
2920	Burke	Taylor	17574	1	btaylor_27@esusdstudents.org	5	M	9	A210	Doering, Mark Edward	Taylor, Burke Everett	t	\N
2921	Michael	Temesvary	19102	1	mtemesvary_27@esusdstudents.org	5	M	9	B100	Strawn, April	Temesvary, Michael Paul	t	\N
2923	Scarlet	Thiel	17580	1	sthiel_27@esusdstudents.org	5	F	9	A101	Daegele, Kimberly	Thiel, Scarlet Viola	t	\N
2924	Ani	Thomas	21896	1	athomas_27@esusdstudents.org	5	F	9	B100	Strawn, April	Thomas, Ani Lilit	t	\N
2925	Dylan	Thomas	16698	1	dthomas_27@esusdstudents.org	5	M	9	K217	Turner, Lauren Alissa	Thomas, Dylan Lonnie	t	\N
2926	Murad	Thomas	21964	1	mthomas_27@esusdstudents.org	5	M	9	R101	Hansen, Bjorn	Thomas, Murad Ruben	t	\N
2927	Odin	Thomas	18174	1	othomas_27@esusdstudents.org	5	M	9	A210	Doering, Mark Edward	Thomas, Odin Moon	t	\N
2928	Sophia	Thomason	15553	1	sthomason_27@esusdstudents.org	5	F	9	B201	Reese, Julie Ann	Thomason, Sophia Elizabeth	t	\N
2930	Liston	Tonks	20783	1	ltonks_27@esusdstudents.org	5	M	9	R101	Hansen, Bjorn	Tonks, Liston	t	\N
2931	Elena	Truxillo	22248	1	etruxillo_27@esusdstudents.org	5	F	9	K217	Turner, Lauren Alissa	Truxillo, Elena Cecile	t	\N
2932	Channing	Turner	18086	1	cturner_27@esusdstudents.org	5	M	9	A101	Daegele, Kimberly	Turner, Channing Freeman	t	\N
2933	Matteo	Valentino	22435	1	mvalentino_27@esusdstudents.org	5	M	9	K217	Turner, Lauren Alissa	Valentino, Matteo Leonardo	t	\N
2934	Brayden	Vanek	15597	1	bvanek_27@esusdstudents.org	5	M	9	R103	Moeller, Jill	Vanek, Brayden Thomas	t	\N
2935	Noah	Vargas	19920	1	nvargas_27@esusdstudents.org	5	M	9	R103	Moeller, Jill	Vargas, Noah Iseah	t	\N
2936	Kate	Vaughn	21659	1	kvaughn_27@esusdstudents.org	5	F	9	R103	Moeller, Jill	Vaughn, Kate Lorraine	t	\N
2937	Thomas	Villa	20761	1	tvilla_27@esusdstudents.org	5	M	9	A101	Daegele, Kimberly	Villa, Thomas Duane	t	\N
2938	Maximilian	Villacreses	22861	1	mvillacreses_27@esusdstudents.org	5	M	9	South Gym	March, David	Villacreses, Maximilian Benjamin	t	\N
2939	Tate	Vincent	17575	1	tvincent_27@esusdstudents.org	5	M	9	B100	Strawn, April	Vincent, Tate Mathieu	t	\N
2922	Ethan	Thadani	20448	1	ethadani_27@esusdstudents.org	5	M	9	South Gym	March, David	Thadani, Ethan Vikram Matthew	t	\N
2940	Christopher	Voge	22879	1	cvoge_27@esusdstudents.org	5	M	9	South Gym	March, David	Voge, Christopher William	t	\N
2956	Caden	Abarquez	22411	1	pabarquez_26@esusdstudents.org	5	M	10	South Gym	March, David	Abarquez, Caden	t	\N
2959	Selim	Adil	19360	1	sadil_26@esusdstudents.org	5	M	10	K203	McNeela, Kristina	Adil, Selim	t	\N
2958	Maxwell	Abroms	20423	1	mabroms_26@esusdstudents.org	5	M	10	K203	McNeela, Kristina	Abroms, Maxwell Crescencio	t	\N
2960	Grecia	Aguilar	19376	1	gaguilar_26@esusdstudents.org	5	F	10	A101	Daegele, Kimberly	Aguilar, Grecia Susana	t	\N
2961	Cooper	Albano	15790	1	calbano_26@esusdstudents.org	5	M	10	E102	Maye, Bonnie Michelle	Albano, Cooper Cash Holohan	t	\N
2962	Matias	Alcocer Arauz	16303	1	malcocerarauz_26@esusdstudents.org	5	M	10	R201	Turner, Jahid	Alcocer Arauz, Matias Francisco	t	\N
2963	Lucas	Alpert	16787	1	lalpert_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Alpert, Lucas Macrae	t	\N
2964	Alejandro	Alvarez	20850	1	aalvarez_26@esusdstudents.org	5	M	10	K211	Perren, Nicole Marie	Alvarez, Alejandro	t	\N
2965	Ruby	Ambrocio	16933	1	rambrocio_26@esusdstudents.org	5	F	10	E100	Kadlec, Tamara	Ambrocio, Ruby Valeria	t	\N
2966	Julianna	Angel	22063	1	jangel_26@esusdstudents.org	5	F	10	K103	Stern, Kimberly	Angel, Julianna Pauline	t	\N
2967	Aarush	Antil	15593	1	aantil_26@esusdstudents.org	5	M	10	B205	Nieto Viteri, Grace	Antil, Aarush	t	\N
2968	Abeshek	Aravindan	17124	1	aaravindan_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Aravindan, Abeshek	t	\N
2969	Alexander	Arieta	15748	1	aarieta_26@esusdstudents.org	5	M	10	B205	Nieto Viteri, Grace	Arieta, Alexander Masaji	t	\N
2971	Dorothy	Atteridge	15794	1	datteridge_26@esusdstudents.org	5	F	10	R201	Turner, Jahid	Atteridge, Dorothy May	t	\N
2972	Audrey	Ayler	16484	1	aayler_26@esusdstudents.org	5	F	10	C100	Kadonaga, Theresa M	Ayler, Audrey Victoria	t	\N
2973	Roman	Aytur	22038	1	raytur_26@esusdstudents.org	5	M	10	A210	Doering, Mark Edward	Aytur, Roman Odes	t	\N
2974	Silvie	Bachelder	20634	1	sbachelder_26@esusdstudents.org	5	F	10	A205	Brandlin, Amy	Bachelder, Silvie Elizabeth	t	\N
2977	Auriana	Barragan	19278	1	abarragan_26@esusdstudents.org	5	F	10	B205	Nieto Viteri, Grace	Barragan, Auriana Jaylin	t	\N
2978	Jack	Bartholomew	16306	1	jbartholomew_26@esusdstudents.org	5	M	10	K213	Mendoza, Manuel	Bartholomew, Jack Anthony	t	\N
2979	Grace	Beetner	16486	1	gbeetner_26@esusdstudents.org	5	F	10	A210	Doering, Mark Edward	Beetner, Grace Yanmaio	t	\N
2980	Aiden	Bellamy	21762	1	abellamy_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Bellamy, Aiden Diauntae	t	\N
2981	Daniella	Benjamin	17609	1	dbenjamin_26@esusdstudents.org	5	F	10	K217	Turner, Lauren Alissa	Benjamin, Daniella Joy	t	\N
2982	Nikita	Bertoni	16488	1	nbertoni_26@esusdstudents.org	5	F	10	R103	Moeller, Jill	Bertoni, Nikita	t	\N
2983	Joshua	Bhadran	14913	1	jbhadran_26@esusdstudents.org	5	M	10	South Gym	March, David	Bhadran, Joshua	t	\N
2984	Agrima	Bhutani	19782	1	abhutani_26@esusdstudents.org	5	F	10	R200	Davlantis, Foti J	Bhutani, Agrima	t	\N
2985	Oliver	Bixon	21801	1	obixon_26@esusdstudents.org	5	M	10	E102	Maye, Bonnie Michelle	Bixon, Oliver Benjamin	t	\N
2987	Joe	Bolder	20616	1	jbolder_26@esusdstudents.org	5	M	10	B203	O'Keefe, Amy Ann	Bolder, Joe Maurice	t	\N
2988	Theodore	Bong	15751	1	tbong_26@esusdstudents.org	5	M	10	K203	McNeela, Kristina	Bong, Theodore Sohjae	t	\N
2989	Nolan	Bowen	18692	1	nbowen_26@esusdstudents.org	5	M	10	E102	Maye, Bonnie Michelle	Bowen, Nolan Riley	t	\N
2990	Penelope	Bravo	16935	1	pbravo_26@esusdstudents.org	5	F	10	B205	Nieto Viteri, Grace	Bravo, Penelope Abigail	t	\N
2991	Logan	Brooks	16490	1	lbrooks_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Brooks, Logan B	t	\N
2992	Jack	Brown	18697	1	jbrown_26@esusdstudents.org	5	M	10	E102	Maye, Bonnie Michelle	Brown, Jack Alexander	t	\N
2993	Jamorris	Brown	19279	1	jbrown2_26@esusdstudents.org	5	M	10	R201	Turner, Jahid	Brown, Jamorris Dorveak	t	\N
2955	Juliet	Zenaye	20763	1	jzenaye_27@esusdstudents.org	5	F	9	R103	Moeller, Jill	Zenaye, Juliet Shwaye	t	\N
2954	Peyton	Zajic	17535	1	pzajic_27@esusdstudents.org	5	F	9	B100	Strawn, April	Zajic, Peyton Margaret-Ann	t	\N
2953	Matan	Yussman	17518	1	myussman_27@esusdstudents.org	5	M	9	Engineerin	Zwissler, Darwin	Yussman, Matan Joseph Shimon	t	\N
2952	Ethan	Young	20412	1	eyoung_27@esusdstudents.org	5	M	9	R101	Hansen, Bjorn	Young, Ethan	t	\N
2994	Cambria	Buckler	21991	1	cbuckler_26@esusdstudents.org	5	F	10	R201	Turner, Jahid	Buckler, Cambria Mae	t	\N
2975	Ava	Bao	21935	1	abao_26@esusdstudents.org	5	F	10	K213	Mendoza, Manuel	Bao, Ava Mahina	t	\N
2941	Bryant	Waites	17533	1	bwaites_27@esusdstudents.org	5	M	9	B104	Gaxiola, Gabriela	Waites, Bryant Andrew	t	\N
2942	James	Walker	17450	1	jwalker_27@esusdstudents.org	5	M	9	K100	Jeon, Paul	Walker, James Alonzo	t	\N
2943	Olivia	Ward	19349	1	oward_27@esusdstudents.org	5	F	9	K201	Kojima, Tyler	Ward, Olivia	t	\N
2944	Erikk	Warren	16699	1	ewarren_27@esusdstudents.org	5	M	9	C100	Kadonaga, Theresa M	Warren, Erikk Allan	t	\N
2945	Ava	Waters	17453	1	awaters_27@esusdstudents.org	5	F	9	K201	Kojima, Tyler	Waters, Ava Therese	t	\N
2947	James	Wheeler	16758	1	jwheeler_27@esusdstudents.org	5	M	9	K201	Kojima, Tyler	Wheeler, James	t	\N
2946	Brady	Whalen	22843	1	bwhalen_27@esusdstudents.org	5	M	9	R101	Hansen, Bjorn	Whalen, Brady Peter Hsing-Hwa	t	\N
2948	Ryan	Wiacek	17611	1	rwiacek_27@esusdstudents.org	5	M	9	A104	Sidwell, Glenn	Wiacek, Ryan Stas	t	\N
2949	Allen	Wilson	19103	1	awilson_27@esusdstudents.org	5	M	9	C100	Kadonaga, Theresa M	Wilson, Allen Leo	t	\N
2950	Tanner	Wilson	17566	1	twilson_27@esusdstudents.org	5	M	9	R103	Moeller, Jill	Wilson, Tanner Christopher	t	\N
2951	Noami	Workneh	20762	1	nworkneh_27@esusdstudents.org	5	F	9	Engineerin	Zwissler, Darwin	Workneh, Noami Mita	t	\N
2997	Lauren	Calof	16924	1	lcalof_26@esusdstudents.org	5	F	10	K213	Mendoza, Manuel	Calof, Lauren Aerin	t	\N
2998	Robert	Campbell	15807	1	rcampbell_26@esusdstudents.org	5	M	10	R201	Turner, Jahid	Campbell, Robert Logan	t	\N
2999	Elissa	Campos	18637	1	ecampos_26@esusdstudents.org	5	F	10	E101	DeLong, Megan	Campos, Elissa Antonia	t	\N
3000	Gisele	Carr	19302	1	gcarr_26@esusdstudents.org	5	F	10	E102	Maye, Bonnie Michelle	Carr, Gisele Amber	t	\N
3002	Hailey	Casper	15753	1	hcasper_26@esusdstudents.org	5	F	10	R201	Turner, Jahid	Casper, Hailey Juliana	t	\N
3003	Destiny	Castellanos	22360	1	dcastellanos_26@esusdstudents.org	5	F	10	K217	Turner, Lauren Alissa	Castellanos, Destiny Jaylene	t	\N
3004	Cassidy	Castillo	21803	1	ccastillo_26@esusdstudents.org	5	F	10	A210	Doering, Mark Edward	Castillo, Cassidy Juliette	t	\N
3005	Camden	Chen	16925	1	cchen_26@esusdstudents.org	5	M	10	E102	Maye, Bonnie Michelle	Chen, Camden Lee	t	\N
3006	Addison	Chittick	16495	1	achittick_26@esusdstudents.org	5	F	10	K213	Mendoza, Manuel	Chittick, Addison	t	\N
3007	Natalie	Christenson	15808	1	nchristenson_26@esusdstudents.org	5	F	10	E102	Maye, Bonnie Michelle	Christenson, Natalie Isabella	t	\N
3008	Maxwell	Christian	16738	1	mchristian_26@esusdstudents.org	5	M	10	E101	DeLong, Megan	Christian, Maxwell Davis	t	\N
3009	Nathan	Claudino	18131	1	nclaudino_26@esusdstudents.org	5	M	10	K103	Stern, Kimberly	Claudino, Nathan Christopher	t	\N
3010	Andrew	Clouse	16069	1	aclouse_26@esusdstudents.org	5	M	10	B202	Adams, Nicole	Clouse, Andrew Takashi	t	\N
3011	Daylen	Coffey	22346	1	dcoffey_26@esusdstudents.org	5	M	10	E102	Maye, Bonnie Michelle	Coffey, Daylen Omari	t	\N
3012	Charlotte	Collard	16312	1	ccollard_26@esusdstudents.org	5	F	10	E102	Maye, Bonnie Michelle	Collard, Charlotte White	t	\N
3013	Shaun	Conley	21789	1	sconley_26@esusdstudents.org	5	M	10	E100	Kadlec, Tamara	Conley, Shaun Michael	t	\N
3015	Natalia	Cortez	19105	1	ncortez_26@esusdstudents.org	5	F	10	E101	DeLong, Megan	Cortez, Natalia Roset	t	\N
3016	Ashley	Couch	16313	1	acouch_26@esusdstudents.org	5	F	10	K217	Turner, Lauren Alissa	Couch, Ashley Nicole	t	\N
3017	Estefani	Cruz	21804	1	ecruz_26@esusdstudents.org	5	F	10	E101	DeLong, Megan	Cruz, Estefani Patrocinia	t	\N
3018	Zachary	Cumming	16496	1	zcumming_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Cumming, Zachary	t	\N
3019	Jacob	Danford	19280	1	jdanford_26@esusdstudents.org	5	M	10	E102	Maye, Bonnie Michelle	Danford, Jacob Dylan	t	\N
3020	Ava	David	22931	1	adavid_26@esusdstudents.org	5	F	10	A210	Doering, Mark Edward	David, Ava Gabriella	t	\N
3021	Emilio	Davila	21243	1	edavila_26@esusdstudents.org	5	M	10	K207	Horvath, Daniel	Davila, Emilio Alessandro	t	\N
3022	Giselle	Davila	16923	1	gdavila_26@esusdstudents.org	5	F	10	K221	Bolanos, Erin	Davila, Giselle Miranda	t	\N
3023	Kaarin	Davis	14914	1	kdavis3_26@esusdstudents.org	5	F	10	K103	Stern, Kimberly	Davis, Kaarin M.	t	\N
3024	Kayla	Davis	16315	1	kdavis_26@esusdstudents.org	5	F	10	K217	Turner, Lauren Alissa	Davis, Kayla Kim	t	\N
3025	Kristiana	Davis	14915	1	kdavis2_26@esusdstudents.org	5	F	10	E101	DeLong, Megan	Davis, Kristiana Hope Wuerth	t	\N
3026	Seth	Davis	22043	1	sdavis_26@esusdstudents.org	5	M	10	R200	Davlantis, Foti J	Davis, Seth Conner	t	\N
3029	Chiara	Del Rio-Ascolese	17581	1	cdelrio-ascoles_26@esusdstudents.org	5	F	10	K213	Mendoza, Manuel	Del Rio-Ascolese, Chiara Edith	t	\N
3030	Sevastien	Deleon	18234	1	sdeleon_26@esusdstudents.org	5	M	10	B203	O'Keefe, Amy Ann	Deleon, Sevastien Anthony	t	\N
3031	Jackson	Dermanoski	22230	1	jdermanoski_26@esusdstudents.org	5	M	10	A210	Doering, Mark Edward	Dermanoski, Jackson Lee	t	\N
3032	Dylan	Diez	15819	1	ddiez_26@esusdstudents.org	5	M	10	A208	Munger, Judith Ann	Diez, Dylan Thomas	t	\N
3033	Thehan	Dissanayake	22914	1	tdissanayake_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Dissanayake, Thehan Bandara	t	\N
3034	Alexander	Donahue	14990	1	adonahue_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Donahue, Alexander Montgomery	t	\N
3035	Madeline	Doyle	16628	1	mdoyle_26@esusdstudents.org	5	F	10	R201	Turner, Jahid	Doyle, Madeline Anne	t	\N
3036	Jake	Eagen	21928	1	jeagen_26@esusdstudents.org	5	M	10	K217	Turner, Lauren Alissa	Eagen, Jake Howard Phineas	t	\N
3037	Emma	Eisenberg	18660	1	eeisenberg_26@esusdstudents.org	5	F	10	E102	Maye, Bonnie Michelle	Eisenberg, Emma Corinne	t	\N
3038	Estella	Elejalde	22227	1	eelejalde_26@esusdstudents.org	5	F	10	A205	Brandlin, Amy	Elejalde, Estella Sophia	t	\N
3039	Colin	Engelhardt	16642	1	cengelhardt_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Engelhardt, Colin Brian	t	\N
3041	Brian	Everitt	22171	1	beveritt_26@esusdstudents.org	5	M	10	A210	Doering, Mark Edward	Everitt, Brian Keith	t	\N
3042	Vincent	Fernandez	22170	1	vfernandez_26@esusdstudents.org	5	M	10	K213	Mendoza, Manuel	Fernandez, Vincent Alexander	t	\N
3043	Giulia	Filippi	20614	1	gfilippi_26@esusdstudents.org	5	F	10	North Gym	Smith, Rainy	Filippi, Giulia Elizabeth Maddalena	t	\N
3044	Riley	Fischer	19843	1	rfischer_26@esusdstudents.org	5	M	10	K103	Stern, Kimberly	Fischer, Riley	t	\N
3045	Matthew	Fizulich	17625	1	mfizulich_26@esusdstudents.org	5	M	10	B202	Adams, Nicole	Fizulich, Matthew	t	\N
3046	Ella	Flores Cully	22050	1	eflorescully_26@esusdstudents.org	5	F	10	K211	Perren, Nicole Marie	Flores Cully, Ella Raine	t	\N
3047	Tristan	Foster	15828	1	tfoster_26@esusdstudents.org	5	M	10	K217	Turner, Lauren Alissa	Foster, Tristan Anthony	t	\N
2996	Kennedy	Calloway	21802	1	kcalloway_26@esusdstudents.org	5	F	10	E102	Maye, Bonnie Michelle	Calloway, Kennedy Jordan	t	\N
3028	Vera	Davis-Boozer	22755	1	vdavis-boozer_26@esusdstudents.org	5	F	10	B205	Nieto Viteri, Grace	Davis-Boozer, Vera Jane	t	\N
6326	Citlali	Carrillo	59014	4	c.carrillosanche014@cvuhsd.org	15	F	9	D-105	Lesan, Kristine M	Carrillo, Citlali	f	\N
3049	Sophia	Frausto	19106	1	sfrausto_26@esusdstudents.org	5	F	10	C100	Kadonaga, Theresa M	Frausto, Sophia Lalita	t	\N
3050	Josue	Fuentes Gil	22427	1	jfuentesgil_26@esusdstudents.org	5	M	10	K217	Turner, Lauren Alissa	Fuentes Gil, Josue Eduardo	t	\N
3051	Kai	Fujimoto	19315	1	kfujimoto_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Fujimoto, Kai Noa	t	\N
3052	Mabel	Furer	20605	1	mfurer_26@esusdstudents.org	5	F	10	A103	Page, Jessica L.	Furer, Mabel Irmgard	t	\N
3053	Marino	Furlan	20563	1	mfurlan_26@esusdstudents.org	5	M	10	B202	Adams, Nicole	Furlan, Marino Maximo	t	\N
3054	Kory	Gable	22172	1	kgable_26@esusdstudents.org	5	F	10	K221	Bolanos, Erin	Gable, Kory Sri	t	\N
3056	Lyla	Garcia	19107	1	lgarcia_26@esusdstudents.org	5	F	10	E101	DeLong, Megan	Garcia, Lyla	t	\N
3057	Sienna	Garcia	21806	1	sgarcia_26@esusdstudents.org	5	F	10	K221	Bolanos, Erin	Garcia, Sienna Elysse	t	\N
3058	Theodore	Gardner	16317	1	tgardner_26@esusdstudents.org	5	M	10	E101	DeLong, Megan	Gardner, Theodore James	t	\N
3059	Genevieve	Gartner-LeBlanc	16644	1	ggartner-leblanc_26@esusdstudents.org	5	F	10	K221	Bolanos, Erin	Gartner-LeBlanc, Genevieve Madelyn	t	\N
3060	Rushil	Ghosh	14991	1	rghosh_26@esusdstudents.org	5	M	10	K103	Stern, Kimberly	Ghosh, Rushil	t	\N
3062	Lia	Giroux	15818	1	lgiroux_26@esusdstudents.org	5	F	10	E102	Maye, Bonnie Michelle	Giroux, Lia	t	\N
3063	Kylie	Glynn	15754	1	kglynn_26@esusdstudents.org	5	F	10	A103	Page, Jessica L.	Glynn, Kylie Grace	t	\N
3064	Aria	Gonzales	19817	1	agonzales_26@esusdstudents.org	5	F	10	R201	Turner, Jahid	Gonzales, Aria	t	\N
3065	Javier	Gonzalez	22028	1	jgonzalez_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Gonzalez, Javier Eduardo	t	\N
3067	Noah	Gonzalez	16108	1	ngonzalez_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Gonzalez, Noah	t	\N
3068	Lucy	Gormley	18699	1	lgormley_26@esusdstudents.org	5	F	10	E102	Maye, Bonnie Michelle	Gormley, Lucy	t	\N
3070	Emerson	Granberg	16685	1	egranberg_26@esusdstudents.org	5	M	10	R200	Davlantis, Foti J	Granberg, Emerson Hobbes	t	\N
3071	Preston	Greaser	16319	1	pgreaser_26@esusdstudents.org	5	M	10	R201	Turner, Jahid	Greaser, Preston Edward	t	\N
3072	Dylan	Gribbon	15968	1	dgribbon_26@esusdstudents.org	5	M	10	E102	Maye, Bonnie Michelle	Gribbon, Dylan Robert	t	\N
3073	Cyren	Groisman	21155	1	cgroisman_26@esusdstudents.org	5	X	10	K213	Mendoza, Manuel	Groisman, Cyren	t	\N
3074	Anya	Gupta	16660	1	agupta_26@esusdstudents.org	5	F	10	A208	Munger, Judith Ann	Gupta, Anya	t	\N
3075	Cameron	Gurr	16477	1	cgurr_26@esusdstudents.org	5	M	10	K203	McNeela, Kristina	Gurr, Cameron David Liberty	t	\N
3076	Trey	Gustafson	21807	1	tgustafson_26@esusdstudents.org	5	M	10	South Gym	March, David	Gustafson, Trey William	t	\N
3078	Alessandra	Haddick	21312	1	ahaddick_26@esusdstudents.org	5	F	10	E101	DeLong, Megan	Haddick, Alessandra Marina	t	\N
3079	Sarah	Hafez	16480	1	shafez_26@esusdstudents.org	5	F	10	A205	Brandlin, Amy	Hafez, Sarah Tamer	t	\N
3080	Christen	Hardy-Taylor	18010	1	chardy-taylor_26@esusdstudents.org	5	F	10	K221	Bolanos, Erin	Hardy-Taylor, Christen London	t	\N
3081	Brooklyn	Harper	19399	1	bharper_26@esusdstudents.org	5	F	10	A205	Brandlin, Amy	Harper, Brooklyn Elizabeth	t	\N
3082	Brad	Haug	15825	1	bhaug_26@esusdstudents.org	5	M	10	R200	Davlantis, Foti J	Haug, Brad	t	\N
3083	Caden	Hawkins	22219	1	chawkins_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Hawkins, Caden Thomas	t	\N
3085	Andrew	Hernandez	19337	1	ahernandez_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Hernandez, Andrew Elijah	t	\N
3086	Sage	Herring	16927	1	sherring_26@esusdstudents.org	5	F	10	E102	Maye, Bonnie Michelle	Herring, Sage Michele	t	\N
3087	Shane	Hines	21584	1	shines_26@esusdstudents.org	5	M	10	E100	Kadlec, Tamara	Hines, Shane Anthony	t	\N
3088	Graham	Hopkins	16934	1	ghopkins_26@esusdstudents.org	5	M	10	E102	Maye, Bonnie Michelle	Hopkins, Graham Lee	t	\N
3089	Liam	Howard	22220	1	lhoward_26@esusdstudents.org	5	M	10	K103	Stern, Kimberly	Howard, Liam Magnus	t	\N
3090	Tristan	Hummel	19978	1	thummel_26@esusdstudents.org	5	M	10	A210	Doering, Mark Edward	Hummel, Tristan Karlyle Higashiyama	t	\N
3091	Isabelle	Ibarra	19282	1	iibarra_26@esusdstudents.org	5	F	10	K221	Bolanos, Erin	Ibarra, Isabelle Celine	t	\N
3092	Drew	Ingram	19937	1	dingram_26@esusdstudents.org	5	M	10	North Gym	Smith, Rainy	Ingram, Drew	t	\N
3093	Issac	Ingram	19936	1	iingram_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Ingram, Issac	t	\N
3094	Ledger	Issock	21698	1	lissock_26@esusdstudents.org	5	M	10	K217	Turner, Lauren Alissa	Issock, Ledger Warren	t	\N
3095	Jazper	Ivester	15823	1	eivester_26@esusdstudents.org	5	F	10	South Gym	March, David	Ivester, Jazper Leigh	t	\N
3096	Elijah	Jackson	20519	1	ejackson_26@esusdstudents.org	5	M	10	K217	Turner, Lauren Alissa	Jackson, Elijah Nicholas	t	\N
3097	Makenzie	Jaeger	15758	1	mjaeger_26@esusdstudents.org	5	F	10	K221	Bolanos, Erin	Jaeger, Makenzie Sara	t	\N
3099	Andrew	Johnson	22835	1	ajohnson_26@esusdstudents.org	5	M	10	K201	Kojima, Tyler	Johnson, Andrew Matthew	t	\N
3100	Cynthia	Johnson	21705	1	cjohnson_26@esusdstudents.org	5	F	10	K221	Bolanos, Erin	Johnson, Cynthia Marie	t	\N
3101	Danielle	Juckett	21809	1	djuckett_26@esusdstudents.org	5	F	10	A210	Doering, Mark Edward	Juckett, Danielle Shelby	t	\N
3061	Jackson	Giorgio	16658	1	jgiorgio_26@esusdstudents.org	5	M	10	K103	Stern, Kimberly	Giorgio, Jackson Cole	t	\N
3077	Kendel	Guy	16802	1	kguy_26@esusdstudents.org	5	F	10	K221	Bolanos, Erin	Guy, Kendel Sage	t	\N
6327	Omar	Castaneda	58156	4	o.castaneda156@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	Castaneda, Omar	f	\N
3102	Tyler	Keegan	15760	1	tkeegan_26@esusdstudents.org	5	M	10	R201	Turner, Jahid	Keegan, Tyler Andrew	t	\N
3103	Kimberly	Kehl	16664	1	kkehl_26@esusdstudents.org	5	F	10	K221	Bolanos, Erin	Kehl, Kimberly	t	\N
3104	Ashlyn	Keith	15829	1	akeith_26@esusdstudents.org	5	F	10	K203	McNeela, Kristina	Keith, Ashlyn Marian	t	\N
3106	Julia	Kelly	16665	1	jkelly_26@esusdstudents.org	5	F	10	A210	Doering, Mark Edward	Kelly, Julia	t	\N
3107	Sydney	Keown	19973	1	skeown_26@esusdstudents.org	5	F	10	A103	Page, Jessica L.	Keown, Sydney	t	\N
3108	Elizabeth	Kerker	16667	1	ekerker_26@esusdstudents.org	5	F	10	E102	Maye, Bonnie Michelle	Kerker, Elizabeth Marie	t	\N
3109	Ava	King	16668	1	aking_26@esusdstudents.org	5	F	10	R201	Turner, Jahid	King, Ava Jean	t	\N
3110	Cara	King	16669	1	cking_26@esusdstudents.org	5	F	10	E102	Maye, Bonnie Michelle	King, Cara Penelope	t	\N
3111	Destiny	Kinyanjui	19968	1	dkinyanjui_26@esusdstudents.org	5	F	10	R103	Moeller, Jill	Kinyanjui, Destiny Muthoni	t	\N
3112	Olivia	Klages	16629	1	oklages_26@esusdstudents.org	5	F	10	R201	Turner, Jahid	Klages, Olivia Marie	t	\N
3113	Sora	Koike	16719	1	skoike_26@esusdstudents.org	5	F	10	K103	Stern, Kimberly	Koike, Sora	t	\N
3114	Emilia	Krumlauf	21161	1	ekrumlauf_26@esusdstudents.org	5	F	10	K103	Stern, Kimberly	Krumlauf, Emilia Carlotta	t	\N
3115	Makena	Lafolette	21810	1	mlafolette_26@esusdstudents.org	5	F	10	K203	McNeela, Kristina	Lafolette, Makena Lei	t	\N
3116	Jadden	Lai-Yates	16085	1	jlai-yates_26@esusdstudents.org	5	M	10	E101	DeLong, Megan	Lai-Yates, Jadden Chase	t	\N
3118	Andre	Lavalle	15836	1	alavalle_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Lavalle, Andre Phillip	t	\N
3119	Wesley	Lawlor	16897	1	wlawlor_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Lawlor, Wesley Ryan	t	\N
3120	Ronald	Lemus	22232	1	rlemus_26@esusdstudents.org	5	M	10	A206	Nichols, Nathan	Lemus, Ronald Nicholas	t	\N
3121	Kai	Lepisto	21931	1	klepisto_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Lepisto, Kai Eric	t	\N
3122	Madeline	Linder	18872	1	mlinder_26@esusdstudents.org	5	F	10	E102	Maye, Bonnie Michelle	Linder, Madeline Brielle	t	\N
3123	Declan	Lister	15911	1	dlister_26@esusdstudents.org	5	M	10	K103	Stern, Kimberly	Lister, Declan Miles	t	\N
3124	Cam	Longshore	22229	1	clongshore_26@esusdstudents.org	5	M	10	K103	Stern, Kimberly	Longshore, Cam Kiernan	t	\N
3125	Julieta	Lopez	16631	1	jlopez_26@esusdstudents.org	5	F	10	R101	Hansen, Bjorn	Lopez, Julieta	t	\N
3126	Madeleine	Lucy	21793	1	mlucy_26@esusdstudents.org	5	F	10	R201	Turner, Jahid	Lucy, Madeleine Isabella	t	\N
3127	Macy	Ludwig	21811	1	mludwig_26@esusdstudents.org	5	F	10	A210	Doering, Mark Edward	Ludwig, Macy Grace	t	\N
3128	Cora	Mackerer	16931	1	cmackerer_26@esusdstudents.org	5	F	10	K203	McNeela, Kristina	Mackerer, Cora Charlton	t	\N
3130	Dylan	Mahoney	15844	1	dmahoney_26@esusdstudents.org	5	M	10	A103	Page, Jessica L.	Mahoney, Dylan Makoa	t	\N
3132	Nathaniel	Marcus	19783	1	nmarcus_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Marcus, Nathaniel James	t	\N
3133	Jose	Marrero	20479	1	jmarrero_26@esusdstudents.org	5	M	10	A103	Page, Jessica L.	Marrero, Jose	t	\N
3134	Ava	Martinez	18746	1	amartinez_26@esusdstudents.org	5	F	10	C100	Kadonaga, Theresa M	Martinez, Ava Carlota	t	\N
3135	Kayla	Martinez	16101	1	kmartinez_26@esusdstudents.org	5	F	10	A210	Doering, Mark Edward	Martinez, Kayla Hope	t	\N
3138	Elias-Micah	Matthews	21812	1	ematthews_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Matthews, Elias-Micah Douglas	t	\N
3139	Taylor	McCarthy	21825	1	tmccarthy_26@esusdstudents.org	5	M	10	E102	Maye, Bonnie Michelle	McCarthy, Taylor Ace	t	\N
3140	Jack	McCaulley	16687	1	jmccaulley_26@esusdstudents.org	5	M	10	E102	Maye, Bonnie Michelle	McCaulley, Jack	t	\N
3141	Deborah	McCormack	21813	1	dmccormack_26@esusdstudents.org	5	F	10	R200	Davlantis, Foti J	McCormack, Deborah Marie	t	\N
3142	Aidan	McKerron	18638	1	amckerron_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	McKerron, Aidan Anthony	t	\N
3143	Katherine	McKibben	14916	1	kmckibben_26@esusdstudents.org	5	F	10	North Gym	Smith, Rainy	McKibben, Katherine	t	\N
3144	Cooper	McKie	16938	1	cmckie_26@esusdstudents.org	5	M	10	E102	Maye, Bonnie Michelle	McKie, Cooper James Keller	t	\N
3145	Gabriel	McMahan	16632	1	gmcmahan_26@esusdstudents.org	5	M	10	K207	Horvath, Daniel	McMahan, Gabriel	t	\N
3146	Kalista	McMillon	15761	1	kmcmillon_26@esusdstudents.org	5	F	10	R103	Moeller, Jill	McMillon, Kalista Ann	t	\N
3147	Kirsten	McNally	17407	1	kmcnally_26@esusdstudents.org	5	F	10	K203	McNeela, Kristina	McNally, Kirsten Elise	t	\N
3148	Amanuel	Mesfin	19372	1	amesfin_26@esusdstudents.org	5	M	10	E101	DeLong, Megan	Mesfin, Amanuel Tamiru	t	\N
3149	Bridget	Michel	15851	1	bmichel_26@esusdstudents.org	5	F	10	K213	Mendoza, Manuel	Michel, Bridget	t	\N
3150	Brianna	Mills	17410	1	bmills_26@esusdstudents.org	5	F	10	K213	Mendoza, Manuel	Mills, Brianna Elizabeth	t	\N
3152	Ashton	Moore	19429	1	amoore2_26@esusdstudents.org	5	M	10	A210	Doering, Mark Edward	Moore, Ashton Pierce	t	\N
3153	Hudson	Moreshead	19977	1	hmoreshead_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Moreshead, Hudson Marinaccio	t	\N
3154	Ava	Morini	19883	1	amorini_26@esusdstudents.org	5	F	10	R101	Hansen, Bjorn	Morini, Ava Dora Pompermayer Meiners	t	\N
3155	Charly	Morrissey	16692	1	cmorrissey_26@esusdstudents.org	5	F	10	K217	Turner, Lauren Alissa	Morrissey, Charly Alyce	t	\N
3131	Isabella	Mangiagli	19226	1	imangiagli_26@esusdstudents.org	5	F	10	E102	Maye, Bonnie Michelle	Mangiagli, Isabella Diane	t	\N
3136	Luke	Martinez	22363	1	lmartinez_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Martinez, Luke Abraham	t	\N
6328	Adrian	Castanon	57841	4	a.castanon841@cvuhsd.org	15	M	9	M-110	Segovia, Jose M	Castanon, Adrian	f	\N
3197	Jaiden	Rico	18732	1	jrico_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Rico, Jaiden	t	\N
3199	Isaiah	Rodriguez	22168	1	irodriguez_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Rodriguez, Isaiah Gabriel	t	\N
3200	Madeleine	Rodriguez	21929	1	mrodriguez_26@esusdstudents.org	5	F	10	E102	Maye, Bonnie Michelle	Rodriguez, Madeleine Blaire	t	\N
3201	Remy	Romero	17885	1	rromero_26@esusdstudents.org	5	M	10	K103	Stern, Kimberly	Romero, Remy Stefan	t	\N
3202	Charlee	Rosenwald	16737	1	crosenwald_26@esusdstudents.org	5	F	10	E101	DeLong, Megan	Rosenwald, Charlee Ray	t	\N
3203	Natalia	Roundy	16733	1	nroundy_26@esusdstudents.org	5	F	10	E102	Maye, Bonnie Michelle	Roundy, Natalia Anne	t	\N
3204	Jonah	Rouse	16735	1	jrouse_26@esusdstudents.org	5	M	10			Rouse, Jonah	t	\N
3205	Jackson	Rushing	20552	1	jrushing_26@esusdstudents.org	5	M	10	A208	Munger, Judith Ann	Rushing, Jackson Carter	t	\N
3206	Hollan	Russell	21247	1	hrussell_26@esusdstudents.org	5	M	10	A206	Nichols, Nathan	Russell, Hollan James	t	\N
3207	Zia	Sanchez-Boisselle	16489	1	zboisselle_26@esusdstudents.org	5	F	10	R101	Hansen, Bjorn	Sanchez-Boisselle, Zia Bella	t	\N
3208	Samantha	Santos	22030	1	ssantos_26@esusdstudents.org	5	F	10	R200	Davlantis, Foti J	Santos, Samantha Michelle	t	\N
3209	Johnny	Schnauer	21313	1	jschnauer_26@esusdstudents.org	5	M	10	A206	Nichols, Nathan	Schnauer, Johnny Ara	t	\N
3157	Cody	Natvig	22042	1	cnatvig_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Natvig, Cody Scott	t	\N
3158	Brianna	Nelson	22284	1	bnelson_26@esusdstudents.org	5	F	10	K203	McNeela, Kristina	Nelson, Brianna Virginia	t	\N
3159	Cameron	Nelson	20613	1	cnelson_26@esusdstudents.org	5	M	10	K203	McNeela, Kristina	Nelson, Cameron Ashten	t	\N
3160	Miles	Nguyen	16633	1	mnguyen_26@esusdstudents.org	5	M	10	E102	Maye, Bonnie Michelle	Nguyen, Miles Tan	t	\N
3161	Julia	Nieves	15006	1	jnieves_26@esusdstudents.org	5	F	10	K103	Stern, Kimberly	Nieves, Julia Christine	t	\N
3162	Keith	Nishimoto	19808	1	knishimoto_26@esusdstudents.org	5	M	10	R200	Davlantis, Foti J	Nishimoto, Keith	t	\N
3163	Jasmine	Ogata	18669	1	jogata_26@esusdstudents.org	5	F	10	A208	Munger, Judith Ann	Ogata, Jasmine Anuhea Akane	t	\N
3164	Jacob	Ortega Miro	22356	1	jortegamiro_26@esusdstudents.org	5	M	10	A208	Munger, Judith Ann	Ortega Miro, Jacob Gael	t	\N
3165	David	Ortiz	22893	1	dortiz_26@esusdstudents.org	5	M	10	R200	Davlantis, Foti J	Ortiz, David	t	\N
3166	Spencer	Osborne	17730	1	sosborne_26@esusdstudents.org	5	M	10	K103	Stern, Kimberly	Osborne, Spencer James	t	\N
3167	Grant	Ostler	16717	1	gostler_26@esusdstudents.org	5	M	10	B205	Nieto Viteri, Grace	Ostler, Grant Brian	t	\N
3168	Juliette	Oudot-Lague	19988	1	joudot-Lague_26@esusdstudents.org	5	F	10	K103	Stern, Kimberly	Oudot-Lague, Juliette Christiane	t	\N
3169	James	Owen	15842	1	jowen_26@esusdstudents.org	5	M	10	K217	Turner, Lauren Alissa	Owen, James	t	\N
3170	Elliot	Pak	16720	1	epak_26@esusdstudents.org	5	M	10	E101	DeLong, Megan	Pak, Elliot Sung Hyun	t	\N
3171	Madeleine	Palka	20610	1	mpalka_26@esusdstudents.org	5	F	10	K203	McNeela, Kristina	Palka, Madeleine Jade	t	\N
3173	Joseph	Pastrana	21815	1	jpastrana_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Pastrana, Joseph Daniel	t	\N
3174	Luka	Pavlovic	16634	1	lpavlovic_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Pavlovic, Luka Mateo	t	\N
3175	Samantha	Pavon	22039	1	spavon_26@esusdstudents.org	5	F	10	E101	DeLong, Megan	Pavon, Samantha Alexandra	t	\N
3176	Julianne	Pearson	16710	1	jpearson_26@esusdstudents.org	5	F	10	C100	Kadonaga, Theresa M	Pearson, Julianne Elizabeth	t	\N
3177	Ashley	Perkins	16723	1	aperkins_26@esusdstudents.org	5	F	10	R101	Hansen, Bjorn	Perkins, Ashley Todd	t	\N
3178	Derick	Perry	16724	1	dperry_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Perry, Derick	t	\N
3179	Darron	Pierce	16725	1	dpierce_26@esusdstudents.org	5	M	10	E102	Maye, Bonnie Michelle	Pierce, Darron Ellery	t	\N
3180	Tate	Pintens	21826	1	tpintens_26@esusdstudents.org	5	M	10	E102	Maye, Bonnie Michelle	Pintens, Tate James	t	\N
3181	Lauren	Poepoe	16726	1	lpoepoe_26@esusdstudents.org	5	F	10	K213	Mendoza, Manuel	Poepoe, Lauren	t	\N
3182	Elijah	Pohlman	15862	1	epohlman_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Pohlman, Elijah	t	\N
3183	Stella	Pollard	16638	1	spollard_26@esusdstudents.org	5	F	10	A103	Page, Jessica L.	Pollard, Stella	t	\N
3184	Zoe	Pollard	16639	1	zpollard_26@esusdstudents.org	5	F	10	A103	Page, Jessica L.	Pollard, Zoe	t	\N
3186	Priya	Pullman	19441	1	ppullman_26@esusdstudents.org	5	F	10	K221	Bolanos, Erin	Pullman, Priya	t	\N
3187	Lincoln	Quaintance	16728	1	lquaintance_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Quaintance, Lincoln	t	\N
3188	Arianna	Quevedo	22909	1	aquevedo_26@esusdstudents.org	5	F	10	A205	Brandlin, Amy	Quevedo, Arianna Janae	t	\N
3185	Townes	Potter	17428	1	tpotter_26@esusdstudents.org	5	M	10	R200	Davlantis, Foti J	Potter, Townes William	t	\N
3189	Sofia	Ramos	17431	1	sramos_26@esusdstudents.org	5	F	10	K213	Mendoza, Manuel	Ramos, Sofia Anne	t	\N
3190	Daviq	Razaq	22053	1	drazaq_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Razaq, Daviq	t	\N
3191	Hanzo	Rehm	22052	1	hrehm_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Rehm, Hanzo Rayden	t	\N
3192	Emma	Relles	18180	1	erelles_26@esusdstudents.org	5	F	10	A206	Nichols, Nathan	Relles, Emma	t	\N
3193	Ethan	Relles	18179	1	erelles2_26@esusdstudents.org	5	M	10	K103	Stern, Kimberly	Relles, Ethan	t	\N
3194	Marlee	Remington	21786	1	mremington_26@esusdstudents.org	5	F	10	K213	Mendoza, Manuel	Remington, Marlee Jo	t	\N
3195	Max	Repolust	19970	1	mrepolust_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Repolust, Max Jona	t	\N
3212	Syden	Shaibi	16649	1	sshaibi_26@esusdstudents.org	5	M	10	North Gym	Smith, Rainy	Shaibi, Syden August	t	\N
3213	Delilah	Shields	21933	1	dshields_26@esusdstudents.org	5	F	10	K213	Mendoza, Manuel	Shields, Delilah Pearl	t	\N
3214	Jasper	Shimon	18305	1	jshimon_26@esusdstudents.org	5	M	10	K103	Stern, Kimberly	Shimon, Jasper Kenneth	t	\N
3217	Anaiya	Singh	18250	1	asingh_26@esusdstudents.org	5	F	10	B205	Nieto Viteri, Grace	Singh, Anaiya	t	\N
3218	Aidan	Smith	15872	1	asmith_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Smith, Aidan Montgomery Patterson	t	\N
3219	Jayden	Smith	15814	1	jsmith_26@esusdstudents.org	5	F	10	K221	Bolanos, Erin	Smith, Jayden Hendrica	t	\N
3220	Mason	Smith	15873	1	msmith_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Smith, Mason Thurl	t	\N
3221	Wyatt	Smith	21197	1	wsmith_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Smith, Wyatt James	t	\N
3222	Kyra	Snell	16745	1	ksnell_26@esusdstudents.org	5	F	10	E101	DeLong, Megan	Snell, Kyra Leilani Yukiko	t	\N
3216	Brianna	Sierra	16812	1	bsierra_26@esusdstudents.org	5	F	10	B202	Adams, Nicole	Sierra, Brianna Ilene	t	\N
3215	Nicolas	Shoepe	15811	1	nshoepe_26@esusdstudents.org	5	M	10	K203	McNeela, Kristina	Shoepe, Nicolas Vo	t	\N
3223	Sadie	Snow	18701	1	ssnow_26@esusdstudents.org	5	F	10	K203	McNeela, Kristina	Snow, Sadie Rose	t	\N
3225	Sarah	Spraggins	16746	1	sspraggins_26@esusdstudents.org	5	F	10	K217	Turner, Lauren Alissa	Spraggins, Sarah Emily	t	\N
3226	Aidan	Steele	16879	1	asteele_26@esusdstudents.org	5	M	10	A208	Munger, Judith Ann	Steele, Aidan	t	\N
3227	Eli	Stephens	18676	1	estephens_26@esusdstudents.org	5	M	10	B202	Adams, Nicole	Stephens, Eli Samuel	t	\N
3228	Emma	Stevens	16114	1	estevens_26@esusdstudents.org	5	F	10	A210	Doering, Mark Edward	Stevens, Emma Elizabeth	t	\N
3229	Stephanie	Stone	16747	1	sstone_26@esusdstudents.org	5	F	10	K217	Turner, Lauren Alissa	Stone, Stephanie	t	\N
3230	Andre	Sugden	16705	1	asugden_26@esusdstudents.org	5	M	10	A210	Doering, Mark Edward	Sugden, Andre William	t	\N
3231	Trevor	Szabo	14925	1	tszabo_26@esusdstudents.org	5	M	10			Szabo, Trevor Thomas	t	\N
3232	Riley	Taylor	19974	1	rtaylor_26@esusdstudents.org	5	F	10	E101	DeLong, Megan	Taylor, Riley Morgan	t	\N
3233	Axel	Thiess	21787	1	athiess_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Thiess, Axel Louis	t	\N
3234	Theo	Thomas	16653	1	tthomas_26@esusdstudents.org	5	M	10	B205	Nieto Viteri, Grace	Thomas, Theo Sterling	t	\N
3235	Niklas	Thomas-Baumann	21817	1	nthomas-baumann_26@esusdstudents.org	5	M	10	E102	Maye, Bonnie Michelle	Thomas-Baumann, Niklas	t	\N
3236	Andrew	Tijerino	22283	1	atijerino_26@esusdstudents.org	5	M	10	A210	Doering, Mark Edward	Tijerino, Andrew Jordan	t	\N
3238	Madisson	Torres	19975	1	mtorres_26@esusdstudents.org	5	F	10	B205	Nieto Viteri, Grace	Torres, Madisson Traci	t	\N
3239	Aiden	Trombo	19897	1	atrombo_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Trombo, Aiden Charles	t	\N
3240	Sophia	Trujillo	16875	1	strujillo_26@esusdstudents.org	5	F	10	R200	Davlantis, Foti J	Trujillo, Sophia Adin	t	\N
3241	Collen	Ungaro	16750	1	cungaro_26@esusdstudents.org	5	M	10	E102	Maye, Bonnie Michelle	Ungaro, Collen Rino	t	\N
3242	Adan	Uribe	21930	1	auribe_26@esusdstudents.org	5	M	10	A206	Nichols, Nathan	Uribe, Adan Enrique	t	\N
3243	Samiuela	Vaikona	21932	1	svaikona_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Vaikona, Samiuela Paea-I-Vaha	t	\N
3245	Adam	Varga	21139	1	avarga_26@esusdstudents.org	5	M	10	K103	Stern, Kimberly	Varga, Adam Dezso	t	\N
3246	Annabelle	Varghese	16751	1	avarghese_26@esusdstudents.org	5	F	10	K213	Mendoza, Manuel	Varghese, Annabelle	t	\N
3247	Inci	Varon	21934	1	ivaron_26@esusdstudents.org	5	F	10	E102	Maye, Bonnie Michelle	Varon, Inci	t	\N
3248	Mira Kelly	Villa	19969	1	mvilla_26@esusdstudents.org	5	F	10	South Gym	March, David	Villa, Mira Kelly Estolano	t	\N
3249	Joaquin	Wagner-Bagues	16657	1	jwagner-bagues_26@esusdstudents.org	5	M	10	R100	Maisonet, Tiffany	Wagner-Bagues, Joaquin Angel	t	\N
3250	Sarina	Waite	16754	1	swaite_26@esusdstudents.org	5	F	10	R200	Davlantis, Foti J	Waite, Sarina Avani	t	\N
3253	Taryn	Walker	16755	1	twalker_26@esusdstudents.org	5	F	10	E102	Maye, Bonnie Michelle	Walker, Taryn Noelle	t	\N
3254	Eridani	Walther	17452	1	ewalther_26@esusdstudents.org	5	F	10	K213	Mendoza, Manuel	Walther, Eridani Elizabeth	t	\N
3255	Trista	Wei	21211	1	twei_26@esusdstudents.org	5	F	10	K221	Bolanos, Erin	Wei, Trista	t	\N
3256	Lily	Weiss	16702	1	lweiss_26@esusdstudents.org	5	F	10	A210	Doering, Mark Edward	Weiss, Lily Isabella	t	\N
3257	Samuel	Whitney	15865	1	swhitney_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Whitney, Samuel Allen	t	\N
3258	Adam	Wiacek	19286	1	awiacek_26@esusdstudents.org	5	M	10	R201	Turner, Jahid	Wiacek, Adam	t	\N
3252	Ethan	Walker	17970	1	ewalker_26@esusdstudents.org	5	M	10	R201	Turner, Jahid	Walker, Ethan Joshua	t	\N
3259	Hayden	Wilkoff	16672	1	hwilkoff_26@esusdstudents.org	5	X	10	K221	Bolanos, Erin	Wilkoff, Hayden E	t	\N
3260	Ashton	Williams	21827	1	awilliams_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Williams, Ashton Timothy	t	\N
3261	Sean	Willick	16762	1	swillick_26@esusdstudents.org	5	M	10	K203	McNeela, Kristina	Willick, Sean Jacob	t	\N
3262	ThaingahMoun	Win	19287	1	twin_26@esusdstudents.org	5	M	10	E101	DeLong, Megan	Win, ThaingahMoun Thura	t	\N
3263	Cheyenne	Yates	19397	1	cyates_26@esusdstudents.org	5	F	10	A205	Brandlin, Amy	Yates, Cheyenne	t	\N
3264	Alexis	Yew	16764	1	ayew_26@esusdstudents.org	5	F	10	K203	McNeela, Kristina	Yew, Alexis	t	\N
6329	Aiden	Castellanos	57963	4	a.castellanos963@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Castellanos, Aiden Bruce	f	\N
3268	Reed	Abrams	14511	1	rabrams2_25@esusdstudents.org	5	M	11	R201	Turner, Jahid	Abrams, Reed Wyatt	t	\N
3269	Riley	Abrams	15057	1	rabrams_25@esusdstudents.org	5	F	11	K205	Glotz, Darin	Abrams, Riley August	t	\N
3270	Ava	Adlam	15787	1	aadlam_25@esusdstudents.org	5	F	11	A202	Gerber, Rachael Marci	Adlam, Ava Grace	t	\N
3271	Arya	Ahadzadeh	19484	1	aahadzadeh_25@esusdstudents.org	5	M	11	B202	Adams, Nicole	Ahadzadeh, Arya	t	\N
3272	Ava	Albertson	15830	1	aalbertson_25@esusdstudents.org	5	F	11	B101	Richmond, Ashley	Albertson, Ava Marie	t	\N
3273	Lutfy	Alhassan	15833	1	lalhassan_25@esusdstudents.org	5	M	11	R201	Turner, Jahid	Alhassan, Lutfy A	t	\N
3274	Anisa	Ali	19859	1	aali_25@esusdstudents.org	5	F	11	K202	Barajas, Gerardo	Ali, Anisa Mariya	t	\N
3275	Mary	Amara	17486	1	mamara_25@esusdstudents.org	5	F	11	E101	DeLong, Megan	Amara, Mary Clara	t	\N
3276	Jordan	Amber	15791	1	jamber_25@esusdstudents.org	5	M	11	R200	Davlantis, Foti J	Amber, Jordan Francis	t	\N
3278	Elliot	Anenberg	19486	1	eanenberg_25@esusdstudents.org	5	M	11	E102	Maye, Bonnie Michelle	Anenberg, Elliot Yassin	t	\N
3279	Norely	Aranda	21641	1	naranda_25@esusdstudents.org	5	F	11	R202	Traber, William Jr.	Aranda, Norely Andrea	t	\N
3280	Sofia	Arichea-Brown	21201	1	sarichea-brown_25@esusdstudents.org	5	F	11	K202	Barajas, Gerardo	Arichea-Brown, Sofia Genevieve	t	\N
3281	Juliana	Armendariz	21306	1	jarmendariz_25@esusdstudents.org	5	F	11	E100	Kadlec, Tamara	Armendariz, Juliana Izel	t	\N
3282	Jessica	Arutunian	21291	1	jarutunian_25@esusdstudents.org	5	F	11	C100	Kadonaga, Theresa M	Arutunian, Jessica Jean	t	\N
3283	Ethan	Ayler	15058	1	eayler_25@esusdstudents.org	5	M	11	R201	Turner, Jahid	Ayler, Ethan William	t	\N
3284	Joanne	Bagby	16139	1	jbagby_25@esusdstudents.org	5	F	11	B201	Reese, Julie Ann	Bagby, Joanne	t	\N
3285	Cadee	Baird	15837	1	cbaird_25@esusdstudents.org	5	F	11	E105	Eastman, John James	Baird, Cadee Marie	t	\N
3286	Vince	Baldino	15840	1	vbaldino_25@esusdstudents.org	5	M	11	E105	Eastman, John James	Baldino, Vince Riley	t	\N
3287	Taylor	Bargielski	19542	1	tbargielski2_25@esusdstudents.org	5	F	11	K213	Mendoza, Manuel	Bargielski, Taylor Ann	t	\N
3288	Tianna	Bargielski	19541	1	tbargielski_25@esusdstudents.org	5	F	11	K207	Horvath, Daniel	Bargielski, Tianna Lee	t	\N
3290	Alan	Bayk	21324	1	abayk_25@esusdstudents.org	5	M	11	A206	Nichols, Nathan	Bayk, Alan Bardia	t	\N
3291	Isaac	Beas	21610	1	ibeas_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Beas, Isaac Gabriel	t	\N
3293	Serena	Benson	16893	1	sbenson_25@esusdstudents.org	5	F	11	K211	Perren, Nicole Marie	Benson, Serena Shea	t	\N
3294	Yuvia	Bernauer	15846	1	ybernauer_25@esusdstudents.org	5	F	11	R202	Traber, William Jr.	Bernauer, Yuvia Sofia	t	\N
3296	Jaya	Bhakta	19511	1	jbhakta_25@esusdstudents.org	5	F	11	B101	Richmond, Ashley	Bhakta, Jaya Rakesh	t	\N
3297	Mika	Bialek	21285	1	mbialek_25@esusdstudents.org	5	F	11	R100	Maisonet, Tiffany	Bialek, Mika Jillian	t	\N
3298	Reese	Biggerstaff	15849	1	rbiggerstaff_25@esusdstudents.org	5	M	11	A103	Page, Jessica L.	Biggerstaff, Reese Elliot	t	\N
3299	Dillon	Birkmann	21218	1	dbirkmann_25@esusdstudents.org	5	M	11	A206	Nichols, Nathan	Birkmann, Dillon Austin	t	\N
3300	Anmei	Bloom	19729	1	abloom_25@esusdstudents.org	5	F	11	Counseling	Allen-Burns, Stephanie Marie	Bloom, Anmei Grace	t	\N
3301	Amelia	Bolognini	21209	1	abolognini_25@esusdstudents.org	5	F	11	C100	Kadonaga, Theresa M	Bolognini, Amelia Pamela Yorke	t	\N
3302	Cooper	Borde Grubbs	21823	1	cbordegrubbs_25@esusdstudents.org	5	M	11	E105	Eastman, John James	Borde Grubbs, Cooper Alexandre	t	\N
3303	Merrick	Boyles	15063	1	mboyles_25@esusdstudents.org	5	M	11	K215	McDorman, Teresa	Boyles, Merrick Andrew	t	\N
3304	Nainoa	Breeden	15311	1	nbreeden_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Breeden, Nainoa	t	\N
3306	Lucas	Brown	15988	1	lbrown_25@esusdstudents.org	5	M	11	B101	Richmond, Ashley	Brown, Lucas Ryan	t	\N
3266	Stanley	Zhang	16675	1	szhang_26@esusdstudents.org	5	M	10	A208	Munger, Judith Ann	Zhang, Stanley Davis	t	\N
3265	Natasha	Zhang	16674	1	nzhang_26@esusdstudents.org	5	F	10	A208	Munger, Judith Ann	Zhang, Natasha Ella	t	\N
3307	Nathan	Burns	21230	1	nburns_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Burns, Nathan Roe	t	\N
3308	Clash	Buswell	17437	1	cbuswell_25@esusdstudents.org	5	M	11	A206	Nichols, Nathan	Buswell, Clash Henry	t	\N
3309	Ryan	Butcher	14452	1	rbutcher_25@esusdstudents.org	5	M	11	R201	Turner, Jahid	Butcher, Ryan Chen	t	\N
3310	Holden	Cadman	15853	1	hcadman_25@esusdstudents.org	5	M	11	A206	Nichols, Nathan	Cadman, Holden	t	\N
3311	Callista	Calderon	15855	1	ccalderon_25@esusdstudents.org	5	F	11	A206	Nichols, Nathan	Calderon, Callista	t	\N
3312	Aden	Calof	16903	1	acalof_25@esusdstudents.org	5	M	11	A208	Munger, Judith Ann	Calof, Aden Logan	t	\N
3313	Brooke	Campbell	20811	1	bcampbell_25@esusdstudents.org	5	F	11	R100	Maisonet, Tiffany	Campbell, Brooke Elizabeth	t	\N
3314	James	Camper	21665	1	jcamper_25@esusdstudents.org	5	M	11	K211	Perren, Nicole Marie	Camper, James Earl	t	\N
3315	Roberto	Cantu	19490	1	rcantu_25@esusdstudents.org	5	M	11	K207	Horvath, Daniel	Cantu, Roberto	t	\N
3317	Alejandro	Carballar	20545	1	acarballar_25@esusdstudents.org	5	M	11	E105	Eastman, John James	Carballar, Alejandro	t	\N
3318	Sara	Carroll	16779	1	scarroll_25@esusdstudents.org	5	F	11	A206	Nichols, Nathan	Carroll, Sara Nivada	t	\N
3289	Morgan	Barlow	21602	1	mbarlow_25@esusdstudents.org	5	M	11	A208	Munger, Judith Ann	Barlow, Morgan Alexander	t	\N
3295	Julien	Bertout	16091	1	jbertout_25@esusdstudents.org	5	M	11	A203	Whalen IV, James	Bertout, Julien Zoltan	t	\N
6330	Camila	Castillo Perez	58792	4	c.castilloperez792@cvuhsd.org	15	F	9	C-203	Duran, Dominic J	Castillo Perez, Camila	f	\N
6331	Samantha	Castillo	58791	4	s.castillo791@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Castillo, Samantha Esther	f	\N
3320	Cole	Castillo	15857	1	ccastillo_25@esusdstudents.org	5	M	11	R200	Davlantis, Foti J	Castillo, Cole Lagman	t	\N
3321	Massimo	Cecconi	15066	1	mcecconi_25@esusdstudents.org	5	M	11	K213	Mendoza, Manuel	Cecconi, Massimo Luca	t	\N
3322	Jude	Chartier	18683	1	jchartier_25@esusdstudents.org	5	M	11	K215	McDorman, Teresa	Chartier, Jude Sebstian	t	\N
3323	Sophia	Chasez	18641	1	schasez_25@esusdstudents.org	5	F	11	E105	Eastman, John James	Chasez, Sophia Madeleine	t	\N
3324	Joseph	Chavez	19108	1	jchavez_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Chavez, Joseph Nicholas	t	\N
3325	Evan	Chen	15403	1	echen_25@esusdstudents.org	5	M	11	B101	Richmond, Ashley	Chen, Evan Lee	t	\N
3326	Ellie	Chester	21714	1	echester_25@esusdstudents.org	5	F	11	K213	Mendoza, Manuel	Chester, Ellie Anne	t	\N
3327	Lilia	Cheung	21231	1	lcheung_25@esusdstudents.org	5	F	11	A204	Tacsik, Kyle	Cheung, Lilia Wing-Yee	t	\N
3328	Oliver	Childs	18703	1	ochilds_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Childs, Oliver	t	\N
3329	Nyla	Cho	21240	1	ncho_25@esusdstudents.org	5	F	11	A208	Munger, Judith Ann	Cho, Nyla Pearl	t	\N
3331	Kyra	Clark	19421	1	kclark_25@esusdstudents.org	5	F	11	K202	Barajas, Gerardo	Clark, Kyra Payton	t	\N
3332	Tyler	Cohen	20803	1	tcohen_25@esusdstudents.org	5	M	11	A206	Nichols, Nathan	Cohen, Tyler Bennet	t	\N
3333	Cassia	Cole	15866	1	ccole_25@esusdstudents.org	5	F	11	R100	Maisonet, Tiffany	Cole, Cassia Helene	t	\N
3334	Jake	Collins	21228	1	jcollins_25@esusdstudents.org	5	M	11	E102	Maye, Bonnie Michelle	Collins, Jake Owen	t	\N
3335	Ashton	Cote'	21196	1	acote_25@esusdstudents.org	5	M	11	K207	Horvath, Daniel	Cote', Ashton Brody Nicholas	t	\N
3336	Jake	Croxall	15214	1	jcroxall_25@esusdstudents.org	5	M	11	E105	Eastman, John James	Croxall, Jake Robert	t	\N
3337	Jack	Cuzzocrea	19725	1	jcuzzocrea_25@esusdstudents.org	5	M	11	K215	McDorman, Teresa	Cuzzocrea, Jack Deland	t	\N
3338	Thomas	Cuzzocrea	19723	1	tcuzzocrea_25@esusdstudents.org	5	M	11	B101	Richmond, Ashley	Cuzzocrea, Thomas Diego	t	\N
3339	Samrawi	Daniel	21494	1	sdaniel_25@esusdstudents.org	5	M	11	R202	Traber, William Jr.	Daniel, Samrawi	t	\N
3340	Chase	Davidson	16769	1	cdavidson_25@esusdstudents.org	5	M	11	E105	Eastman, John James	Davidson, Chase Robert	t	\N
3341	Mitchell	Dawes	15893	1	mdawes_25@esusdstudents.org	5	M	11	E105	Eastman, John James	Dawes, Mitchell Burr	t	\N
3342	Aaron	De Kretser	15070	1	adekretser_25@esusdstudents.org	5	M	11	R100	Maisonet, Tiffany	De Kretser, Aaron Christopher	t	\N
3343	Rhea	DeBlanc	15894	1	tdeblanc_25@esusdstudents.org	5	F	11	K205	Glotz, Darin	DeBlanc, Rhea	t	\N
3345	Mariah	Delgado	21205	1	mdelgado_25@esusdstudents.org	5	F	11	K207	Horvath, Daniel	Delgado, Mariah Desiree	t	\N
3346	Nia	Desai	19547	1	ndesai_25@esusdstudents.org	5	F	11	A202	Gerber, Rachael Marci	Desai, Nia Niraj	t	\N
3347	Elena	DiCerbo	15989	1	edicerbo_25@esusdstudents.org	5	F	11	K101	Pagnucco, Pete V	DiCerbo, Elena Grace	t	\N
3348	Zoe	Domyan	19526	1	zdomyan_25@esusdstudents.org	5	F	11	A208	Munger, Judith Ann	Domyan, Zoe Bella	t	\N
3349	Kendall	Donahue	19544	1	kdonahue_25@esusdstudents.org	5	F	11	A210	Doering, Mark Edward	Donahue, Kendall Ivy	t	\N
3350	Vitor	Dorn	22829	1	vdorn_25@esusdstudents.org	5	M	11	A206	Nichols, Nathan	Dorn, Vitor Nobell	t	\N
3351	Jackson	Doukakis	14522	1	jdoukakis_25@esusdstudents.org	5	M	11	K213	Mendoza, Manuel	Doukakis, Jackson Robert	t	\N
3352	Kaitlyn	Duarte	21220	1	kduarte_25@esusdstudents.org	5	F	11	K215	McDorman, Teresa	Duarte, Kaitlyn Roxana	t	\N
3353	Anabella	Dunlop	22393	1	adunlop_25@esusdstudents.org	5	M	11	K217	Turner, Lauren Alissa	Dunlop, Anabella Dawn Elaine	t	\N
3354	Avery	Edelstein	15822	1	aedelstein_25@esusdstudents.org	5	F	11	B101	Richmond, Ashley	Edelstein, Avery Eve	t	\N
3355	Kacey	Ekstrom	15075	1	kekstrom_25@esusdstudents.org	5	F	11	K202	Barajas, Gerardo	Ekstrom, Kacey Leann	t	\N
3356	Liam	Endo	14918	1	lendo_25@esusdstudents.org	5	M	11	R100	Maisonet, Tiffany	Endo, Liam Gunji	t	\N
3357	William	Enenstein	19560	1	wenenstein_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Enenstein, William Morgan	t	\N
3358	Elleni	Esayas	21325	1	eesayas_25@esusdstudents.org	5	F	11	R100	Maisonet, Tiffany	Esayas, Elleni	t	\N
3359	Nader	Esdin	18063	1	nesdin_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Esdin, Nader	t	\N
3361	Bowen	Everitt	21217	1	beveritt_25@esusdstudents.org	5	M	11	R202	Traber, William Jr.	Everitt, Bowen Thomas	t	\N
3362	Julian	Fajardo	15078	1	jfajardo_25@esusdstudents.org	5	M	11	A206	Nichols, Nathan	Fajardo, Julian Christopher	t	\N
3363	Erik	Fallon	15896	1	efallon_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Fallon, Erik Michael	t	\N
3364	Amal	Farah	22285	1	afarah_25@esusdstudents.org	5	F	11	K101	Pagnucco, Pete V	Farah, Amal	t	\N
3365	Grace	Farris	21225	1	gfarris_25@esusdstudents.org	5	F	11	A204	Tacsik, Kyle	Farris, Grace Anne Taka	t	\N
3366	Venus	Felix	21282	1	vfelix_25@esusdstudents.org	5	F	11	B101	Richmond, Ashley	Felix, Venus Iriza	t	\N
3369	Sutton	Fisk	17446	1	sfisk_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Fisk, Sutton Stanleigh	t	\N
3370	Liam	Fitzgerald	14437	1	lfitzgerald_25@esusdstudents.org	5	M	11	K215	McDorman, Teresa	Fitzgerald, Liam	t	\N
3371	Paulina	Flores	19520	1	pflores_25@esusdstudents.org	5	F	11	K205	Glotz, Darin	Flores, Paulina	t	\N
3372	Daisy	Flynn	15216	1	dflynn_25@esusdstudents.org	5	F	11	R201	Turner, Jahid	Flynn, Daisy May	t	\N
3367	Addison	Finney	15995	1	afinney_25@esusdstudents.org	5	F	11	K202	Barajas, Gerardo	Finney, Addison Nicole	t	\N
6332	Isabella	Ceja	57981	4	i.ceja981@cvuhsd.org	15	F	9	M-110	Segovia, Jose M	Ceja, Isabella	f	\N
6333	Lorena	Cerda-Smith	58915	4	l.cerdasmith915@cvuhsd.org	15	F	9	M-213	Morin, Jasmine	Cerda-Smith, Lorena Jules	f	\N
3374	Samuel	Forthuber	18706	1	sforthuber_25@esusdstudents.org	5	M	11	R100	Maisonet, Tiffany	Forthuber, Samuel	t	\N
3375	Colin	Frank	15832	1	cfrank_25@esusdstudents.org	5	M	11	K213	Mendoza, Manuel	Frank, Colin Peter	t	\N
3376	Tyler	Frawley	21223	1	tfrawley_25@esusdstudents.org	5	M	11	E105	Eastman, John James	Frawley, Tyler James	t	\N
3377	Felix	Fuchs	15287	1	ffuchs_25@esusdstudents.org	5	M	11	A208	Munger, Judith Ann	Fuchs, Felix Sven	t	\N
3378	Nikki	Furukawa	15962	1	nfurukawa_25@esusdstudents.org	5	F	11	A208	Munger, Judith Ann	Furukawa, Nikki Lin	t	\N
3379	Alaina	Gafni	21226	1	agafni_25@esusdstudents.org	5	F	11	E105	Eastman, John James	Gafni, Alaina Brynn	t	\N
3380	Ellen	Gagliardi	14402	1	egagliardi_25@esusdstudents.org	5	F	11	C100	Kadonaga, Theresa M	Gagliardi, Ellen Josephine	t	\N
3381	Sung-Hee	Gales	19109	1	sgales_25@esusdstudents.org	5	F	11	A203	Whalen IV, James	Gales, Sung-Hee Kim	t	\N
3382	Jacob	Galindo	16781	1	jgalindo_25@esusdstudents.org	5	M	11	C100	Kadonaga, Theresa M	Galindo, Jacob Nicolas	t	\N
3383	Pierce	Gardner	15986	1	pgardner_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Gardner, Pierce Robert	t	\N
3385	Abigail	Getnet	21227	1	agetnet_25@esusdstudents.org	5	F	11	K101	Pagnucco, Pete V	Getnet, Abigail Teshager	t	\N
3386	Clarke	Gettinger	19509	1	cgettinger_25@esusdstudents.org	5	F	11	K101	Pagnucco, Pete V	Gettinger, Clarke Rose	t	\N
3387	Diya	Gilani	19493	1	dgilani_25@esusdstudents.org	5	F	11	E105	Eastman, John James	Gilani, Diya Amin	t	\N
3388	Maureen	Glastetter	15897	1	mglastetter_25@esusdstudents.org	5	F	11	K205	Glotz, Darin	Glastetter, Maureen Renee	t	\N
3389	Ruben	Gomez	21204	1	rgomez_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Gomez, Ruben Anthony	t	\N
3390	Rocco	Goncher	15218	1	rgoncher_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Goncher, Rocco Edward	t	\N
3391	Bryana	Gonzalez	19110	1	bgonzalez_25@esusdstudents.org	5	F	11	K205	Glotz, Darin	Gonzalez, Bryana Giselle	t	\N
3392	Mary	Gonzalez	15334	1	mgonzalez_25@esusdstudents.org	5	F	11	A206	Nichols, Nathan	Gonzalez, Mary Helen	t	\N
3396	Jay	Grant	15899	1	jgrant_25@esusdstudents.org	5	F	11	A206	Nichols, Nathan	Grant, Jay V	t	\N
3397	Margaret	Green	15900	1	mgreen_25@esusdstudents.org	5	F	11	B101	Richmond, Ashley	Green, Margaret Anne	t	\N
3398	Annabel	Gross	19290	1	agross_25@esusdstudents.org	5	F	11	R201	Turner, Jahid	Gross, Annabel Catherine	t	\N
3400	Martin	Guerrero	21311	1	mguerrero_25@esusdstudents.org	5	M	11	A206	Nichols, Nathan	Guerrero, Martin	t	\N
3401	Finn	Gust	21289	1	fgust_25@esusdstudents.org	5	M	11	R200	Davlantis, Foti J	Gust, Finn Darby Razo	t	\N
3403	Evelyn	Hale	14921	1	ehale_25@esusdstudents.org	5	F	11	A206	Nichols, Nathan	Hale, Evelyn Ellen	t	\N
3404	Alyssa	Harris	15902	1	aharris_25@esusdstudents.org	5	F	11	A202	Gerber, Rachael Marci	Harris, Alyssa Lane	t	\N
3405	Jack	Harris	19111	1	jharris_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Harris, Jack Victor	t	\N
3406	Maren	Henry	17874	1	mhenry_25@esusdstudents.org	5	F	11	B101	Richmond, Ashley	Henry, Maren Cate	t	\N
3407	Sophie	Henson	14434	1	shenson_25@esusdstudents.org	5	F	11	B201	Reese, Julie Ann	Henson, Sophie Ava	t	\N
3408	Alexi	Heredia	21585	1	aheredia_25@esusdstudents.org	5	F	11	North Gym	Smith, Rainy	Heredia, Alexi Valencia	t	\N
3409	Camila	Hernandez Acevedo	21222	1	chernandezacevedo_25@esusdstudents.org	5	F	11	K205	Glotz, Darin	Hernandez Acevedo, Camila Isabel	t	\N
3410	Samantha	Herrera	20970	1	sherrera_25@esusdstudents.org	5	F	11	A206	Nichols, Nathan	Herrera, Samantha	t	\N
3411	Isabella	Hoadrea	21292	1	ihoadrea_25@esusdstudents.org	5	F	11	R100	Maisonet, Tiffany	Hoadrea, Isabella Marie	t	\N
3412	Lucas	Hoffmann	22228	1	lhoffmann_25@esusdstudents.org	5	M	11	E102	Maye, Bonnie Michelle	Hoffmann, Lucas Jiaming	t	\N
3413	Mimi	Holmes	16100	1	mholmes_25@esusdstudents.org	5	F	11	K205	Glotz, Darin	Holmes, Mimi Olivia	t	\N
3414	Ray	Honda	15291	1	rhonda_25@esusdstudents.org	5	M	11	A208	Munger, Judith Ann	Honda, Ray	t	\N
3416	Lucas	Hubbard	21302	1	lhubbard_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Hubbard, Lucas T	t	\N
3417	Angelina	Hume	16782	1	ahume_25@esusdstudents.org	5	F	11	A208	Munger, Judith Ann	Hume, Angelina Grace	t	\N
3418	Riley	Hurley	15827	1	rhurley_25@esusdstudents.org	5	F	11	A204	Tacsik, Kyle	Hurley, Riley Ann	t	\N
3419	Victor	Ihezuoh	21283	1	vihezuoh_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Ihezuoh, Victor Tochukwu	t	\N
3420	Emily	Infantino	15904	1	einfantino_25@esusdstudents.org	5	F	11	R201	Turner, Jahid	Infantino, Emily Alyssa	t	\N
3421	Tigran	Ispiryan	21710	1	tispiryan_25@esusdstudents.org	5	M	11	R202	Traber, William Jr.	Ispiryan, Tigran	t	\N
3422	Rocston	Issock	21589	1	rissock_25@esusdstudents.org	5	M	11	A206	Nichols, Nathan	Issock, Rocston Jean-Paul	t	\N
3423	Shelby	Jackson	19496	1	sjackson_25@esusdstudents.org	5	F	11	R100	Maisonet, Tiffany	Jackson, Shelby Brynn	t	\N
3424	Arianna	James	21238	1	ajames_25@esusdstudents.org	5	F	11	A204	Tacsik, Kyle	James, Arianna Inez	t	\N
3425	Jonah	Jamner	14512	1	jjamner_25@esusdstudents.org	5	M	11	R201	Turner, Jahid	Jamner, Jonah Samuel	t	\N
3426	Ricky	Jones	19112	1	rjones_25@esusdstudents.org	5	M	11	K202	Barajas, Gerardo	Jones, Ricky Lamar	t	\N
3394	Wesley	Gordon	19727	1	wgordon_25@esusdstudents.org	5	M	11	A203	Whalen IV, James	Gordon, Wesley Jacob	t	\N
3399	Fedra	Guerrero	22361	1	fguerrero_25@esusdstudents.org	5	F	11	B201	Reese, Julie Ann	Guerrero, Fedra Teresita	t	\N
6334	Aden	Chavez	59143	4	a.chavez143@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Chavez, Aden James	f	\N
3429	Jason	Juarez	21582	1	jjuarez_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Juarez, Jason Isileli-Niualiku	t	\N
3430	Lassana	Keita	18198	1	lkeita_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Keita, Lassana Baker	t	\N
3431	Dylan	Kelly	15089	1	dkelly_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Kelly, Dylan Andrew	t	\N
3432	Finn	Ketola	19499	1	fketola2_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Ketola, Finn Taft	t	\N
3433	Yumna	Khan	17023	1	ykhan_25@esusdstudents.org	5	F	11	A210	Doering, Mark Edward	Khan, Yumna	t	\N
3434	Lana	Kinkaid	18843	1	lkinkaid_25@esusdstudents.org	5	F	11	B202	Adams, Nicole	Kinkaid, Lana	t	\N
3435	Samantha	Kinnison Smith	15090	1	skinnisonsmith_25@esusdstudents.org	5	F	11	K215	McDorman, Teresa	Kinnison Smith, Samantha Lynn	t	\N
3436	George	Kobzina	15906	1	gkobzina_25@esusdstudents.org	5	M	11	K213	Mendoza, Manuel	Kobzina, George Raymond	t	\N
3437	Arrow	Koester	19521	1	ekoester_25@esusdstudents.org	5	F	11	B205	Nieto Viteri, Grace	Koester, Arrow Laurraine	t	\N
3438	Kelly	Kramer	15220	1	kkramer_25@esusdstudents.org	5	F	11	R201	Turner, Jahid	Kramer, Kelly Ann	t	\N
3439	Evin	Krilko	19500	1	ekrilko_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Krilko, Evin Quinn	t	\N
3441	Richard	Lambert	15835	1	rlambert_25@esusdstudents.org	5	M	11	K202	Barajas, Gerardo	Lambert, Richard Daniel	t	\N
3442	Cameron	Lane	16004	1	clane_25@esusdstudents.org	5	F	11	R100	Maisonet, Tiffany	Lane, Cameron Rose	t	\N
3443	S'Naii	Lapierre	22286	1	slapierre_25@esusdstudents.org	5	F	11	R201	Turner, Jahid	Lapierre, S'Naii Elena	t	\N
3444	Fynn	Lavelle	15908	1	flavelle_25@esusdstudents.org	5	M	11	R202	Traber, William Jr.	Lavelle, Fynn Leo	t	\N
3445	Madison	Lawrence	19501	1	mlawrence_25@esusdstudents.org	5	F	11	K205	Glotz, Darin	Lawrence, Madison Elyse	t	\N
3446	Stefan	Lazarevic	15479	1	slazarevic_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Lazarevic, Stefan	t	\N
3447	Riley	Leatherman	16007	1	rleatherman_25@esusdstudents.org	5	F	11	E105	Eastman, John James	Leatherman, Riley Nicole	t	\N
3448	Benjamin	Lee	15838	1	blee_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Lee, Benjamin Pierce	t	\N
3449	Parker	Levin	16012	1	plevin_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Levin, Parker Scott	t	\N
3450	Tianxi	Li	22934	1	tli_25@esusdstudents.org	5	M	11	South Gym	March, David	Li, Tianxi	t	\N
3451	Jacynda	Lindsay	15841	1	jlindsay_25@esusdstudents.org	5	F	11	A208	Munger, Judith Ann	Lindsay, Jacynda Marianne	t	\N
3453	Christopher	Lopez-Solano	18223	1	clopez-solano_25@esusdstudents.org	5	M	11	K207	Horvath, Daniel	Lopez-Solano, Christopher Agustin	t	\N
3454	Isaac	Loss	22056	1	iloss_25@esusdstudents.org	5	F	11	C100	Kadonaga, Theresa M	Loss, Isaac Christine	t	\N
3455	Emmitt	Lozano	15093	1	elozano_25@esusdstudents.org	5	M	11	E105	Eastman, John James	Lozano, Emmitt Diego	t	\N
3457	Grady	Lubs	15094	1	glubs_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Lubs, Grady Stephen	t	\N
3458	Xaila	Luna	15881	1	xluna_25@esusdstudents.org	5	F	11	R200	Davlantis, Foti J	Luna, Xaila	t	\N
3459	Chloe	Lund	15993	1	clund_25@esusdstudents.org	5	F	11	B202	Adams, Nicole	Lund, Chloe Nari	t	\N
3460	Ella	Lynch	17490	1	elynch_25@esusdstudents.org	5	F	11	B101	Richmond, Ashley	Lynch, Ella Sue	t	\N
3461	Joseph	Lynch	15292	1	jlynch_25@esusdstudents.org	5	M	11	K202	Barajas, Gerardo	Lynch, Joseph Shea	t	\N
3462	Kohana Maile	Maguadog	20524	1	kmaguadog_25@esusdstudents.org	5	F	11	E101	DeLong, Megan	Maguadog, Kohana Maile Lizama	t	\N
3463	Sophia	Mahmoud	15921	1	smahmoud_25@esusdstudents.org	5	F	11	K207	Horvath, Daniel	Mahmoud, Sophia	t	\N
3464	Richard	Martocci	15847	1	rmartocci_25@esusdstudents.org	5	M	11	R201	Turner, Jahid	Martocci, Richard Giovanni	t	\N
3465	Evan	Mata	18802	1	emata_25@esusdstudents.org	5	M	11	K207	Horvath, Daniel	Mata, Evan Ignacio	t	\N
3466	Brianna	Matulich	15927	1	bmatulich_25@esusdstudents.org	5	F	11	A208	Munger, Judith Ann	Matulich, Brianna Jane	t	\N
3467	Sienna	Mayer	15928	1	smayer_25@esusdstudents.org	5	F	11	K202	Barajas, Gerardo	Mayer, Sienna Rose	t	\N
3469	Finley	McAndrews	15848	1	fmcandrews_25@esusdstudents.org	5	F	11	A204	Tacsik, Kyle	McAndrews, Finley Grace	t	\N
3470	Natalie	McAndrews	15931	1	nmcandrews_25@esusdstudents.org	5	F	11	R100	Maisonet, Tiffany	McAndrews, Natalie Reese	t	\N
3471	Tess	McAndrews	15932	1	tmcandrews_25@esusdstudents.org	5	F	11	K101	Pagnucco, Pete V	McAndrews, Tess Irelyn	t	\N
3472	Olivia	McPherson	18749	1	omcpherson_25@esusdstudents.org	5	F	11	R100	Maisonet, Tiffany	McPherson, Olivia	t	\N
3473	Romi	McPherson	17728	1	rmcpherson_25@esusdstudents.org	5	F	11	K202	Barajas, Gerardo	McPherson, Romi	t	\N
3474	Geordie	Mendez	21515	1	gmendez_25@esusdstudents.org	5	M	11	R202	Traber, William Jr.	Mendez, Geordie Efrain	t	\N
3475	Isabel	Merica-Jones	21224	1	imerica-jones_25@esusdstudents.org	5	F	11	K101	Pagnucco, Pete V	Merica-Jones, Isabel Madeline	t	\N
3476	Celia	Meza	19114	1	cmeza_25@esusdstudents.org	5	F	11	K101	Pagnucco, Pete V	Meza, Celia	t	\N
3478	Daniel	Mikula	16783	1	dmikula_25@esusdstudents.org	5	M	11	A208	Munger, Judith Ann	Mikula, Daniel Ronald	t	\N
3479	Everett	Mitchell	22863	1	emitchell_25@esusdstudents.org	5	M	11	B104	Gaxiola, Gabriela	Mitchell, Everett Antoine	t	\N
3480	Nina	Mobus	21295	1	nmobus_25@esusdstudents.org	5	F	11	K101	Pagnucco, Pete V	Mobus, Nina	t	\N
3481	Olivia	Monera	20539	1	omonera_25@esusdstudents.org	5	F	11	K215	McDorman, Teresa	Monera, Olivia Reese	t	\N
3477	Elise	Meza	21308	1	emeza_25@esusdstudents.org	5	F	11	A208	Munger, Judith Ann	Meza, Elise Sarah	t	\N
6335	Jose	Chavez	58555	4	j.chavez555@cvuhsd.org	15	M	9	M-213	Traylor, Dean S.	Chavez, Jose Luis	f	\N
3530	Josephine	Rivera	21498	1	jrivera_25@esusdstudents.org	5	F	11	A206	Nichols, Nathan	Rivera, Josephine Renee	t	\N
3531	Oscar	Rivera	16041	1	orivera_25@esusdstudents.org	5	M	11	K211	Perren, Nicole Marie	Rivera, Oscar	t	\N
3532	Porter	Robbins	15952	1	probbins_25@esusdstudents.org	5	M	11	A206	Nichols, Nathan	Robbins, Porter Mason	t	\N
3533	Christopher	Robledo	15267	1	crobledo_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Robledo, Christopher	t	\N
3534	Jacob	Rodriguez	19522	1	jrodriguez_25@esusdstudents.org	5	M	11	K215	McDorman, Teresa	Rodriguez, Jacob	t	\N
3535	Victoria	Rodriguez	21294	1	vrodriguez_25@esusdstudents.org	5	F	11	A202	Gerber, Rachael Marci	Rodriguez, Victoria Harper	t	\N
3507	Brendon	Pate	15919	1	bpate_25@esusdstudents.org	5	M	11	A206	Nichols, Nathan	Pate, Brendon Mitchell	t	\N
3492	Makenna	Neumann	15939	1	mneumann_25@esusdstudents.org	5	F	11	K202	Barajas, Gerardo	Neumann, Makenna Elizabeth	t	\N
3493	Aaron	Newman	15940	1	anewman_25@esusdstudents.org	5	M	11	K202	Barajas, Gerardo	Newman, Aaron James	t	\N
3494	Jake	Nguyen	21604	1	jnguyen2_25@esusdstudents.org	5	M	11	K101	Pagnucco, Pete V	Nguyen, Jake Shores	t	\N
3496	Lauren	Nguyen	15991	1	lnguyen_25@esusdstudents.org	5	F	11	A202	Gerber, Rachael Marci	Nguyen, Lauren Simone	t	\N
3497	Shane	Nguyen	21603	1	snguyen_25@esusdstudents.org	5	M	11	B202	Adams, Nicole	Nguyen, Shane Shores	t	\N
3498	Evan	Nichols	21237	1	enichols_25@esusdstudents.org	5	M	11	K215	McDorman, Teresa	Nichols, Evan Kirk	t	\N
3499	Jacob	Noda	21767	1	jnoda_25@esusdstudents.org	5	M	11	B202	Adams, Nicole	Noda, Jacob Nobuhito	t	\N
3500	Dewey	Northington IV	15296	1	dnorthingtoniv_25@esusdstudents.org	5	M	11	E105	Eastman, John James	Northington IV, Dewey Jackson	t	\N
3501	Julian	Nunez	21309	1	jnunez_25@esusdstudents.org	5	M	11	R100	Maisonet, Tiffany	Nunez, Julian Emiliano	t	\N
3502	Erik	Olmos	20974	1	eolmos_25@esusdstudents.org	5	M	11	B202	Adams, Nicole	Olmos, Erik Bernardo	t	\N
3503	Ashley	Ortiz	22894	1	aortiz_25@esusdstudents.org	5	F	11	B203	O'Keefe, Amy Ann	Ortiz, Ashley	t	\N
3504	Eileen	Osby	21208	1	eosby_25@esusdstudents.org	5	F	11	K205	Glotz, Darin	Osby, Eileen Veeanna	t	\N
3505	Charli	Pages	15942	1	cpages_25@esusdstudents.org	5	F	11	K205	Glotz, Darin	Pages, Charli Nicole	t	\N
3506	Nicolas	Parisi	15944	1	nparisi_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Parisi, Nicolas Joseph	t	\N
3509	Samantha	Patterson	15854	1	spatterson_25@esusdstudents.org	5	F	11	K101	Pagnucco, Pete V	Patterson, Samantha	t	\N
3510	Zachary	Patterson	16107	1	zpatterson_25@esusdstudents.org	5	M	11	K202	Barajas, Gerardo	Patterson, Zachary	t	\N
3511	Hailey	Perez	15947	1	hperez_25@esusdstudents.org	5	F	11	K205	Glotz, Darin	Perez, Hailey Ava	t	\N
3482	Hayden	Moore	15918	1	hmoore_25@esusdstudents.org	5	M	11	A208	Munger, Judith Ann	Moore, Hayden Graham	t	\N
3483	Valeria	Mora	21497	1	vmora_25@esusdstudents.org	5	F	11	K205	Glotz, Darin	Mora, Valeria	t	\N
3512	Cali	Peterson	21278	1	cpeterson_25@esusdstudents.org	5	F	11	E105	Eastman, John James	Peterson, Cali Milliana	t	\N
3513	Ioane	Petit	22330	1	ipetit_25@esusdstudents.org	5	M	11	K217	Turner, Lauren Alissa	Petit, Ioane Isai Joshua	t	\N
3514	Drey	Phillips	22190	1	dphillips_25@esusdstudents.org	5	F	11	C100	Kadonaga, Theresa M	Phillips, Drey Celia	t	\N
3484	Christopher	Morales	21239	1	cmorales_25@esusdstudents.org	5	M	11	B203	O'Keefe, Amy Ann	Morales, Christopher Martin	t	\N
3485	Nathan	Morales	15930	1	nmorales_25@esusdstudents.org	5	M	11	B205	Nieto Viteri, Grace	Morales, Nathan Micah	t	\N
3515	Dylan	Pilkvist	15776	1	dpilkvist_25@esusdstudents.org	5	M	11	B202	Adams, Nicole	Pilkvist, Dylan Brooks	t	\N
3486	Sage	Morton	21788	1	smorton_25@esusdstudents.org	5	F	11	E105	Eastman, John James	Morton, Sage Marie	t	\N
3517	Marissa	Pinero	21200	1	mpinero_25@esusdstudents.org	5	F	11	R100	Maisonet, Tiffany	Pinero, Marissa Marie	t	\N
3487	Sean	Mossman	14945	1	smossman_25@esusdstudents.org	5	M	11	E105	Eastman, John James	Mossman, Sean William	t	\N
3488	Shane	Mossman	14518	1	smossman2_25@esusdstudents.org	5	M	11	R201	Turner, Jahid	Mossman, Shane Steven	t	\N
3489	Alexia	Munoz	21299	1	amunoz_25@esusdstudents.org	5	F	11			Munoz, Alexia Celeste	t	\N
3490	Danielle	Murphy	17491	1	dmurphy_25@esusdstudents.org	5	F	11	A210	Doering, Mark Edward	Murphy, Danielle Rene	t	\N
3491	Darreson	Naruse	18216	1	dnaruse_25@esusdstudents.org	5	M	11	R101	Hansen, Bjorn	Naruse, Darreson Takehiro	t	\N
3518	Christopher	Porter	15364	1	cporter_25@esusdstudents.org	5	M	11	R200	Davlantis, Foti J	Porter, Christopher Xavier	t	\N
3519	Sydney	Porter	21281	1	sporter_25@esusdstudents.org	5	F	11	A206	Nichols, Nathan	Porter, Sydney Nicole	t	\N
3521	London	Quincy	15949	1	lquincy_25@esusdstudents.org	5	F	11	A208	Munger, Judith Ann	Quincy, London	t	\N
3522	Jake	Quintana	21297	1	jquintana_25@esusdstudents.org	5	M	11	B101	Richmond, Ashley	Quintana, Jake Ethan	t	\N
3523	Alexandra	Rahmel	15312	1	arahmel_25@esusdstudents.org	5	F	11	R100	Maisonet, Tiffany	Rahmel, Alexandra Thelma Sophia	t	\N
3524	Jazlene	Ramos	21307	1	jramos_25@esusdstudents.org	5	F	11	K100	Jeon, Paul	Ramos, Jazlene	t	\N
3525	Xavier	Ramos	18283	1	xramos_25@esusdstudents.org	5	M	11	R200	Davlantis, Foti J	Ramos, Xavier Jordan	t	\N
3527	Isabella	Recalde	19502	1	irecalde_25@esusdstudents.org	5	F	11	A202	Gerber, Rachael Marci	Recalde, Isabella Lucia	t	\N
3528	Owen	Reed	14439	1	oreed_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Reed, Owen	t	\N
3520	Ross	Puffer	15948	1	rpuffer_25@esusdstudents.org	5	M	11	E100	Kadlec, Tamara	Puffer, Ross James	t	\N
6336	Enrique	Chilel Guerra	58889	4	e.chilelguerra889@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	Chilel Guerra, Enrique	f	\N
3537	Jaedin	Rosario	21729	1	jrosario_25@esusdstudents.org	5	M	11	K217	Turner, Lauren Alissa	Rosario, Jaedin Anthony	t	\N
3539	Jake	Ruiz	19866	1	jruiz_25@esusdstudents.org	5	M	11	R201	Turner, Jahid	Ruiz, Jake Robert	t	\N
3540	Antonio	Ruvalcaba Acosta	21588	1	aruvalcabaacost_25@esusdstudents.org	5	M	11	A203	Whalen IV, James	Ruvalcaba Acosta, Antonio	t	\N
3541	Jack	Sabosky	15863	1	jsabosky_25@esusdstudents.org	5	M	11	K202	Barajas, Gerardo	Sabosky, Jack Matthew	t	\N
3542	Raymond	Sakaguchi	21699	1	rsakaguchi_25@esusdstudents.org	5	M	11	R100	Maisonet, Tiffany	Sakaguchi, Raymond Yui	t	\N
3543	Ashley	Sanchez	21650	1	asanchez_25@esusdstudents.org	5	F	11	A202	Gerber, Rachael Marci	Sanchez, Ashley Nicole	t	\N
3544	Graycie	Sandoval	15980	1	gsandoval_25@esusdstudents.org	5	F	11	R200	Davlantis, Foti J	Sandoval, Graycie Rose	t	\N
3545	Michelle	Sandoval	21529	1	msandoval_25@esusdstudents.org	5	F	11	K101	Pagnucco, Pete V	Sandoval, Michelle	t	\N
3546	Gabriel	Santiago	21677	1	gsantiago_25@esusdstudents.org	5	M	11	C100	Kadonaga, Theresa M	Santiago, Gabriel Hector	t	\N
3547	Sophia	Santos	14521	1	ssantos_25@esusdstudents.org	5	F	11	North Gym	Smith, Rainy	Santos, Sophia Elizabeth	t	\N
3548	Elizabeth	Sautter	19505	1	esautter_25@esusdstudents.org	5	F	11	B101	Richmond, Ashley	Sautter, Elizabeth Emily	t	\N
3549	Rebecca	Sautter	19504	1	rsautter_25@esusdstudents.org	5	F	11	B101	Richmond, Ashley	Sautter, Rebecca Natalie	t	\N
3550	Jocelyn	Savitt	21288	1	jsavitt_25@esusdstudents.org	5	F	11	R201	Turner, Jahid	Savitt, Jocelyn Blue	t	\N
3551	Matias	Scarda	19861	1	mscarda_25@esusdstudents.org	5	M	11	K217	Turner, Lauren Alissa	Scarda, Matias Alejandro	t	\N
3553	Clayton	Sennott	15870	1	csennott_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Sennott, Clayton	t	\N
3554	Cyrus	Shahabi	15922	1	cshahabi_25@esusdstudents.org	5	M	11	R100	Maisonet, Tiffany	Shahabi, Cyrus Kane	t	\N
3555	Avi	Sharma	19506	1	asharma_25@esusdstudents.org	5	M	11	B101	Richmond, Ashley	Sharma, Avi	t	\N
3556	Kennedy	Shelton	19271	1	kshelton_25@esusdstudents.org	5	F	11	B101	Richmond, Ashley	Shelton, Kennedy Ann	t	\N
3557	Blake	Sheridan	19507	1	bsheridan_25@esusdstudents.org	5	M	11	A210	Doering, Mark Edward	Sheridan, Blake Robert	t	\N
3558	Lindsey	Sherrill	16786	1	lsherrill_25@esusdstudents.org	5	F	11	E105	Eastman, John James	Sherrill, Lindsey Sharda	t	\N
3559	Sawyer	Shuster	15957	1	sshuster_25@esusdstudents.org	5	F	11	E105	Eastman, John James	Shuster, Sawyer Simone	t	\N
3560	Kimberly	Singh	19980	1	ksingh_25@esusdstudents.org	5	F	11	K205	Glotz, Darin	Singh, Kimberly Priety	t	\N
3561	Saraiyah	Slack	21132	1	sslack_25@esusdstudents.org	5	F	11	R201	Turner, Jahid	Slack, Saraiyah Imani Symphony	t	\N
3562	Cole	Smith	21198	1	csmith_25@esusdstudents.org	5	M	11	B203	O'Keefe, Amy Ann	Smith, Cole David	t	\N
3564	Hannah	Smith	21495	1	hsmith2_25@esusdstudents.org	5	F	11	A206	Nichols, Nathan	Smith, Hannah Anisa	t	\N
3565	Hannah	Smith	19525	1	hsmith_25@esusdstudents.org	5	F	11	A202	Gerber, Rachael Marci	Smith, Hannah Kristina	t	\N
3566	Troy	Smith	19992	1	tsmith_25@esusdstudents.org	5	M	11	R200	Davlantis, Foti J	Smith, Troy Emanuel	t	\N
3567	Michal	Sochur	19704	1	msochur_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Sochur, Michal Krzysztof	t	\N
3568	Ryan	Sowder	15118	1	rsowder_25@esusdstudents.org	5	M	11	R100	Maisonet, Tiffany	Sowder, Ryan Riley	t	\N
3569	Hendrik	Speer	19513	1	hspeer_25@esusdstudents.org	5	M	11	E100	Kadlec, Tamara	Speer, Hendrik Maximilian	t	\N
3570	Samantha	Stahl	15875	1	sstahl_25@esusdstudents.org	5	F	11	E105	Eastman, John James	Stahl, Samantha Drew	t	\N
3571	Blake	Steinbacher	19270	1	bsteinbacher_25@esusdstudents.org	5	M	11	C100	Kadonaga, Theresa M	Steinbacher, Blake James	t	\N
3572	Jayden	Stephens	18710	1	jstephens_25@esusdstudents.org	5	M	11	R200	Davlantis, Foti J	Stephens, Jayden	t	\N
3573	Becket	Sterba	15222	1	bsterba_25@esusdstudents.org	5	M	11	K101	Pagnucco, Pete V	Sterba, Becket Carson	t	\N
3574	Allie	Stevenson	15964	1	astevenson_25@esusdstudents.org	5	F	11	A203	Whalen IV, James	Stevenson, Allie Mei	t	\N
3575	Charlotte	Stewart	21509	1	cstewart_25@esusdstudents.org	5	F	11	A202	Gerber, Rachael Marci	Stewart, Charlotte Rae	t	\N
3576	Jack	Stewart	21510	1	jstewart_25@esusdstudents.org	5	M	11	B203	O'Keefe, Amy Ann	Stewart, Jack Marcus	t	\N
3577	Lillie	Stonecipher	14516	1	lstonecipher_25@esusdstudents.org	5	F	11	R100	Maisonet, Tiffany	Stonecipher, Lillie Akemi	t	\N
3578	Christoph	Strutz	19514	1	cstrutz_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Strutz, Christoph	t	\N
3580	Nicholas	Taja	22421	1	ntaja_25@esusdstudents.org	5	M	11	E105	Eastman, John James	Taja, Nicholas	t	\N
3581	Kayla	Tang	21620	1	ktang_25@esusdstudents.org	5	F	11	A208	Munger, Judith Ann	Tang, Kayla Grace	t	\N
3582	Malachi	Tank	15973	1	mtank_25@esusdstudents.org	5	M	11	E100	Kadlec, Tamara	Tank, Malachi Artyom	t	\N
3583	Alexandria	Taylor	15974	1	ataylor_25@esusdstudents.org	5	F	11	B101	Richmond, Ashley	Taylor, Alexandria Orean	t	\N
3584	Blaise	Taylor	21236	1	btaylor_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Taylor, Blaise Ronan	t	\N
3585	Chloe	Thiel	15976	1	cthiel_25@esusdstudents.org	5	F	11	A202	Gerber, Rachael Marci	Thiel, Chloe Rose	t	\N
3586	Dayon	Thomas	16771	1	dthomas_25@esusdstudents.org	5	M	11	K202	Barajas, Gerardo	Thomas, Dayon Lovell	t	\N
3587	John	Thomas	15455	1	jthomas_25@esusdstudents.org	5	M	11	A206	Nichols, Nathan	Thomas, John Brody	t	\N
3588	Zachary	Thompson	19543	1	zthompson_25@esusdstudents.org	5	M	11	K207	Horvath, Daniel	Thompson, Zachary Ramie	t	\N
3589	Anders	Tipton	15924	1	atipton_25@esusdstudents.org	5	M	11	C100	Kadonaga, Theresa M	Tipton, Anders Kilen	t	\N
6337	Emely	Cinto	59165	4	e.cinto165@cvuhsd.org	15	F	9	F-106	Givens, Kathy E.	Cinto, Emely Isabella	f	\N
3621	Tesnim	Adil	19358	1	tadil_24@esusdstudents.org	5	F	12	A201	Gast, Craig Joseph	Adil, Tesnim	t	\N
3622	Dylan	Alcala	14548	1	dalcala_24@esusdstudents.org	5	M	12	R202	Traber, William Jr.	Alcala, Dylan Blake	t	\N
3624	Alexa	Alvarez	16789	1	aalvarez_24@esusdstudents.org	5	F	12	A201	Gast, Craig Joseph	Alvarez, Alexa Skylar	t	\N
3625	Jonathan	Amosa Levy	20848	1	jamosalevy_24@esusdstudents.org	5	M	12	R202	Traber, William Jr.	Amosa Levy, Jonathan Enrique	t	\N
3626	James	Anderson	15792	1	janderson_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Anderson, James	t	\N
3627	Maiya	Anderson	20721	1	manderson_24@esusdstudents.org	5	F	12	C100	Kadonaga, Theresa M	Anderson, Maiya Danielle	t	\N
3628	Timothy	Anderson	15224	1	tanderson_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Anderson, Timothy Lee	t	\N
3629	Janessa	Angel	20812	1	jangel_24@esusdstudents.org	5	F	12	A201	Gast, Craig Joseph	Angel, Janessa Itzel	t	\N
3630	Kourosh	Ardestani	14712	1	kardestani_24@esusdstudents.org	5	M	12	K101	Pagnucco, Pete V	Ardestani, Kourosh	t	\N
3631	Emery	Arnold	15225	1	earnold_24@esusdstudents.org	5	F	12	K209	Bolanos, Marcos	Arnold, Emery Rose	t	\N
3632	Sophia	Arroyo	20514	1	sarroyo_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	Arroyo, Sophia Angelina	t	\N
3633	Hailey	Atteridge	13955	1	hatteridge_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	Atteridge, Hailey Marie	t	\N
3634	Adam	Aucella	14551	1	aaucella_24@esusdstudents.org	5	M	12	B202	Adams, Nicole	Aucella, Adam William	t	\N
3635	Aubrie	Ayers	18684	1	aayers_24@esusdstudents.org	5	F	12	K207	Horvath, Daniel	Ayers, Aubrie Janae	t	\N
3636	Joneer	Ayoub	20717	1	jayoub_24@esusdstudents.org	5	F	12	K209	Bolanos, Marcos	Ayoub, Joneer Mena	t	\N
3638	Jordan	Barash	15478	1	jbarash_24@esusdstudents.org	5	F	12	A201	Gast, Craig Joseph	Barash, Jordan Alyson	t	\N
3639	Sebastian	Barba	20700	1	sbarba_24@esusdstudents.org	5	M	12	E100	Kadlec, Tamara	Barba, Sebastian Alfonso	t	\N
3640	Nolan	Barnett	20732	1	nbarnett_24@esusdstudents.org	5	M	12	K215	McDorman, Teresa	Barnett, Nolan James	t	\N
3641	Benjamin	Barnhart	15406	1	bbarnhart_24@esusdstudents.org	5	M	12	K215	McDorman, Teresa	Barnhart, Benjamin Isei	t	\N
3642	Scarlett	Basile	20839	1	sbasile_24@esusdstudents.org	5	F	12	A201	Gast, Craig Joseph	Basile, Scarlett Grace	t	\N
3643	Molly	Beetner	15569	1	mbeetner_24@esusdstudents.org	5	F	12	K209	Bolanos, Marcos	Beetner, Molly Xiaomei	t	\N
3644	Payton	Bemis	14554	1	pbemis_24@esusdstudents.org	5	F	12	A201	Gast, Craig Joseph	Bemis, Payton Jewel	t	\N
3619	Jayden	Zenaye	19548	1	jzenaye_25@esusdstudents.org	5	M	11	K215	McDorman, Teresa	Zenaye, Jayden Ammanuel	t	\N
3618	Marley	Zask	15983	1	mzask_25@esusdstudents.org	5	F	11	K205	Glotz, Darin	Zask, Marley Amalia	t	\N
3617	Ryan	Zarneke	15878	1	rzarneke_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Zarneke, Ryan Edward	t	\N
3590	Sophie	Tobon	22381	1	stobon_25@esusdstudents.org	5	F	11	A202	Gerber, Rachael Marci	Tobon, Sophie Celin	t	\N
3591	Kayla	Tran	18712	1	ktran_25@esusdstudents.org	5	F	11	K101	Pagnucco, Pete V	Tran, Kayla	t	\N
3594	Caleb	Tsai	19115	1	ctsai_25@esusdstudents.org	5	M	11	B101	Richmond, Ashley	Tsai, Caleb	t	\N
3595	Milena	Vanek	15979	1	mvanek_25@esusdstudents.org	5	F	11	A210	Doering, Mark Edward	Vanek, Milena Grace	t	\N
3596	Victor	Vargas	19116	1	vvargas_25@esusdstudents.org	5	M	11	Counseling	Allen-Burns, Stephanie Marie	Vargas, Victor Daniel	t	\N
3593	Joie	Trotter	16081	1	jtrotter_25@esusdstudents.org	5	F	11	R200	Davlantis, Foti J	Trotter, Joie Elizabeth	t	\N
3597	Logan	Vasquez	15366	1	lvasquez_25@esusdstudents.org	5	M	11	E105	Eastman, John James	Vasquez, Logan Anthony	t	\N
3598	Elijah	Vela	21180	1	evela_25@esusdstudents.org	5	M	11	R200	Davlantis, Foti J	Vela, Elijah Lee	t	\N
3599	Michael	Voge	21296	1	mvoge_25@esusdstudents.org	5	M	11	E105	Eastman, John James	Voge, Michael Edward	t	\N
3600	Lily	Vye	15008	1	lvye_25@esusdstudents.org	5	F	11	R100	Maisonet, Tiffany	Vye, Lily Mae	t	\N
3601	Hudson	Waggoner	19512	1	hwaggoner_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Waggoner, Hudson James	t	\N
3602	Hayden	Walkinshaw	21286	1	hwalkinshaw_25@esusdstudents.org	5	M	11	E105	Eastman, John James	Walkinshaw, Hayden Douglas	t	\N
3603	Audrey	Ward	19124	1	award_25@esusdstudents.org	5	F	11	B101	Richmond, Ashley	Ward, Audrey Isabelle	t	\N
3604	Ruari	Watt	21235	1	rwatt_25@esusdstudents.org	5	F	11	K101	Pagnucco, Pete V	Watt, Ruari Marie	t	\N
3606	Mia	Wiacek	16772	1	mwiacek_25@esusdstudents.org	5	F	11	R202	Traber, William Jr.	Wiacek, Mia Isabella	t	\N
3607	Jayden	Williams	21737	1	jwilliams_25@esusdstudents.org	5	F	11	K205	Glotz, Darin	Williams, Jayden Marie	t	\N
3608	Carter	Williamson	19518	1	cwilliamson_25@esusdstudents.org	5	M	11	R201	Turner, Jahid	Williamson, Carter David	t	\N
3609	Daniel	Wong	21301	1	dwong_25@esusdstudents.org	5	M	11	B205	Nieto Viteri, Grace	Wong, Daniel Bryan	t	\N
3610	Conrad	Wood	21232	1	cwood_25@esusdstudents.org	5	M	11	K101	Pagnucco, Pete V	Wood, Conrad James	t	\N
3611	Leah	Worku	21234	1	lworku_25@esusdstudents.org	5	F	11	A208	Munger, Judith Ann	Worku, Leah Eden	t	\N
3612	Jonathan	Xu	20518	1	jxu_25@esusdstudents.org	5	M	11	E105	Eastman, John James	Xu, Jonathan Haixiang	t	\N
3613	Brett	Yada	15876	1	byada_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Yada, Brett Akira	t	\N
3614	Kent	Yada	15877	1	kyada_25@esusdstudents.org	5	M	11	R100	Maisonet, Tiffany	Yada, Kent Yoshio	t	\N
3615	Nanami	Yamashita	16817	1	nyamashita_25@esusdstudents.org	5	F	11	E105	Eastman, John James	Yamashita, Nanami	t	\N
3616	Jude	Yeber	19837	1	jyeber_25@esusdstudents.org	5	M	11	R200	Davlantis, Foti J	Yeber, Jude Tyler	t	\N
6338	Javon	Clark	58638	4	j.clark638@cvuhsd.org	15	M	9	G-101	Galt, Douglas S	Clark, Javon Bentley	f	\N
3646	Rhea	Bickerstaff	19396	1	rbickerstaff_24@esusdstudents.org	5	F	12	K101	Pagnucco, Pete V	Bickerstaff, Rhea Ophelia	t	\N
3647	Giorgio	Biondo	20726	1	gbiondo_24@esusdstudents.org	5	M	12	K101	Pagnucco, Pete V	Biondo, Giorgio Leone	t	\N
3648	Shane	Biscaya	22828	1	sbiscaya_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Biscaya, Shane Kai	t	\N
3649	Gabriel	Blanco	15771	1	gblanco_24@esusdstudents.org	5	M	12	A203	Whalen IV, James	Blanco, Gabriel Gamaliel	t	\N
3650	Charles	Bobo	17724	1	cbobo_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Bobo, Charles Gabriel	t	\N
3651	Mays	Borgmeyer	18956	1	mborgmeyer_24@esusdstudents.org	5	M	12	K215	McDorman, Teresa	Borgmeyer, Mays Robert De Jesus	t	\N
3652	Sofia Isabela	Breitenstein	21583	1	sbreitenstein_24@esusdstudents.org	5	F	12	A201	Gast, Craig Joseph	Breitenstein, Sofia Isabela Escudero	t	\N
3653	Jackson	Breneman	20693	1	jbreneman_24@esusdstudents.org	5	M	12	A204	Tacsik, Kyle	Breneman, Jackson River	t	\N
3654	Carson	Brooks	14440	1	cbrooks_24@esusdstudents.org	5	M	12	K213	Mendoza, Manuel	Brooks, Carson S	t	\N
3655	Jazel	Brown	15419	1	jbrown_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	Brown, Jazel Jamiese Victoria	t	\N
3656	Max	Brown	18723	1	mbrown_24@esusdstudents.org	5	M	12	K209	Bolanos, Marcos	Brown, Max Mason	t	\N
3658	Caedon	Buhr	20701	1	cbuhr_24@esusdstudents.org	5	M	12	A204	Tacsik, Kyle	Buhr, Caedon Conger	t	\N
3660	Madeline	Butler	20561	1	mbutler_24@esusdstudents.org	5	F	12	B202	Adams, Nicole	Butler, Madeline Rachel	t	\N
3661	Ava Marie	Caban	15414	1	acaban_24@esusdstudents.org	5	F	12	A203	Whalen IV, James	Caban, Ava Marie Opal	t	\N
3662	Abigail	Cabrera	18827	1	acabrera_24@esusdstudents.org	5	F	12	A204	Tacsik, Kyle	Cabrera, Abigail	t	\N
3663	Hailey	Cadmus	18152	1	hcadmus_24@esusdstudents.org	5	F	12	K215	McDorman, Teresa	Cadmus, Hailey Parker	t	\N
3664	Natalie	Canton	19836	1	ncanton_24@esusdstudents.org	5	F	12	K101	Pagnucco, Pete V	Canton, Natalie Liliana	t	\N
3665	Kai	Carpenter	15228	1	kcarpenter_24@esusdstudents.org	5	M	12	K209	Bolanos, Marcos	Carpenter, Kai David	t	\N
3666	Sophia	Carr	19379	1	scarr_24@esusdstudents.org	5	F	12	A103	Page, Jessica L.	Carr, Sophia Ava	t	\N
3667	Lily	Carrigan	18724	1	lcarrigan_24@esusdstudents.org	5	F	12	R200	Davlantis, Foti J	Carrigan, Lily Catherine	t	\N
3668	Chase	Chargin	17484	1	cchargin_24@esusdstudents.org	5	F	12	K215	McDorman, Teresa	Chargin, Chase Anabelle	t	\N
3659	Maxwell	Busse	18685	1	mbusse_24@esusdstudents.org	5	M	12	A204	Tacsik, Kyle	Busse, Maxwell Lemond	t	\N
3669	Yash	Chowdhury	15068	1	ychowdhury_24@esusdstudents.org	5	M	12	A204	Tacsik, Kyle	Chowdhury, Yash	t	\N
3671	Louis	Church	20736	1	lchurch_24@esusdstudents.org	5	M	12	B202	Adams, Nicole	Church, Louis Stanley	t	\N
3672	Tyler	Cipriano	19491	1	tcipriano_24@esusdstudents.org	5	M	12	South Gym	March, David	Cipriano, Tyler Salvatore	t	\N
3673	David	Coffey	22927	1		5	M	12	R201	Turner, Jahid	Coffey, David Lawrence-Luzerne	t	\N
3675	Alexander	Coles IV	18973	1	acoles_24@esusdstudents.org	5	M	12	E100	Kadlec, Tamara	Coles IV, Alexander Elijah	t	\N
3676	Hudson	Comer	20719	1	hcomer_24@esusdstudents.org	5	M	12	K100	Jeon, Paul	Comer, Hudson David	t	\N
3677	Timothy	Comer	20695	1	tcomer_24@esusdstudents.org	5	M	12	A203	Whalen IV, James	Comer, Timothy Maxwell	t	\N
3678	Luis	Conde	14800	1	lconde_24@esusdstudents.org	5	M	12	E100	Kadlec, Tamara	Conde, Luis Alejandro	t	\N
3679	Sophia	Cortez	18959	1	scortez_24@esusdstudents.org	5	F	12	K101	Pagnucco, Pete V	Cortez, Sophia Elise	t	\N
3680	Giuliana	Costa	20913	1	gcosta_24@esusdstudents.org	5	F	12	K209	Bolanos, Marcos	Costa, Giuliana Gavrielle	t	\N
3681	Chloe	Crabtree	15231	1	ccrabtree_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	Crabtree, Chloe Anna	t	\N
3682	Lucas	Crother-Collado	18970	1	lcrother-collado_24@esusdstudents.org	5	M	12	K100	Jeon, Paul	Crother-Collado, Lucas Helmut	t	\N
3683	Noah	Dagmawi	20810	1	ndagmawi_24@esusdstudents.org	5	M	12	K209	Bolanos, Marcos	Dagmawi, Noah T.	t	\N
3684	Harper	Dame	18953	1	hdame_24@esusdstudents.org	5	F	12	A204	Tacsik, Kyle	Dame, Harper Grace	t	\N
3686	Menkem	Daniel	18960	1	mdaniel_24@esusdstudents.org	5	F	12	R100	Maisonet, Tiffany	Daniel, Menkem M.	t	\N
3687	Sophia	Davila	15503	1	sdavila_24@esusdstudents.org	5	F	12	A203	Whalen IV, James	Davila, Sophia Anahi	t	\N
3688	Ashley	Davis	14714	1	adavis_24@esusdstudents.org	5	F	12	K209	Bolanos, Marcos	Davis, Ashley Kim	t	\N
3689	Tyler	Davis	18123	1	tdavis_24@esusdstudents.org	5	M	12	A204	Tacsik, Kyle	Davis, Tyler Jordan	t	\N
3690	Jack	Dawson	19001	1	jdawson_24@esusdstudents.org	5	M	12	K209	Bolanos, Marcos	Dawson, Jack Dray	t	\N
3691	William	DeBlanc	20718	1	wdeblanc_24@esusdstudents.org	5	M	12	A204	Tacsik, Kyle	DeBlanc, William Albert	t	\N
3692	Jacob	Delfino	15232	1	jdelfino_24@esusdstudents.org	5	M	12	K207	Horvath, Daniel	Delfino, Jacob Anthony	t	\N
3693	Vivianne	Diaz	18272	1	vdiaz_24@esusdstudents.org	5	F	12	R100	Maisonet, Tiffany	Diaz, Vivianne	t	\N
3694	Isabel	Dillon	15071	1	idillon_24@esusdstudents.org	5	F	12	E105	Eastman, John James	Dillon, Isabel Anai	t	\N
3695	Emma	Diver	15162	1	ediver_24@esusdstudents.org	5	F	12	K101	Pagnucco, Pete V	Diver, Emma Marie	t	\N
3696	Volodymyr	Drobiazko	22176	1	vdrobiazko_24@esusdstudents.org	5	M	12	K215	McDorman, Teresa	Drobiazko, Volodymyr	t	\N
3697	Anderson	Duffy	15074	1	aduffy_24@esusdstudents.org	5	M	12	E100	Kadlec, Tamara	Duffy, Anderson Joseph	t	\N
3674	Jonah	Coleman	17873	1	jcoleman_24@esusdstudents.org	5	M	12	A203	Whalen IV, James	Coleman, Jonah Robert Shobu	t	\N
6339	Deshawn	Cleveland	58917	4	d.cleveland917@cvuhsd.org	15	M	9	J-112	Levine, Allison A	Cleveland, Deshawn Rasheem	f	\N
3701	Michael	Eisenberg	18707	1	meisenberg_24@esusdstudents.org	5	M	12	R100	Maisonet, Tiffany	Eisenberg, Michael Ilan	t	\N
3702	Kate	Elward	19976	1	kelward_24@esusdstudents.org	5	F	12	R100	Maisonet, Tiffany	Elward, Kate Kenyon	t	\N
3703	Maryn	Erney	15076	1	merney_24@esusdstudents.org	5	F	12	A203	Whalen IV, James	Erney, Maryn Miriam	t	\N
3704	Carlotta	Escala Boehm	18961	1	cescalaboehm_24@esusdstudents.org	5	F	12	B202	Adams, Nicole	Escala Boehm, Carlotta Maika	t	\N
3705	Diego	Escario	20549	1	descario_24@esusdstudents.org	5	M	12	B205	Nieto Viteri, Grace	Escario, Diego Jose	t	\N
3706	Esteban	Esparza	19387	1	eesparza_24@esusdstudents.org	5	M	12	R202	Traber, William Jr.	Esparza, Esteban Rigoberto	t	\N
3707	Ethan	Everard	18971	1	eeverard_24@esusdstudents.org	5	M	12	K209	Bolanos, Marcos	Everard, Ethan Garret	t	\N
3708	Dylan	Evers	19309	1	devers_24@esusdstudents.org	5	M	12	E100	Kadlec, Tamara	Evers, Dylan Ross	t	\N
3709	Christian	Ewell	14717	1	cewell_24@esusdstudents.org	5	M	12	R104	Summers, Gianna A	Ewell, Christian Jacob	t	\N
3710	Patrick	Ezzo	15234	1	pezzo_24@esusdstudents.org	5	M	12	A203	Whalen IV, James	Ezzo, Patrick David	t	\N
3711	Logan	Fastman	15409	1	lfastman_24@esusdstudents.org	5	M	12	A203	Whalen IV, James	Fastman, Logan Alexander	t	\N
3712	Andrew	Felix	18962	1	afelix_24@esusdstudents.org	5	M	12	E100	Kadlec, Tamara	Felix, Andrew Jonatan	t	\N
3713	Samantha	Fenton	15465	1	sfenton_24@esusdstudents.org	5	F	12	K100	Jeon, Paul	Fenton, Samantha Claudia	t	\N
3715	Joscelynn	Fernandez	20696	1	jfernandez_24@esusdstudents.org	5	F	12	E100	Kadlec, Tamara	Fernandez, Joscelynn Chrystell	t	\N
3716	Kylie	Fernandez	19832	1	kfernandez_24@esusdstudents.org	5	F	12	A203	Whalen IV, James	Fernandez, Kylie Anneliese	t	\N
3717	Calvin	Fillingame	15423	1	cfillingame_24@esusdstudents.org	5	M	12	R104	Summers, Gianna A	Fillingame, Calvin Patrick	t	\N
3718	Nicholas	Fisher	14574	1	nfisher_24@esusdstudents.org	5	M	12	R100	Maisonet, Tiffany	Fisher, Nicholas Jeffrey	t	\N
3719	Jake	Fosmore	20692	1	jfosmore_24@esusdstudents.org	5	M	12	A208	Munger, Judith Ann	Fosmore, Jake Alexander	t	\N
3720	Benjamin	Fuentes	20849	1	bfuentes_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Fuentes, Benjamin Even	t	\N
3721	Malachi	Fuqua	16008	1	mfuqua_24@esusdstudents.org	5	M	12	R104	Summers, Gianna A	Fuqua, Malachi Marquist	t	\N
3722	Nicole	Galbreath	15239	1	15239_24@esusdstudents.org	5	F	12	K101	Pagnucco, Pete V	Galbreath, Nicole Elizabeth	t	\N
3723	Audrey	Garcia	20778	1	agarcia_24@esusdstudents.org	5	F	12	A203	Whalen IV, James	Garcia, Audrey Sabina	t	\N
3724	Dylan	Garcia	15079	1	dgarcia_24@esusdstudents.org	5	M	12	K215	McDorman, Teresa	Garcia, Dylan Bradley	t	\N
3725	Jonah	Gardiner	18219	1	jgardiner_24@esusdstudents.org	5	M	12	R104	Summers, Gianna A	Gardiner, Jonah Michael	t	\N
3726	Josephine	Gardner	15241	1	jgardner_24@esusdstudents.org	5	F	12	A204	Tacsik, Kyle	Gardner, Josephine Anna	t	\N
3728	Leola	Ghazi	21104	1	lghazi_24@esusdstudents.org	5	F	12	K209	Bolanos, Marcos	Ghazi, Leola Bess	t	\N
3729	Luc	Giroux	15080	1	lgiroux_24@esusdstudents.org	5	M	12	A203	Whalen IV, James	Giroux, Luc	t	\N
3730	Dorde	Glisovic	19308	1	dglisovic_24@esusdstudents.org	5	M	12	K209	Bolanos, Marcos	Glisovic, Dorde	t	\N
3731	Zachary	Goldman	18963	1	zgoldman_24@esusdstudents.org	5	M	12	A203	Whalen IV, James	Goldman, Zachary Marshall	t	\N
3732	Hector	Gomez	15242	1	hgomez_24@esusdstudents.org	5	M	12	B202	Adams, Nicole	Gomez, Hector Daniel	t	\N
3734	Donald	Gonzalez	18954	1	dgonzalez_24@esusdstudents.org	5	M	12	K209	Bolanos, Marcos	Gonzalez, Donald Augusto	t	\N
3735	Esteban	Gonzalez	18713	1	egonzalez_24@esusdstudents.org	5	M	12	K215	McDorman, Teresa	Gonzalez, Esteban Manuel	t	\N
3736	Isabella	Gonzalez	18955	1	igonzalez_24@esusdstudents.org	5	F	12	K209	Bolanos, Marcos	Gonzalez, Isabella Adriana	t	\N
3737	Lincoln	Gonzalez	20743	1	lgonzalez_24@esusdstudents.org	5	M	12	A203	Whalen IV, James	Gonzalez, Lincoln Benjamin	t	\N
3733	Sally	Gonzalez Aguilar	18966	1	sgonzalez-aguilar_24@esusdstudents.org	5	F	12	K209	Bolanos, Marcos	Gonzalez Aguilar, Sally	t	\N
3739	Matthew	Gookin	19967	1	mgookin_24@esusdstudents.org	5	M	12	B202	Adams, Nicole	Gookin, Matthew Donald	t	\N
3740	Jere	Gossom	15243	1	jgossom_24@esusdstudents.org	5	M	12	K213	Mendoza, Manuel	Gossom, Jere James	t	\N
3742	Cade	Gravett	15426	1	cgravett_24@esusdstudents.org	5	M	12	R104	Summers, Gianna A	Gravett, Cade Jackson	t	\N
3743	Ian	Gray	18796	1	igray_24@esusdstudents.org	5	M	12	K209	Bolanos, Marcos	Gray, Ian Jackson	t	\N
3745	Lucas	Gribbon	15504	1	lgribbon_24@esusdstudents.org	5	M	12	C100	Kadonaga, Theresa M	Gribbon, Lucas Holt	t	\N
3746	Ainsley	Gulden	18757	1	agulden_24@esusdstudents.org	5	F	12	A204	Tacsik, Kyle	Gulden, Ainsley Marie	t	\N
3747	Isabella	Gutierrez	16183	1	igutierrez_24@esusdstudents.org	5	F	12	R100	Maisonet, Tiffany	Gutierrez, Isabella Nathaly	t	\N
3748	Matthew	Gutierrez	16026	1	mgutierrez_24@esusdstudents.org	5	M	12	C100	Kadonaga, Theresa M	Gutierrez, Matthew	t	\N
3749	Brock	Guy	15082	1	bguy_24@esusdstudents.org	5	M	12	Counseling	Allen-Burns, Stephanie Marie	Guy, Brock Gunner	t	\N
3750	Lauryn	Hachiya	18969	1	lhachiya_24@esusdstudents.org	5	F	12	K101	Pagnucco, Pete V	Hachiya, Lauryn Yoshiko Lin	t	\N
3751	Carter	Hajt	20559	1	chajt_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Hajt, Carter Christopher	t	\N
3752	Maxwell	Hale	14441	1	mhale_24@esusdstudents.org	5	M	12	E100	Kadlec, Tamara	Hale, Maxwell Brunner	t	\N
3741	Jacob	Grant	14941	1	jgrant_24@esusdstudents.org	5	M	12	K213	Mendoza, Manuel	Grant, Jacob Sean	t	\N
6340	Zamir	Conserve	58164	4	z.conserve164@cvuhsd.org	15	M	9	D-108	Infante Razo, Carlos	Conserve, Zamir Elias	f	\N
3753	Amir	Hamilton	18771	1	ahamilton2_24@esusdstudents.org	5	M	12	K213	Mendoza, Manuel	Hamilton, Amir Hasan	t	\N
3754	Bianca	Hammer	15083	1	bhammer_24@esusdstudents.org	5	F	12	A204	Tacsik, Kyle	Hammer, Bianca	t	\N
3755	Alexa	Hanley	18958	1	ahanley_24@esusdstudents.org	5	F	12	K209	Bolanos, Marcos	Hanley, Alexa	t	\N
3756	Susannah	Harper	16218	1	sharper_24@esusdstudents.org	5	F	12	R202	Traber, William Jr.	Harper, Susannah Claire	t	\N
3757	Madison	Harris	14758	1	mharris_24@esusdstudents.org	5	F	12	C100	Kadonaga, Theresa M	Harris, Madison Lane	t	\N
3758	Indigo	Henry-Davis	21098	1	ihenry-davis_24@esusdstudents.org	5	F	12	K209	Bolanos, Marcos	Henry-Davis, Indigo Alexandra	t	\N
3759	Barcelona	Heredia	20723	1	bheredia_24@esusdstudents.org	5	F	12	Counseling	Allen-Burns, Stephanie Marie	Heredia, Barcelona Piedad	t	\N
3760	Mateo	Heredia	15246	1	mheredia_24@esusdstudents.org	5	M	12	A203	Whalen IV, James	Heredia, Mateo Christopher	t	\N
3762	Takumi	Hirano	21029	1	thirano_24@esusdstudents.org	5	M	12	K215	McDorman, Teresa	Hirano, Takumi	t	\N
3763	Conrad	Hoffman	15773	1	choffman_24@esusdstudents.org	5	M	12	E100	Kadlec, Tamara	Hoffman, Conrad Johan	t	\N
3765	Maya	Holtzman	18972	1	mholtzman_24@esusdstudents.org	5	F	12	A203	Whalen IV, James	Holtzman, Maya Anne	t	\N
3766	Sophia	Hummel	18976	1	shummel_24@esusdstudents.org	5	F	12	K215	McDorman, Teresa	Hummel, Sophia Rose Higashiyama	t	\N
3767	Samantha	Ignarro	20834	1	signarro_24@esusdstudents.org	5	F	12	A203	Whalen IV, James	Ignarro, Samantha Michele	t	\N
3768	Tanner	Ijams	18069	1	tijams_24@esusdstudents.org	5	F	12	A204	Tacsik, Kyle	Ijams, Tanner	t	\N
3769	Kacy	Ivie	20709	1	kivie_24@esusdstudents.org	5	F	12	K215	McDorman, Teresa	Ivie, Kacy Lee	t	\N
3770	Taylor	Ivie	20708	1	tivie_24@esusdstudents.org	5	F	12	R100	Maisonet, Tiffany	Ivie, Taylor Elaine	t	\N
3771	Maximus	Janicek	15774	1	mjanicek_24@esusdstudents.org	5	M	12	C100	Kadonaga, Theresa M	Janicek, Maximus	t	\N
3772	Quinn	Jenkins	15088	1	qjenkins_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	Jenkins, Quinn Ann	t	\N
3773	Rina	Johnson	15087	1	rjohnson_24@esusdstudents.org	5	F	12	A203	Whalen IV, James	Johnson, Rina	t	\N
3774	Valerie	Johnson	21708	1	vjohnson_24@esusdstudents.org	5	F	12	K101	Pagnucco, Pete V	Johnson, Valerie Melina	t	\N
3775	Leila	Jones	18934	1	ljones_24@esusdstudents.org	5	F	12	B202	Adams, Nicole	Jones, Leila Nicole	t	\N
3777	Tyler	Kazen	15248	1	tkazen_24@esusdstudents.org	5	M	12	K215	McDorman, Teresa	Kazen, Tyler Garrick	t	\N
3778	Kaden	Keens	15360	1	kkeens_24@esusdstudents.org	5	M	12	R104	Summers, Gianna A	Keens, Kaden Michael Haruki	t	\N
3779	William	Kerker	16790	1	wkerker_24@esusdstudents.org	5	M	12	R104	Summers, Gianna A	Kerker, William Richard	t	\N
3780	Alexander	Khan	19004	1	akhan_24@esusdstudents.org	5	M	12	A204	Tacsik, Kyle	Khan, Alexander Isa	t	\N
3781	Akam	Khinda	15223	1	akhinda_24@esusdstudents.org	5	M	12	E100	Kadlec, Tamara	Khinda, Akam Singh	t	\N
3782	Maya	Kingsley	15250	1	mkingsley_24@esusdstudents.org	5	F	12	R202	Traber, William Jr.	Kingsley, Maya Karen	t	\N
3783	Clarke	Klein	20746	1	cklein_24@esusdstudents.org	5	M	12	K215	McDorman, Teresa	Klein, Clarke Matthew	t	\N
3784	Timothy	Klug	15519	1	tklug_24@esusdstudents.org	5	M	12	K215	McDorman, Teresa	Klug, Timothy Martin	t	\N
3785	Kaden	Kobzina	15251	1	kkobzina_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	Kobzina, Kaden Rose	t	\N
3786	Dominik	Kopecky	15252	1	dkopecky_24@esusdstudents.org	5	M	12	A203	Whalen IV, James	Kopecky, Dominik Jan	t	\N
3787	Abhay	Korlapati	15091	1	akorlapati_24@esusdstudents.org	5	M	12	A204	Tacsik, Kyle	Korlapati, Abhay Krishna	t	\N
3789	Connor	Ksieski	20698	1	cksieski_24@esusdstudents.org	5	M	12	B202	Adams, Nicole	Ksieski, Connor Aiden	t	\N
3790	Isaac	Kwon	18233	1	ikwon_24@esusdstudents.org	5	M	12	A204	Tacsik, Kyle	Kwon, Isaac Hyuk	t	\N
3791	Shiloh	Laden	20857	1	sladen_24@esusdstudents.org	5	M	12	C100	Kadonaga, Theresa M	Laden, Shiloh Elijah	t	\N
3792	Chasen	Lafolette	18776	1	clafolette_24@esusdstudents.org	5	M	12	K215	McDorman, Teresa	Lafolette, Chasen Joseph	t	\N
3793	Emily	Lallemand	16177	1	elallemand_24@esusdstudents.org	5	F	12	C100	Kadonaga, Theresa M	Lallemand, Emily Marissa	t	\N
3794	Bailey	Landeros	18935	1	blanderos_24@esusdstudents.org	5	F	12	A201	Gast, Craig Joseph	Landeros, Bailey Lynn	t	\N
3795	Dylan	Lawrence	15254	1	dlawrence_24@esusdstudents.org	5	M	12	K209	Bolanos, Marcos	Lawrence, Dylan James	t	\N
3796	Tristan	Letang	15138	1	tletang_24@esusdstudents.org	5	M	12	E105	Eastman, John James	Letang, Tristan	t	\N
3797	Juddson	Lister	15255	1	jlister_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Lister, Juddson Everett	t	\N
3798	Chase	Little	14593	1	clittle_24@esusdstudents.org	5	M	12	K209	Bolanos, Marcos	Little, Chase Hamilton	t	\N
3799	Alexander	Lool-Perez	19903	1	alool-perez_24@esusdstudents.org	5	M	12	R200	Davlantis, Foti J	Lool-Perez, Alexander Ezekiel	t	\N
3800	Sofia	Lucy	20706	1	slucy_24@esusdstudents.org	5	F	12	A201	Gast, Craig Joseph	Lucy, Sofia Maria Louise	t	\N
3801	Jackson	Lund	16016	1	jlund_24@esusdstudents.org	5	M	12	K215	McDorman, Teresa	Lund, Jackson	t	\N
3802	Dane	Mackerer	15438	1	dmackerer_24@esusdstudents.org	5	M	12	R202	Traber, William Jr.	Mackerer, Dane Keating	t	\N
3803	Jacob	Mandoyan	15096	1	jmandoyan_24@esusdstudents.org	5	M	12	E100	Kadlec, Tamara	Mandoyan, Jacob Daniel	t	\N
3804	Lola	Manoukian	21527	1	lmanoukian_24@esusdstudents.org	5	F	12	B202	Adams, Nicole	Manoukian, Lola Amber	t	\N
3806	Alexis	Marrero	20777	1	amarrero_24@esusdstudents.org	5	F	12	C100	Kadonaga, Theresa M	Marrero, Alexis Grace	t	\N
6341	Walter	Copeland	59257	4	w.copeland257@cvuhsd.org	15	M	9	F-106	Givens, Kathy E.	Copeland, Walter Donovan	f	\N
3832	Alexandra	Nelson	15410	1	anelson_24@esusdstudents.org	5	F	12	A204	Tacsik, Kyle	Nelson, Alexandra Leigh	t	\N
3833	Olive	Nelson	15103	1	onelson_24@esusdstudents.org	5	F	12	K209	Bolanos, Marcos	Nelson, Olive Mary	t	\N
3834	Elias	Nessary	16885	1	enessary_24@esusdstudents.org	5	M	12	E100	Kadlec, Tamara	Nessary, Elias Lemar	t	\N
3835	Adam	Neulander	20728	1	aneulander_24@esusdstudents.org	5	M	12	A204	Tacsik, Kyle	Neulander, Adam Noah	t	\N
3836	Max	Nuslein	22233	1	mnuslein_24@esusdstudents.org	5	M	12	A204	Tacsik, Kyle	Nuslein, Max John	t	\N
3837	Kylie	O'Connor	15424	1	koconnor_24@esusdstudents.org	5	F	12	R202	Traber, William Jr.	O'Connor, Kylie Elle	t	\N
3839	Kiana	Ogata	18719	1	kogata_24@esusdstudents.org	5	F	12	A203	Whalen IV, James	Ogata, Kiana Kanoelani Akemi	t	\N
3838	Kiera	O'Keefe	15416	1	kokeefe_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	O'Keefe, Kiera Ann	t	\N
3841	Stephanie	Ortiz	22895	1	sortiz_24@esusdstudents.org	5	F	12	K207	Horvath, Daniel	Ortiz, Stephanie Tamara	t	\N
3842	Luke	Osborne	17729	1	losborne_24@esusdstudents.org	5	M	12	A103	Page, Jessica L.	Osborne, Luke Thomas	t	\N
3843	Abigail	Ouaknine	18941	1	aouaknine_24@esusdstudents.org	5	F	12	A204	Tacsik, Kyle	Ouaknine, Abigail Warner	t	\N
3844	Rose	Padlipsky	15441	1	rpadlipsky_24@esusdstudents.org	5	F	12	A204	Tacsik, Kyle	Padlipsky, Rose Beverly	t	\N
3845	Soleil	Palace	15105	1	spalace_24@esusdstudents.org	5	F	12	A204	Tacsik, Kyle	Palace, Soleil Regina	t	\N
3808	Elijah	Matthews	22189	1	ematthews_24@esusdstudents.org	5	M	12	K221	Bolanos, Erin	Matthews, Elijah Kadyn	t	\N
3846	Ryan	Pascarelli	13935	1	rpascarelli_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Pascarelli, Ryan Lucas	t	\N
3809	Alexander	McAlpine	18754	1	amcalpine_24@esusdstudents.org	5	M	12	E100	Kadlec, Tamara	McAlpine, Alexander Charles	t	\N
3847	Aidan	Pastorelli	15106	1	apastorelli_24@esusdstudents.org	5	M	12	K101	Pagnucco, Pete V	Pastorelli, Aidan James	t	\N
3810	Riley	McAndrews	15098	1	rmcandrews_24@esusdstudents.org	5	F	12	E100	Kadlec, Tamara	McAndrews, Riley Marie	t	\N
3811	Lilia	McCann	18177	1	lmccann_24@esusdstudents.org	5	F	12	K215	McDorman, Teresa	McCann, Lilia	t	\N
3848	Fynland	Patterson	22891	1	fpatterson_24@esusdstudents.org	5	F	12	A201	Gast, Craig Joseph	Patterson, Fynland Elizabeth	t	\N
3812	Kailesh	McCarthy	20715	1	kmccarthy_24@esusdstudents.org	5	M	12	A204	Tacsik, Kyle	McCarthy, Kailesh Doshi	t	\N
3814	Kaylie	McColgan	14840	1	kmccolgan_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	McColgan, Kaylie Ann	t	\N
3849	Jaidan	Pech	20815	1	jpech_24@esusdstudents.org	5	F	12	K209	Bolanos, Marcos	Pech, Jaidan Mariah	t	\N
3815	Makenna	McIlhargey	20742	1	mmcilhargey_24@esusdstudents.org	5	F	12	R101	Hansen, Bjorn	McIlhargey, Makenna Faith	t	\N
3850	Kiana	Pereira	15411	1	kpereira_24@esusdstudents.org	5	F	12	K215	McDorman, Teresa	Pereira, Kiana Anishka	t	\N
3816	Gavin	McKinnon	15099	1	gmckinnon_24@esusdstudents.org	5	M	12	E100	Kadlec, Tamara	McKinnon, Gavin Anthony	t	\N
3817	Molly	McNeil	20705	1	mmcneil_24@esusdstudents.org	5	F	12	A203	Whalen IV, James	McNeil, Molly Jane	t	\N
3818	Sophia	Menendez	22817	1	smenendez_24@esusdstudents.org	5	F	12	C100	Kadonaga, Theresa M	Menendez, Sophia Corina	t	\N
3819	Mikah	Meyerson	20713	1	mmeyerson_24@esusdstudents.org	5	M	12	A204	Tacsik, Kyle	Meyerson, Mikah Asher	t	\N
3820	Nathanial	Meyerson	20714	1	nmeyerson_24@esusdstudents.org	5	M	12	C100	Kadonaga, Theresa M	Meyerson, Nathanial Caleb	t	\N
3821	Kaylin	Milo	20740	1	kmilo_24@esusdstudents.org	5	F	12	K215	McDorman, Teresa	Milo, Kaylin Gloria	t	\N
3822	Scott	Moeller	15100	1	smoeller_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Moeller, Scott Andrew	t	\N
3823	Julio	Molina	21724	1	jmolina_24@esusdstudents.org	5	M	12	E100	Kadlec, Tamara	Molina, Julio Cesar	t	\N
3825	Connor	Moore	18196	1	cmoore_24@esusdstudents.org	5	M	12	A204	Tacsik, Kyle	Moore, Connor James	t	\N
3826	Liam	Moore	18195	1	lmoore_24@esusdstudents.org	5	M	12	K101	Pagnucco, Pete V	Moore, Liam Timothy	t	\N
3851	Julia	Perfetti	15260	1	jperfetti_24@esusdstudents.org	5	F	12	E101	DeLong, Megan	Perfetti, Julia James	t	\N
3827	Isabela	Moreno	16047	1	imoreno_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	Moreno, Isabela Grace	t	\N
3828	Madison	Mosich	19985	1	mmosich_24@esusdstudents.org	5	F	12	R100	Maisonet, Tiffany	Mosich, Madison Elizabeth	t	\N
3852	William	Pinero	17877	1	wpinero_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Pinero, William Emilio	t	\N
3829	Mairyn	Mull	15205	1	mmull_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	Mull, Mairyn Kenna	t	\N
3853	Jackson	Pintens	19826	1	jpintens_24@esusdstudents.org	5	M	12	E100	Kadlec, Tamara	Pintens, Jackson Peter	t	\N
3830	Izabella	Munoz	20845	1	imunoz_24@esusdstudents.org	5	F	12	K209	Bolanos, Marcos	Munoz, Izabella	t	\N
3854	Luke	Polk	15107	1	lpolk_24@esusdstudents.org	5	M	12	K215	McDorman, Teresa	Polk, Luke Ryu	t	\N
3855	Olivia	Poppe	15261	1	opoppe_24@esusdstudents.org	5	F	12	R100	Maisonet, Tiffany	Poppe, Olivia Helen	t	\N
3856	Aaron	Poublon	15108	1	apoublon_24@esusdstudents.org	5	M	12	R100	Maisonet, Tiffany	Poublon, Aaron Edward	t	\N
3858	Camila	Prida	19314	1	cprida_24@esusdstudents.org	5	F	12	K215	McDorman, Teresa	Prida, Camila Marie	t	\N
3859	Johnathan	Priest	15263	1	jpriest_24@esusdstudents.org	5	M	12	R202	Traber, William Jr.	Priest, Johnathan Jay	t	\N
3860	Bianca	Prince	14601	1	bprince_24@esusdstudents.org	5	F	12	K101	Pagnucco, Pete V	Prince, Bianca Rae	t	\N
3861	Milla	Prince	14603	1	mprince_24@esusdstudents.org	5	F	12	A203	Whalen IV, James	Prince, Milla Jordan	t	\N
6342	Leah	Corcio	58882	4	l.corcio882@cvuhsd.org	15	F	9	J-112	Levine, Allison A	Corcio, Leah Giselle	f	\N
3875	Braulio	Rivas Delgado	21763	1	brivasdelgado_24@esusdstudents.org	5	M	12	C100	Kadonaga, Theresa M	Rivas Delgado, Braulio David	t	\N
3876	Angel	Rojas	20809	1	arojas_24@esusdstudents.org	5	M	12	E100	Kadlec, Tamara	Rojas, Angel Sandro	t	\N
3877	Jayden	Rosenwald	15114	1	jrosenwald_24@esusdstudents.org	5	F	12	K209	Bolanos, Marcos	Rosenwald, Jayden Grace	t	\N
3878	Elizabeth	Ruedas	17755	1	eruedas_24@esusdstudents.org	5	F	12	C100	Kadonaga, Theresa M	Ruedas, Elizabeth Anne	t	\N
3879	Jacob	Ruedas	15115	1	jruedas_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Ruedas, Jacob Nathaniel	t	\N
3880	Jesse	Ruiz Sandoval	14607	1	jruizsandoval_24@esusdstudents.org	5	M	12	R104	Summers, Gianna A	Ruiz Sandoval, Jesse	t	\N
3881	LaVie	Saad	20686	1	lsaad_24@esusdstudents.org	5	F	12	A204	Tacsik, Kyle	Saad, LaVie Lina	t	\N
3882	Taisei	Saito	20689	1	tsaito_24@esusdstudents.org	5	M	12	K209	Bolanos, Marcos	Saito, Taisei	t	\N
3885	Brynn	Sanders	15778	1	bsanders_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	Sanders, Brynn Rachael	t	\N
3886	Devin	Sant	13957	1	dsant_24@esusdstudents.org	5	M	12	K209	Bolanos, Marcos	Sant, Devin Mehrdad	t	\N
3887	Simone	Santana	19325	1	ssantana_24@esusdstudents.org	5	F	12	R100	Maisonet, Tiffany	Santana, Simone Isabella	t	\N
3884	Zoey	Samuel	19503	1	zsamuel_24@esusdstudents.org	5	F	12	K101	Pagnucco, Pete V	Samuel, Zoey Ang	t	\N
3888	Ciara	Schnauer	20731	1	cschnauer_24@esusdstudents.org	5	F	12	C100	Kadonaga, Theresa M	Schnauer, Ciara Thia	t	\N
3889	Shelby	Searight	20682	1	ssearight_24@esusdstudents.org	5	F	12	B202	Adams, Nicole	Searight, Shelby Lynn	t	\N
3890	Lukas	Seli	18729	1	lseli_24@esusdstudents.org	5	M	12	A204	Tacsik, Kyle	Seli, Lukas Leo	t	\N
3891	Syed Ali	Shah	18071	1	sshah_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Shah, Syed Ali Imran	t	\N
3892	Nathan	Shanks	15116	1	nshanks_24@esusdstudents.org	5	M	12	K209	Bolanos, Marcos	Shanks, Nathan James	t	\N
3894	Raylene	Silva	16874	1	rsilva_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	Silva, Raylene Dallas	t	\N
3893	Aiden	Sheridan	20688	1	asheridan_24@esusdstudents.org	5	M	12	A208	Munger, Judith Ann	Sheridan, Aiden Ho-Han	t	\N
3895	Haydn	Song	15435	1	hsong_24@esusdstudents.org	5	M	12	A204	Tacsik, Kyle	Song, Haydn Arthur	t	\N
3897	Matthew	Spraggins	15119	1	mspraggins_24@esusdstudents.org	5	M	12	E105	Eastman, John James	Spraggins, Matthew Sevan	t	\N
3898	Aditya	Sridhar	18855	1	asridhar_24@esusdstudents.org	5	M	12	R100	Maisonet, Tiffany	Sridhar, Aditya	t	\N
3899	Samyuktha	Srikanth	20712	1	ssrikanth_24@esusdstudents.org	5	F	12	K209	Bolanos, Marcos	Srikanth, Samyuktha	t	\N
3900	Lucas	Sun	20691	1	lsun_24@esusdstudents.org	5	M	12	A203	Whalen IV, James	Sun, Lucas Qijun	t	\N
3901	Gloria	Sutlovich	15123	1	gsutlovich_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	Sutlovich, Gloria Ann	t	\N
3902	Ashlyn Grace	Sze	19000	1	asze_24@esusdstudents.org	5	F	12	A201	Gast, Craig Joseph	Sze, Ashlyn Grace Ong	t	\N
3903	Thomas	Taja	22416	1	ttaja_24@esusdstudents.org	5	M	12	A204	Tacsik, Kyle	Taja, Thomas	t	\N
3904	Chloe	Taylor	21587	1	ctaylor_24@esusdstudents.org	5	F	12	A201	Gast, Craig Joseph	Taylor, Chloe Joy	t	\N
3905	James	Taylor	18950	1	jtaylor_24@esusdstudents.org	5	M	12	A208	Munger, Judith Ann	Taylor, James Arthur Russell	t	\N
3906	Simone	Taylor	20704	1	staylor_24@esusdstudents.org	5	F	12	C100	Kadonaga, Theresa M	Taylor, Simone Elise	t	\N
3907	Matthew	Tec Lopez	21718	1	mteclopez_24@esusdstudents.org	5	M	12	K211	Perren, Nicole Marie	Tec Lopez, Matthew Samuel	t	\N
3908	Mary	Tecle	19753	1	mtecle_24@esusdstudents.org	5	F	12	K213	Mendoza, Manuel	Tecle, Mary	t	\N
3910	Milo	Thomas	18175	1	mthomas_24@esusdstudents.org	5	M	12	K209	Bolanos, Marcos	Thomas, Milo Moon	t	\N
3912	Ian	Toledo	19330	1	itoledo_24@esusdstudents.org	5	M	12	K215	McDorman, Teresa	Toledo, Ian Alexander	t	\N
3913	Marco	Torre	15437	1	mtorre_24@esusdstudents.org	5	M	12	R104	Summers, Gianna A	Torre, Marco Cesare	t	\N
3914	Isaiah	Torres	15396	1	itorres_24@esusdstudents.org	5	M	12	B202	Adams, Nicole	Torres, Isaiah Alexander	t	\N
3915	Daniel	Tritasavit	15408	1	dtritasavit_24@esusdstudents.org	5	M	12	C100	Kadonaga, Theresa M	Tritasavit, Daniel Tam	t	\N
3864	Isabella	Ramacciotti	15333	1	iramacciotti_24@esusdstudents.org	5	F	12	C100	Kadonaga, Theresa M	Ramacciotti, Isabella Marie	t	\N
3865	Emily	Ramirez	18944	1	eramirez_24@esusdstudents.org	5	F	12	A203	Whalen IV, James	Ramirez, Emily Marie	t	\N
3866	Justin	Ramirez	15109	1	jramirez_24@esusdstudents.org	5	M	12	R104	Summers, Gianna A	Ramirez, Justin	t	\N
3867	Milan	Ramirez	19401	1	mramirez_24@esusdstudents.org	5	F	12	K217	Turner, Lauren Alissa	Ramirez, Milan Isabella	t	\N
3868	Lauren	Ray	18946	1	lray_24@esusdstudents.org	5	F	12	A201	Gast, Craig Joseph	Ray, Lauren Kay Lyons	t	\N
3869	Julian	Raymond	18968	1	jraymond_24@esusdstudents.org	5	M	12	B202	Adams, Nicole	Raymond, Julian Diego	t	\N
3862	Kayla	Pritchard	17189	1	kpritchard_24@esusdstudents.org	5	F	12	A201	Gast, Craig Joseph	Pritchard, Kayla Chanel	t	\N
3863	Keith	Puckett	14877	1	kpuckett_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Puckett, Keith Francisco	t	\N
3870	Zaxxon	Rehm	20813	1	zrehm_24@esusdstudents.org	5	M	12	A208	Munger, Judith Ann	Rehm, Zaxxon Kenshin	t	\N
3871	Alexander	Reis	20814	1	areis_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Reis, Alexander Felipe	t	\N
3873	Erica	Remmer	15266	1	eremmer_24@esusdstudents.org	5	F	12	A204	Tacsik, Kyle	Remmer, Erica Rose	t	\N
6343	Mariah	Cordova	58916	4	m.cordova916@cvuhsd.org	15	F	9	F-107	Rice, Christopher A.	Cordova, Mariah Cristina	f	\N
6344	Emily	Corona-Vasquez	58514	4	e.coronavasquez514@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Corona-Vasquez, Emily Roxanne	f	\N
3949	Mackenzie	Anderson	22874	1	manderson_27@esusdstudents.org	7	F	9	A104	Sidwell, Glenn	Anderson, Mackenzie Vanessa	t	\N
3620	Leul	Abay	20725	1	labay_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Abay, Leul Belay	t	\N
3946	Devin	Alavez	17382	1	dalavez_27@esusdstudents.org	7	M	9	A101	Daegele, Kimberly	Alavez, Devin Thomas	f	\N
3947	Sienna	Alcus	17538	1	salcus_27@esusdstudents.org	7	F	9	A101	Daegele, Kimberly	Alcus, Sienna Porta	f	\N
3948	Dean	Ali	21061	1	dali_27@esusdstudents.org	7	M	9	North Gym	Smith, Rainy	Ali, Dean Maliq	f	\N
3950	Ransom	Anderson	18076	1	randerson_27@esusdstudents.org	7	M	9	K217	Turner, Lauren Alissa	Anderson, Ransom Kingsley	f	\N
3951	Madison	Antonelli	18157	1	mantonelli_27@esusdstudents.org	7	F	9	B203	O'Keefe, Amy Ann	Antonelli, Madison Rosemary	f	\N
3952	Jayleen	Arias	19099	1	jarias_27@esusdstudents.org	7	F	9	C100	Kadonaga, Theresa M	Arias, Jayleen	f	\N
3953	Landon	Aubert	16703	1	laubert_27@esusdstudents.org	7	M	9	K201	Kojima, Tyler	Aubert, Landon Reese	f	\N
3954	Rami	Awada	15596	1	rawada_27@esusdstudents.org	7	M	9	B203	O'Keefe, Amy Ann	Awada, Rami Ali	f	\N
3955	Thomas	Ayoub	21914	1	tayoub_27@esusdstudents.org	7	M	9	South Gym	March, David	Ayoub, Thomas Mena	f	\N
3956	Sonja	Bandy	16485	1	sbandy_27@esusdstudents.org	7	F	9	K201	Kojima, Tyler	Bandy, Sonja Kat	f	\N
3957	Elijah	Barnes	22637	1	ebarnes_27@esusdstudents.org	7	M	9	Engineerin	Zwissler, Darwin	Barnes, Elijah James	f	\N
3958	Rhodes	Baron	17396	1	rbaron_27@esusdstudents.org	7	M	9	B104	Gaxiola, Gabriela	Baron, Rhodes Atwater	f	\N
3959	Samantha	Barragan	19261	1	sbarragan_27@esusdstudents.org	7	F	9	K201	Kojima, Tyler	Barragan, Samantha Jaylin	f	\N
3960	Alexa	Barry	21997	1	abarry_27@esusdstudents.org	7	F	9	A210	Doering, Mark Edward	Barry, Alexa Grace	f	\N
3961	Luke	Bartholomew	16146	1	lbartholomew_27@esusdstudents.org	7	M	9	North Gym	Smith, Rainy	Bartholomew, Luke Aaron	f	\N
3962	Leonie	Basterretche	18696	1	lbasterretche_27@esusdstudents.org	7	F	9	K100	Jeon, Paul	Basterretche, Leonie Catherine	f	\N
3963	Isabella	Beltramo	17523	1	ibeltramo_27@esusdstudents.org	7	F	9	A101	Daegele, Kimberly	Beltramo, Isabella Rose	f	\N
3964	Wyatt	Benson	17411	1	wbenson_27@esusdstudents.org	7	M	9	A103	Page, Jessica L.	Benson, Wyatt Kobe	f	\N
3965	Kira	Bernauer	17515	1	kbernauer_27@esusdstudents.org	7	F	9	K217	Turner, Lauren Alissa	Bernauer, Kira Celeste	f	\N
3966	Valentina	Bogan	19901	1	vbogan_27@esusdstudents.org	7	F	9	B202	Adams, Nicole	Bogan, Valentina	f	\N
3942	Trinitee	Agricourt	20802	1	tagricourt_27@esusdstudents.org	7	F	9	B100	Strawn, April	Agricourt, Trinitee Nevaeh	t	\N
3943	Natalia	Aguilar	22459	1	naguilar_27@esusdstudents.org	7	F	9	B100	Strawn, April	Aguilar, Natalia Anneliese	t	\N
3940	Mina	Youssef	17500	1	myoussef_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Youssef, Mina	t	\N
3939	Matthew	Yisacc	19439	1	myisacc_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Yisacc, Matthew	t	\N
3916	Kaiya	Tungyoo	20663	1	ktungyoo_24@esusdstudents.org	5	F	12	B202	Adams, Nicole	Tungyoo, Kaiya Quinn	t	\N
3917	Ava	Turner	15959	1	aturner_24@esusdstudents.org	5	F	12	A203	Whalen IV, James	Turner, Ava Nicole	t	\N
3919	Taylor	Vickerman	15277	1	tvickerman_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Vickerman, Taylor Barron	t	\N
3920	Maya	Viramontes	20734	1	mviramontes_24@esusdstudents.org	5	F	12	A201	Gast, Craig Joseph	Viramontes, Maya	t	\N
3922	Lucas	Vitale	20858	1	lvitale_24@esusdstudents.org	5	M	12	B202	Adams, Nicole	Vitale, Lucas	t	\N
3921	Emma	Vitale	20859	1	evitale_24@esusdstudents.org	5	F	12	K209	Bolanos, Marcos	Vitale, Emma	t	\N
3923	Troy	Volland	21927	1	tvolland_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Volland, Troy Alexzander	t	\N
3924	Chantal	Walker	17971	1	cwalker_24@esusdstudents.org	5	F	12	K215	McDorman, Teresa	Walker, Chantal Hannah	t	\N
3925	Kaleb	Walker	22027	1	kwalker_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Walker, Kaleb Ashton	t	\N
3926	Patrick	Wang	15923	1	pwang_24@esusdstudents.org	5	M	12	K209	Bolanos, Marcos	Wang, Patrick Tiger	t	\N
3927	Hailey	Wantz	15278	1	hwantz_24@esusdstudents.org	5	F	12	A203	Whalen IV, James	Wantz, Hailey Jean	t	\N
3928	Brayden	Ward	15127	1	bward_24@esusdstudents.org	5	M	12	B202	Adams, Nicole	Ward, Brayden	t	\N
3929	Ailani	Washington	20843	1	awashington_24@esusdstudents.org	5	F	12	R100	Maisonet, Tiffany	Washington, Ailani Ellyce	t	\N
3930	Zoe	Weiss	15279	1	zweiss_24@esusdstudents.org	5	F	12	A203	Whalen IV, James	Weiss, Zoe Sofia	t	\N
3931	Kaan	Wellman	15418	1	kwellman_24@esusdstudents.org	5	M	12	K209	Bolanos, Marcos	Wellman, Kaan Kenneth	t	\N
3932	Grace	Wheaton	15425	1	gwheaton_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	Wheaton, Grace Sophia	t	\N
3934	Griffin	Whitener	15281	1	gwhitener_24@esusdstudents.org	5	M	12	E100	Kadlec, Tamara	Whitener, Griffin Brennan	t	\N
3935	Holly	Wilbanks	15282	1	hwilbanks_24@esusdstudents.org	5	F	12	A203	Whalen IV, James	Wilbanks, Holly Rachel	t	\N
3936	Sophia	Willick	15289	1	swillick_24@esusdstudents.org	5	F	12	C100	Kadonaga, Theresa M	Willick, Sophia Natalie	t	\N
3937	Michael	Wilson	18979	1	mwilson_24@esusdstudents.org	5	M	12	A206	Nichols, Nathan	Wilson, Michael Allen Richard	t	\N
3938	Jacob	Wiseman	20666	1	jwiseman_24@esusdstudents.org	5	M	12	B202	Adams, Nicole	Wiseman, Jacob Paul	t	\N
3945	Fernanda	Alanis-Sanchez	20752	1	falanis-sanchez_27@esusdstudents.org	7	F	9	A101	Daegele, Kimberly	Alanis-Sanchez, Fernanda Gabriella	t	\N
2663	Natalia	Aguilar	22459	1	naguilar_27@esusdstudents.org	5	F	9	B100	Strawn, April	Aguilar, Natalia Anneliese	f	\N
3967	Lillian	Booterbaugh	21685	1	lbooterbaugh2_27@esusdstudents.org	7	F	9	A101	Daegele, Kimberly	Booterbaugh, Lillian Noelani	f	\N
3968	Luke	Booterbaugh	21686	1	lbooterbaugh_27@esusdstudents.org	7	M	9	A101	Daegele, Kimberly	Booterbaugh, Luke Nakoa	f	\N
3969	Elizabeth	Bosco	22386	1	ebosco_27@esusdstudents.org	7	F	9	R101	Hansen, Bjorn	Bosco, Elizabeth Alessandra	f	\N
3970	Colin	Boushell	16677	1	cboushell_27@esusdstudents.org	7	M	9	A104	Sidwell, Glenn	Boushell, Colin Hutchison	f	\N
3971	Molly	Boushell	16679	1	mboushell_27@esusdstudents.org	7	F	9	B104	Gaxiola, Gabriela	Boushell, Molly Claire	f	\N
3972	Samantha	Brady	17413	1	sbrady_27@esusdstudents.org	7	F	9	A101	Daegele, Kimberly	Brady, Samantha Lee	f	\N
3973	Reef	Brock	22441	1	rbrock_27@esusdstudents.org	7	M	9	K201	Kojima, Tyler	Brock, Reef Wilder	f	\N
3974	Jayden	Brown	17610	1	jbrown_27@esusdstudents.org	7	M	9	R103	Moeller, Jill	Brown, Jayden Christopher	f	\N
3975	Lucas	Bryant	16682	1	lbryant_27@esusdstudents.org	7	M	9	A104	Sidwell, Glenn	Bryant, Lucas	f	\N
3976	Alexander	Caban	17525	1	acaban_27@esusdstudents.org	7	M	9	R103	Moeller, Jill	Caban, Alexander Michael	f	\N
3977	Ernest	Cabrera	19829	1	ecabrera_27@esusdstudents.org	7	M	9	A101	Daegele, Kimberly	Cabrera, Ernest	f	\N
3978	Dane	Canvin	22436	1	dcanvin_27@esusdstudents.org	7	M	9	A104	Sidwell, Glenn	Canvin, Dane Sequoia	f	\N
3979	Isabella	Cardenas	22875	1	icardenas_27@esusdstudents.org	7	F	9	R101	Hansen, Bjorn	Cardenas, Isabella Grace	f	\N
3980	Sadie	Carrigan	18698	1	scarrigan_27@esusdstudents.org	7	F	9	A104	Sidwell, Glenn	Carrigan, Sadie Machelle	f	\N
3981	Lindzy	Carroll	18052	1	lcarroll_27@esusdstudents.org	7	F	9	K201	Kojima, Tyler	Carroll, Lindzy Rachel	f	\N
3982	Ethan	Casper	20781	1	ecasper_27@esusdstudents.org	7	M	9	B203	O'Keefe, Amy Ann	Casper, Ethan Marcus	f	\N
3983	Justin	Castellanos	22876	1	jcastellanos_27@esusdstudents.org	7	M	9	R101	Hansen, Bjorn	Castellanos, Justin Phillip	f	\N
3984	Ava	Cecconi	17415	1	acecconi_27@esusdstudents.org	7	F	9	B202	Adams, Nicole	Cecconi, Ava Lilyanna	f	\N
3985	Brayden	Chang	18054	1	bchang_27@esusdstudents.org	7	M	9	Engineerin	Zwissler, Darwin	Chang, Brayden	f	\N
3986	Jake	Charmello	20780	1	jcharmello_27@esusdstudents.org	7	M	9	K201	Kojima, Tyler	Charmello, Jake Tyler	f	\N
3987	Oliver	Chartier	18644	1	ochartier_27@esusdstudents.org	7	M	9	B100	Strawn, April	Chartier, Oliver Keene	f	\N
3988	Owen	Chasez	18634	1	ochasez_27@esusdstudents.org	7	M	9	A101	Daegele, Kimberly	Chasez, Owen	f	\N
3989	Mario	Chavarin	21062	1	mchavarin_27@esusdstudents.org	7	M	9	B205	Nieto Viteri, Grace	Chavarin, Mario Guilian	f	\N
3990	Sienna	Chavez	20793	1	schavez_27@esusdstudents.org	7	F	9	A101	Daegele, Kimberly	Chavez, Sienna Isabel	f	\N
3941	Jordan	Acevedo Salazar	21349	1	jacevedosalazar_27@esusdstudents.org	7	M	9	A104	Sidwell, Glenn	Acevedo Salazar, Jordan Arimando	t	\N
2670	Ransom	Anderson	18076	1	randerson_27@esusdstudents.org	5	M	9	K217	Turner, Lauren Alissa	Anderson, Ransom Kingsley	t	\N
3267	Hayden	Abbott	21216	1	habbott_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Abbott, Hayden William	t	\N
2957	Sophia	Abrams	19972	1	sabrams_26@esusdstudents.org	5	F	10	K213	Mendoza, Manuel	Abrams, Sophia Marie	t	\N
3623	Karla	Alhallak	16792	1	kalhallak_24@esusdstudents.org	5	F	12	A201	Gast, Craig Joseph	Alhallak, Karla	t	\N
3277	Aislin	Anderson	16225	1	aanderson_25@esusdstudents.org	5	F	11	K215	McDorman, Teresa	Anderson, Aislin	t	\N
6345	Josephine	Corrigan	58223	4	j.corrigan223@cvuhsd.org	15	F	9	C-203	Duran, Dominic J	Corrigan, Josephine Caroline-Collins	f	\N
2970	Noah	Artiles	22191	1	nartiles_26@esusdstudents.org	5	M	10	K217	Turner, Lauren Alissa	Artiles, Noah Alexander	t	\N
3637	James	Baldino	14741	1	jbaldino_24@esusdstudents.org	5	M	12	A203	Whalen IV, James	Baldino, James Anthony	t	\N
2679	Samantha	Barragan	19261	1	sbarragan_27@esusdstudents.org	5	F	9	K201	Kojima, Tyler	Barragan, Samantha Jaylin	t	\N
3292	Liam	Belson	15961	1	lbelson_25@esusdstudents.org	5	M	11	R202	Traber, William Jr.	Belson, Liam Joseph	t	\N
3645	Michelle	Bergdahl	18957	1	mbergdahl_24@esusdstudents.org	5	F	12	C100	Kadonaga, Theresa M	Bergdahl, Michelle Erin	t	\N
2986	Kaitlin	Black	16307	1	kblack_26@esusdstudents.org	5	F	10	E102	Maye, Bonnie Michelle	Black, Kaitlin Deborah	t	\N
3305	Millaa	Brock	21219	1	mbrock_25@esusdstudents.org	5	F	11	E105	Eastman, John James	Brock, Millaa Avalyn	t	\N
2694	Jayden	Brown	17610	1	jbrown_27@esusdstudents.org	5	M	9	R103	Moeller, Jill	Brown, Jayden Christopher	t	\N
3196	Emma	Reyna	21828	1	ereyna_26@esusdstudents.org	5	F	10	A205	Brandlin, Amy	Reyna, Emma	t	\N
3529	Monica	Rice	15112	1	mrice_25@esusdstudents.org	5	F	11	K205	Glotz, Darin	Rice, Monica Josephine	t	\N
3657	Catherine	Bryce	14670	1	cbryce_24@esusdstudents.org	5	F	12	K209	Bolanos, Marcos	Bryce, Catherine Mae	t	\N
2879	Olive	Richmon	19153	1	orichmon_27@esusdstudents.org	5	F	9	E100	Kadlec, Tamara	Richmon, Olive Charlotte	t	\N
2880	Julianne	Rillera	21668	1	jrillera_27@esusdstudents.org	5	F	9	R103	Moeller, Jill	Rillera, Julianne Yzabel	t	\N
3874	Ryan	Ringland	15420	1	rringland_24@esusdstudents.org	5	M	12	B202	Adams, Nicole	Ringland, Ryan Chiu	t	\N
2995	Alexandra	Callahan	15803	1	acallahan_26@esusdstudents.org	5	F	10	K103	Stern, Kimberly	Callahan, Alexandra Louise	t	\N
3316	Ambrosia	Canvin	21203	1	acanvin_25@esusdstudents.org	5	F	11	E100	Kadlec, Tamara	Canvin, Ambrosia Simone	t	\N
3198	Calvin	Rodecker	19285	1	crodecker_26@esusdstudents.org	5	M	10	R103	Moeller, Jill	Rodecker, Calvin Jacob	t	\N
3319	Josias	Casas Velasco	21647	1	jcasasvelasco_25@esusdstudents.org	5	M	11	K101	Pagnucco, Pete V	Casas Velasco, Josias Raul	t	\N
3001	Irys	Casey	19262	1	icasey_26@esusdstudents.org	5	F	10	E101	DeLong, Megan	Casey, Irys Ewuraba Philippa	t	\N
3536	Keilani	Rojas	21500	1	krojas_25@esusdstudents.org	5	F	11	A210	Doering, Mark Edward	Rojas, Keilani Brianna	t	\N
2706	Jake	Charmello	20780	1	jcharmello_27@esusdstudents.org	5	M	9	K201	Kojima, Tyler	Charmello, Jake Tyler	t	\N
3538	Alan	Rosas Juarez	21210	1	arosasjuarez_25@esusdstudents.org	5	M	11	A206	Nichols, Nathan	Rosas Juarez, Alan Jaime	t	\N
2976	Owen	Barnhart	16928	1	obarnhart_26@esusdstudents.org	5	M	10	R200	Davlantis, Foti J	Barnhart, Owen Kenzo	t	\N
2886	Amelie	Rudnick	17887	1	arudnick_27@esusdstudents.org	5	F	9	A101	Daegele, Kimberly	Rudnick, Amelie Sydney Luptrawan	t	\N
2888	Sofija	Rutmanis	17570	1	srutmanis_27@esusdstudents.org	5	F	9	K100	Jeon, Paul	Rutmanis, Sofija Rose	t	\N
3883	Khadija	Saleem	21783	1	ksaleem_24@esusdstudents.org	5	F	12	R100	Maisonet, Tiffany	Saleem, Khadija	t	\N
3670	Mason	Christian	15427	1	mchristian_24@esusdstudents.org	5	M	12	K209	Bolanos, Marcos	Christian, Mason Xavier	t	\N
3330	Kyle	Cipriano	19492	1	kcipriano_25@esusdstudents.org	5	M	11	R202	Traber, William Jr.	Cipriano, Kyle Anthony	t	\N
3014	Myleah	Cooley	18228	1	mcooley_26@esusdstudents.org	5	F	10	A205	Brandlin, Amy	Cooley, Myleah Madie	t	\N
3210	Joseph	Schobel	16736	1	jschobel_26@esusdstudents.org	5	M	10	R200	Davlantis, Foti J	Schobel, Joseph Lokene-Konala	t	\N
3211	Morgan	Scivoletto	21245	1	mscivoletto_26@esusdstudents.org	5	M	10	K217	Turner, Lauren Alissa	Scivoletto, Morgan Jove	t	\N
3552	Vicken	Semerdjian	15864	1	vsemerdjian_25@esusdstudents.org	5	M	11	B202	Adams, Nicole	Semerdjian, Vicken	t	\N
2720	Lukas	Da Silva	16683	1	ldasilva_27@esusdstudents.org	5	M	9	B203	O'Keefe, Amy Ann	Da Silva, Lukas	t	\N
3685	Olyvia	Danford	18933	1	odanford_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	Danford, Olyvia Gabrielle	t	\N
2722	Cole	Davidson	17881	1	cdavidson_27@esusdstudents.org	5	M	9	K217	Turner, Lauren Alissa	Davidson, Cole Matthew	t	\N
3027	Vincent	Davis	22040	1	vdavis_26@esusdstudents.org	5	M	10	B205	Nieto Viteri, Grace	Davis, Vincent Kole	t	\N
3344	Zarek	Delahoussaye-Stephens	22870	1	zdelahoussaye-ste_25@esusdstudents.org	5	M	11	K207	Horvath, Daniel	Delahoussaye-Stephens, Zarek Taylor	t	\N
2903	Jack	Slusser	18786	1	jslusser_27@esusdstudents.org	5	M	9	A101	Daegele, Kimberly	Slusser, Jack Boon	t	\N
3563	Elizabeth	Smith	20854	1	esmith_25@esusdstudents.org	5	F	11	A206	Nichols, Nathan	Smith, Elizabeth Mackenzie	t	\N
2732	Genevieve	Dupee	20799	1	gdupee_27@esusdstudents.org	5	F	9	B100	Strawn, April	Dupee, Genevieve Charlotte	t	\N
3698	Emily	Dvi-Vardhana	15422	1	edvivardhana_24@esusdstudents.org	5	F	12	K101	Pagnucco, Pete V	Dvi-Vardhana, Emily Renee	t	\N
3699	Jonathan	Earley	16009	1	jearley_24@esusdstudents.org	5	M	12	K215	McDorman, Teresa	Earley, Jonathan	t	\N
3700	Amelia	Eastcott	19405	1	aeastcott_24@esusdstudents.org	5	F	12	K101	Pagnucco, Pete V	Eastcott, Amelia Sandrine	t	\N
3040	Grace	Espinoza	16701	1	gespinoza_26@esusdstudents.org	5	F	10	E101	DeLong, Megan	Espinoza, Grace Catherine	t	\N
3224	Jarrett	Sorbello	16650	1	jsorbello_26@esusdstudents.org	5	M	10	E102	Maye, Bonnie Michelle	Sorbello, Jarrett	t	\N
3360	Josh	Esquivel	16770	1	jesquivel_25@esusdstudents.org	5	M	11	R201	Turner, Jahid	Esquivel, Josh Fernando	t	\N
3896	Alessandra	Soto	18722	1	asoto_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	Soto, Alessandra Marie	t	\N
3579	Rhegan	Stubbs	21221	1	rstubbs_25@esusdstudents.org	5	F	11	A206	Nichols, Nathan	Stubbs, Rhegan Alyssa	t	\N
2915	Martina	Swiderski Mar	22930	1	mswiderskimar_27@esusdstudents.org	5	F	9	K207	Horvath, Daniel	Swiderski Mar, Martina	t	\N
3714	Aaron	Fernandez	20702	1	afernandez_24@esusdstudents.org	5	M	12	A208	Munger, Judith Ann	Fernandez, Aaron Eduardo	t	\N
2744	Nicole	Fitzpatrick	16643	1	nfitzpatrick_27@esusdstudents.org	5	F	9	K201	Kojima, Tyler	Fitzpatrick, Nicole	t	\N
3373	Sawyer	Foell	21630	1	sfoell_25@esusdstudents.org	5	M	11	A208	Munger, Judith Ann	Foell, Sawyer Laik	t	\N
3048	Connor	Fracisco	20482	1	cfracisco_26@esusdstudents.org	5	M	10	R201	Turner, Jahid	Fracisco, Connor Charles	t	\N
3909	Anthony	Temesvary	18949	1	atemesvary_24@esusdstudents.org	5	M	12	R202	Traber, William Jr.	Temesvary, Anthony Stephen	t	\N
3055	Julia	Galvan	22916	1	jgalvan_26@esusdstudents.org	5	F	10	K221	Bolanos, Erin	Galvan, Julia Madeline	t	\N
2929	Andrew	Tipton	21967	1	atipton_27@esusdstudents.org	5	M	9	Engineerin	Zwissler, Darwin	Tipton, Andrew James	t	\N
3727	Havana	Gerson	20727	1	hgerson_24@esusdstudents.org	5	F	12	A203	Whalen IV, James	Gerson, Havana Montgomery	t	\N
3384	Jameson	Gertsch	21501	1	jgertsch_25@esusdstudents.org	5	F	11	A206	Nichols, Nathan	Gertsch, Jameson Paige	t	\N
3237	Josephine	Topar	16654	1	jtopar_26@esusdstudents.org	5	F	10	K217	Turner, Lauren Alissa	Topar, Josephine Lynn	t	\N
3592	Dorothy	Troncoso	19517	1	dtroncoso_25@esusdstudents.org	5	F	11	K202	Barajas, Gerardo	Troncoso, Dorothy Sunshine	t	\N
3918	Malina	Valentino	20744	1	mvalentino_24@esusdstudents.org	5	F	12	A203	Whalen IV, James	Valentino, Malina Donatella	t	\N
3244	Jade	Van Kleeck	16819	1	jvankleeck_26@esusdstudents.org	5	F	10	K213	Mendoza, Manuel	Van Kleeck, Jade	t	\N
3066	Mason	Gonzalez	19833	1	mgonzalez_26@esusdstudents.org	5	M	10	K217	Turner, Lauren Alissa	Gonzalez, Mason	t	\N
3911	Mackenzie	Thompson	20683	1	mthompson_24@esusdstudents.org	5	M	12	A201	Gast, Craig Joseph	Thompson, Mackenzie Dillon	t	\N
3738	Melany	Gonzalez	19854	1	mgonzalez_24@esusdstudents.org	5	F	12	B202	Adams, Nicole	Gonzalez, Melany Matlide	t	\N
2759	Sophia	Gonzalez	20853	1	sgonzalez_27@esusdstudents.org	5	F	9	B203	O'Keefe, Amy Ann	Gonzalez, Sophia Ellianna	t	\N
3393	Nicholas	Gordon	21499	1	ngordon_25@esusdstudents.org	5	M	11	E105	Eastman, John James	Gordon, Nicholas Daniel	t	\N
3069	Isabella	Goulart	16659	1	igoulart_26@esusdstudents.org	5	F	10	R103	Moeller, Jill	Goulart, Isabella Mercedes	t	\N
3761	Conrad	Herring	14971	1	cherring_24@esusdstudents.org	5	M	12	K209	Bolanos, Marcos	Herring, Conrad Pembroke	t	\N
3744	Quinn	Gregory	15081	1	qgregory_24@esusdstudents.org	5	F	12	K215	McDorman, Teresa	Gregory, Quinn Leo	t	\N
3402	Ava	Gutierrez	21298	1	agutierrez_25@esusdstudents.org	5	F	11	A202	Gerber, Rachael Marci	Gutierrez, Ava Valenzuela	t	\N
3251	Greyson	Waldman	16190	1	gwaldman_26@esusdstudents.org	5	M	10	North Gym	Smith, Rainy	Waldman, Greyson Ford	t	\N
2773	Elena	Hammer	17451	1	ehammer_27@esusdstudents.org	5	F	9	R101	Hansen, Bjorn	Hammer, Elena Amelie	t	\N
2777	Sean	Helms	20593	1	shelms_27@esusdstudents.org	5	M	9	B100	Strawn, April	Helms, Sean James	t	\N
3084	Gabriella	Heredia	16712	1	gheredia_26@esusdstudents.org	5	F	10	K217	Turner, Lauren Alissa	Heredia, Gabriella Isabel	t	\N
3605	Kyle	Whalen	21649	1	kwhalen_25@esusdstudents.org	5	M	11	B101	Richmond, Ashley	Whalen, Kyle Daniel Hsing-Young	t	\N
3933	Sofia	Wheeler	15129	1	swheeler_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	Wheeler, Sofia Corie	t	\N
3764	Lucy	Hoffman	20729	1	lhoffman_24@esusdstudents.org	5	F	12	E100	Kadlec, Tamara	Hoffman, Lucy Rose	t	\N
3415	Shayne	Hopkins	15290	1	shopkins_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Hopkins, Shayne Ladd	t	\N
2786	Jaden	Huang	17457	1	jhuang_27@esusdstudents.org	5	M	9	Engineerin	Zwissler, Darwin	Huang, Jaden Samuel	t	\N
3129	Nicholas	Maffucci	22041	1	nmaffucci_26@esusdstudents.org	5	M	10			Maffucci, Nicholas Joseph	t	\N
3098	Olaoluwa	Jeboda	19735	1	ojeboda_26@esusdstudents.org	5	M	10	K213	Mendoza, Manuel	Jeboda, Olaoluwa Ayomikun Oluwagbemiga	t	\N
3427	Symai	Jones	21711	1	sjones_25@esusdstudents.org	5	F	11	B101	Richmond, Ashley	Jones, Symai London	t	\N
3428	Andrew Ryan	Jorge	19498	1	ajorge_25@esusdstudents.org	5	M	11	K213	Mendoza, Manuel	Jorge, Andrew Ryan Delgado	t	\N
3776	Josephine	Kaiman	20710	1	jkaiman_24@esusdstudents.org	5	F	12	K213	Mendoza, Manuel	Kaiman, Josephine Faye	t	\N
3105	Makena	Kelch	18087	1	mkelch_26@esusdstudents.org	5	F	10	K217	Turner, Lauren Alissa	Kelch, Makena Elisabeth	t	\N
2799	Brandon	Kim	20438	1	bkim_27@esusdstudents.org	5	M	9	South Gym	March, David	Kim, Brandon Minjoon	t	\N
3788	Maximilian	Kreuzriegler	18718	1	mkreuzriegler_24@esusdstudents.org	5	M	12	A204	Tacsik, Kyle	Kreuzriegler, Maximilian Figo	t	\N
3831	Lauren	Neely	16017	1	lneely_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	Neely, Lauren Isabella	t	\N
3440	Stevon	Kurniady	15929	1	skurniady_25@esusdstudents.org	5	F	11	R202	Traber, William Jr.	Kurniady, Stevon Jayden	t	\N
3495	Justin	Nguyen	18214	1	jnguyen_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Nguyen, Justin Tri	t	\N
3117	Alexandre	Larour-Debonneuil	18662	1	alarour-debonneui_26@esusdstudents.org	5	M	10	B205	Nieto Viteri, Grace	Larour-Debonneuil, Alexandre Jacques Didier	t	\N
2812	Bennett	Lee	18209	1	blee_27@esusdstudents.org	5	M	9	A210	Doering, Mark Edward	Lee, Bennett Isaiah	t	\N
3840	Alexander	Olmos	20915	1	aolmos_24@esusdstudents.org	5	M	12	B205	Nieto Viteri, Grace	Olmos, Alexander Gianni	t	\N
3456	John	Lozano	16904	1	jlozano_25@esusdstudents.org	5	M	11	K205	Glotz, Darin	Lozano, John Luke	t	\N
2858	Landon	Olsen	22007	1	lolsen_27@esusdstudents.org	5	M	9	R101	Hansen, Bjorn	Olsen, Landon Roy	t	\N
2824	Nathaniel	Macdonald	22463	1	nmacdonald_27@esusdstudents.org	5	M	9	K201	Kojima, Tyler	Macdonald, Nathaniel James	t	\N
3805	Jeremiah	Mark	18092	1	jmark_24@esusdstudents.org	5	M	12	E102	Maye, Bonnie Michelle	Mark, Jeremiah Jabulani	t	\N
3137	Miles	Mastrella	18058	1	mmastrella_26@esusdstudents.org	5	M	10	K221	Bolanos, Erin	Mastrella, Miles Yohanes	t	\N
3172	Isabella	Pardon	21818	1	ipardon_26@esusdstudents.org	5	F	10	C100	Kadonaga, Theresa M	Pardon, Isabella Leyla	t	\N
3468	Alexia	Mazzotta	21496	1	amazzotta_25@esusdstudents.org	5	F	11	B202	Adams, Nicole	Mazzotta, Alexia Yvette	t	\N
3508	Felicity	Patterson	22890	1	fpatterson_25@esusdstudents.org	5	F	11	K207	Horvath, Daniel	Patterson, Felicity Evon	t	\N
3813	Dani	McColgan	14839	1	dmccolgan_24@esusdstudents.org	5	F	12	R104	Summers, Gianna A	McColgan, Dani Kaye	t	\N
2837	Sullivan	McLaughlin	17530	1	smclaughlin_27@esusdstudents.org	5	F	9	B202	Adams, Nicole	McLaughlin, Sullivan Jean	t	\N
3151	Muhammad Saaiq	Mohamed Imtiaaz	20598	1	mmohamedimtiaaz_26@esusdstudents.org	5	M	10	A205	Brandlin, Amy	Mohamed Imtiaaz, Muhammad Saaiq	t	\N
3824	Iliana	Montenegro	20838	1	imontenegro_24@esusdstudents.org	5	F	12	K101	Pagnucco, Pete V	Montenegro, Iliana	t	\N
3516	Ryan	Pilkvist	15775	1	rpilkvist_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Pilkvist, Ryan James	t	\N
2868	Tikhon	Popov	20791	1	tpopov_27@esusdstudents.org	5	M	9	Engineerin	Zwissler, Darwin	Popov, Tikhon Dmitrievich	t	\N
3156	Kaia	Musalborn	21713	1	kmusalborn_26@esusdstudents.org	5	F	10	K103	Stern, Kimberly	Musalborn, Kaia Lia	t	\N
3857	Rachel	Preston	15436	1	rpreston_24@esusdstudents.org	5	F	12	K209	Bolanos, Marcos	Preston, Rachel Elizabeth	t	\N
3526	Nicolas	Rayburn	19527	1	nrayburn_25@esusdstudents.org	5	M	11	K202	Barajas, Gerardo	Rayburn, Nicolas Robert	t	\N
3872	Hallie	Reiss	21090	1	hreiss_24@esusdstudents.org	5	F	12	K215	McDorman, Teresa	Reiss, Hallie Alicia	t	\N
3368	Bennett	Fischer	19519	1	bfischer_25@esusdstudents.org	5	M	11	A202	Gerber, Rachael Marci	Fischer, Bennett Drissel	t	\N
3395	Carlie	Gottron	15898	1	cgottron_25@esusdstudents.org	5	F	11	K207	Horvath, Daniel	Gottron, Carlie Paige Palacio	t	\N
3452	Aiden	Lockett	19786	1	alockett_25@esusdstudents.org	5	M	11	R201	Turner, Jahid	Lockett, Aiden Bryce	t	\N
2661	Jordan	Acevedo Salazar	21349	1	jacevedosalazar_27@esusdstudents.org	5	M	9	A104	Sidwell, Glenn	Acevedo Salazar, Jordan Arimando	f	\N
6346	Randie	CortesTovar Artiga	58721	4	r.cortestovarart721@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	CortesTovar Artiga, Randie	f	\N
6347	Marjorie	Cruz Castro	59251	4	m.cruzcastro251@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Cruz Castro, Marjorie Stacy	f	\N
6348	Ricardo	Cruz Hernandez	58026	4	r.cruzhernandez026@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Cruz Hernandez, Ricardo Javier	f	\N
6349	Cesar	Cruz	59195	4	c.cruz195@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Cruz, Cesar Andrew	f	\N
6350	Valery	Cueva	58733	4	v.cueva733@cvuhsd.org	15	F	9	C-106	Howard Johnson, Crystal	Cueva, Valery Fiorela	f	\N
6351	Kenji	Dao	57799	4	k.dao799@cvuhsd.org	15	M	9	C-203	Duran, Dominic J	Dao, Kenji	f	\N
6352	Maurice	Davidson	59086	4	m.davidson086@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Davidson, Maurice Danny	f	\N
6353	Aiden	Davila Ramirez	58416	4	a.davilaramirez416@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Davila Ramirez, Aiden Jeremiah	f	\N
6354	Katie	De Leon	59087	4	k.deleon087@cvuhsd.org	15	F	9	L-201	Haynes, Cordell	De Leon, Katie Allani	f	\N
6355	Kenrie	De Leon	57843	4	k.deleon843@cvuhsd.org	15	M	9	C-203	Duran, Dominic J	De Leon, Kenrie Auriel	f	\N
6356	Emily	De Loera	58307	4	e.deloera307@cvuhsd.org	15	F	9	M-213	Morin, Jasmine	De Loera, Emily Nicole	f	\N
6357	Jesus	De Loera	59204	4	j.deloera204@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	De Loera, Jesus Omar	f	\N
6358	Fernanda	De Luis	57907	4	f.deluis907@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	De Luis, Fernanda	f	\N
6359	Ruby	Diaz	58398	4	r.diaz398@cvuhsd.org	15	F	9	K-202	Allen, Richard E	Diaz, Ruby Lynn	f	\N
6360	Benjamin	Dominguez	57978	4	b.dominguez978@cvuhsd.org	15	M	9	C-203	Duran, Dominic J	Dominguez, Benjamin Joseph	f	\N
6361	Jayden	Dorantes	57718	4	j.dorantes718@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Dorantes, Jayden Alexander	f	\N
6362	Oscar	Duarte Quintero	57665	4	o.duartequintero665@cvuhsd.org	15	M	9	L-103	Castillo, Amy	Duarte Quintero, Oscar Alberto	f	\N
6363	Jayland	Edwards	58260	4	j.edwards260@cvuhsd.org	15	M	9	F-106	Givens, Kathy E.	Edwards, Jayland Kesean	f	\N
6364	Jayden	English Boyd	57954	4	j.englishboyd954@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	English Boyd, Jayden Travon	f	\N
6365	Ruby	Escamilla	58343	4	r.escamilla343@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Escamilla, Ruby Gizelle	f	\N
6366	Iker	Esteban Ruballo	58317	4	i.estebanruballo317@cvuhsd.org	15	M	9	D-207	Gonzalez, Deborah A	Esteban Ruballo, Iker Ariel	f	\N
6367	Jacob	Estevez-Fuentes	57961	4	j.estevezfuentes961@cvuhsd.org	15	M	9	L-103	Castillo, Amy	Estevez-Fuentes, Jacob	f	\N
6368	Yaritza	Estrada Rendon	59185	4	y.estradarendon185@cvuhsd.org	15	F	9	C-203	Duran, Dominic J	Estrada Rendon, Yaritza	f	\N
6369	Noah	Evarts	58743	4	n.evarts743@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Evarts, Noah Marcel	f	\N
6370	Marvin	Eze	59304	4	m.eze304@cvuhsd.org	15	M	9	L-204	Ishii, Emily	Eze, Marvin Chizitelu	f	\N
6371	Valentina	Figueroa Loayza	59108	4	v.figueroaloayza108@cvuhsd.org	15	F	9	D-207	Gonzalez, Deborah A	Figueroa Loayza, Valentina Rosmery Miluska	f	\N
6372	Ibanez	Figueroa	58752	4	i.figueroa752@cvuhsd.org	15	M	9	L-204	Ishii, Emily	Figueroa, Ibanez Intal	f	\N
6373	Lilah	Floran	58753	4	l.floran753@cvuhsd.org	15	F	9	C-203	Duran, Dominic J	Floran, Lilah Caridad	f	\N
6374	Andrew	Flores	58479	4	a.flores479@cvuhsd.org	15	M	9	D-108	Infante Razo, Carlos	Flores, Andrew Erik	f	\N
6375	Haylee	Flowers	58756	4	h.flowers756@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Flowers, Haylee Lynn	f	\N
6376	Shanise	Frederick	58515	4	s.frederick515@cvuhsd.org	15	F	9	L-201	Haynes, Cordell	Frederick, Shanise Ericka	f	\N
6377	Steven	Frias	59164	4	s.frias164@cvuhsd.org	15	M	9	F-107	Rice, Christopher A.	Frias, Steven Edgar	f	\N
6378	Monica	Fuentes	58137	4	m.fuentes137@cvuhsd.org	15	F	9	L-103	Castillo, Amy	Fuentes, Monica Isabella	f	\N
6379	Luis	Galicia	58155	4	l.galicia155@cvuhsd.org	15	M	9	F-107	Rice, Christopher A.	Galicia, Luis Alberto	f	\N
6380	Richard	Gallegos Baez	57955	4	r.gallegosbaez955@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	Gallegos Baez, Richard Anthony	f	\N
6381	Isaiah	Gamboa	58881	4	i.gamboa881@cvuhsd.org	15	M	9	C-203	Duran, Dominic J	Gamboa, Isaiah Thomas	f	\N
6382	Alexa	Garcia	59109	4	a.garcia109@cvuhsd.org	15	F	9	K-115	Poland, Susan M.	Garcia, Alexa Gabriella	f	\N
6383	Chelsea	Garcia	57808	4	c.garcia808@cvuhsd.org	15	F	9	C-203	Duran, Dominic J	Garcia, Chelsea Elizabeth	f	\N
6384	Christopher	Garcia	58418	4	c.garcia418@cvuhsd.org	15	M	9	C-203	Duran, Dominic J	Garcia, Christopher Anthony	f	\N
6385	Iliana	Garcia	58108	4	i.garcia108@cvuhsd.org	15	F	9	M-213	Morin, Jasmine	Garcia, Iliana Elizabeth	f	\N
6386	Maviel	Garcia	57844	4	m.garcia844@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Garcia, Maviel	f	\N
6387	Ezequiel	Garcia-Camberos	57740	4	e.garciacamberos740@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Garcia-Camberos, Ezequiel	f	\N
6388	Moises	Giron	57956	4	m.giron956@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Giron, Moises Isai	f	\N
6389	Xavier	Godinez	57773	4	x.godinez773@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Godinez, Xavier Aiden	f	\N
6390	Jocelyn	Gomez	57991	4	j.gomez991@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Gomez, Jocelyn Roxanne	f	\N
6391	Lissy	Gomez	57609	4	l.gomez609@cvuhsd.org	15	F	9	J-112	Levine, Allison A	Gomez, Lissy Kamila	f	\N
6392	Andrew	Gomez-Fernandez	58854	4	a.gomezfernandez854@cvuhsd.org	15	M	9	J-112	Levine, Allison A	Gomez-Fernandez, Andrew	f	\N
6393	Josue	Gonzalez Leon	57686	4	j.gonzalezleon686@cvuhsd.org	15	M	9	C-203	Duran, Dominic J	Gonzalez Leon, Josue David	f	\N
6394	Nataly	Gonzalez Ruano	57957	4	n.gonzalezruano957@cvuhsd.org	15	F	9	C-106	Howard Johnson, Crystal	Gonzalez Ruano, Nataly Sophia	f	\N
6395	Analy	Gonzalez	58322	4	a.gonzalez322@cvuhsd.org	15	F	9	L-201	Haynes, Cordell	Gonzalez, Analy Isabel	f	\N
6396	Bethany	Gonzalez	58776	4	b.gonzalez776@cvuhsd.org	15	F	9	G-101	Galt, Douglas S	Gonzalez, Bethany	f	\N
6397	Charlie	Gonzalez	57728	4	c.gonzalez728@cvuhsd.org	15	M	9	C-203	Duran, Dominic J	Gonzalez, Charlie Dominick	f	\N
6398	Sarai	Gonzalez	57871	4	s.gonzalez871@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Gonzalez, Sarai	f	\N
6399	Yolanda	Gonzalez	58070	4	y.gonzalez070@cvuhsd.org	15	F	9	M-110	Segovia, Jose M	Gonzalez, Yolanda Lilie	f	\N
6400	Alyssa	Gordon-Harris	58911	4	a.gordonharris911@cvuhsd.org	15	F	9	C-106	Howard Johnson, Crystal	Gordon-Harris, Alyssa Kai	f	\N
6401	Bryant	Green	58131	4	b.green131@cvuhsd.org	15	M	9	C-203	Duran, Dominic J	Green, Bryant Charles Marshon	f	\N
6402	Aijalon	Griffin	58745	4	a.griffin745@cvuhsd.org	15	M	9	M-110	Segovia, Jose M	Griffin, Aijalon Rael	f	\N
6403	Julius	Guerra	59045	4	j.guerra045@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Guerra, Julius Cesar	f	\N
6404	Liliana	Guerra	58561	4	l.guerra561@cvuhsd.org	15	F	9	E-107	Takamoto, Jason K.	Guerra, Liliana Hazel	f	\N
6405	Abril	Guevara Duarte	59037	4	a.guevaraduarte037@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Guevara Duarte, Abril	f	\N
6406	Erick	Guevara	58855	4	e.guevara855@cvuhsd.org	15	M	9	L-204	Ishii, Emily	Guevara, Erick Dominick	f	\N
6407	Justin	Gutierrez	58186	4	j.gutierrez186@cvuhsd.org	15	M	9	M-117	Tarkington, Cole	Gutierrez, Justin Sergio	f	\N
6408	Aiden	Guzman	58482	4	a.guzman482@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Guzman, Aiden	f	\N
6409	Daniel	Guzman	58210	4	d.guzman210@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Guzman, Daniel	f	\N
6410	Natalia	Halleluyan	57687	4	n.halleluyan687@cvuhsd.org	15	F	9	M-110	Segovia, Jose M	Halleluyan, Natalia	f	\N
6411	Jordan	Hardwell	58780	4	j.hardwell780@cvuhsd.org	15	M	9	C-203	Duran, Dominic J	Hardwell, Jordan Christopher	f	\N
6412	Jaylen	Hearn	58857	4	j.hearn857@cvuhsd.org	15	M	9	F-106	Givens, Kathy E.	Hearn, Jaylen Michael	f	\N
6413	Raul	Hermosillo	58938	4	r.hermosillo938@cvuhsd.org	15	M	9	M-110	Segovia, Jose M	Hermosillo, Raul Jacob	f	\N
6414	Andrick	Hernandez Alvizo	58544	4	a.hernandezalviz544@cvuhsd.org	15	M	9	L-103	Castillo, Amy	Hernandez Alvizo, Andrick	f	\N
6415	Jaquelin	Hernandez Batres	58141	4	j.hernandezbatres141@cvuhsd.org	15	F	9	L-103	Castillo, Amy	Hernandez Batres, Jaquelin Julissa	f	\N
6416	Abel	Hernandez Espinoza	58728	4	a.hernandezespin728@cvuhsd.org	15	M	9	C-106	Howard Johnson, Crystal	Hernandez Espinoza, Abel Sebastian	f	\N
6417	Valdemar	Hernandez Garcia	57908	4	v.hernandezgarcia908@cvuhsd.org	15	M	9	M-213	Morin, Jasmine	Hernandez Garcia, Valdemar	f	\N
6418	Alexander	Hernandez	57614	4	a.hernandez614@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Hernandez, Alexander Damian	f	\N
6419	Alexandra	Hernandez	57862	4	a.hernandez862@cvuhsd.org	15	F	9	C-203	Duran, Dominic J	Hernandez, Alexandra Danielle	f	\N
6420	Daniel	Hernandez	58729	4	d.hernandez729@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Hernandez, Daniel Silvano	f	\N
6421	Diego	Hernandez	57952	4	d.hernandez952@cvuhsd.org	15	M	9	M-213	Morin, Jasmine	Hernandez, Diego Giovanni	f	\N
6422	Jocelyn	Hernandez	57775	4	j.hernandez775@cvuhsd.org	15	F	9	K-105	Gonzalez, Alejandra	Hernandez, Jocelyn Hilaria	f	\N
6423	Julianna	Hernandez	59151	4	j.hernandez151@cvuhsd.org	15	F	9	L-102	Farkouh, Raphael M.	Hernandez, Julianna Itzel	f	\N
6424	Kylique	Hernandez	59152	4	k.hernandez152@cvuhsd.org	15	M	9	M-213	Morin, Jasmine	Hernandez, Kylique	f	\N
6425	Vanessa	Hernandez	58282	4	v.hernandez282@cvuhsd.org	15	F	9	E-107	Takamoto, Jason K.	Hernandez, Vanessa	f	\N
6426	Vivian	Hernandez	57613	4	v.hernandez613@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Hernandez, Vivian	f	\N
6427	Diego	Hernandez-Cortes	58344	4	d.hernandezcortes344@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Hernandez-Cortes, Diego Alberto	f	\N
6428	Brianna	Herrera	57847	4	b.herrera847@cvuhsd.org	15	F	9	L-201	Haynes, Cordell	Herrera, Brianna Grace	f	\N
6429	Embree	Herrera	58793	4	e.herrera793@cvuhsd.org	15	F	9	J-112	Levine, Allison A	Herrera, Embree Nevae	f	\N
6430	Abigail	Hoffman	58410	4	a.hoffman410@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Hoffman, Abigail Isabella	f	\N
6431	Darnell	Holyfield	57910	4	d.holyfield910@cvuhsd.org	15	M	9	J-118	Gray, Ron	Holyfield, Darnell Milton	f	\N
6432	Krystal	Hurtado	58999	4	k.hurtado999@cvuhsd.org	15	F	9	M-213	Morin, Jasmine	Hurtado, Krystal Heidi	f	\N
6433	Omoye	Iyoha	58252	4	o.iyoha252@cvuhsd.org	15	F	9	M-110	Segovia, Jose M	Iyoha, Omoye Itanhan	f	\N
6434	Raquel	Jacobo Campos	58414	4	r.jacobocampos414@cvuhsd.org	15	F	9	C-106	Howard Johnson, Crystal	Jacobo Campos, Raquel	f	\N
6435	Andrew	Jacobo Jimenez	58997	4	a.jacobojimenez997@cvuhsd.org	15	M	9	M-110	Segovia, Jose M	Jacobo Jimenez, Andrew	f	\N
6436	Emmanuel	Jaime	58188	4	e.jaime188@cvuhsd.org	15	M	9	J-118	Gray, Ron	Jaime, Emmanuel Anthony	f	\N
6437	Valeria	Jaimez	57832	4	v.jaimez832@cvuhsd.org	15	F	9	L-201	Haynes, Cordell	Jaimez, Valeria	f	\N
6438	Aubrey	Johnson	58564	4	a.johnson564@cvuhsd.org	15	F	9	M-118	Aguilar Hernandez, Leslie	Johnson, Aubrey Samaria	f	\N
6439	Israel	Johnson	57671	4	i.johnson671@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Johnson, Israel Elijah	f	\N
6440	D'Manni	Jones	57941	4	d.jones941@cvuhsd.org	15	M	9	D-108	Infante Razo, Carlos	Jones, D'Manni Darion	f	\N
6441	Marqueis	Jones	58715	4	m.jones715@cvuhsd.org	15	M	9	C-106	Howard Johnson, Crystal	Jones, Marqueis Grandee	f	\N
6442	Mia	Jones	59110	4	m.jones110@cvuhsd.org	15	F	9	J-105	Bowman, Lauren C.	Jones, Mia Aaliyah	f	\N
6443	Zsakiyah	Jordan	59091	4	z.jordan091@cvuhsd.org	15	F	9	K-105	Gonzalez, Alejandra	Jordan, Zsakiyah Nyomi	f	\N
6444	Bryan	Juan	59290	4	b.juan290@cvuhsd.org	15	M	9	F-106	Givens, Kathy E.	Juan, Bryan Alexander	f	\N
6445	Leslie	Juarez	58545	4	l.juarez545@cvuhsd.org	15	F	9	M-213	Morin, Jasmine	Juarez, Leslie Fernanda	f	\N
7951	Sinai	Abarca	59077	8	s.abarca077@cvuhsd.org	13	F	9	G-203	Torres, Walter	Abarca. Sinai	f	\N
7952	Rhyan	Abrica	57766	8	r.abrica766@cvuhsd.org	13	M	9	G-105	Yorizane, Traci	Abrica, Rhyan	f	\N
7953	Ibrahim	Abusalah	58200	8	i.abusalah200@cvuhsd.org	13	M	9	G-212	Harris, Annette	Abusalah, Ibrahim Kamal	f	\N
7954	Olger	Acevedo	58176	8	o.acevedo176@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Acevedo, Olger Romeo	f	\N
7955	Luis	Aguirre Oajaca	58313	8	l.aguirreoajaca313@cvuhsd.org	13	M	9	G-107	Lopez, Maria	Aguirre Oajaca, Luis Fernando	f	\N
7956	Jonathan	Ake	59050	8	j.ake050@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Ake, Jonathan Alexander	f	\N
7957	Ifunanya	Alamah	59126	8	i.alamah126@cvuhsd.org	13	F	9	G-203	Torres, Walter	Alamah, Ifunanya Gabrielle	f	\N
7959	Lander	Alarcon Talavera	59070	8	l.alarcontalaver070@cvuhsd.org	13	M	9	GYM 1	Miller, David L	Alarcon Talavera, Lander Yunerling	f	\N
7960	Nathan	Alarcon	58958	8	n.alarcon958@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Alarcon, Nathan Alexander	f	\N
7961	Carolina	Alas	58595	8	c.alas595@cvuhsd.org	13	F	9	G-107	Lopez, Maria	Alas, Carolina Nicole	f	\N
7962	Stephany	Alfaro Alvarez	57794	8	s.alfaroalvarez794@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Alfaro Alvarez, Stephany Rubi	f	\N
7963	Gustavo	Aliaga Cabrejos	59107	8	g.aliagacabrejos107@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Aliaga Cabrejos, Gustavo Alexis	f	\N
7964	Michael	Allen Jr	58381	8	m.allenjr381@cvuhsd.org	13	M	9	G-212	Harris, Annette	Allen Jr, Michael Lavell	f	\N
7965	Sahrenitee	Allen-Jordan	58693	8	s.allenjordan693@cvuhsd.org	13	F	9	H-201	Teichmann, Thomas E.	Allen-Jordan. Sahrenitee My'Angel Michelle	f	\N
7966	Anthony	Alonzo	57997	8	a.alonzo997@cvuhsd.org	13	M	9	D-203	Haefner, Kevin L.	Alonzo, Anthony Josue	f	\N
7967	George	Alonzo	58025	8	g.alonzo025@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Alonzo, George Anselmo	f	\N
7958	Alvaro	Alarcon Chuga	58170	8	a.alarconchuga170@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Alarcon Chuga, Alvaro Rolando	t	\N
7968	Xavier	Altoville	58391	8	x.altoville391@cvuhsd.org	13	M	9	D-203	Haefner, Kevin L.	Altoville, Xavier Onyekachukwu	f	\N
7970	Taida	Alvarez Villavicencio	58078	8	t.alvarezvillavic078@cvuhsd.org	13	F	9	G-101	Mehta, Anand G	Alvarez Villavicencio, Taida Patricia	f	\N
7973	Jose	Amador Perez	57898	8	j.amadorperez898@cvuhsd.org	13	M	9	D-203	Haefner, Kevin L.	Amador Perez, Jose Manuel JR	f	\N
7974	Nyomi	Amaya Reyes	58181	8	n.amayareyes181@cvuhsd.org	13	F	9	H-203	Rojas, Miguel Sr.	Amaya Reyes, Nyomi Samantha	f	\N
7975	Azul	Anaya	58787	8	a.anaya787@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Anaya, Azul Celeste	f	\N
7976	Andres	Andrade	58597	8	a.andrade597@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Andrade, Andres	f	\N
7977	Arianna	Apisala	58534	8	a.apisala534@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Apisala, Arianna Nadine	f	\N
7978	Caleb	Aquino	58789	8	c.aquino789@cvuhsd.org	13	M	9	G-101	Mehta, Anand G	Aquino, Caleb	f	\N
7979	Ryder	Arango	58912	8	r.arango912@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Arango, Ryder Bobby	f	\N
7980	Atziri	Araux	58069	8	a.araux069@cvuhsd.org	13	F	9	E-103	Talbott, Jose	Araux, Atziri Andrea	f	\N
7981	Allison	Arguelles Castaneda	57962	8	a.arguellescastan962@cvuhsd.org	13	F	9	G-111	Romo, Jose A.	Arguelles Castaneda, Allison Adonay	f	\N
7982	Cesar	Argueta Crespin	58492	8	c.arguetacrespin492@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Argueta Crespin, Cesar David	f	\N
7983	Allyson	Argujo	57785	8	a.argujo785@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Argujo, Allyson Sonia	f	\N
7984	Helen	Arias Segura	59273	8	h.ariassegura273@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Arias Segura, Helen Yireth	f	\N
7985	Marian	Ariza Pote	58771	8	m.arizapote771@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Ariza Pote, Marian Ximena	f	\N
7986	Carolina	Arredondo	57795	8	c.arredondo795@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Arredondo, Carolina Julia Francisca	f	\N
7988	Benjamin	Arteaga	57796	8	b.arteaga796@cvuhsd.org	13	M	9	G-107	Lopez, Maria	Arteaga, Benjamin	f	\N
7990	Aiden	Atondo	59098	8	a.atondo098@cvuhsd.org	13	M	9	D-107	Williams, Sherrevia A	Atondo, Aiden Andrew	f	\N
7991	Darion	Autrey	58383	8	d.autrey383@cvuhsd.org	13	F	9	E-103	Talbott, Jose	Autrey, Darion Claudette	f	\N
7992	Vanessa	Avalos	58019	8	v.avalos019@cvuhsd.org	13	F	9	G-212	Harris, Annette	Avalos, Vanessa Alejandra	f	\N
7993	Sailena	Avendano	58578	8	s.avendano578@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Avendano, Sailena Andrismar	f	\N
7994	Anabel	Ayala	58241	8	a.ayala241@cvuhsd.org	13	F	9	G-212	Harris, Annette	Ayala, Anabel Katelyn	f	\N
7995	Taylor	Baker	58535	8	t.baker535@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Baker,Taylor Dionne	f	\N
7997	Jazabel	Barajas	58608	8	j.barajas608@cvuhsd.org	13	F	9	G-203	Torres, Walter	Barajas, Jazabel	f	\N
7999	Rahel	Basta	57905	8	r.basta905@cvuhsd.org	13	F	9	G-101	Komatsu, Chase	Basta, Rahel Botros	f	\N
8000	Paola	Bautista	58385	8	p.bautista385@cvuhsd.org	13	F	9	G-107	Lopez, Maria	Bautista, Paola	f	\N
8001	Raysean	Bean	58978	8	r.bean978@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Bean, Raysean Joshua	f	\N
8002	Anthony	Becerra Magallon	58341	8	a.becerramagallon341@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Becerra Magallon, Anthony	f	\N
8003	Jorge	Becerra	58803	8	j.becerra803@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Becerra, Jorge Alejandro	f	\N
8004	Kynadee	Bell	58118	8	k.bell118@cvuhsd.org	13	F	9	G-109	Miranda, Denisse	Bell, Kynadee Elise	f	\N
8006	Kyle	Bias	59221	8	k.bias221@cvuhsd.org	13	M	9	A-201	Salgado, Efrain	Bias, Kyle Deandre Armon	f	\N
8007	Ty'Iana	Boatner	58538	8	t.boatner538@cvuhsd.org	13	F	9	D-203	Haefner, Kevin L.	Boatner, Ty'Iana Mary- Nevaeh-Myjoi	f	\N
8008	Zion	Borders	59079	8	z.borders079@cvuhsd.org	13	M	9	G-203	Torres, Walter	Borders, Zion Reginal	f	\N
8009	Rashad	Brooks	57853	8	r.brooks853@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Brooks, Rashad Larenz	f	\N
8010	Kelis	Browne	58696	8	k.browne696@cvuhsd.org	13	F	9	G-203	Torres, Walter	Browne, Kelis Aunya	f	\N
8012	Natalie	Cabrera	58204	8	n.cabrera204@cvuhsd.org	13	F	9	G-212	Harris, Annette	Cabrera, Natalie Isabella	f	\N
8013	Joe	Calderon Sanchez	58258	8	j.calderonsanchez258@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Calderon Sanchez, Joe Smart	f	\N
8014	Anderson	Calles	58314	8	a.calles314@cvuhsd.org	13	M	9	D-203	Haefner, Kevin L.	Calles, Anderson Ernesto	f	\N
8015	Andrew	Campuzano	58394	8	a.campuzano394@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Campuzano, Andrew Anthony	f	\N
8016	Alexander	Cardenas	57922	8	a.cardenas922@cvuhsd.org	13	M	9	G-107	Lopez, Maria	Cardenas, Alexander	f	\N
8017	Gabriel	Cardenas	59212	8	g.cardenas212@cvuhsd.org	13	M	9	G-101	Mehta, Anand G	Cardenas, Gabriel Alfonso	f	\N
8018	Jhon	Carloves	59022	8	j.carloves022@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Carloves, Jhon Fabrisio	f	\N
7969	Alexander	Alvarenga	59169	8	a.alvarenga169@cvuhsd.org	13	M	9	F-102	Massey-Sloan, Patricia A	Alvarenga, Alexander Aiden	t	\N
7996	Emylee	Barahona	57710	8	e.barahona710@cvuhsd.org	13	F	9	F-102	Massey-Sloan, Patricia A	Barahona, Emylee Aileen	t	\N
8011	Jorge	Caballero	59081	8	j.caballero081@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Caballero, Jorge	t	\N
8005	Daniel	Berryman Jr.	58952	8	d.berrymanjr.952@cvuhsd.org	13	M	9	G-203	Torres, Walter	Berryman Jr, .Daniel Lee	t	\N
7987	Andrew	Arreola Barrios	58599	8	a.arreolabarrios599@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Arreola Barrios, Andrew Ernesto	t	\N
7971	Isaac	Alvarez	57767	8	i.alvarez767@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Alvarez, Isaac Alexander	t	\N
7972	Sebastian	Alvarez	58218	8	s.alvarez218@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Alvarez, Sebastian	t	\N
7998	Alex	Barrera	58898	8	a.barerra898@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Barrera, Alex	t	\N
8019	Nikol	Caro Quitian	58622	8	n.caro622@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Caro Quitian, Nikol Valeria	f	\N
8020	Jared	Carrera Gonzales	58243	8	j.carreragonzales243@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Carrera Gonzales, Jared Fernando	f	\N
8021	Genesis	Carrera Rodriguez	57906	8	g.carrerarodrigue906@cvuhsd.org	13	F	9	G-212	Harris, Annette	Carrera Rodriguez, Genesis Desiree	f	\N
8023	Emily	Castilla	59132	8	e.castilla132@cvuhsd.org	13	F	9	G-203	Torres, Walter	Castilla, Emily Anai	f	\N
8024	Valerie	Castilla	58395	8	v.castilla395@cvuhsd.org	13	F	9	G-101	Komatsu, Chase	Castilla, Valerie Marie	f	\N
8025	Michelle	Catalan	57999	8	m.catalan999@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Catalan, Michelle	f	\N
8026	Sophia	Ceja	57842	8	s.ceja842@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Ceja, Sophia Gisele	f	\N
8027	Isabella	Cervantes Jimenez	58304	8	i.cervantesjimene304@cvuhsd.org	13	F	9	G-104	Mccoy, Bert L	Cervantes Jimenez, Isabella Priscilla	f	\N
8028	Genesis	Cervantes	58553	8	g.cervantes553@cvuhsd.org	13	F	9	G-101	Komatsu, Chase	Cervantes, Genesis Amanda	f	\N
8029	Natalia	Cervantes	58625	8	n.cervantes625@cvuhsd.org	13	F	9	G-203	Torres, Walter	Cervantes, Natalia Aubrey	f	\N
8031	Andy	Chavez	57982	8	a.chavez982@cvuhsd.org	13	M	9	A-201	Salgado, Efrain	Chavez, Andy Alejandro	f	\N
8032	Jacqueline	Chavez	58878	8	j.chavez878@cvuhsd.org	13	F	9	H-203	Rojas, Miguel Sr.	Chavez, Jacqueline Nicole	f	\N
8033	Nathaniel	Chavez	57724	8	n.chavez724@cvuhsd.org	13	M	9	G-212	Harris, Annette	Chavez, Nathaniel Lucifer	f	\N
8034	Sebastian	Chavez	58580	8	s.chavez580@cvuhsd.org	13	M	9	G-203	Torres, Walter	Chavez, Sebastian	f	\N
8035	Sophia	Chavez	58058	8	s.chavez058@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Chavez, Sophia Elena	f	\N
8037	Logan	Clay	59021	8	l.clay021@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Clay, Logan Daniel	f	\N
8038	Heaven	Clipper	58539	8	h.clipper539@cvuhsd.org	13	F	9	G-203	Torres, Walter	Clipper, Heaven Lanette	f	\N
8039	Lindsey	Cobon Rodriguez	58279	8	l.cobonrodriguez279@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Cobon Rodriguez, Lindsey Janelle	f	\N
8040	Arianna	Cole	59287	8	a.cole287@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Cole, Arianna Valerie	f	\N
8041	Esteban	Constanza Pineda	57923	8	e.constanzapineda923@cvuhsd.org	13	M	9	G-101	Mehta, Anand G	Constanza Pineda, Esteban Antonio	f	\N
8042	Amy	Contreras	57854	8	a.contreras854@cvuhsd.org	13	F	9	H-203	Rojas, Miguel Sr.	Contreras, Amy Nicole	f	\N
8043	Jahmeer	Coombs	58931	8	j.coombs931@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Coombs, Jahmeer Sameer	f	\N
8044	Jeymi	Cornejo Chiu	58506	8	j.cornejochiu506@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Cornejo Chiu, Jeymi Giordany	f	\N
8046	Aaron	Cortes Pina	58064	8	a.cortespina064@cvuhsd.org	13	M	9	GYM 4	Whitt, James	Cortes Pina, Aaron Guadalupe	f	\N
8047	Naithan	Cortes	58719	8	n.cortes719@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Cortes, Naithan Brandon	f	\N
8048	Stephanee	Cortez	58558	8	s.cortez558@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Cortez, Stephanee Adriana	f	\N
8050	Shawn	Crawford	59018	8	s.crawford018@cvuhsd.org	13	M	9	G-104	Mccoy, Bert L	Crawford, Shawn Katie	f	\N
8051	Belen	Cristobal Cruz	57711	8	b.cristobalcruz711@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Cristobal Cruz, Belen	f	\N
8052	Aaron	Cruz Parraguirre	58730	8	a.cruzparraguirr730@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Cruz Parraguirre, Aaron	f	\N
8053	Caleb	Cruz Perez	58731	8	c.cruzperez731@cvuhsd.org	13	M	9	G-107	Lopez, Maria	Cruz Perez, Caleb Elijah	f	\N
8054	Andrew	Cruz	58992	8	a.cruz992@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Cruz, Andrew Jose	f	\N
8055	Antonio	Cruz	58966	8	a.cruz966@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Cruz, Antonio Miguel	f	\N
8056	Joshua	Cruz	58818	8	j.cruz818@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Cruz, Joshua Israel	f	\N
8057	Olivia	Cunanan	57769	8	o.cunanan769@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Cunanan, Olivia Janelle	f	\N
8060	Sashay	Dawson	58259	8	s.dawson259@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Dawson, Sashay Ezzah	f	\N
8061	Alfonso	De Jesus-Ramirez	58359	8	a.dejesusramirez359@cvuhsd.org	13	M	9	D-203	Haefner, Kevin L.	De Jesus-Ramirez, Alfonso	f	\N
8063	Milca	De Leon Barrios	58055	8	m.deleonbarrios055@cvuhsd.org	13	M	9	G-107	Lopez, Maria	De Leon Barrios, Milca Magaly	f	\N
8064	Damien	Delgado	58205	8	d.delgado205@cvuhsd.org	13	M	9	G-212	Harris, Annette	Delgado, Damien Rigoberto	f	\N
8065	Siria	Dempkey-Hernandez	58360	8	s.dempkeyhernande360@cvuhsd.org	13	F	9	D-203	Haefner, Kevin L.	Dempkey-Hernandez, Siria Nadeem	f	\N
8066	Josept	Diaz Sanchez	58984	8	j.diazsanchez984@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Diaz Sanchez, Josept Matias	f	\N
8067	Laritza	Dimas Gonzalez	58194	8	l.dimasgonzalez194@cvuhsd.org	13	X	9	G-212	Harris, Annette	Dimas Gonzalez, Laritza Diana	f	\N
8068	Brian	Dircio	58399	8	b.dircio399@cvuhsd.org	13	M	9	G-105	Yorizane, Traci	Dircio, Brian	f	\N
8069	Royal	Distin	58136	8	r.distin136@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Distin, Royal Reign	f	\N
8058	Raemond	Datts	59099	8	r.datts099@cvuhsd.org	13	F	9	G-101	Komatsu, Chase	Datts, Raemond Goldie	t	\N
8062	Anthony	De La Rosa	58865	8	a.delarosa865@cvuhsd.org	13	M	9	G-107	Lopez, Maria	De La Rosa, Anthony	t	\N
8036	Rayan	Chic	58505	8	r.chic505@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Chic, Rayan	t	\N
8059	Susana	Davalos	57804	8	s.davalos804@cvuhsd.org	13	F	9	H-203	Rojas, Miguel Sr.	Davalos, Susana	t	\N
8049	Antonio	Cotto	57870	8	a.cotto870@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Cotto, Antonio Manuel	t	\N
8030	Yaneth	Chavez Medina	58297	8	y.chavezmedina297@cvuhsd.org	13	F	9	G-107	Lopez, Maria	Chavez Medina, Yaneth	t	\N
8071	Denisse	Dominguez Dominguez	58943	8	d.dominguezdomin943@cvuhsd.org	13	F	9	G-107	Lopez, Maria	Dominguez Dominguez, Denisse	f	\N
8072	Kor'van	Dowdell	59135	8	k.dowdell135@cvuhsd.org	13	F	9	G-109	Miranda, Denisse	Dowdell, Kor'van Shiann	f	\N
8074	Evelyn	Echeverria Favela	58401	8	e.echeverriafave401@cvuhsd.org	13	F	9	B-1	Cassio, Michael J.	Echeverria Favela, Evelyn Marian	f	\N
8075	Favour	Ehirim-Onyema	58387	8	f.ehirimonyema387@cvuhsd.org	13	F	9	A-201	Salgado, Efrain	Ehirim-Onyema, Favour Somtochukwu	f	\N
8076	Steven	Ellis Jr	58532	8	s.ellisjr532@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Ellis Jr, Steven Elijah	f	\N
8077	Destiny	Emeruwa	57643	8	d.emeruwa643@cvuhsd.org	13	F	9	E-103	Talbott, Jose	Emeruwa, Destiny Chizaram	f	\N
8078	Benjamin	Espinosa	58976	8	b.espinosa976@cvuhsd.org	13	M	9	B-1	Cassio, Michael J.	Espinosa, Benjamin Ismael	f	\N
8080	Pedro	Espinoza	58280	8	p.espinoza280@cvuhsd.org	13	M	9	G-107	Lopez, Maria	Espinoza, Pedro	f	\N
8081	Ana	Estevez Catarino	57666	8	a.estevezcatarino666@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Estevez Catarino, Ana Gabriela	f	\N
8083	Deon	Evins Jr	58217	8	d.evinsjr217@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Evins Jr, Deon Terrell	f	\N
8084	Zion	Eze	57736	8	z.eze736@cvuhsd.org	13	M	9	G-203	Young, Royale	Eze, Zion David	f	\N
8085	Munachimso	Ezeh	57737	8	m.ezeh737@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Ezeh, Munachimso Michelle	f	\N
8086	Peter	Fakatoumafi	58402	8	p.fakatoumafi402@cvuhsd.org	13	M	9	G-203	Torres, Walter	Fakatoumafi, Peter Moala Giacomo	f	\N
8087	Jamaal	Fay	58498	8	j.fay498@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Fay, Jamaal Adayah	f	\N
8089	Ryan	Ferguson Jr	58319	8	r.ferguson319@cvuhsd.org	13	M	9	D-203	Haefner, Kevin L.	Ferguson Jr, Ryan Jamaal	f	\N
8090	Ane	Fifita	57771	8	a.fifita771@cvuhsd.org	13	F	9	E-103	Talbott, Jose	Fifita, Ane Petiola	f	\N
8094	Israel	Flores	58754	8	i.flores754@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Flores, Israel Angel	f	\N
8095	Jason	Flores	58362	8	j.flores362@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Flores, Jason  Xavier	f	\N
8096	Kaitlyn	Flores	58361	8	k.flores361@cvuhsd.org	13	M	9	G-212	Harris, Annette	Flores, Kaitlyn	f	\N
8097	Serenity	Flores	58175	8	s.flores175@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Flores, Serenity Marie	f	\N
8098	Eliezer	Florian	57807	8	e.florian807@cvuhsd.org	13	M	9	D-204	Bravo, Ronald J	Florian, Eliezer Fernando	f	\N
8100	Jessenia	Franco Vazquez	58020	8	j.francovazquez020@cvuhsd.org	13	F	9	G-101	Mehta, Anand G	Franco Vazquez, Jessenia Sidney	f	\N
8101	Tra'von	Franks	58760	8	t.franks760@cvuhsd.org	13	M	9	F-102	Massey-Sloan, Patricia A	Franks, Tra'von La'Van	f	\N
8102	Elliott	Freire	58942	8	e.freire942@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Freire, Elliott Thomas	f	\N
8103	Paul	Fry III	59100	8	p.fryiii100@cvuhsd.org	13	M	9	D-204	Bravo, Ronald J	Fry III, Paul Eugene	f	\N
8104	Victor-Cesar	Galaviz	58763	8	v.galaviz763@cvuhsd.org	13	M	9	F-102	Massey-Sloan, Patricia A	Galaviz, Victor-Cesar Manuel	f	\N
8105	Milan	Gallardo Carpenter	58248	8	m.gallardocarpent248@cvuhsd.org	13	F	9	H-203	Rojas, Miguel Sr.	Gallardo Carpenter, Milan Amari	f	\N
8106	Dorian	Gallardo-Ortega	58305	8	d.gallardoortega305@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Gallardo-Ortega, Dorian David	f	\N
8107	Enrique	Galvan	59187	8	e.galvan187@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Galvan, Enrique Adrian	f	\N
8109	Marvin	Garcia Gutierrez	58028	8	m.garciagutierrez028@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Garcia Gutierrez, Marvin Omar	f	\N
8110	Carlos	Garcia Martinez	58281	8	c.garciamartinez281@cvuhsd.org	13	M	9	G-107	Lopez, Maria	Garcia Martinez, Carlos Jhovany	f	\N
8111	Emma	Garcia Orellana	57685	8	e.garciaorellana685@cvuhsd.org	13	F	9	G-107	Lopez, Maria	Garcia Orellana, Emma Marcela	f	\N
8112	Dariel	Garcia Vera	58788	8	d.garciavera788@cvuhsd.org	13	M	9	G-111	Romo, Jose A.	Garcia Vera, Dariel Mateo	f	\N
8115	Jesus	Garcia	59240	8	j.garcia240@cvuhsd.org	13	M	9	G-104	Mccoy, Bert L	Garcia, Jesus	f	\N
8118	Karla	Garcia	58390	8	k.garcia390@cvuhsd.org	13	F	9	D-203	Haefner, Kevin L.	Garcia, Karla Magaly	f	\N
8070	Marely	Dolores Rosendo	58400	8	m.doloresrosendo400@cvuhsd.org	13	F	9	H-201	Teichmann, Thomas E.	Dolores Rosendo, Marely	t	\N
8113	Brandon	Garcia	59174	8	b.garcia174@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Garcia, Brandon	t	\N
8091	Adrion	Finley	58403	8	a.finley403@cvuhsd.org	13	M	9	F-102	Massey-Sloan, Patricia A	Finley, Adrion Antoine	t	\N
8082	Jencarlo	Estrada Melgar	58388	8	j.estradamelgar388@cvuhsd.org	13	M	9	F-102	Massey-Sloan, Patricia A	Estrada Melgar, Jencarlo	t	\N
8088	Kara	Feldman	58389	8	k.feldman389@cvuhsd.org	13	F	9	G-203	Torres, Walter	Feldman, Kara Jazmin	t	\N
8119	Nuvia	Garcia	59101	8	n.garcia101@cvuhsd.org	13	F	9	G-104	Mccoy, Bert L	Garcia, Nuvia	t	\N
8114	Bryanna	Garcia	57809	8	b.garcia809@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Garcia, Bryanna	t	\N
8099	Isaiah	Foreman	58758	8	i.foreman758@cvuhsd.org	13	M	9	G-203	Young, Royale	Foreman, Isaiah Lamar	t	\N
8073	Troy	Duran Simon Casanova	58734	8	t.duransimoncasa734@cvuhsd.org	13	M	9	G-104	Mccoy, Bert L	Duran Simon Casanova, Troy Luigi	t	\N
8117	Jorge	Garcia	58301	8	j.garcia301@cvuhsd.org	13	M	9	G-105	Yorizane, Traci	Garcia, Jorge Javier	t	\N
8108	Allison	Galvez	58320	8	a.galvez320@cvuhsd.org	13	F	9	F-102	Massey-Sloan, Patricia A	Galvez, Allison Abril	t	\N
8093	Daniel	Flores	57772	8	d.flores772@cvuhsd.org	13	M	9	G-212	Harris, Annette	Flores, Daniel	t	\N
8120	Hailey	Gil	57883	8	h.gil883@cvuhsd.org	13	F	9	G-109	Miranda, Denisse	Gil, Hailey	t	\N
8079	Natalie	Espinoza Del Cid	58316	8	n.espinozadelcid316@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Espinoza Del Cid, Natalie Dailite	t	\N
8121	Andrew	Giron	58766	8	a.giron766@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Giron, Andrew Leonel	f	\N
8122	Isabela	Godoy-Guevara	58227	8	i.godoy227@cvuhsd.org	13	F	9	H-203	Rojas, Miguel Sr.	Godoy-Guevara, Isabela Maryluz	f	\N
8123	Roberto	Gomez Polanco	57742	8	r.gomezpolanco742@cvuhsd.org	13	M	9	D-107	Williams, Sherrevia A	Gomez Polanco, Roberto Carlos	f	\N
8125	Erickson	Gomez	57741	8	e.gomez741@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Gomez, Erickson Daniel	f	\N
8126	Javier	Gomez	57610	8	j.gomez610@cvuhsd.org	13	M	9	G-101	Komatsu, Chase	Gomez, Javier	f	\N
8128	Clara	Gonzales Mendoza	58249	8	c.gonzalesmendoza249@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Gonzales Mendoza, Clara Valentina	f	\N
8129	Genesis	Gonzalez Castro	57936	8	g.gonzalezcastro936@cvuhsd.org	13	F	9	G-212	Harris, Annette	Gonzalez Castro, Genesis Anahi	f	\N
8130	Adrian	Gonzalez Morales	58748	8	a.gonzalezmorale748@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Gonzalez Morales, Adrian Damian	f	\N
8131	Adan	Gonzalez	58269	8	a.gonzalez269@cvuhsd.org	13	M	9	G-111	Romo, Jose A.	Gonzalez, Adan Arturo	f	\N
8132	Bryan	Gonzalez	58775	8	b.gonzalez775@cvuhsd.org	13	M	9	G-203	Torres, Walter	Gonzalez, Bryan Cisco	f	\N
8133	Elyssa	Gonzalez	58152	8	e.gonzalez152@cvuhsd.org	13	F	9	E-103	Talbott, Jose	Gonzalez, Elyssa Marie	f	\N
8134	Giuliana	Gonzalez	57650	8	g.gonzalez650@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Gonzalez, Giuliana Dyan	f	\N
8135	Grisel	Gonzalez	57872	8	g.gonzalez872@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Gonzalez, Grisel Edith	f	\N
8136	Izabella	Gonzalez	58541	8	i.gonzalez541@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Gonzalez, Izabella Dianna	f	\N
8137	Javier	Gonzalez	58230	8	j.gonzalez230@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Gonzalez, Javier Jesus	f	\N
8139	Kimberly	Gonzalez	58774	8	k.gonzalez774@cvuhsd.org	13	F	9	E-103	Talbott, Jose	Gonzalez, Kimberly	f	\N
8142	Victoria	Gonzalez	57810	8	v.gonzalez810@cvuhsd.org	13	F	9	G-107	Lopez, Maria	Gonzalez, Victoria Nieves	f	\N
8143	Brycen	Grant	58828	8	b.grant828@cvuhsd.org	13	M	9	A-201	Salgado, Efrain	Grant, Brycen Schrod Hasawni	f	\N
8144	Autumn	Green	58746	8	a.green746@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Green, Autumn Zamora	f	\N
8145	Dajon	Green	58324	8	d.green324@cvuhsd.org	13	M	9	G-101	Komatsu, Chase	Green, Dajon Anthony	f	\N
8146	Mariah Jessicaley	Gregorio	57989	8	m.santosgregorio989@cvuhsd.org	13	F	9	E-103	Talbott, Jose	Gregorio, Mariah Jessicaley Santos	f	\N
8147	Jay'Shawn	Gresham	58560	8	j.gresham560@cvuhsd.org	13	M	9	D-203	Haefner, Kevin L.	Gresham, Jay'Shawn	f	\N
8149	Salvador	Grimaldo Melendrez	58890	8	s.grimaldomelend890@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Grimaldo Melendrez, Salvador Antonio	f	\N
8150	Ashley	Guerrero-Carreon	57709	8	a.guerrerocarreon709@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Guerrero-Carreon, Ashley	f	\N
8151	Cynthia	Gutierrez	57951	8	c.gutierrez951@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Gutierrez, Cynthia	f	\N
8152	Alyssa	Gutierrez-Rios	57987	8	a.gutierrezrios987@cvuhsd.org	13	F	9	F-102	Massey-Sloan, Patricia A	Gutierrez-Rios, Alyssa	f	\N
8154	Tutulupeatau	Halalilo Jr.	59057	8	t.halalilojr.057@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Halalilo Jr., Tutulupeatau	f	\N
8157	Valeria	Haro	58123	8	v.haro123@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Haro, Valeria	f	\N
8158	Christian	Harris	58542	8	c.harris542@cvuhsd.org	13	M	9	G-203	Torres, Walter	Harris, Christian Lamont	f	\N
8159	Dyson	Harris	58738	8	d.harris738@cvuhsd.org	13	M	9	G-101	Komatsu, Chase	Harris, Dyson	f	\N
8160	Shawnti	Henderson	58466	8	s.henderson466@cvuhsd.org	13	F	9	D-203	Haefner, Kevin L.	Henderson, Shawnti Latisse Michele	f	\N
8163	Fernando	Hermosillo	58830	8	f.hermosillo830@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Hermosillo, Fernando	f	\N
8164	Brehenan	Hernandez Coto	58981	8	b.hernandezcoto981@cvuhsd.org	13	M	9	G-104	Mccoy, Bert L	Hernandez Coto, Brehenan Alonso	f	\N
8166	Allison	Hernandez Mercado	58326	8	a.hernandezmercad326@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Hernandez Mercado, Allison Guadalupe	f	\N
8167	Jerliany	Hernandez Reyes	57846	8	j.hernandezreyes846@cvuhsd.org	13	F	9	B-1	Cassio, Michael J.	Hernandez Reyes, Jerliany Alexandra	f	\N
8168	Anthony	Hernandez	58363	8	a.hernandez363@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Hernandez, Anthony David	f	\N
8169	Cesar	Hernandez	58732	8	c.hernandez732@cvuhsd.org	13	M	9	G-203	Torres, Walter	Hernandez, Cesar Ulises	f	\N
8127	Olivia	Gomez	58772	8	o.gomez772@cvuhsd.org	13	F	9	H-201	Teichmann, Thomas E.	Gomez, Olivia Ann	t	\N
8140	Santiago	Gonzalez	58806	8	s.gonzalez806@cvuhsd.org	13	M	9	F-102	Massey-Sloan, Patricia A	Gonzalez, Santiago	t	\N
8165	Stephanie	Hernandez Espinoza	58726	8	s.hernandezespin726@cvuhsd.org	13	F	9	F-102	Massey-Sloan, Patricia A	Hernandez Espinoza, Stephanie Yanci	t	\N
8156	Jakhi	Harmon	58212	8	j.harmon212@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Harmon, Jakhi Mayleer	t	\N
8153	Alexander	Hakimian	58029	8	a.hakimian029@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Hakimian, Alexander Berge	t	\N
8124	Chelsea	Gomez	58819	8	c.gomez819@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Gomez, Chelsea Milly	t	\N
8141	Santiago	Gonzalez	58946	8	s.gonzalez946@cvuhsd.org	13	M	9	G-107	Lopez, Maria	Gonzalez, Santiago Francisco	t	\N
8155	Shondell	Hall	58944	8	s.hall944@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Hall, Shondell Elise	t	\N
8162	Ja'Mir	Henry	58543	8	j.henry543@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Henry, Ja'Mir Brashone	t	\N
8170	Victoria	Hernandez	58140	8	v.hernandez140@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Hernandez, Victoria Scarlett	t	\N
8148	Mia	Grijalva	57845	8	m.grijalva845@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Grijalva, Mia Andrea	t	\N
8161	Blake	Hendrix	59297	8	b.hendrix297@cvuhsd.org	13	M	9	GYM 1	Miller, David L	Hendrix, Blake Acar	t	\N
8171	Yahir	Hernandez	58735	8	y.hernandez735@cvuhsd.org	13	M	9	D-107	Williams, Sherrevia A	Hernandez, Yahir Cesar	f	\N
8173	Sergio	Herrera Chilin	57670	8	s.herrerachilin670@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Herrera Chilin, Sergio Roberto	f	\N
8175	Angie	Herrera	58206	8	a.herrera206@cvuhsd.org	13	F	9	G-107	Lopez, Maria	Herrera, Angie	f	\N
8176	Derek	Herrera	58725	8	d.herrera725@cvuhsd.org	13	M	9	F-102	Massey-Sloan, Patricia A	Herrera, Derek Ethan	f	\N
8177	Michelle	Herrera	58199	8	m.herrera199@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Herrera, Michelle Andrea	f	\N
8179	Duong	Hoang	58409	8	d.hoang409@cvuhsd.org	13	M	9	G-105	Yorizane, Traci	Hoang, Duong Trong	f	\N
8181	Khanh-Ngoc	Hoang	58009	8	k.hoang009@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Hoang, Khanh-Ngoc Lea	f	\N
8182	Kylie	Hoang	58216	8	k.hoang216@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Hoang, Kylie	f	\N
8183	Nusi	Holani	58720	8	n.holani720@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Holani, Nusi Antonio Adalberto Pepe	f	\N
8185	Aniyah	Hubbert	58960	8	a.hubbert960@cvuhsd.org	13	F	9	A-201	Salgado, Efrain	Hubbert, Aniyah Zenobia-Annise	f	\N
8186	Champ	Hunter	58411	8	c.hunter411@cvuhsd.org	13	M	9	G-104	Mccoy, Bert L	Hunter, Champ Caleb	f	\N
8188	Pappy	Ibeh Chukwuemeka	57911	8	p.ibehchukwuemeka911@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Ibeh Chukwuemeka, Pappy David	f	\N
8189	Grace	Iglesias	57863	8	g.iglesias863@cvuhsd.org	13	F	9	G-212	Harris, Annette	Iglesias, Grace Elizabeth	f	\N
8190	Klaris	Ike	58162	8	k.ike162@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Ike, Klaris Naya	f	\N
8191	Angel	Iniguez	58412	8	a.iniguez412@cvuhsd.org	13	M	9	A-201	Salgado, Efrain	Iniguez, Angel Uriel	f	\N
8192	Alejandra	Islas	58031	8	a.islas031@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Islas, Alejandra	f	\N
8193	Jaye	James	57894	8	j.james894@cvuhsd.org	13	F	9	G-109	Miranda, Denisse	James, Jaye Marley	f	\N
8194	Milton	Jefferson III	58716	8	m.jeffersoniii716@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Jefferson III, Milton Louis	f	\N
8195	Ayden	Jenkins	57777	8	a.jenkins777@cvuhsd.org	13	M	9	D-203	Haefner, Kevin L.	Jenkins, Ayden Antonio	f	\N
8196	Alyssa	Jenson	58104	8	a.jenson104@cvuhsd.org	13	F	9	G-212	Harris, Annette	Jenson, Alyssa Nicole	f	\N
8197	Rebeca	Jeronimo	57811	8	r.jeronimo811@cvuhsd.org	13	F	9	E-103	Talbott, Jose	Jeronimo, Rebeca Eunice	f	\N
8198	Liberty	Johnson	58494	8	l.johnson494@cvuhsd.org	13	F	9	G-212	Harris, Annette	Johnson, Liberty Grace	f	\N
8199	Torreon	Johnson	58262	8	t.johnson262@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Johnson, Torreon Deontrill	f	\N
8201	Amille	Jones	59261	8	a.jones261@cvuhsd.org	13	F	9	G-203	Young, Royale	Jones, Amille Sara	f	\N
8204	Aaniyah	Jordan	58714	8	a.jordan714@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Jordan, Aaniyah Cherice	f	\N
8205	Alondra	Kaye-Kafie	58158	8	a.kayekafie158@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Kaye-Kafie, Alondra Anais	f	\N
8206	Mariah	Kennedy	59004	8	m.kennedy004@cvuhsd.org	13	F	9	A-201	Salgado, Efrain	Kennedy, Mariah Star	f	\N
8207	Benjamin	Klimenko	57688	8	b.klimenko688@cvuhsd.org	13	M	9	G-105	Yorizane, Traci	Klimenko, Benjamin Leyesa	f	\N
8208	Henry	Lam	58493	8	h.lam493@cvuhsd.org	13	M	9	G-105	Yorizane, Traci	Lam, Henry Thien Huu	f	\N
8209	Izaak	Lara	58246	8	i.lara246@cvuhsd.org	13	M	9	G-101	Mehta, Anand G	Lara, Izaak	f	\N
8210	Nathan	Legardy	58945	8	n.legardy945@cvuhsd.org	13	M	9	A-201	Salgado, Efrain	Legardy, Nathan Ryan	f	\N
8212	Ashley	Leon Garcia	58107	8	a.leongarcia107@cvuhsd.org	13	F	9	G-111	Romo, Jose A.	Leon Garcia, Ashley	f	\N
8213	Juan	Leon Jr.	57812	8	j.leon812@cvuhsd.org	13	M	9	G-203	Young, Royale	Leon Jr., Juan Daniel	f	\N
8214	Allison	Leon Moreno	58941	8	a.leonmoreno941@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Leon Moreno, Allison Michelle	f	\N
8215	Justin	Lindbergh	58032	8	j.lindbergh032@cvuhsd.org	13	M	9	G-212	Harris, Annette	Lindbergh, Justin Harvey	f	\N
8216	Ty'lyn	Littleton	58871	8	t.littleton871@cvuhsd.org	13	M	9	G-101	Komatsu, Chase	Littleton, Ty'lyn Dashawn	f	\N
8217	Andrew	Llamas	58904	8	a.llamas904@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Llamas, Andrew	f	\N
8218	Andy	Llamas	58920	8	a.llamas920@cvuhsd.org	13	M	9	G-203	Young, Royale	Llamas, Andy	f	\N
8219	Jorge	Loaiza Gastelum	59093	8	j.loaizagastelum093@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Loaiza Gastelum, Jorge Efrain	f	\N
8220	Rihanna	Loayza	58529	8	r.loayza529@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Loayza, Rihanna Seday	f	\N
8221	Alan	Logo	58207	8	a.logo207@cvuhsd.org	13	M	9	D-203	Haefner, Kevin L.	Logo, Alan Adry	f	\N
8222	Alex	Lopez Arroyo	58283	8	a.lopezarroyo283@cvuhsd.org	13	M	9	G-107	Lopez, Maria	Lopez Arroyo, Alex	f	\N
8174	Anthony	Herrera Perez	59289	8	a.herreraperez289@cvuhsd.org	13	M	9	GYM 1	Miller, David L	Herrera Perez, Anthony	t	\N
8202	Jace	Jones	58327	8	j.jones327@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Jones, Jace	t	\N
8211	Siale	Leka	58804	8	s.leka804@cvuhsd.org	13	M	9	G-101	Komatsu, Chase	Leka, SialeTupoulola Charlie	t	\N
8187	London	Hunter	58093	8	l.hunter093@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Hunter, London Haylee	t	\N
8178	Anh	Hoang	58063	8	a.hoang063@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Hoang, Anh Minh Ngoc	t	\N
8180	Jetlee	Hoang	57776	8	j.hoang776@cvuhsd.org	13	M	9	D-203	Haefner, Kevin L.	Hoang, Jetlee Anh	t	\N
8172	Antony	Herrera Carrillo	58724	8	a.herreracarrill724@cvuhsd.org	13	M	9	G-104	Mccoy, Bert L	Herrera Carrillo, Antony Lisandro	t	\N
8184	Edwin	Honorato	57744	8	e.honorato744@cvuhsd.org	13	M	9	G-111	Romo, Jose A.	Honorato, Edwin Isaac	t	\N
8200	Aaron	Jones	58870	8	a.jones870@cvuhsd.org	13	M	9	A-201	Salgado, Efrain	Jones, Aaron Valentino-Joseph	t	\N
8224	Alexander	Lopez	58956	8	a.lopez956@cvuhsd.org	13	M	9	G-104	Mccoy, Bert L	Lopez, Alexander Axel	f	\N
8225	Allison	Lopez	58710	8	a.lopez710@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Lopez, Allison Guadalupe	f	\N
8226	Jasmin	Lopez	58033	8	j.lopez033@cvuhsd.org	13	F	9	G-107	Lopez, Maria	Lopez, Jasmin Liset	f	\N
8227	Liam	Lopez	59102	8	l.lopez102@cvuhsd.org	13	M	9	F-103	Kaiser, Noah	Lopez,Liam James	f	\N
8228	Tatiyana	Lopez	58174	8	t.lopez174@cvuhsd.org	13	F	9	G-111	Romo, Jose A.	Lopez, Tatiyana Jayden	f	\N
8230	Miguel	Lopez-Jimenez	58422	8	m.lopezjimenez422@cvuhsd.org	13	M	9	D-203	Haefner, Kevin L.	Lopez-Jimenez, Miguel Angel	f	\N
8231	Emily	Lorenzo-Colindres	58955	8	e.lorenzocolindr955@cvuhsd.org	13	F	9	G-107	Lopez, Maria	Lorenzo-Colindres, Emily	f	\N
8233	Camille	Loza Moreno	58718	8	c.lozamoreno718@cvuhsd.org	13	F	9	A-201	Salgado, Efrain	Loza Moreno, Camille Sarahi	f	\N
8234	Camila	Lozano	58185	8	c.lozano185@cvuhsd.org	13	F	9	G-212	Harris, Annette	Lozano, Camila	f	\N
8235	Josiah	Macias	58702	8	j.macias702@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Macias, Josiah	f	\N
8237	Ryan	Madrigal	58833	8	r.madrigal833@cvuhsd.org	13	M	9	G-203	Young, Royale	Madrigal, Ryan Alberto	f	\N
8238	Tanumaleu	Mafi	59153	8	t.mafi153@cvuhsd.org	13	F	9	H-203	Rojas, Miguel Sr.	Mafi, Tanumaleu Jasmine	f	\N
8239	Melissa	Magallon	58423	8	m.magallon423@cvuhsd.org	13	F	9	D-203	Haefner, Kevin L.	Magallon, Melissa	f	\N
8240	Amanda	Mahoney	58872	8	a.mahoney872@cvuhsd.org	13	F	9	G-203	Young, Royale	Mahoney, Amanda Elizabeth	f	\N
8241	Joseph	Mai	58701	8	j.mai701@cvuhsd.org	13	M	9	D-103	Sarpong, Kwame Kwakye	Mai, Joseph Huynh	f	\N
8243	Alexander	Maldonado Rabanales	58048	8	a.maldonadorabana048@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Maldonado Rabanales, Alexander Emmanuel	f	\N
8244	Raul	Mancia Lopez	58699	8	r.mancialopez699@cvuhsd.org	13	M	9	G-107	Lopez, Maria	Mancia Lopez, Raul Ernesto	f	\N
8245	Alfredo	Manjarrez	58051	8	a.manjarrez051@cvuhsd.org	13	M	9	G-212	Harris, Annette	Manjarrez, Alfredo Nickolas	f	\N
8246	Zameya	Manor	59216	8	z.manor216@cvuhsd.org	13	F	9	G-109	Miranda, Denisse	Manor, Zameya Ma'Kween Amy	f	\N
8247	Zhamya	Manor	59217	8	z.manor217@cvuhsd.org	13	F	9	G-109	Miranda, Denisse	Manor, Zhamya My'Love Jamie	f	\N
8248	Flor	Marquez Domingo	57877	8	f.marquezdomingo877@cvuhsd.org	13	F	9	D-203	Haefner, Kevin L.	Marquez Domingo, Flor Antonia	f	\N
8249	Bryan	Marquez	58717	8	b.marquez717@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Marquez, Bryan	f	\N
8251	Alyssa	Marroquin	58042	8	a.marroquin042@cvuhsd.org	13	F	9	G-212	Harris, Annette	Marroquin, Alyssa Nalani	f	\N
8252	Jonathan	Marroquin	58426	8	j.marroquin426@cvuhsd.org	13	M	9	G-107	Lopez, Maria	Marroquin, Jonathan Osvaldo	f	\N
8253	Samantha	Marroquin	57926	8	s.marroquin926@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Marroquin, Samantha Nicole	f	\N
8254	Steven	Marroquin	57642	8	s.marroquin642@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Marroquin, Steven Tomas	f	\N
8255	Kyleigh	Martin	58124	8	k.martin124@cvuhsd.org	13	F	9	D-203	Haefner, Kevin L.	Martin, Kyleigh Savannah	f	\N
8256	Ema	Martinez Aldana	57707	8	e.martinezaldana707@cvuhsd.org	13	F	9	G-212	Harris, Annette	Martinez Aldana, Ema Kamilah	f	\N
8257	George	Martinez Blas	58692	8	g.martinezblas692@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Martinez Blas, George Angelo	f	\N
8258	Issac	Martinez Jr.	58879	8	i.martinezjr.879@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Martinez Jr., Issac	f	\N
8259	Andrew	Martinez	58980	8	a.martinez980@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Martinez, Andrew Trinh	f	\N
8261	Damian	Martinez	59286	8	d.martinez286@cvuhsd.org	13	M	9	G-212	Harris, Annette	Martinez, Damian Chuyito	f	\N
8262	Dylan	Martinez	58105	8	d.martinez105@cvuhsd.org	13	M	9	G-212	Harris, Annette	Martinez, Dylan	f	\N
8264	Isabella	Martinez	57813	8	i.martinez813@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Martinez, Isabella Dora	f	\N
8265	Jacob	Martinez	58284	8	j.martinez284@cvuhsd.org	13	M	9	A-201	Salgado, Efrain	Martinez, Jacob	f	\N
8266	Meilani	Martinez	57945	8	m.martinez945@cvuhsd.org	13	F	9	G-212	Harris, Annette	Martinez, Meilani Emily	f	\N
8267	Miguel	Martinez	58084	8	m.martinez084@cvuhsd.org	13	M	9	G-107	Lopez, Maria	Martinez, Miguel Angel	f	\N
8269	Rodolfo	Martinez-Rivera	57814	8	r.martinezrivera814@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Martinez-Rivera, Rodolfo Gabriel	f	\N
8270	Treasure	McClure	58429	8	t.mcclure429@cvuhsd.org	13	F	9	E-103	Talbott, Jose	McClure, Treasure Lailani	f	\N
8271	Olivia	McConnell	58876	8	o.mcconnell876@cvuhsd.org	13	F	9	G-101	Komatsu, Chase	McConnell,Olivia Katy	f	\N
8272	Jesse	McFarland	59124	8	j.mcfarland124@cvuhsd.org	13	M	9	A-201	Salgado, Efrain	McFarland,Jesse James	f	\N
8250	Camila	Marroquin Favela	57779	8	c.marroquinfavela779@cvuhsd.org	13	F	9	H-201	Teichmann, Thomas E.	Marroquin Favela, Camila Abigail	t	\N
8229	Giovanie	Lopez-Garrigos	58707	8	g.lopezgarrigos707@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Lopez-Garrigos, Giovanie Omar	t	\N
8260	Chris	Martinez	58582	8	c.martinez582@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Martinez, Chris	t	\N
8242	Elijah	Maka	58836	8	e.maka836@cvuhsd.org	13	M	9	F-102	Massey-Sloan, Patricia A	Maka, ElijahTaliai Kilifo'oti	t	\N
8273	De'Trell	McGee	59104	8	d.mcgee104@cvuhsd.org	13	M	9	F-102	Massey-Sloan, Patricia A	McGee, De'Trell	t	\N
8263	Francisco	Martinez	57689	8	f.martinez689@cvuhsd.org	13	M	9	G-104	Mccoy, Bert L	Martinez, Francisco David	t	\N
8268	Noribel	Martinez-Leal	58487	8	n.martinezleal487@cvuhsd.org	13	F	9	G-107	Lopez, Maria	Martinez-Leal, Noribel Heidy	t	\N
8232	Loya	Loya Dominguez	58219	8	s.loyadominguez219@cvuhsd.org	13	F	9	D-203	Haefner, Kevin L.	Loya Dominguez, Loya	t	\N
8236	Raymond	Madrigal	59055	8	r.madrigal055@cvuhsd.org	13	M	9	A-201	Salgado, Efrain	Madrigal, Raymond Joseph	t	\N
8274	Kendall	McKinstry	58430	8	k.mckinstry430@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	McKinstry,Kendall Juanell	f	\N
8277	Cesar	Medina Jr.	58566	8	c.medinajr.566@cvuhsd.org	13	X	9	E-103	Talbott, Jose	Medina Jr., Cesar Efren	f	\N
8278	Jaslene	Medina	58265	8	j.medina265@cvuhsd.org	13	F	9	F-102	Massey-Sloan, Patricia A	Medina, Jaslene Alma	f	\N
8279	Jason	Medina	59236	8	j.medina236@cvuhsd.org	13	M	9	D-107	Williams, Sherrevia A	Medina, Jason Manuel	f	\N
8280	Jisselle	Medina	58565	8	j.medina565@cvuhsd.org	13	F	9	G-101	Komatsu, Chase	Medina, Jisselle Alejandra	f	\N
8282	Lilyana	Medina	58691	8	l.medina691@cvuhsd.org	13	F	9	D-203	Haefner, Kevin L.	Medina, Lilyana Irene	f	\N
8283	Evan	Meeks	58121	8	e.meeks121@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Meeks, Evan Aleksander	f	\N
8284	Maria	Mejia Bonilla	57938	8	m.mejiabonilla938@cvuhsd.org	13	F	9	G-111	Romo, Jose A.	Mejia Bonilla, Maria Alejandra	f	\N
8285	Jose	Mejia	57850	8	j.mejia850@cvuhsd.org	13	M	9	G-111	Romo, Jose A.	Mejia, Jose Miguel	f	\N
8286	Kaden	Melendez	58056	8	k.melendez056@cvuhsd.org	13	M	9	D-203	Haefner, Kevin L.	Melendez, Kaden Jay Issac	f	\N
8287	Mia	Melgar	58002	8	m.melgar002@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Melgar, Mia Alexandra	f	\N
8288	Keren	Mendez Avila	58144	8	k.mendezavila144@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Mendez Avila, Keren Merari	f	\N
8289	Fernando	Merino Manzano	58233	8	f.merinomanzano233@cvuhsd.org	13	M	9	G-101	Komatsu, Chase	Merino Manzano, Fernando Gabriel	f	\N
8290	Sofia	Meza	57722	8	s.meza722@cvuhsd.org	13	F	9	E-103	Talbott, Jose	Meza, Sofia	f	\N
8291	Ayana	Miller	59052	8	a.miller052@cvuhsd.org	13	F	9	G-203	Torres, Walter	Miller, Ayana Alva	f	\N
8293	Abie	Miralda Salgado	59002	8	a.miraldasalgado002@cvuhsd.org	13	F	9	G-107	Lopez, Maria	Miralda Salgado, Abie Nicole	f	\N
8296	Juan	Molina	58220	8	j.molina220@cvuhsd.org	13	M	9	G-105	Yorizane, Traci	Molina, Juan	f	\N
8298	Anderson	Monzon Garcia	59231	8	a.monzongarcia231@cvuhsd.org	13	M	9	A-201	Salgado, Efrain	Monzon Garcia, Anderson Estuardo	f	\N
8299	Bertrand	Moore III	58685	8	b.mooreiii685@cvuhsd.org	13	M	9	G-105	Yorizane, Traci	Moore III, Bertrand Michael	f	\N
8302	Bryan	Morales	58826	8	b.morales826@cvuhsd.org	13	M	9	F-102	Massey-Sloan, Patricia A	Morales, Bryan Ruben	f	\N
8303	Javier	Morales	59028	8	j.morales028@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Morales, Javier Atapana	f	\N
8304	Annika	Moran	59239	8	a.moran239@cvuhsd.org	13	F	9	A-201	Salgado, Efrain	Moran, Annika Sherlyn	f	\N
8305	Kamden	Morrow	58435	8	k.morrow435@cvuhsd.org	13	M	9	G-101	Komatsu, Chase	Morrow, Kamden Zyaire	f	\N
8306	Keion	Moseley	59189	8	k.moseley189@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Moseley, Keion William	f	\N
8307	Morgan	Mosley	58964	8	m.mosley964@cvuhsd.org	13	F	9	A-201	Salgado, Efrain	Mosley, Morgan Summer	f	\N
8309	Kinsey	Mundi	58436	8	k.mundi436@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Mundi,Kinsey Tangwan	f	\N
8310	Raymond	Munive	58050	8	r.munive050@cvuhsd.org	13	M	9	G-203	Torres, Walter	Munive, Raymond Thomas	f	\N
8312	Ezayah	Myers	58795	8	e.myers795@cvuhsd.org	13	M	9	F-102	Massey-Sloan, Patricia A	Myers, Ezayah John	f	\N
8313	Fanguna-Helotu	Nau	59224	8	f.nau224@cvuhsd.org	13	M	9	A-201	Salgado, Efrain	Nau, Fanguna-Helotu Semisi	f	\N
8314	Andres	Navarro Crisostomo	58331	8	a.navarrocrisosto331@cvuhsd.org	13	M	9	G-104	Mccoy, Bert L	Navarro Crisostomo, Andres Alejandro	f	\N
8315	Natalie	Navarro	57647	8	n.navarro647@cvuhsd.org	13	F	9	E-103	Talbott, Jose	Navarro, Natalie Sofia	f	\N
8316	Denni	Negreros Rodriguez	59019	8	d.negrerosrodrig019@cvuhsd.org	13	M	9	GYM 1	Miller, David L	Negreros Rodriguez, Denni Omar	f	\N
8317	Shirly	Neira Ortiz	59144	8	s.neiraortiz144@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Neira Ortiz, Shirly Daniela	f	\N
8318	Derrick	Newman	58354	8	d.newman354@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Newman, Derrick Reed	f	\N
8320	Josiah	Nguyen	58244	8	j.nguyen244@cvuhsd.org	13	M	9	G-212	Harris, Annette	Nguyen, Josiah Rye	f	\N
8321	Khiem	Nguyen	58198	8	k.nguyen198@cvuhsd.org	13	M	9	A-201	Salgado, Efrain	Nguyen, Khiem Duy	f	\N
8322	Mya	Nguyen	58769	8	m.nguyen769@cvuhsd.org	13	F	9	G-104	Mccoy, Bert L	Nguyen, Mya	f	\N
8323	Paulina	Nicasio	58873	8	p.nicasio873@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Nicasio, Paulina Sofia	f	\N
8324	Jovan	Nichols	57879	8	j.nichols879@cvuhsd.org	13	M	9	A-201	Salgado, Efrain	Nichols, Jovan Chauncey	f	\N
8281	Kayly	Medina	59026	8	k.medina026@cvuhsd.org	13	F	9	H-201	Teichmann, Thomas E.	Medina, Kayly Melissa	t	\N
8276	Christopher	Mederos Mayoral	58987	8	c.mederosmayoral987@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Mederos Mayoral, Christopher Leon	t	\N
8294	Pakipole	Moala	59074	8	p.moala074@cvuhsd.org	13	M	9	A-201	Salgado, Efrain	Moala, Pakipole Seiloni	t	\N
8308	Sariyah	Muhammad	59242	8	s.muhammad242@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Muhammad, Sariyah Ummi Mebane	t	\N
8292	Jonathan	Minquiz	58266	8	j.minquiz266@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Minquiz, Jonathan Ricardo	t	\N
8297	Jonathan	Moncada Ordonez	58433	8	j.moncadaordonez433@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Moncada Ordonez, Jonathan Ezequiel	t	\N
8300	Sherry	Mora	57783	8	s.mora783@cvuhsd.org	13	F	9	H-203	Rojas, Miguel Sr.	Mora, Sherry Jacqueline	t	\N
8319	Chi	Nguyen	57928	8	c.nguyen928@cvuhsd.org	13	F	9	A-201	Salgado, Efrain	Nguyen, Chi Ngoc	t	\N
8311	Jesse	Murillo	58927	8	j.murillo927@cvuhsd.org	13	M	9	G-111	Romo, Jose A.	Murillo, Jesse Orlando	t	\N
8275	Trevor	McMiller	58285	8	t.mcmiller285@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	McMiller, Trevor	t	\N
8301	Daniel	Morales Miranda	58825	8	d.moralesmiranda825@cvuhsd.org	13	M	9	F-102	Massey-Sloan, Patricia A	Morales Miranda, Daniel	t	\N
8325	Glein	Njim	58356	8	g.njim356@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Njim, Glein Fah	f	\N
8327	Andrew	Nunez	57895	8	a.nunez895@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Nunez, Andrew Rene	f	\N
8328	Jaylene	Nunez-Espinosa	58438	8	j.nunezespinosa438@cvuhsd.org	13	F	9	D-203	Haefner, Kevin L.	Nunez-Espinosa, Jaylene	f	\N
8329	Mauricio	Nungaray	57940	8	m.nungaray940@cvuhsd.org	13	M	9	G-212	Harris, Annette	Nungaray, Mauricio	f	\N
8331	Abdiel	Oajaca	59112	8	a.oajaca112@cvuhsd.org	13	M	9	G-107	Lopez, Maria	Oajaca, Abdiel Armando	f	\N
8332	Onyedikachi	Ofoegbu	57896	8	o.ofoegbu896@cvuhsd.org	13	M	9	D-203	Haefner, Kevin L.	Ofoegbu, Onyedikachi Sydney	f	\N
8333	Saul	Ojeda	58332	8	s.ojeda332@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Ojeda, Sau Alonso	f	\N
8334	Emmanuella	Okonkwo	58674	8	e.okonkwo674@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Okonkwo, Emmanuella	f	\N
8335	Chiagoziem	Okparaocha	58673	8	c.okparaocha673@cvuhsd.org	13	M	9	G-101	Komatsu, Chase	Okparaocha, Chiagoziem Ezenwa	f	\N
8336	Derek	Olea Medel	58796	8	d.oleamedel796@cvuhsd.org	13	M	9	F-102	Massey-Sloan, Patricia A	Olea Medel, Derek	f	\N
8339	Samantha	Orozco	59049	8	s.orozco049@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Orozco, Samantha Evelyn	f	\N
8340	Prisila	Ortega Carreto	58682	8	p.ortegacarreto682@cvuhsd.org	13	F	9	H-203	Rojas, Miguel Sr.	Ortega Carreto, Prisila Marisol	f	\N
8342	Bella	Ortiz	58196	8	b.ortiz196@cvuhsd.org	13	F	9	G-107	Lopez, Maria	Ortiz, Bella Luna	f	\N
8343	Jose	Ortiz	58669	8	j.ortiz669@cvuhsd.org	13	M	9	G-101	Komatsu, Chase	Ortiz, Jose Alberto	f	\N
8344	Ariana	Otero	59129	8	a.otero129@cvuhsd.org	13	F	9	G-203	Torres, Walter	Otero, Ariana Jaylene	f	\N
8345	Lisa	Otuonye	57975	8	l.otuonye975@cvuhsd.org	13	F	9	H-203	Rojas, Miguel Sr.	Otuonye, Lisa Nma	f	\N
8346	Ehizojie	Ozigho	58172	8	e.ozigho172@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Ozigho, Ehizojie Michael	f	\N
8347	Genesis	Palacios Pena	58439	8	g.palaciospena439@cvuhsd.org	13	F	9	G-212	Harris, Annette	Palacios Pena, Genesis Eunice	f	\N
8348	Vanessa	Palacios	58499	8	v.palacios499@cvuhsd.org	13	F	9	G-101	Komatsu, Chase	Palacios, Vanessa	f	\N
8349	Sarit	Palma-Mejia	58367	8	s.palmamejia367@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Palma-Mejia, Sarit Galilea	f	\N
8351	Detrell	Parker	58440	8	d.parker440@cvuhsd.org	13	M	9	D-203	Haefner, Kevin L.	Parker, Detrell Diamond	f	\N
8352	Darvin	Pascual Cano	59113	8	d.pascualcano113@cvuhsd.org	13	M	9	G-107	Lopez, Maria	Pascual Cano, Darvin Jeremymilton	f	\N
8353	Aaliyah	Pastrana	58254	8	a.pastrana254@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Pastrana, Aaliyah Genesis	f	\N
8354	Blaine	Pecaoco	58568	8	b.pecaoco568@cvuhsd.org	13	M	9	G-101	Komatsu, Chase	Pecaoco, Blaine Louis	f	\N
8355	Mayte	Penado	58500	8	m.penado500@cvuhsd.org	13	F	9	G-109	Miranda, Denisse	Penado, Mayte Nataly	f	\N
8356	Maximilian	Perez Ahuatl	58934	8	m.perezahuatl934@cvuhsd.org	13	M	9	G-101	Komatsu, Chase	Perez Ahuatl, Maximilian Joel	f	\N
8357	Karen	Perez Jacobo	58441	8	k.perezjacobo441@cvuhsd.org	13	F	9	G-107	Lopez, Maria	Perez Jacobo, Karen Lilah	f	\N
8358	Cristobal	Perez Jiron	58648	8	c.perezjiron648@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Perez Jiron, Cristobal Aaron	f	\N
8359	Yassir	Perez Lopez	57820	8	y.perezlopez820@cvuhsd.org	13	M	9	D-203	Haefner, Kevin L.	Perez Lopez, Yassir	f	\N
8361	Alexis	Perez	58933	8	a.perez933@cvuhsd.org	13	F	9	F-103	Kaiser, Noah	Perez, Alexis Resa	f	\N
8362	Andrew	Perez	58649	8	a.perez649@cvuhsd.org	13	M	9	G-111	Romo, Jose A.	Perez, Andrew Omar	f	\N
8363	Daniel	Perez	58470	8	d.perez470@cvuhsd.org	13	M	9	G-212	Harris, Annette	Perez, Daniel Salvador	f	\N
8364	Juan David	Perez	59170	8	j.perez170@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Perez, Juan David	f	\N
8365	Jayden	Phillips	58062	8	j.phillips062@cvuhsd.org	13	M	9	G-212	Harris, Annette	Phillips, Jayden Anthony	f	\N
8366	Pablo	Pio	58184	8	p.pio184@cvuhsd.org	13	M	9	D-203	Haefner, Kevin L.	Pio, Pablo	f	\N
8367	Luis	Polanco Zarate	58173	8	l.polancozarate173@cvuhsd.org	13	M	9	D-203	Haefner, Kevin L.	Polanco ZarateLuisMario	f	\N
8368	Kolbi	Prewitt	58646	8	k.prewitt646@cvuhsd.org	13	F	9	E-103	Talbott, Jose	Prewitt, Kolbi Sky	f	\N
8369	Jayon	Price	58586	8	j.price586@cvuhsd.org	13	M	9	G-101	Komatsu, Chase	Price, Jayon	f	\N
8370	Vanessa	Pulido Iraheta	58444	8	v.pulidoiraheta444@cvuhsd.org	13	F	9	G-107	Lopez, Maria	Pulido Iraheta, Vanessa Yolanda	f	\N
8371	Isabella	Pulido	58822	8	i.pulido822@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Pulido, Isabella	f	\N
8372	Jacob	Quinteros	57821	8	j.quinteros821@cvuhsd.org	13	M	9	F-102	Massey-Sloan, Patricia A	Quinteros, Jacob	f	\N
8373	Joel	Quiroz	58645	8	j.quiroz645@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Quiroz, Joel	f	\N
8374	Ever	Quisquina Calel	59266	8	e.quisquinacalel266@cvuhsd.org	13	M	9	GYM 4	Whitt, James	Quisquina Calel, Ever Ismael	f	\N
8375	Alaina	Ramirez Aplicano	57979	8	a.ramirezaplicano979@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Ramirez Aplicano, Alaina Jackelyne	f	\N
8360	Adrian	Perez	58650	8	a.perez650@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Perez, Adrian Osiris	t	\N
8350	Clive Allen	Paraguya	58126	8	c.paraguya126@cvuhsd.org	13	M	9	F-102	Massey-Sloan, Patricia A	Paraguya, Clive Allen Magnayon	t	\N
8341	Leonardo	Ortiz Ayala	58521	8	l.ortizayala521@cvuhsd.org	13	M	9	G-107	Lopez, Maria	Ortiz Ayala, Leonardo	t	\N
8337	Ayodeji	Olorunfemi	57651	8	a.olorunfemi651@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Olorunfemi, Ayodeji Oluwademilade	t	\N
8330	Angel	Nwodo	57690	8	a.nwodo690@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Nwodo, Angel Chisom	t	\N
8338	Udochukwu	Onwuka Jr	58939	8	u.onwukajr939@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Onwuka Jr, Udochukwu Lazarus Eze	t	\N
8377	Shawn	Ramirez Jr	57852	8	s.ramirezjr852@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Ramirez Jr, Shawn Alfred Eugene	f	\N
8378	Jasmine	Ramirez Orozco	59154	8	j.ramirezorozco154@cvuhsd.org	13	F	9	A-201	Salgado, Efrain	Ramirez Orozco, Jasmine Tiffany	f	\N
8379	Jeannie	Ramirez	57677	8	j.ramirez677@cvuhsd.org	13	F	9	H-201	Teichmann, Thomas E.	Ramirez, Jeannie Isabella	f	\N
8380	Martin	Ramirez	58867	8	m.ramirez867@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Ramirez, Martin Khyree	f	\N
8381	Bryana	Ramos Mecco	58797	8	b.ramosmecco797@cvuhsd.org	13	F	9	G-111	Romo, Jose A.	Ramos Mecco, Bryana Michelle	f	\N
8382	Leah	Ramos	58930	8	l.ramos930@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Ramos, Leah Michelle	f	\N
8383	Ronny	Ramos	57649	8	r.ramos649@cvuhsd.org	13	M	9	G-212	Harris, Annette	Ramos, Ronny	f	\N
8384	Regina	Raudales Ruiz	57641	8	r.raudalesruiz641@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Raudales Ruiz, Regina Daniela	f	\N
8385	Billy	Recinos	58274	8	b.recinos274@cvuhsd.org	13	M	9	G-107	Lopez, Maria	Recinos, Billy Alan	f	\N
8386	Jordan	Recinos	58369	8	j.recinos369@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Recinos, Jordan Emanuel	f	\N
8387	Hennsen	Recinos-Juarez	58641	8	h.recinosjuarez641@cvuhsd.org	13	M	9	H-202	Saad, Eman	Recinos-Juarez, Hennsen	f	\N
8389	Audrina	Reyes	58897	8	a.reyes897@cvuhsd.org	13	F	9	H-201	Teichmann, Thomas E.	Reyes, Audrina Faith	f	\N
8390	Brianna	Reyes	58334	8	b.reyes334@cvuhsd.org	13	F	9	G-212	Harris, Annette	Reyes, Brianna Kylie	f	\N
8391	Fernando	Reyes	57679	8	f.reyes679@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Reyes, Fernando	f	\N
8392	Scarlett	Reyes	58635	8	s.reyes635@cvuhsd.org	13	F	9	G-101	Mehta, Anand G	Reyes, Scarlett Dalila	f	\N
8393	Jadon	Rice	58370	8	j.rice370@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Rice, Jadon Sean	f	\N
8394	Alberth	Rios Barrientos	58957	8	a.riosbarrientos957@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Rios Barrientos, Alberth Daniel	f	\N
8395	Heydi	Rivera Avila	57691	8	h.rivera691@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Rivera Avila, Heydi Ruby	f	\N
8396	Azul	Rivera Pena	57855	8	a.riverapena855@cvuhsd.org	13	F	9	G-111	Romo, Jose A.	Rivera Pena, Azul Fernanda	f	\N
8397	Aileen	Rivera	59167	8	a.rivera167@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Rivera, Aileen Savannah	f	\N
8398	Carly	Rivera	58047	8	c.rivera047@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Rivera, Carly Azenith	f	\N
8399	Jazmin	Rivera	58036	8	j.rivera036@cvuhsd.org	13	F	9	G-111	Romo, Jose A.	Rivera, Jazmin	f	\N
8400	Angelique	Roberts Andrews	58275	8	a.robertsandrews275@cvuhsd.org	13	F	9	G-212	Harris, Annette	Roberts Andrews, Angelique Nayrene	f	\N
8401	Charlotte	Roberts	58472	8	c.roberts472@cvuhsd.org	13	F	9	D-203	Haefner, Kevin L.	Roberts, Charlotte Jane	f	\N
8402	Troy	Robertson	58473	8	t.robertson473@cvuhsd.org	13	M	9	G-203	Torres, Walter	Robertson, Troy Vai Tiane-Amanaki Tai	f	\N
8403	Damaryeh	Robinson	58821	8	d.robinson821@cvuhsd.org	13	M	9	G-101	Komatsu, Chase	Robinson, DamaryehTerrel	f	\N
8404	Gustavo	Robledo Martinez	57976	8	g.robledomartinez976@cvuhsd.org	13	M	9	G-212	Harris, Annette	Robledo Martinez, Gustavo Angel	f	\N
8405	Mia	Rodas Roman	59155	8	m.rodasroman155@cvuhsd.org	13	F	9	G-111	Romo, Jose A.	Rodas Roman, Mia Andrea	f	\N
8407	Christopher	Rodriguez Vela	57591	8	c.rodriguezvela591@cvuhsd.org	13	M	9	F-102	Massey-Sloan, Patricia A	Rodriguez Vela, Christopher Alexis	f	\N
8408	Aleena	Rodriguez	59160	8	a.rodriguez160@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Rodriguez, Aleena Ruby	f	\N
8409	Alejandra	Rodriguez	58570	8	a.rodriguez570@cvuhsd.org	13	F	9	A-201	Salgado, Efrain	Rodriguez, Alejandra Giselle	f	\N
8410	Alondra	Rodriguez	58215	8	a.rodriguez215@cvuhsd.org	13	F	9	D-203	Haefner, Kevin L.	Rodriguez, Alondra Cristal	f	\N
8411	Amy	Rodriguez	59208	8	a.rodriguez9208@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Rodriguez, Amy Nataly	f	\N
8413	Ryan	Rodriguez	57897	8	r.rodriguez897@cvuhsd.org	13	M	9	G-105	Yorizane, Traci	Rodriguez, Ryan	f	\N
8414	Isabella	Rojas Rueda	57822	8	i.rojasrueda822@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Rojas Rueda, Isabella Ariadna	f	\N
8415	Ricardo	Romero Jr.	58633	8	r.romerojr.633@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Romero Jr., Ricardo Anthony	f	\N
8416	Fernando	Ruiz Quijano	58276	8	f.ruizquijano276@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Ruiz Quijano, Fernando Josue	f	\N
8417	Elijah	Ruiz	58617	8	e.ruiz617@cvuhsd.org	13	M	9	G-101	Komatsu, Chase	Ruiz, Elijah Armando	f	\N
8418	Gennesis	Sagrero Espinosa	58474	8	g.sagreroespinos474@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Sagrero Espinosa, Gennesis Sarai	f	\N
8419	Ivan	Salas	59263	8	i.salas263@cvuhsd.org	13	M	9	D-104	Samuels, Kathleen C	Salas, Ivan	f	\N
8420	Delilah	Salazar	59121	8	d.salazar121@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Salazar, Delilah Rose	f	\N
8421	Sarah	Salazar	57730	8	s.salazar730@cvuhsd.org	13	F	9	H-203	Rojas, Miguel Sr.	Salazar, Sarah Lynn	f	\N
8422	Bryan	Sales Fuentes	58447	8	b.salesfuentes447@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Sales Fuentes, Bryan Alexander	f	\N
8423	Nathaly	Sales Gomez	58005	8	n.salesgomez005@cvuhsd.org	13	F	9	D-203	Haefner, Kevin L.	Sales Gomez, Nathaly Yarezty	f	\N
8425	Veronica	Sancen	57881	8	v.sancen881@cvuhsd.org	13	F	9	G-107	Lopez, Maria	Sancen, Veronica	f	\N
8424	Daysie	Salvatierra	59068	8	d.salvatierra068@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Salvatierra, Daysie Renee	t	\N
8406	Sharon	Rodriguez Miranda	58994	8	s.rodriguezmiran994@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Rodriguez,  Miranda Sharon	t	\N
8388	Aaliyah	Reed	57880	8	a.reed880@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Reed, Aaliyah Hailey	t	\N
8376	David	Ramirez Barrientos	58644	8	d.ramirezbarrien644@cvuhsd.org	13	M	9	B-1	Cassio, Michael J.	Ramirez Barrientos, David Alexander	t	\N
8426	Sebastian	Sanchez Gomez	59211	8	s.sanchezgomez211@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Sanchez Gomez, Sebastian	f	\N
8427	Brayden	Sanchez Padilla	58449	8	b.sanchezpadilla449@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Sanchez Padilla, Brayden Joel	f	\N
8428	Armani	Sanchez	59254	8	a.sanchez254@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Sanchez, Armani	f	\N
8429	Natalie	Sanchez	58817	8	n.sanchez817@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Sanchez, Natalie	f	\N
8431	Hailey	Sanchez-Vallejo	58145	8	h.sanchezvallejo145@cvuhsd.org	13	F	9	G-101	Komatsu, Chase	Sanchez-Vallejo, Hailey Anahi	f	\N
8432	Jaylen	Sanders	59228	8	j.sanders228@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Sanders, Jaylen Dwayne Anthony	f	\N
8433	Bella	Sandoval	58533	8	b.sandoval533@cvuhsd.org	13	F	9	E-103	Talbott, Jose	Sandoval, Bella Juliet	f	\N
8434	Dennise	Sandoval	57823	8	d.sandoval823@cvuhsd.org	13	F	9	D-203	Haefner, Kevin L.	Sandoval, Dennise Dialma	f	\N
8435	Riley	Santa Cruz	57693	8	r.santacruz693@cvuhsd.org	13	F	9	D-203	Haefner, Kevin L.	Santa Cruz, Riley Lynette	f	\N
8436	Kamila	Santamaria Ayala	58615	8	k.santamariaayal615@cvuhsd.org	13	F	9	G-101	Komatsu, Chase	Santamaria Ayala, Kamila Fernanda	f	\N
8437	Yahir	Santizo Santos	58961	8	y.santizosantos961@cvuhsd.org	13	M	9	G-107	Lopez, Maria	Santizo Santos, Yahir Amilcar	f	\N
8438	Russell	Sekona	58800	8	r.sekona800@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Sekona, Russell Tupou Malani	f	\N
8439	Jeremiah	Seymour	58197	8	j.seymour197@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Seymour, Jeremiah Drew	f	\N
8440	Mikayla	Shaheed	58277	8	m.shaheed277@cvuhsd.org	13	F	9	H-203	Rojas, Miguel Sr.	Shaheed, Mikayla Renee	f	\N
8441	Korry	Shaw	58940	8	k.shaw940@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Shaw, Korry Hayden	f	\N
8442	Nathaniel	Shkolnik	58969	8	n.shkolnik969@cvuhsd.org	13	M	9	D-104	Samuels, Kathleen C	Shkolnik, Nathaniel David	f	\N
8443	Ilaiakimi	Simana	59168	8	i.simana168@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Simana, Ilaiakimi Keola Malama	f	\N
8444	Isaiah	Skanes	59123	8	i.skanes123@cvuhsd.org	13	M	9	D-104	Samuels, Kathleen C	Skanes, Isaiah Milton	f	\N
8445	Jade	Smith	58096	8	j.smith096@cvuhsd.org	13	F	9	H-203	Rojas, Miguel Sr.	Smith, Jade Re'Ann	f	\N
8447	Samuel	Solares	57932	8	s.solares932@cvuhsd.org	13	M	9	G-105	Yorizane, Traci	Solares, Samuel	f	\N
8448	Brayan	Solis Pastrano	58453	8	b.solispastrano453@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Solis Pastrano, Brayan Alejandro	f	\N
8449	Jacob	Solis	58613	8	j.solis613@cvuhsd.org	13	M	9	G-107	Lopez, Maria	Solis, Jacob Abrahaam	f	\N
8450	David	Sorensen	58289	8	d.sorensen289@cvuhsd.org	13	M	9	G-105	Yorizane, Traci	Sorensen, David Kenneth	f	\N
8451	Josephine	Sotelo	57725	8	j.sotelo725@cvuhsd.org	13	F	9	F-102	Massey-Sloan, Patricia A	Sotelo, Josephine Guadalupe	f	\N
8452	Joseph	Soto	58303	8	j.soto303@cvuhsd.org	13	M	9	G-101	Komatsu, Chase	Soto, Joseph Gilberto	f	\N
8453	Westlee	St. Clair	58937	8	w.st.clair937@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	St. Clair, Westlee James	f	\N
8456	Karina	Suares Hidalgo	58060	8	k.suareshidalgo060@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Suares Hidalgo, Karina	f	\N
8457	Andrew	Suarez	58290	8	a.suarez290@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Suarez, Andrew Nathan	f	\N
8458	Valeria	Suazo Mendoza	58526	8	v.suazomendoza526@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Suazo Mendoza, Valeria Abigail	f	\N
8459	Leilani	Sumler	59180	8	l.sumler180@cvuhsd.org	13	F	9	G-101	Komatsu, Chase	Sumler, Leilani Marie	f	\N
8460	Lysean	Taishibmai Siromaliu	58038	8	l.taishibmaisirom038@cvuhsd.org	13	M	9	G-101	Komatsu, Chase	Taishibmai Siromaliu, Lysean Kaleo	f	\N
8461	Isabella	Tamayo	58291	8	i.tamayo291@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Tamayo, Isabella Marie	f	\N
8462	Jocelyn	Tapia	57696	8	j.tapia696@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Tapia, Jocelyn Lailah	f	\N
8463	Taaniela	Taufa	57790	8	t.taufa790@cvuhsd.org	13	M	9	G-105	Yorizane, Traci	Taufa, Taaniela Lisala Maama Mei Lototatau	f	\N
8464	Amare	Taylor	57791	8	a.taylor791@cvuhsd.org	13	M	9	G-203	Young, Royale	Taylor, Amare Lamar-Robert	f	\N
8465	Shaday	Taylor	58962	8	s.taylor962@cvuhsd.org	13	F	9	G-104	Mccoy, Bert L	Taylor, Shaday Melia	f	\N
8466	Brandon	Tejada Lopez	58576	8	b.tejadalopez576@cvuhsd.org	13	M	9	G-212	Harris, Annette	Tejada Lopez, Brandon Enrique	f	\N
8467	Travis	Tieu	57640	8	t.tieu640@cvuhsd.org	13	M	9	G-105	Yorizane, Traci	Tieu, Travis	f	\N
8468	Kayden	Toki	58662	8	k.toki662@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Toki, Kayden Stephen	f	\N
8471	Sophia	Torres	58273	8	s.torres273@cvuhsd.org	13	F	9	F-102	Massey-Sloan, Patricia A	Torres, Sophia	f	\N
8473	Khanh Vy	Tran Nguyen	59244	8	k.trannguyen244@cvuhsd.org	13	F	9	A-201	Salgado, Efrain	Tran Nguyen, Khanh Vy	f	\N
8476	Alonnah	Travis	58810	8	a.travis810@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Travis, Alonnah Lishi'	f	\N
8469	Marco	Torres Soriano	58127	8	m.torres127@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Torres Soriano, Marco Fabricio	t	\N
8455	Tamiyah	Styles	58006	8	t.styles006@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Styles, Tamiyah Leanna	t	\N
8470	Alejandro	Torres	58454	8	a.torres454@cvuhsd.org	13	M	9	G-203	Torres, Walter	Torres, Alejandro	t	\N
8472	Isaac	Torres-Alvarado	58267	8	i.torresalvarado267@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Torres-Alvarado, Isaac  Alexander	t	\N
8454	Michael	Stenson	58168	8	m.stenson168@cvuhsd.org	13	M	9	E-103	Talbott, Jose	StensonMichaelBenjamin	t	\N
8446	Landon	Smith	58812	8	l.smith812@cvuhsd.org	13	M	9	GYM 1	Miller, David L	Smith, Landon Anthony	t	\N
8475	Solaine	Tran	58293	8	s.tran293@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Tran, Solaine Dieuanh	t	\N
8474	Christa	Tran	57934	8	c.tran934@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Tran, ChristaThien Huong Mai	t	\N
8477	Yostin	Trochez Reyes	58455	8	y.trochezreyes455@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Trochez Reyes, Yostin Ariel	f	\N
8478	William	Tuihalamaka Jr	59071	8	w.tuihalamakajr071@cvuhsd.org	13	M	9	GYM 5	Marshall Jr, Robert	Tuihalamaka Jr, William Molitika	f	\N
8479	Chavis Jr	Tuimauga	58610	8	c.tuimauga610@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Tuimauga, Chavis Jr Chavar	f	\N
8480	Jorge	Ucan Navarro	58278	8	j.ucannavarro278@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Ucan Navarro, Jorge  Fernando	f	\N
8481	Kingston	Uhamaka	58970	8	k.uhamaka970@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Uhamaka, Kingston George	f	\N
8482	Ke'ron	Usher	59059	8	k.usher059@cvuhsd.org	13	M	9	G-104	Mccoy, Bert L	Usher, Ke'ron	f	\N
8483	Brandon	Valdes Avila	58376	8	b.valdesavila376@cvuhsd.org	13	M	9	A-201	Salgado, Efrain	Valdes Avila, Brandon Vicente	f	\N
8484	Andres	Valentin Castro	58245	8	a.valentincastro245@cvuhsd.org	13	F	9	G-212	Harris, Annette	Valentin Castro, Andres	f	\N
8485	George	Valladares	58077	8	g.valladares077@cvuhsd.org	13	M	9	G-203	Torres, Walter	Valladares, George Gee. Isreal	f	\N
8487	Mataiasi	Vanisi	59219	8	m.vanisi219@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Vanisi, Mataiasi Tofa Mo E Alo	f	\N
8489	Patrick	Vargas	58037	8	p.vargas037@cvuhsd.org	13	M	9	D-203	Haefner, Kevin L.	Vargas, Patrick Alexander	f	\N
8491	Byron	Vasquez	58606	8	b.vasquez606@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Vasquez, Byron Iram	f	\N
8492	Daniela	Vasquez	57723	8	d.vasquez723@cvuhsd.org	13	F	9	G-203	Torres, Walter	Vasquez, Daniela	f	\N
8493	Jayden	Vasquez	58605	8	j.vasquez605@cvuhsd.org	13	M	9	G-203	Young, Royale	Vasquez,Jayden Ernesto	f	\N
8494	Jaylene	Vasquez	57828	8	j.vasquez828@cvuhsd.org	13	F	9	G-109	Miranda, Denisse	Vasquez, Jaylene Eliana	f	\N
8495	Marlen	Vazquez Solares	59259	8	m.vazquezsolares259@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Vazquez Solares, Marlen Yareli	f	\N
8496	Damian	Vazquez	57860	8	d.vazquez860@cvuhsd.org	13	M	9	G-203	Torres, Walter	Vazquez, Damian Ulises	f	\N
8497	Natalie	Vazquez	57698	8	n.vazquez698@cvuhsd.org	13	F	9	G-111	Romo, Jose A.	Vazquez, Natalie Cecilia	f	\N
8498	Javier	Vela	58802	8	j.vela802@cvuhsd.org	13	M	9	G-203	Young, Royale	Vela, Javier Emilio	f	\N
8499	Katelynn	Vela	57859	8	k.vela859@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Vela, Katelynn	f	\N
8500	Anthony	Velasco	57857	8	a.velasco857@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Velasco, Anthony Jacob	f	\N
8501	Evren	Velazquez	58457	8	e.velazquez457@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Velazquez, Evren Edward	f	\N
8503	Fernanda	Venegas Garcia	57700	8	f.venegasgarcia700@cvuhsd.org	13	F	9	G-212	Harris, Annette	Venegas Garcia, Fernanda Eskarleth	f	\N
8505	Yaneli	Ventura Valerio	59096	8	y.venturavalerio096@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Ventura Valerio, Yaneli	f	\N
8506	Illussion	Vera	57829	8	i.vera829@cvuhsd.org	13	F	9	G-107	Lopez, Maria	Vera, Illussion Ninneth	f	\N
8507	Brandon	Viernes Orozco	57858	8	b.viernesorozco858@cvuhsd.org	13	M	9	G-105	Yorizane, Traci	Viernes Orozco, Brandon	f	\N
8508	Kiara	Villagran	59281	8	k.villagran281@cvuhsd.org	13	F	9	D-104	Samuels, Kathleen C	Villagran, Kiara Abigail	f	\N
8511	Jaelin	Wadman	58990	8	j.wadman990@cvuhsd.org	13	F	9	G-109	Miranda, Denisse	Wadman, Jaelin Bella	f	\N
8513	Mellodie	Wallick	59122	8	m.wallick122@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Wallick, Mellodie Renae	f	\N
8515	Kei'Von	Washington Jr	59162	8	k.washingtonjr162@cvuhsd.org	13	M	9	G-109	Miranda, Denisse	Washington Jr, Kei'Von Maurice Williams	f	\N
8516	Samuel	Washington	58504	8	s.washington504@cvuhsd.org	13	M	9	G-101	Mehta, Anand G	Washington, Samuel Isaiah	f	\N
8518	Tyrone	Webb Jr	59172	8	t.webbjr172@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Webb Jr, Tyrone Justin	f	\N
8519	Hamiley	Westbay	58167	8	h.westbay167@cvuhsd.org	13	F	9	F-102	Massey-Sloan, Patricia A	Westbay, Hamiley Rae	f	\N
8520	Ameer	Westbrooks-Muhammad	59159	8	a.westbrooksmuha159@cvuhsd.org	13	M	9	G-104	Mccoy, Bert L	Westbrooks-Muhammad, Ameer Hammad	f	\N
8521	Heaven	White	58893	8	h.white893@cvuhsd.org	13	F	9	G-203	Torres, Walter	White, Heaven Marie	f	\N
8522	Shyann	Williams	59063	8	s.williams063@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Williams, Shyann Raquel	f	\N
8523	Jayden	Wilson	58988	8	j.wilson988@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Wilson, Jayden Amori	f	\N
8524	Justin	Wilson	58989	8	j.wilson989@cvuhsd.org	13	M	9	A-201	Salgado, Efrain	Wilson, Justin Malik	f	\N
8525	Kash	Wilson	57701	8	k.wilson701@cvuhsd.org	13	M	9	G-101	Mehta, Anand G	Wilson, Kash Amir	f	\N
8526	Chiann	Wiseman	58577	8	c.wiseman577@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Wiseman, Chiann Deenae	f	\N
8514	Avonee	Walton	58236	8	a.walton236@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Walton, Avonee	t	\N
8486	Bryanna	Valle	58936	8	b.valle936@cvuhsd.org	13	F	9	H-201	Teichmann, Thomas E.	Valle, Bryanna Itzabella	t	\N
8517	Makaria	Watson	58626	8	m.watson626@cvuhsd.org	13	F	9	H-201	Teichmann, Thomas E.	Watson, Makaria Dayniese	t	\N
8502	Justin	Velazquez-Sierra	57980	8	j.velazquezsierra980@cvuhsd.org	13	M	9	F-102	Massey-Sloan, Patricia A	Velazquez-Sierra, Justin	t	\N
8512	Keithen	Walker Jr	58808	8	k.walkerjr808@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Walker Jr, Keithen Jeremy	t	\N
8504	Michael	Venegas	58018	8	m.venegas018@cvuhsd.org	13	M	9	G-105	Yorizane, Traci	Venegas, Michae lNathan	t	\N
8509	Isabella	Visoso	58146	8	i.visoso146@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Visoso, Isabella Delilah	t	\N
8510	Elizabeth	Vivar	57831	8	e.vivar831@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Vivar, Elizabeth Azalia	t	\N
8490	Jose	Vasquez Avelar	58502	8	j.vasquezavelar502@cvuhsd.org	13	M	9	H-203	Rojas, Miguel Sr.	Vasquez Avelar, Jose Carlos	t	\N
8527	Sovereign	Woods	58602	8	s.woods602@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Woods, Sovereign Sereign	f	\N
8529	Semaje	Wright	58511	8	s.wright511@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Wright, Semaje Malik	f	\N
8531	Jazmin	Zamora	57755	8	j.zamora755@cvuhsd.org	13	F	9	G-105	Yorizane, Traci	Zamora, Jazmin Alyssa	f	\N
8532	Adrian	Zaragoza	57950	8	a.zaragoza950@cvuhsd.org	13	M	9	GYM 2	Iveland, Stephanie J.	Zaragoza, Adrian	f	\N
8533	Jocelyn	Zaragoza	58947	8	j.zaragoza947@cvuhsd.org	13	F	9	GYM 2	Iveland, Stephanie J.	Zaragoza, Jocelyn	f	\N
8534	Emily	Zepeda	59192	8	e.zepeda192@cvuhsd.org	13	F	9	GYM 5	Marshall Jr, Robert	Zepeda, Emily Janet	f	\N
8535	Luleah	Zerazion	58380	8	l.zerazion380@cvuhsd.org	13	F	9	GYM 1	Miller, David L	Zerazion, Luleah  Toni	f	\N
8536	Itzary	Zuniga	58195	8	i.zuniga195@cvuhsd.org	13	F	9	G-203	Torres, Walter	Zuniga, Itzary Ixabell	f	\N
8537	Isaac	Acevedo Fuentes	56476	8	i.acevedofuentes476@cvuhsd.org	13	M	10	G-202	Ann, Jane	Acevedo Fuentes, Isaac Antonio	f	\N
8538	Nikolas	Acevedo	56765	8	n.acevedo765@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Acevedo, Nikolas Steban	f	\N
8539	London	Acuna	57196	8	l.acuna196@cvuhsd.org	13	M	10	G-206	Thomas, Michelle	Acuna, London Malique	f	\N
8540	Elka	Adame Corrales	56171	8	e.adamecorrales171@cvuhsd.org	13	F	10	F-204	Brent, Sharone	Adame Corrales, Elka Gabriella	f	\N
8541	Ari	Adams	56555	8	a.adams555@cvuhsd.org	13	M	10	G-201	Doan, Andrew	Adams, Ari Antoine	f	\N
8542	Merwais	Afzali	57161	8	m.afzali161@cvuhsd.org	13	M	10	D-202	Chung, Joshua S	Afzali, Merwais	f	\N
8543	Mia	Aguilar Chiguila	56379	8	m.aguilarchiguila379@cvuhsd.org	13	F	10	GYM 3	Tucker, Erich L	Aguilar Chiguila, Mia Ayleen	f	\N
8544	Alison	Aguilar	57216	8	a.aguilar216@cvuhsd.org	13	F	10	E-205	Rollino, Christian P	Aguilar, Alison Clarise	f	\N
8545	Leah	Aguilar	56653	8	l.aguilar653@cvuhsd.org	13	F	10	G-208	Tran, Maichi N.	Aguilar, Leah Gianna	f	\N
8546	Yunnuen	Aguilar	55933	8	y.aguilar933@cvuhsd.org	13	M	10	F-204	Brent, Sharone	Aguilar, Yunnuen	f	\N
8547	Annabelle	Aguirre	57552	8	a.aguirre552@cvuhsd.org	13	F	10	C-206	Stewart, Jomo K	Aguirre, Annabelle	f	\N
8548	Stephany	Aguirre	55953	8	s.aguirre953@cvuhsd.org	13	F	10	G-202	Ann, Jane	Aguirre, Stephany	f	\N
8549	Katinia	Ahoia	57040	8	k.ahoia040@cvuhsd.org	13	F	10	B-1	Cassio, Michael J.	Ahoia, Katinia Lupe	f	\N
8550	Evelin	Ake Ku	57189	8	e.akeku189@cvuhsd.org	13	F	10	C-105	Williamson, Brianna R	Ake Ku, Evelin Elizabeth	f	\N
8551	Victoria	Alarcon	57004	8	v.alarcon004@cvuhsd.org	13	F	10	F-204	Brent, Sharone	Alarcon, Victoria Mia	f	\N
8552	Marisel	Alcazar Jara	56626	8	m.alcazarjara626@cvuhsd.org	13	F	10	F-204	Brent, Sharone	Alcazar Jara, Marisel Joselyn	f	\N
8553	Fernanda	Aldana-Rodas	55792	8	f.aldanarodas792@cvuhsd.org	13	F	10	G-201	Doan, Andrew	Aldana-Rodas, Fernanda Abigail	f	\N
8554	Christian	Alexander	55925	8	c.alexander925@cvuhsd.org	13	M	10	G-202	Ann, Jane	Alexander, Christian Mark	f	\N
8555	Kayden	Alexander	56243	8	k.alexander243@cvuhsd.org	13	F	10	C-206	Stewart, Jomo K	Alexander, Kayden Marie	f	\N
8556	Jude	Allen	55926	8	j.allen926@cvuhsd.org	13	M	10	G-202	Ann, Jane	Allen, Jude Ramon	f	\N
8557	Katelyn	Allen	56567	8	k.allen567@cvuhsd.org	13	F	10	GYM 3	Tucker, Erich L	Allen, Katelyn Renee	f	\N
8558	Demoya	Alliman	56285	8	d.alliman285@cvuhsd.org	13	F	10	G-202	Ann, Jane	Alliman, Demoya Tatiana	f	\N
8559	Joshuan	Alva Funes	57570	8	j.alvafunes570@cvuhsd.org	13	M	10	D-202	Chung, Joshua S	Alva Funes, Joshuan Jose	f	\N
8560	Joan	Alvarado Rico	57328	8	j.alvaradorico328@cvuhsd.org	13	M	10	GYM 6	Singleton, Sigmund	Alvarado Rico, Joan Brandon	f	\N
8561	Lenny	Alvarez	56666	8	l.alvarez666@cvuhsd.org	13	M	10	F-202	Rogers, Marie	Alvarez, Lenny Eduardo	f	\N
8562	Noemi	Alvarez	56832	8	n.alvarez832@cvuhsd.org	13	F	10	D-103	Sarpong, Kwame Kwakye	Alvarez, Noemi Joanna	f	\N
8563	Kaydence	Amey	56370	8	k.amey370@cvuhsd.org	13	F	10	C-206	Stewart, Jomo K	Amey, Kaydence Anita-Marie	f	\N
8564	Everardo	Amezcua	57214	8	e.amezcua214@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Amezcua, Everardo	f	\N
8565	Lynda	Amezola	56076	8	l.amezola076@cvuhsd.org	13	F	10	H-204	Gilbert, Sean M.	Amezola, Lynda Heidi	f	\N
8566	Tiffanie	Anaya	56667	8	t.anaya667@cvuhsd.org	13	F	10	G-206	Thomas, Michelle	Anaya, Tiffanie Nicole	f	\N
8567	Vianette	Anaya	55969	8	v.anaya969@cvuhsd.org	13	F	10	H-204	Gilbert, Sean M.	Anaya, Vianette Celine	f	\N
8568	Vivianne	Anaya	55954	8	v.anaya954@cvuhsd.org	13	F	10	H-204	Gilbert, Sean M.	Anaya, Vivianne Celeste	f	\N
8569	Giselle	Antuna	56005	8	g.antuna005@cvuhsd.org	13	F	10	C-205	Dibrell, Renee	Antuna, Giselle Juliana	f	\N
8570	Hugo	Aquino Jr	55764	8	h.aquinojr764@cvuhsd.org	13	M	10	H-204	Gilbert, Sean M.	Aquino Jr, Hugo	f	\N
8571	Ruby	Arellano	56210	8	r.arellano210@cvuhsd.org	13	F	10	F-204	Brent, Sharone	Arellano, Ruby Celestte	f	\N
8572	Mariella	Arevalo	55718	8	m.arevalo718@cvuhsd.org	13	F	10	G-111	Romo, Jose A.	Arevalo, Mariella	f	\N
8573	Sophia	Arrivillaga	56779	8	s.arrivillaga779@cvuhsd.org	13	F	10	C-105	Williamson, Brianna R	Arrivillaga, Sophia Olivia	f	\N
8574	Ayanna	Arzu	55989	8	a.arzu989@cvuhsd.org	13	F	10	F-202	Rogers, Marie	Arzu, Ayanna Thais	f	\N
8575	Nicolle	Ascencio Serpas	55748	8	n.ascencioserpas748@cvuhsd.org	13	F	10	G-202	Ann, Jane	Ascencio Serpas, Nicolle Monserrat	f	\N
8576	Tatyana	Aubry	57759	8	t.aubry759@cvuhsd.org	13	F	10	G-108	Ramirez, Lourdes	Aubry, Tatyana De'Shay	f	\N
8577	Isaac	Avalos Navarro	56205	8	i.avalosnavarro205@cvuhsd.org	13	M	10	G-206	Thomas, Michelle	Avalos NavarroI, saac Joe	f	\N
8578	Isabella	Baetiong	56522	8	i.baetiong522@cvuhsd.org	13	F	10	E-205	Rollino, Christian P	Baetiong, Isabella Saludes	f	\N
8530	Rama	Yassine	57919	8	r.yassine919@cvuhsd.org	13	F	9	D-203	Haefner, Kevin L.	Yassine, Rama Saadallah	t	\N
8579	Sophia	Baetiong	56523	8	s.baetiong523@cvuhsd.org	13	F	10	G-201	Doan, Andrew	Baetiong, Sophia Saludes	f	\N
8580	Darrell	Bagsby III	58090	8	d.bagsby090@cvuhsd.org	13	M	10	F-202	Rogers, Marie	Bagsby III, Darrell Michael	f	\N
8581	Ca'Yah	Baltzgar	56475	8	c.baltzgar475@cvuhsd.org	13	F	10	F-204	Brent, Sharone	Baltzgar, Ca'Yah Evevonne-Jean	f	\N
8582	Jason	Barahona	56487	8	j.barahona487@cvuhsd.org	13	M	10	F-201	Mai, Van C	Barahona, Jason Mauricio	f	\N
8583	Aniya'h	Barnes	56648	8	a.barnes648@cvuhsd.org	13	F	10	F-204	Brent, Sharone	Barnes, Aniya'h Cadillac Princess	f	\N
8584	Edgar	Barraza	57114	8	e.barraza114@cvuhsd.org	13	M	10	G-102	Davis, Bryce	Barraza, Edgar Alexander	f	\N
8585	Christopher	Barrios	56404	8	c.barrios404@cvuhsd.org	13	M	10	G-202	Ann, Jane	Barrios, Christopher Edgar	f	\N
8586	Katelyn	Batista	57444	8	k.batista444@cvuhsd.org	13	F	10	E-203	Soufl, Kalei	Batista, Katelyn Violeta	f	\N
8587	Amina	Benson-Usiade	58619	8	a.bensonusiade619@cvuhsd.org	13	F	10	G-206	Thomas, Michelle	Benson-Usiade, Amina Ariella Chidera	f	\N
8588	Ebelechukwu	Biosah	56346	8	e.biosah346@cvuhsd.org	13	F	10	C-105	Williamson, Brianna R	Biosah, Ebelechukwu Anne	f	\N
8589	Astrid	Bragg Marquez	57244	8	a.marquez244@cvuhsd.org	13	F	10	C-105	Williamson, Brianna R	Bragg Marquez, Astrid	f	\N
8590	Raziel	Brizuela	57070	8	r.brizuela070@cvuhsd.org	13	F	10	C-205	Dibrell, Renee	Brizuela, Razie lAriana	f	\N
8591	Katarah	Bryant	57237	8	k.bryant237@cvuhsd.org	13	F	10	F-201	Mai, Van C	Bryant, Katarah Cordese	f	\N
8592	Juan	Burga Timoteo	55937	8	j.burgatimoteo937@cvuhsd.org	13	M	10	GYM 3	Tucker, Erich L	Burga Timoteo, Juan Leonardo	f	\N
8593	Glorianna	Cabrera	57202	8	g.cabrera202@cvuhsd.org	13	F	10	GYM 6	Singleton, Sigmund	Cabrera, Glorianna Michelle	f	\N
8594	Rony	Calderon	57532	8	r.calderon532@cvuhsd.org	13	M	10	G-206	Miller, Jason	Calderon, Rony Xander	f	\N
8595	Johnny	Calhoun	57069	8	j.calhoun069@cvuhsd.org	13	M	10	G-201	Doan, Andrew	Calhoun, Johnny Barack	f	\N
8596	Natalie	Callahan	55955	8	n.callahan955@cvuhsd.org	13	F	10	G-202	Ann, Jane	Callahan, Natalie Bliss	f	\N
8597	Andrea	Callejas	56884	8	a.callejas884@cvuhsd.org	13	F	10	G-201	Doan, Andrew	Callejas, Andrea Michelle	f	\N
8598	Rocio	Camacho Ramirez	56570	8	r.camachoramirez570@cvuhsd.org	13	F	10	F-201	Mai, Van C	Camacho Ramirez, Rocio	f	\N
8599	Sabrina	Camacho	55824	8	s.camacho824@cvuhsd.org	13	F	10	G-206	Miller, Jason	Camacho, Sabrina Danielle	f	\N
8600	Zoe	Camacho	56568	8	z.camacho568@cvuhsd.org	13	F	10	C-205	Dibrell, Renee	Camacho, Zoe Hanali	f	\N
8601	Daisy	Camino	56235	8	d.camino235@cvuhsd.org	13	F	10	H-204	Gilbert, Sean M.	Camino, Daisy Violeta	f	\N
8602	Emmanuel	Campos	55865	8	e.campos865@cvuhsd.org	13	M	10	G-202	Ann, Jane	Campos, Emmanuel Carlos	f	\N
8603	Hailie	Campos	56043	8	h.campos043@cvuhsd.org	13	F	10	E-205	Rollino, Christian P	Campos, Hailie Naomi	f	\N
8604	Nadia	Campos	56909	8	n.campos909@cvuhsd.org	13	F	10	F-201	Mai, Van C	Campos, Nadia Isabella	f	\N
8605	Allison	Carballo Hernandez	56413	8	a.carballohernand413@cvuhsd.org	13	F	10	F-204	Brent, Sharone	Carballo Hernandez, Allison Miriam	f	\N
8606	Saira	Carranza	58623	8	s.carranza623@cvuhsd.org	13	F	10	GYM 6	Singleton, Sigmund	Carranza, Saira Maritza	f	\N
8607	Brenda	Carreto	55935	8	b.carreto935@cvuhsd.org	13	F	10	G-102	Davis, Bryce	Carreto, Brenda Guadalupe	f	\N
8608	Cristofer	Carrillo Giron	56160	8	c.carrillogiron160@cvuhsd.org	13	F	10	G-206	Thomas, Michelle	Carrillo Giron, Cristofer Franchesco	f	\N
8609	Ashly	Carrillo Mendez	57307	8	a.carrillomendez307@cvuhsd.org	13	F	10	D-202	Chung, Joshua S	Carrillo Mendez, Ashly Cafferin Anai	f	\N
8610	Michelle	Carrillo Soto	56867	8	m.carrillosoto867@cvuhsd.org	13	F	10	G-206	Thomas, Michelle	Carrillo Soto, Michelle Vanessa	f	\N
8611	Brenda	Castaneda	56302	8	b.castaneda302@cvuhsd.org	13	F	10	C-105	Williamson, Brianna R	Castaneda, Brenda Renata	f	\N
8612	Naithen	Castellon-Mendez	56081	8	n.castellonmendez081@cvuhsd.org	13	M	10	GYM 6	Singleton, Sigmund	Castellon-Mendez, Naithen Xander	f	\N
8613	Emily	Castillo Jimenez	57245	8	e.castillojimenez245@cvuhsd.org	13	F	10	GYM 3	Tucker, Erich L	Castillo Jimenez, Emily Monserrath	f	\N
8614	Angelo	Castillo Larios	57472	8	a.castillolarios472@cvuhsd.org	13	M	10	GYM 6	Singleton, Sigmund	Castillo Larios, Angelo Antonio	f	\N
8615	Bryan	Castillo Serrano	57629	8	b.castilloserrano629@cvuhsd.org	13	M	10	D-202	Chung, Joshua S	Castillo Serrano, Bryan Alexis	f	\N
8616	Christian	Castillo	56604	8	c.castillo604@cvuhsd.org	13	M	10	F-202	Rogers, Marie	Castillon Christian Alexander	f	\N
8617	Jacob	Castillo	56918	8	j.castillo918@cvuhsd.org	13	M	10	G-201	Doan, Andrew	Castillo, Jacob Alexander	f	\N
8618	Sebastian	Castillo	56482	8	s.castillo482@cvuhsd.org	13	M	10	G-202	Ann, Jane	Castillo, Sebastian Ruben	f	\N
8619	Shawn Matthew	Catamisan	56704	8	s.catamisan704@cvuhsd.org	13	M	10	F-204	Brent, Sharone	Catamisan, Shawn Matthew Ramirez	f	\N
8620	Ayleen	Ceballos	56933	8	a.ceballos933@cvuhsd.org	13	F	10	C-206	Stewart, Jomo K	Ceballos, Ayleen Samira	f	\N
8621	Angel	Chacon Agreda	56094	8	a.chaconagreda094@cvuhsd.org	13	M	10	F-204	Brent, Sharone	Chacon Agreda, Ange lEsteban	f	\N
8622	Amil	Chapman	56894	8	a.chapman894@cvuhsd.org	13	F	10	E-203	Soufl, Kalei	Chapman, Amil Cora Sharon	f	\N
8623	Carissa	Chau	55720	8	c.chau720@cvuhsd.org	13	F	10	G-202	Ann, Jane	Chau, Carissa Ngoc-Nhu	f	\N
8624	Delia	Chavarin	56161	8	d.chavarin161@cvuhsd.org	13	F	10	E-205	Rollino, Christian P	Chavarin, Delia Sarah	f	\N
8625	Mathews	Chavarri Canales	56556	8	m.chavarricanales556@cvuhsd.org	13	M	10	G-111	Romo, Jose A.	Chavarri Canales, Mathews Andre	f	\N
8626	Nathan	Chavez Torres	58495	8	n.chaveztorres495@cvuhsd.org	13	M	10	F-202	Rogers, Marie	Chavez Torres, Nathan Joel	f	\N
8627	Danna	Chavez Villafuerte	56651	8	d.chavezvillafuer651@cvuhsd.org	13	F	10	E-203	Soufl, Kalei	Chavez Villafuerte, Danna Jasmin	f	\N
8628	Brandon	Chavez	55982	8	b.chavez982@cvuhsd.org	13	M	10	D-103	Sarpong, Kwame Kwakye	Chavez, Brandon Eduardo	f	\N
8629	Daniel	Chavez	56919	8	d.chavez919@cvuhsd.org	13	M	10	GYM 3	Tucker, Erich L	Chavez, Daniel Jowell	f	\N
8630	Guillermo	Chavez	56347	8	g.chavez347@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Chavez, Guillermo	f	\N
8631	Joanna	Chavez	56407	8	j.chavez407@cvuhsd.org	13	F	10	GYM 6	Singleton, Sigmund	Chavez, Joanna	f	\N
8632	Adam	Chiheb	57519	8	a.chiheb519@cvuhsd.org	13	M	10	D-202	Chung, Joshua S	Chiheb, Adam	f	\N
8633	Caleb	Childs	57198	8	c.childs198@cvuhsd.org	13	M	10	G-206	Miller, Jason	Childs, Caleb Alexander	f	\N
8634	Jessica	Chukwuani	57549	8	j.chukwuani549@cvuhsd.org	13	F	10	C-206	Stewart, Jomo K	Chukwuani, Jessica Kamsi	f	\N
8635	Angelina	Chunab	56468	8	a.chunab468@cvuhsd.org	13	F	10	E-205	Rollino, Christian P	Chunab, Angelina Juliet	f	\N
8636	Sergio	Cifuentes Basurto	56975	8	s.cifuentesbasurt975@cvuhsd.org	13	M	10	GYM 3	Tucker, Erich L	Cifuentes Basurto, Sergio Angel	f	\N
8637	Kenneth	Conner lll	58160	8	k.connerlll160@cvuhsd.org	13	M	10	E-205	Rollino, Christian P	Conner lll, Kenneth Antoine	f	\N
8638	Clinton	Copeland	57208	8	c.copeland208@cvuhsd.org	13	M	10	C-203	Naluswa, Margaret	Copeland, Clinton Connor	f	\N
8639	Maria	Cortes	55991	8	m.cortes991@cvuhsd.org	13	F	10	D-103	Sarpong, Kwame Kwakye	Cortes, Maria Olga	f	\N
8640	Anthony	Cortez	56628	8	a.cortez628@cvuhsd.org	13	M	10	E-205	Rollino, Christian P	Cortez, Anthony Mario	f	\N
8641	Emily	Covarrubias - Proa	58540	8	e.covarrubiaspro540@cvuhsd.org	13	F	10	C-205	Dibrell, Renee	Covarrubias - Proa, Emily Nivia	f	\N
8642	Chris	Cruz Gomez	56056	8	c.cruzgomez056@cvuhsd.org	13	M	10	D-103	Sarpong, Kwame Kwakye	Cruz Gomez, Chris Branley	f	\N
8643	Victor	Cruz Robles	57188	8	v.cruzrobles188@cvuhsd.org	13	M	10	F-202	Rogers, Marie	Cruz Robles, Victor Daniel	f	\N
8644	Jorge	Cruz Urias	57304	8	j.cruzurias304@cvuhsd.org	13	M	10	G-102	Davis, Bryce	Cruz Urias, Jorge Mario	f	\N
8645	Hector	Cruz	56936	8	h.cruz936@cvuhsd.org	13	M	10	H-204	Gilbert, Sean M.	Cruz, Hector Eduardo	f	\N
8646	Naleeah	Cruz	56320	8	n.cruz320@cvuhsd.org	13	F	10	G-208	Tran, Maichi N.	Cruz, Naleeah Tamire	f	\N
8647	Rogelio	Cuevas Martinez	55911	8	r.cuevasmartinez911@cvuhsd.org	13	M	10	GYM 3	Tucker, Erich L	Cuevas Martinez, Rogelio	f	\N
8648	Dylan	Curry	57802	8	d.curry802@cvuhsd.org	13	M	10	G-201	Doan, Andrew	Curry, Dylan	f	\N
8649	Gadiel	Davalos	56173	8	g.davalos173@cvuhsd.org	13	M	10	GYM 3	Tucker, Erich L	Davalos, Gadiel	f	\N
8650	Gianna	Davila	57293	8	g.davila293@cvuhsd.org	13	F	10	D-107	Williams, Sherrevia A	Davila, Gianna Jaeden	f	\N
8651	Kelaiah	Davis	56674	8	k.davis674@cvuhsd.org	13	F	10	G-201	Doan, Andrew	Davis, Kelaiah Kaylon	f	\N
8652	Jonathan	De La Cruz	56074	8	j.delacruz074@cvuhsd.org	13	M	10	D-205	Brown, Arianne	De La Cruz, Jonathan	f	\N
8653	Isaiah	De Los Santos Contreras	56411	8	i.delossantoscont411@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	De Los Santos Contreras, Isaiah Carlos	f	\N
8654	Ruthanne	De Paz	56187	8	r.depaz187@cvuhsd.org	13	F	10	E-205	Rollino, Christian P	De Paz, Ruthanne Victoria-Elizabeth	f	\N
8655	Kratos	De Santiago	58877	8	k.desantiago877@cvuhsd.org	13	M	10	H-203	Rojas, Miguel Sr.	De Santiago, Kratos Montoya	f	\N
8656	Britany	Delgado Acevedo	57331	8	b.delgadoacevedo331@cvuhsd.org	13	F	10	D-202	Chung, Joshua S	Delgado Acevedo, Britany Mayoline	f	\N
8657	Briseyda	Delgado	56336	8	b.delgado336@cvuhsd.org	13	F	10	G-202	Ann, Jane	Delgado, Briseyda Marie	f	\N
8658	Andres	Diaz	57247	8	a.diaz247@cvuhsd.org	13	M	10	D-205	Brown, Arianne	Diaz, Andres Jesus	f	\N
8659	Jason	Diaz	56529	8	j.diaz529@cvuhsd.org	13	M	10	E-205	Rollino, Christian P	Diaz, Jason Derick	f	\N
8660	Melvin	Diaz-Ayala	55940	8	m.diazayala940@cvuhsd.org	13	M	10	G-111	Romo, Jose A.	Diaz-Ayala, Melvin David	f	\N
8661	Andrew	Dominguez	56938	8	a.dominguez938@cvuhsd.org	13	M	10	D-205	Brown, Arianne	Dominguez, Andrew Matthew	f	\N
8662	Yuliana	Donis Garcia	57034	8	y.donisgarcia034@cvuhsd.org	13	F	10	G-206	Thomas, Michelle	Donis Garcia, Yuliana Berenice	f	\N
8663	Sophia	Elias	56149	8	s.elias149@cvuhsd.org	13	F	10	F-202	Rogers, Marie	Elias, Sophia Monique	f	\N
8664	Hana	Ellis	57261	8	h.ellis261@cvuhsd.org	13	F	10	H-204	Gilbert, Sean M.	Ellis, Hana Analia	f	\N
8665	Sophia	Elnahrawy	55852	8	s.elnahrawy852@cvuhsd.org	13	F	10	G-202	Ann, Jane	Elnahrawy, Sophia Rose	f	\N
8666	Obed	Enriquez	56194	8	o.enriquez194@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Enriquez, Obed David	f	\N
8667	Roberto	Escobar	55721	8	r.escobar721@cvuhsd.org	13	M	10	G-202	Ann, Jane	Escobar, Roberto Carlos	f	\N
8668	Kassandra	Escobedo	55722	8	k.escobedo722@cvuhsd.org	13	F	10	E-205	Rollino, Christian P	Escobedo, Kassandra	f	\N
8669	Ruth	Espana Frausto	57240	8	r.espanafrasto240@cvuhsd.org	13	F	10	F-201	Mai, Van C	Espana Frausto, Ruth Getsemani	f	\N
8670	Christopher	Espinoza Del Cid	57468	8	c.espinozadelcid468@cvuhsd.org	13	M	10	G-102	Davis, Bryce	Espinoza Del Cid, Christopher Yosemar	f	\N
8671	Yuan Elliot	Espiritu	55723	8	y.espiritu723@cvuhsd.org	13	M	10	C-205	Dibrell, Renee	Espiritu, Yuan Elliot Auxilian	f	\N
8672	Jocelyn	Esquivel	56012	8	j.esquivel012@cvuhsd.org	13	F	10	E-203	Soufl, Kalei	Esquivel, Jocelyn Guadalupe	f	\N
8673	Brandon	Esquivel-Diaz	57308	8	b.esquivel308@cvuhsd.org	13	M	10	D-107	Williams, Sherrevia A	Esquivel-Diaz, Brandon Gabriel	f	\N
8674	Brian	Essah	59089	8	b.essah089@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Essah, Brian Jackson	f	\N
8675	Eder	Estrada Barrios	56214	8	e.estradabarrios214@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Estrada Barrios, Eder Daniel	f	\N
8676	Jose	Estrada Najera	56474	8	j.estradanajera474@cvuhsd.org	13	M	10	E-205	Rollino, Christian P	Estrada Najera, Jose Daniel	f	\N
8677	Jayden	Estrada	56267	8	j.estrada267@cvuhsd.org	13	M	10	H-204	Gilbert, Sean M.	Estrada, Jayden Angelo	f	\N
8678	Joshua	Estrada	57073	8	j.estrada073@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Estrada, Joshua Amador Rivas	f	\N
8679	Chimdindu	Ezeh	55783	8	c.ezeh783@cvuhsd.org	13	M	10	E-205	Rollino, Christian P	Ezeh, Chimdindu Patrick Stanley	f	\N
8680	Travis	Facer	55758	8	t.facer758@cvuhsd.org	13	M	10	E-205	Rollino, Christian P	Facer, Travis Jacob	f	\N
8681	Jesse	Falcon	56501	8	j.falcon501@cvuhsd.org	13	M	10	E-205	Rollino, Christian P	Falcon, Jesse	f	\N
8682	Aiden	Fernandez	56399	8	a.fernandez399@cvuhsd.org	13	M	10	GYM 6	Singleton, Sigmund	Fernandez, Aiden Estevan	f	\N
8683	Yvette	Fernandez	56327	8	y.fernandez327@cvuhsd.org	13	F	10	G-208	Tran, Maichi N.	Fernandez, Yvette Sarai	f	\N
8684	Jaxson	Filip	57005	8	j.filip005@cvuhsd.org	13	M	10	F-201	Mai, Van C	Filip, Jaxson Tyler	f	\N
8685	Honesty	Fleming	55862	8	h.fleming862@cvuhsd.org	13	F	10	H-204	Gilbert, Sean M.	Fleming, Honesty Myshay Marie	f	\N
8686	Ayana	Flores	56543	8	a.flores543@cvuhsd.org	13	F	10	E-203	Soufl, Kalei	Flores, Ayana Yuliana	f	\N
8687	Juan	Fonseca Morales	56716	8	j.fonsecamorales716@cvuhsd.org	13	M	10	E-205	Rollino, Christian P	Fonseca Morales, Juan Rafael	f	\N
8688	Kenneth	Furman	59020	8	k.furman020@cvuhsd.org	13	M	10	H-203	Rojas, Miguel Sr.	Furman, Kenneth Edward-Jacob	f	\N
8689	Alvin	Gachucha	57035	8	a.gachucha035@cvuhsd.org	13	M	10	H-204	Gilbert, Sean M.	Gachucha, Alvin Jeff	f	\N
8690	Hailey	Galicia	56941	8	h.galicia941@cvuhsd.org	13	F	10	G-201	Doan, Andrew	Galicia, Hailey Aliyah	f	\N
8691	Alezae	Gallegos	56644	8	a.gallegos644@cvuhsd.org	13	F	10	C-105	Williamson, Brianna R	Gallegos, Alezae	f	\N
8692	Alex	Garcia Santiago	55924	8	a.garciasantiago924@cvuhsd.org	13	M	10	H-204	Gilbert, Sean M.	Garcia Santiago, Alex	f	\N
8693	Greis	Garcia Villatoro	56609	8	g.garciavillatoro609@cvuhsd.org	13	F	10	C-206	Stewart, Jomo K	Garcia Villatoro, Greis Jaretzy del Milagro	f	\N
8694	Breanna	Garcia	56061	8	b.garcia061@cvuhsd.org	13	F	10	C-206	Stewart, Jomo K	Garcia, Breanna Marie	f	\N
8695	Destiny	Garcia	56395	8	d.garcia395@cvuhsd.org	13	F	10	D-103	Sarpong, Kwame Kwakye	Garcia, Destiny Alexandra	f	\N
8696	Marco	Garcia	57207	8	m.garcia207@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Garcia, Marco Jesus	f	\N
8697	Valentina	Garcia	56175	8	v.garcia175@cvuhsd.org	13	F	10	H-204	Gilbert, Sean M.	Garcia, Valentina	f	\N
8698	Jacob	Garcia-Rodriguez	55909	8	j.garciarodriguez909@cvuhsd.org	13	M	10	F-103	Kaiser, Noah	Garcia-Rodriguez, Jacob Lorenzo	f	\N
8699	Emely	George	55930	8	e.george930@cvuhsd.org	13	F	10	F-103	Kaiser, Noah	George, Emely	f	\N
8700	Joseph	Gerald	56021	8	j.gerald021@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Gerald, Joseph Victor	f	\N
8701	Ahtziri	Gil	56148	8	a.gil148@cvuhsd.org	13	F	10	GYM 3	Tucker, Erich L	Gil, Ahtzire Stephanie	f	\N
8702	Adonis	Gomez Jandres	56981	8	a.gomezjandres981@cvuhsd.org	13	M	10	G-208	Tran, Maichi N.	Gomez Jandres, Adonis Marcelo	f	\N
8703	Carlos	Gomez Luna	56400	8	c.gomezluna400@cvuhsd.org	13	M	10	C-205	Dibrell, Renee	Gomez Luna, Carlos Heliodoro	f	\N
8704	Joseangel	Gomez Polanco	55760	8	j.gomezpolanco760@cvuhsd.org	13	M	10	G-202	Ann, Jane	Gomez Polanco, Joseangel	f	\N
8705	Ashley	Gomez	56258	8	a.gomez258@cvuhsd.org	13	F	10	C-206	Stewart, Jomo K	Gomez, Ashley Naomy	f	\N
8706	Elias	Gomez	55724	8	e.gomez724@cvuhsd.org	13	M	10	H-204	Gilbert, Sean M.	Gomez, Elias Daniel	f	\N
8707	Manny	Gomez-Luna	56775	8	m.gomezluna775@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Gomez-Luna, Manny Luis	f	\N
8708	Leila	Gonzales	58773	8	l.gonzales773@cvuhsd.org	13	F	10	G-201	Doan, Andrew	Gonzales, Leila Paulette	f	\N
8709	Morriah	Gonzales-Quispe	58824	8	m.gonzalesquispe824@cvuhsd.org	13	F	10	D-202	Chung, Joshua S	Gonzales-Quispe, Morriah Sakura	f	\N
8710	Luzeli	Gonzalez Agundez	57319	8	l.gonzalezagundez319@cvuhsd.org	13	F	10	D-104	Samuels, Kathleen C	Gonzalez Agundez, Luzeli Azareth	f	\N
8711	Ariana	Gonzalez Mezzich	57186	8	a.gonzalezmezzich186@cvuhsd.org	13	F	10	D-202	Chung, Joshua S	Gonzalez Mezzich, Ariana Lorena	f	\N
8712	Aaron	Gonzalez	56101	8	a.gonzalez101@cvuhsd.org	13	M	10	G-202	Ann, Jane	Gonzalez, Aaron	f	\N
8713	Genesis	Gonzalez	57192	8	g.gonzalez192@cvuhsd.org	13	F	10	C-206	Stewart, Jomo K	Gonzalez, Genesis Arely	f	\N
8714	Genesis	Gonzalez	55853	8	g.gonzalez853@cvuhsd.org	13	F	10	G-202	Ann, Jane	Gonzalez, Genesis Neomi	f	\N
8715	Jayden	Gonzalez	56606	8	j.gonzalez606@cvuhsd.org	13	M	10	F-202	Rogers, Marie	Gonzalez, Jayden Xavier	f	\N
8716	Jose	Gonzalez	55725	8	j.gonzalez725@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Gonzalez, Jose Ruben	f	\N
8717	Sammy	Gonzalez	56108	8	s.gonzalez108@cvuhsd.org	13	M	10	H-204	Gilbert, Sean M.	Gonzalez, Sammy Nathan	f	\N
8718	Ja'Kye	Green	56890	8	j.green890@cvuhsd.org	13	M	10	B-1	Cassio, Michael J.	Green, Ja'Kye Syncere	f	\N
8719	Bryan	Guerrero Galarza	55848	8	b.guerrerogalarza848@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Guerrero Galarza, Bryan Obidio	f	\N
8720	Andres	Gutierrez	56903	8	a.gutierrez903@cvuhsd.org	13	M	10	G-111	Romo, Jose A.	Gutierrez, Andres	f	\N
8721	Casandra	Gutierrez	56785	8	c.gutierrez785@cvuhsd.org	13	F	10	F-202	Rogers, Marie	Gutierrez, Casandra Alicia	f	\N
8722	Joshua	Gutierrez	55726	8	j.gutierrez726@cvuhsd.org	13	M	10	G-111	Romo, Jose A.	Gutierrez, Joshua	f	\N
8723	Anthony	Guzman	56001	8	a.guzman001@cvuhsd.org	13	M	10	C-203	Naluswa, Margaret	Guzman, Anthony Josue	f	\N
8724	Hosannah	Haile	56334	8	h.haile334@cvuhsd.org	13	F	10	G-108	Ramirez, Lourdes	Haile, Hosannah Mengsteab	f	\N
8725	Toan	Hang	56479	8	t.hang479@cvuhsd.org	13	M	10	G-202	Ann, Jane	Hang, Toan Le Quang	f	\N
8726	Jazmyn	Harrell	56462	8	j.harrell462@cvuhsd.org	13	F	10	F-204	Brent, Sharone	Harrell, Jazmyn Elise	f	\N
8727	Adryan	Hermosillo	58737	8	a.hermosillo737@cvuhsd.org	13	M	10	E-205	Rollino, Christian P	Hermosillo, Adryan Antonio	f	\N
8728	Ricardo	Hernandez Jr	56433	8	r.hernandezjr433@cvuhsd.org	13	M	10	C-105	Williamson, Brianna R	Hernandez Jr, Ricardo	f	\N
8729	Joselyn	Hernandez Rodriguez	56498	8	j.hernandezrodrig498@cvuhsd.org	13	F	10	C-105	Williamson, Brianna R	Hernandez Rodriguez, Joselyn Emely	f	\N
8730	Allison	Hernandez	56945	8	a.hernandez945@cvuhsd.org	13	F	10	F-204	Brent, Sharone	Hernandez, Allison Amparo	f	\N
8731	Marlie	Hernandez	56920	8	m.hernandez920@cvuhsd.org	13	F	10	H-204	Gilbert, Sean M.	Hernandez, Marlie Michelle	f	\N
8732	Orlando	Hernandez	56912	8	o.hernandez912@cvuhsd.org	13	M	10	G-201	Doan, Andrew	Hernandez, Orlando Amani	f	\N
8733	Anderson	Herrera Garcia	58129	8	a.herrera129@cvuhsd.org	13	M	10	G-210	Ibarra, Irvin A	Herrera Garcia, Anderson Abrhaham	f	\N
8734	Jaylen	Hill	57233	8	j.hill233@cvuhsd.org	13	M	10	G-206	Thomas, Michelle	Hill, Jaylen Levelle	f	\N
8735	Paul	Hinojosa	55833	8	p.hinojosa833@cvuhsd.org	13	M	10	H-204	Gilbert, Sean M.	Hinojosa, Pau lAnthony	f	\N
8736	Eniline	Hola	58928	8	e.hola928@cvuhsd.org	13	F	10	G-201	Doan, Andrew	Hola, Eniline	f	\N
8737	Joshua	Holakeituai	56323	8	j.holakeituai323@cvuhsd.org	13	M	10	C-205	Dibrell, Renee	Holakeituai, Joshua Amanakilelei	f	\N
8738	Lynaiyah	Huerta	57419	8	l.huerta419@cvuhsd.org	13	F	10	C-205	Dibrell, Renee	Huerta, Lynaiyah Myne	f	\N
8739	Tionni	Hunter	56745	8	t.hunter745@cvuhsd.org	13	F	10	C-206	Stewart, Jomo K	Hunter, Tionni Annette	f	\N
8740	Yonny	Hurtado Sanchez	56859	8	y.hurtadosanchez859@cvuhsd.org	13	M	10	GYM 6	Singleton, Sigmund	Hurtado Sanchez, Yonny Samir	f	\N
8741	Jesse	Hurtado	56163	8	j.hurtado163@cvuhsd.org	13	M	10	C-105	Williamson, Brianna R	Hurtado, Jesse	f	\N
8742	Kathleen	Hurtado	55727	8	k.hurtado727@cvuhsd.org	13	F	10	D-201	Villegas-Diaz, Jessica P.	Hurtado, Kathleen Sarah	f	\N
8743	Eduardo	Ibarra	55830	8	e.ibarra830@cvuhsd.org	13	M	10	G-202	Ann, Jane	Ibarra, Eduardo	f	\N
8744	Henry	Idrees Guzman	56466	8	h.idreesguzman466@cvuhsd.org	13	M	10	GYM 4	Whitt, James	Idrees Guzman, Henry Alexander	f	\N
8745	Haneef	Inawo	57232	8	h.inawo232@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Inawo, Haneef Oluwasepifunmi	f	\N
8746	Steven	Jacome-Arevalo	56073	8	s.jacomearevalo073@cvuhsd.org	13	F	10	F-204	Brent, Sharone	Jacome-Arevalo, Steven Josue	f	\N
8747	Alize	Jaimes Orozco	56983	8	a.jaimesorozco983@cvuhsd.org	13	F	10	F-202	Rogers, Marie	Jaimes Orozco, Alize	f	\N
8748	Jolee	James	56497	8	j.james497@cvuhsd.org	13	F	10	G-109	Miranda, Denisse	James, Jolee Lynn	f	\N
8749	Marla	Jamison	57272	8	m.jamison272@cvuhsd.org	13	F	10	F-201	Mai, Van C	Jamison, Marla Lanay Christina	f	\N
8750	Jose	Jaramillo Torres	56406	8	j.jaramillotorres406@cvuhsd.org	13	M	10	F-201	Mai, Van C	Jaramillo Torres, Jose Manuel	f	\N
8751	Denise	Jimenez	56763	8	d.jimenez763@cvuhsd.org	13	F	10	E-205	Rollino, Christian P	Jimenez, Denise	f	\N
8752	Nic'Kai	Johnson	57235	8	n.johnson235@cvuhsd.org	13	F	10	C-206	Stewart, Jomo K	Johnson, Nic'Kai Denise	f	\N
8753	Anthony	Jones Jr	56625	8	a.jonesjr625@cvuhsd.org	13	M	10	F-201	Mai, Van C	Jones Jr, Anthony Karl	f	\N
8754	Anthony	Jorquera Benitez	55902	8	a.jorquerabenitez902@cvuhsd.org	13	M	10	H-204	Gilbert, Sean M.	Jorquera Benitez, Anthony	f	\N
8755	Jonathan	Juan Chavez	55754	8	j.juanchavez754@cvuhsd.org	13	M	10	G-206	Thomas, Michelle	Juan Chavez, Jonathan	f	\N
8756	Yaxian	Ke	55763	8	y.ke763@cvuhsd.org	13	F	10	H-202	Saad, Eman	Ke, Yaxian	f	\N
8757	Hamid	Khan	56611	8	h.khan611@cvuhsd.org	13	M	10	E-205	Rollino, Christian P	Khan, Hamid	f	\N
8758	Tylan	Kinsey	56387	8	t.kinsey387@cvuhsd.org	13	M	10	G-206	Thomas, Michelle	Kinsey, Tylan Roland	f	\N
8759	Cameron	Knighton	56910	8	c.knighton910@cvuhsd.org	13	M	10	G-206	Miller, Jason	Knighton, Cameron Dawayne	f	\N
8760	Patricia	Ladino Casillas	56013	8	p.ladinocasillas013@cvuhsd.org	13	F	10	G-208	Tran, Maichi N.	Ladino Casillas, Patricia Jaqueline	f	\N
8761	Damoni	Lair	57546	8	d.lair546@cvuhsd.org	13	M	10	E-205	Rollino, Christian P	Lair, Damoni Nassaire	f	\N
8762	Hermione	Lapoyeu	56515	8	h.lapoyeu515@cvuhsd.org	13	F	10	G-208	Tran, Maichi N.	Lapoyeu, Hermione Isanell	f	\N
8763	Daniel	Larrahondo	56491	8	d.larrahondo491@cvuhsd.org	13	M	10	D-103	Sarpong, Kwame Kwakye	Larrahondo, Daniel	f	\N
8764	Joshua	Leandro-Conde	56206	8	j.leandroconde206@cvuhsd.org	13	M	10	C-203	Naluswa, Margaret	Leandro-Conde, Joshua	f	\N
8765	CeAnna	Ledet	58908	8	c.ledet908@cvuhsd.org	13	F	10	F-204	Brent, Sharone	Ledet, CeAnna Ciara Jada	f	\N
8766	Daniel	Leon	56044	8	d.leon044@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Leon, Daniel Alexander	f	\N
8767	David	Leon	56751	8	d.leon751@cvuhsd.org	13	M	10	F-204	Brent, Sharone	Leon, David Christopher	f	\N
8768	Andrea	Lewis	57175	8	a.lewis175@cvuhsd.org	13	F	10	A-201	Salgado, Efrain	Lewis, Andrea Taylor	f	\N
8769	Kaleb	Lewis	58509	8	k.lewis509@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Lewis, Kaleb Melvin	f	\N
8770	Nancy	Lezama	55732	8	n.lezama732@cvuhsd.org	13	F	10	G-201	Doan, Andrew	Lezama, Nancy	f	\N
8771	Benjamin	Lima	56412	8	b.lima412@cvuhsd.org	13	M	10	G-202	Ann, Jane	Lima, Benjamin William	f	\N
8772	Gabriel	Limones Jr	56294	8	g.limonesjr294@cvuhsd.org	13	M	10	F-201	Mai, Van C	Limones Jr, Gabriel	f	\N
8773	Enrique	Limones	56492	8	e.limones492@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Limones, Enrique	f	\N
8774	Dy'lyn	Littleton	57469	8	d.littleton469@cvuhsd.org	13	M	10	F-202	Rogers, Marie	Littleton, Dy'lyn Dashawn	f	\N
8775	Ky'lyn	Littleton	57474	8	k.littleton474@cvuhsd.org	13	M	10	C-105	Williamson, Brianna R	Littleton, Ky'lyn Dashawn	f	\N
8776	Aleena	Lizarraga Marinez	59253	8	a.lizarragamarin253@cvuhsd.org	13	F	10	E-203	Soufl, Kalei	Lizarraga Marinez, Aleena Natalia	f	\N
8777	Davontae	Lloyd	56617	8	d.lloyd617@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Lloyd, Davontae Terrell	f	\N
8778	Alex	Logo	55903	8	a.logo903@cvuhsd.org	13	M	10	F-204	Brent, Sharone	Logo, Alex Fernando	f	\N
8779	Ray	Lopez Amaya	56167	8	r.lopezamaya167@cvuhsd.org	13	M	10	C-203	Naluswa, Margaret	Lopez Amaya, Ray Alexsandro	f	\N
8780	Giovanni	Lopez Arroyo	56382	8	g.lopezarroyo382@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Lopez Arroyo, Giovanni	f	\N
8781	Ian	Lopez Gonzalez	56300	8	i.lopezgonzalez300@cvuhsd.org	13	M	10	F-103	Kaiser, Noah	Lopez Gonzalez, Ian Aron	f	\N
8782	Lesly	Lopez Martinez	56503	8	l.lopezmartinez503@cvuhsd.org	13	F	10	E-203	Soufl, Kalei	Lopez Martinez, Lesly Nahomy	f	\N
8783	Cristopher	Lopez Rodriguez	56417	8	c.lopezrodriguez417@cvuhsd.org	13	M	10	G-111	Romo, Jose A.	Lopez Rodriguez, Cristopher	f	\N
8784	Luis	Lopez Romero	56275	8	l.lopezromero275@cvuhsd.org	13	M	10	E-205	Rollino, Christian P	Lopez Romero, Luis	f	\N
8785	Alexander	Lopez	55733	8	a.lopez733@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Lopez, Alexander Omar	f	\N
8786	Brian	Lopez	58150	8	b.lopez150@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Lopez, Brian	f	\N
8787	Bryant	Lopez	56224	8	b.lopez224@cvuhsd.org	13	M	10	C-203	Naluswa, Margaret	Lopez, Bryan tIvan	f	\N
8788	Delanny	Lopez	57012	8	d.lopez012@cvuhsd.org	13	F	10	D-205	Brown, Arianne	Lopez, Delanny Cristhel	f	\N
8789	Jacob	Lopez	57123	8	j.lopez123@cvuhsd.org	13	M	10	D-205	Brown, Arianne	Lopez,Jacob Ryan	f	\N
8790	Sheily	Loza	56518	8	s.loza518@cvuhsd.org	13	F	10	E-203	Soufl, Kalei	Loza, Sheily Nataly	f	\N
8791	Elec	Lunsford	57568	8	e.lunsford568@cvuhsd.org	13	M	10	GYM 3	Tucker, Erich L	Lunsford,Elec James	f	\N
8792	Abdiel	Macias Aguirre	56746	8	a.maciasaguirre746@cvuhsd.org	13	M	10	D-104	Samuels, Kathleen C	Macias Aguirre, Abdiel Isaac	f	\N
8793	Isaiah	Macias	56451	8	i.macias451@cvuhsd.org	13	M	10	C-205	Dibrell, Renee	Macias, Isaiah Aleksander	f	\N
8794	Jayden	Macias	55759	8	j.macias759@cvuhsd.org	13	M	10	G-202	Ann, Jane	Macias, Jayden Kyle	f	\N
8795	Bang	Mai	56345	8	b.mai345@cvuhsd.org	13	F	10	C-205	Dibrell, Renee	Mai, Bang Nguyen Hoai	f	\N
8796	Benjamin	Mai	56264	8	b.mai264@cvuhsd.org	13	M	10	F-204	Brent, Sharone	Mai, Benjamin Xuan	f	\N
8797	Christopher	Mai	55734	8	c.mai734@cvuhsd.org	13	M	10	G-202	Ann, Jane	Mai, Christopher Ho	f	\N
8798	Isabel	Manriquez	56083	8	i.manriquez083@cvuhsd.org	13	F	10	GYM 3	Tucker, Erich L	Manriquez, Isabel Elena	f	\N
8799	A'Niya	Manuel	56582	8	a.manuel582@cvuhsd.org	13	F	10	F-204	Brent, Sharone	Manuel, A'Niya Tremaya	f	\N
8800	Ilaisaane	Manukailea	57006	8	i.manukailea006@cvuhsd.org	13	F	10	G-206	Thomas, Michelle	Manukailea, Ilaisaane Suikimoana	f	\N
8801	Daniel	Mark	57184	8	d.mark184@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Mark, Daniel Sayers	f	\N
8802	Lesly	Marquez	56397	8	l.marquez397@cvuhsd.org	13	F	10	C-205	Dibrell, Renee	Marquez, Lesly Sinai	f	\N
8803	Jerry	Marroquin	56000	8	j.marroquin000@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Marroquin, Jerry Humberto	f	\N
8804	Kalen	Marshall	56950	8	k.marshall950@cvuhsd.org	13	F	10	D-205	Brown, Arianne	Marshall, Kalen Jah'Shae	f	\N
8805	Moises	Martinez Mendoza	56585	8	m.martinezmendoza585@cvuhsd.org	13	M	10	E-205	Rollino, Christian P	Martinez Mendoza, Moises Jayden	f	\N
8806	Alejandro	Martinez	56265	8	a.martinez265@cvuhsd.org	13	M	10	C-205	Dibrell, Renee	Martinez, Alejandro	f	\N
8807	Allison	Martinez	55877	8	a.martinez877@cvuhsd.org	13	F	10	G-201	Doan, Andrew	Martinez, Allison Marie	f	\N
8808	Carolina	Martinez	55753	8	c.martinez753@cvuhsd.org	13	F	10	GYM 3	Tucker, Erich L	Martinez, Carolina	f	\N
8809	Daniel	Martinez	56470	8	d.martinez470@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Martinez, Daniel	f	\N
8810	Ivan	Martinez	56064	8	i.martinez064@cvuhsd.org	13	M	10	GYM 4	Whitt, James	Martinez, Ivan Ramon	f	\N
8811	Melanie	Martinez	56649	8	m.martinez649@cvuhsd.org	13	F	10	H-204	Gilbert, Sean M.	Martinez, Melanie Alyssa	f	\N
8812	Miguel	Martinez	56304	8	m.martinez304@cvuhsd.org	13	M	10	F-204	Brent, Sharone	Martinez, Miguel	f	\N
8814	Randy	Martinez	56510	8	r.martinez510@cvuhsd.org	13	M	10	F-204	Brent, Sharone	Martinez, Randy	f	\N
8815	Rihanna	Martinez	56807	8	r.martinez807@cvuhsd.org	13	F	10	G-102	Davis, Bryce	Martinez, Rihanna	f	\N
8816	Andy	Mazariegos Alvarado	56018	8	a.mazariegosalvar018@cvuhsd.org	13	M	10	F-201	Mai, Van C	Mazariegos Alvarado, Andy Leonel	f	\N
8817	Mathias Kenzo	Mbengmo Nanfack	57414	8	m.mbengmonanfack414@cvuhsd.org	13	M	10	G-206	Thomas, Michelle	Mbengmo Nanfack, Mathias Kenzo	f	\N
8818	Keyerra	McCrow	55757	8	k.mccrow757@cvuhsd.org	13	F	10	C-105	Williamson, Brianna R	McCrow, Keyerra Aaliyah	f	\N
8819	Christopher	McDaniel	56084	8	c.mcdaniel084@cvuhsd.org	13	M	10	F-201	Mai, Van C	McDaniel, Christopher Desmond	f	\N
8820	Kha'rell	McDuffie	57601	8	k.mcduffie601@cvuhsd.org	13	M	10	F-202	Rogers, Marie	McDuffie, Kha'rell Tawjuan	f	\N
8821	Jaylynn	McGee-Mallaney	56781	8	j.mcgeemallaney781@cvuhsd.org	13	F	10	E-205	Rollino, Christian P	McGee-Mallaney, Jaylynn Cali	f	\N
8822	Destiny	McKeever	57611	8	d.mckeever611@cvuhsd.org	13	F	10	E-203	Soufl, Kalei	McKeever, Destiny Renee	f	\N
8823	Cristofer	Medina	57575	8	c.medina575@cvuhsd.org	13	M	10	G-201	Doan, Andrew	Medina, Cristofer Isaac	f	\N
8824	Joe	Medrano Moreno	56565	8	j.medranomoreno565@cvuhsd.org	13	M	10	GYM 4	Whitt, James	Medrano Moreno, Joe Anthony	f	\N
8825	Aileen	Mejia	56703	8	a.mejia703@cvuhsd.org	13	F	10	H-204	Gilbert, Sean M.	Mejia, Aileen Fernanda	f	\N
8826	Ryan	Mejia	55735	8	r.mejia735@cvuhsd.org	13	M	10	G-111	Romo, Jose A.	Mejia, Ryan Ivan	f	\N
8827	Leudies	Melchor	56062	8	l.melchor062@cvuhsd.org	13	M	10	G-202	Ann, Jane	Melchor, Leudies Martin	f	\N
8828	Cesar	Melendrez	56228	8	c.melendrez228@cvuhsd.org	13	M	10	G-102	Davis, Bryce	Melendrez, Cesar Eduardo	f	\N
8829	Melvyn	Mendoza	56446	8	m.mendoza446@cvuhsd.org	13	M	10	G-102	Davis, Bryce	 Mendoza, Melvin Joseph	f	\N
8830	Daynee	Merida	56760	8	d.merida760@cvuhsd.org	13	F	10	G-102	Davis, Bryce	Merida, Daynee Joana	f	\N
8831	Denise	Meza	56324	8	d.meza324@cvuhsd.org	13	F	10	D-107	Williams, Sherrevia A	Meza, Denise Melody	f	\N
8832	Major	Miller	56901	8	m.miller901@cvuhsd.org	13	M	10	GYM 6	Singleton, Sigmund	Miller, Major Eson	f	\N
8833	Myles	Miller	56902	8	m.miller902@cvuhsd.org	13	M	10	C-205	Dibrell, Renee	Miller, Myles Eden	f	\N
8834	Bryan	Miralda-Salgado	55736	8	b.miraldasalgado736@cvuhsd.org	13	M	10	G-201	Doan, Andrew	Miralda-Salgado, Bryan Joseph	f	\N
8835	Sione	Moala Jr	57320	8	s.moalajr320@cvuhsd.org	13	M	10	H-203	Rojas, Miguel Sr.	Moala Jr, Sione Finau	f	\N
8836	Angel	Moncada	57075	8	a.moncada075@cvuhsd.org	13	M	10	H-204	Gilbert, Sean M.	 Moncada, Angel	f	\N
8837	Hugo	Monroy	58971	8	h.monroy971@cvuhsd.org	13	M	10	C-105	Williamson, Brianna R	Monroy, Hugo Jarediah	f	\N
8838	Samuel	Montoya Aguirre	56634	8	s.montoyaaguirre634@cvuhsd.org	13	M	10	D-202	Chung, Joshua S	Montoya Aguirre, Samuel David	f	\N
8839	Asante	Monzon	56808	8	a.monzon808@cvuhsd.org	13	M	10	G-201	Doan, Andrew	Monzon, Asante Micah	f	\N
8840	Brandon	Monzon	58270	8	b.monzon270@cvuhsd.org	13	M	10	G-111	Romo, Jose A.	Monzon, Brandon Adolfo	f	\N
8841	Dulce	Morales	56424	8	d.morales424@cvuhsd.org	13	F	10	C-206	Stewart, Jomo K	Morales, Dulce Juliana	f	\N
8842	Miroslava	Moran Garcia	55858	8	m.morangarcia858@cvuhsd.org	13	F	10	C-105	Williamson, Brianna R	Moran Garcia, Miroslava Naireth	f	\N
8843	Hideli	Mosqueda Campos	56112	8	h.mosquedacampos112@cvuhsd.org	13	M	10	C-205	Dibrell, Renee	Mosqueda Campos, Hideli Saul	f	\N
8844	Antonio	Munoz Ortega	57266	8	a.munozortega266@cvuhsd.org	13	M	10	G-206	Thomas, Michelle	Munoz Ortega, Antonio	f	\N
8845	Jacob	Munoz	57191	8	j.munoz191@cvuhsd.org	13	M	10	F-103	Kaiser, Noah	Munoz, Jacob Alberto	f	\N
8846	Diego	Murillo	56123	8	d.murillo123@cvuhsd.org	13	M	10	H-204	Gilbert, Sean M.	Murillo, Diego Alexander	f	\N
8847	Victor	Nava	55737	8	v.nava737@cvuhsd.org	13	M	10	G-206	Thomas, Michelle	Nava, Victor Ali	f	\N
8848	Nai'Jah	Nelson	56559	8	n.nelson559@cvuhsd.org	13	F	10	H-204	Gilbert, Sean M.	Nelson, Nai'Jah Jamese	f	\N
8849	Dulce	Nepomuceno Andrade	57212	8	d.nepomucenoandra212@cvuhsd.org	13	F	10	D-205	Brown, Arianne	Nepomuceno Andrade, Dulce Maria	f	\N
8850	Evolet	Neri	56762	8	e.neri762@cvuhsd.org	13	F	10	G-206	Thomas, Michelle	Neri Evolet Dolley	f	\N
8851	Bryan	Nguyen	55934	8	b.nguyen934@cvuhsd.org	13	M	10	C-105	Williamson, Brianna R	Nguyen, Bryan	f	\N
8852	Christine	Nguyen	56588	8	c.nguyen588@cvuhsd.org	13	F	10	G-104	Mccoy, Bert L	Nguyen, Christine	f	\N
8853	Jame	Nguyen	57059	8	j.nguyen059@cvuhsd.org	13	M	10	G-206	Miller, Jason	Nguyen, Jame	f	\N
8854	Viana	Nguyen	55855	8	v.nguyen855@cvuhsd.org	13	F	10	F-204	Brent, Sharone	Nguyen, Viana Ha	f	\N
8855	Angelina	Nicasio	56882	8	a.nicasio882@cvuhsd.org	13	F	10	E-203	Soufl, Kalei	Nicasio, Angelina Raquel	f	\N
8856	Rebeca	Nieto	57036	8	r.nieto036@cvuhsd.org	13	F	10	C-206	Stewart, Jomo K	Nieto, Rebeca Sarai	f	\N
8857	James	Nishikawa	55750	8	j.nishikawa750@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Nishikawa, James John	f	\N
8858	Angel	Nolasco Ruiz	57065	8	a.nolascoruiz065@cvuhsd.org	13	M	10	GYM 3	Tucker, Erich L	Nolasco Ruiz, Angel Axel	f	\N
8859	Spirit	Norman	56744	8	s.norman744@cvuhsd.org	13	F	10	G-202	Ann, Jane	Norman, Spirit Esther Earlene	f	\N
8860	Jesse	Nunez	56216	8	j.nunez216@cvuhsd.org	13	M	10	G-208	Tran, Maichi N.	Nunez, Jesse Ragde	f	\N
8861	Juan	Ocampo Fuentes	57542	8	j.ocampofuentes542@cvuhsd.org	13	M	10	D-202	Chung, Joshua S	Ocampo Fuentes, Juan Jose	f	\N
8862	Juan	Ochoa Magallon	56026	8	j.ochoamagallon026@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Ochoa Magallon, Juan Pablo	f	\N
8863	Jonathan	Olazabal	57176	8	j.olazabal176@cvuhsd.org	13	M	10	C-205	Dibrell, Renee	Olazabal, Jonathan Daniel	f	\N
8864	Sarahy	Olea	57624	8	s.olea624@cvuhsd.org	13	F	10	H-204	Gilbert, Sean M.	Olea, Sarahy Esther	f	\N
8865	Cristofer	Olivas Cervantes	56560	8	c.olivascervantes560@cvuhsd.org	13	M	10	F-204	Brent, Sharone	Olivas Cervantes, Cristofer Rafael	f	\N
8866	Alexis	Ontiveros Vargas	56331	8	a.ontiverosvargas331@cvuhsd.org	13	M	10	G-206	Thomas, Michelle	Ontiveros Vargas, Alexis Daniel	f	\N
8867	Andrew	Ontiveros	57410	8	a.ontiveros410@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Ontiveros, Andrew Lopez	f	\N
8868	Clara	Onyeanusi	56892	8	c.onyeanusi892@cvuhsd.org	13	F	10	F-204	Brent, Sharone	Onyeanusi, Clara Chinyere	f	\N
8869	Justina	Onyeanusi	56895	8	j.onyeanusi895@cvuhsd.org	13	F	10	E-205	Rollino, Christian P	Onyeanusi, Justina Jachi	f	\N
8870	Briana	Ordaz	56624	8	b.ordaz624@cvuhsd.org	13	F	10	G-206	Thomas, Michelle	Ordaz, Briana	f	\N
8871	George	Orosco Alvarado	57228	8	g.oroscoalvarado228@cvuhsd.org	13	M	10	D-205	Brown, Arianne	Orosco Alvarado, George Anthony	f	\N
8872	Jacob	Orozco	56131	8	j.orozco131@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	OrozcoJacob	f	\N
8873	Katherine	Orozco	56065	8	k.orozco065@cvuhsd.org	13	F	10	F-201	Mai, Van C	Orozco, Katherine Samantha	f	\N
8874	Isabel	Ortega	55739	8	i.ortega739@cvuhsd.org	13	F	10	C-206	Stewart, Jomo K	Ortega, Isabel Emily	f	\N
8875	Jesus	Ortega	56552	8	j.ortega552@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Ortega. Jesus Abel	f	\N
8876	Kevin	Ortiz-Barraza	56709	8	k.ortizbarraza709@cvuhsd.org	13	M	10	D-205	Brown, Arianne	Ortiz-Barraza, Kevin	f	\N
8877	Ayden	Osorio Corona	55740	8	a.osoriocorona740@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Osorio Corona, Ayden	f	\N
8878	Maecin	Pacherres	56230	8	m.pacherres230@cvuhsd.org	13	M	10	G-112	Diaz, Maria I.	Pacherres, Maecin Abraham	f	\N
8879	Ashley	Palacios	57407	8	a.palacios407@cvuhsd.org	13	F	10	G-201	Doan, Andrew	Palacios,Ashley Nicolee	f	\N
8880	Julian	Paniagua	56586	8	j.paniagua586@cvuhsd.org	13	M	10	C-205	Dibrell, Renee	Paniagua, Julian Misea	f	\N
8881	Luis	Pardo Pinzon	57002	8	l.pardopinzon002@cvuhsd.org	13	M	10	D-202	Chung, Joshua S	Pardo Pinzon, Luis Felipe	f	\N
8882	Samantha	Pastrano Paredes	59054	8	s.pastranoparede054@cvuhsd.org	13	F	10	GYM 3	Tucker, Erich L	Pastrano Paredes, Samantha Michel	f	\N
8883	Kareena	Pate	55741	8	k.pate741@cvuhsd.org	13	F	10	E-203	Soufl, Kalei	Pate, Kareena Leann	f	\N
8884	Jeremiah	Patin	56177	8	j.patin177@cvuhsd.org	13	M	10	D-104	Samuels, Kathleen C	Patin, Jeremiah Ralph	f	\N
8885	Churchill	Patrick	55790	8	c.patrick790@cvuhsd.org	13	M	10	GYM 4	Whitt, James	Patrick, Churchill Nnazitere	f	\N
8886	Briny	Perez Alvarado	56877	8	b.perezalvardo877@cvuhsd.org	13	F	10	GYM 3	Tucker, Erich L	Perez Alvarado, Briny Alexandra	f	\N
8887	Hilary	Perez Guerra	58116	8	h.perezguerra116@cvuhsd.org	13	F	10	B-1	Cassio, Michael J.	Perez Guerra, Hilary Jezabel	f	\N
8888	Joshua	Perez Munoz	58647	8	j.perezmunoz647@cvuhsd.org	13	M	10	G-111	Romo, Jose A.	Perez MunozJ, oshua Alexander	f	\N
8889	Marcos	Perez	57513	8	m.perez513@cvuhsd.org	13	M	10	G-206	Thomas, Michelle	Perez, Marcos Nathan	f	\N
8890	Angelyn	Pham	56213	8	a.pham213@cvuhsd.org	13	F	10	C-205	Dibrell, Renee	Pham, Angelyn Quynhmai	f	\N
8891	Theresa	Pham	56215	8	t.pham215@cvuhsd.org	13	F	10	G-108	Ramirez, Lourdes	Pham, Theresa Ngoc	f	\N
8892	Aedan	Phillips	56561	8	a.phillips561@cvuhsd.org	13	M	10	G-202	Ann, Jane	Phillips, Aedan Isaiah	f	\N
8893	Dean	Pineda Alvarado	56344	8	d.pinedaalvarado344@cvuhsd.org	13	M	10	F-204	Brent, Sharone	Pineda Alvarado, Dean Benjamin	f	\N
8894	Britany	Pineda	56192	8	b.pineda192@cvuhsd.org	13	F	10	E-203	Soufl, Kalei	Pineda. Britany Zusseth	f	\N
8895	Markiesh	Pirtle Jr	57224	8	m.pirtlejr224@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Pirtle Jr, Markiesh Deion	f	\N
8896	Aiden	Placencia	55742	8	a.placencia742@cvuhsd.org	13	M	10	E-205	Rollino, Christian P	Placencia, Aiden	f	\N
8897	Lizbeth	Plascencia Martinez	56571	8	l.plascenciamarti571@cvuhsd.org	13	F	10	H-204	Gilbert, Sean M.	Plascencia Martinez, Lizbeth Anahi	f	\N
8898	Randle	Pollard	58095	8	r.pollard095@cvuhsd.org	13	M	10	G-203	Torres, Walter	Pollard, Randle Scott	f	\N
8899	Reyneri	Ponce	56128	8	r.ponce128@cvuhsd.org	13	F	10	G-102	Davis, Bryce	Ponce, Reyneri	f	\N
8900	Kason	Poole-Hughes	56181	8	k.poolehughes181@cvuhsd.org	13	M	10	C-205	Dibrell, Renee	Poole-Hughes, Kason Coshawn	f	\N
8901	Leticia	Pulido	56478	8	l.pulido478@cvuhsd.org	13	F	10	F-201	Mai, Van C	Pulido, Leticia Nayleen	f	\N
8902	Edson	Quiroz Delgado	56505	8	e.quirozdelgado505@cvuhsd.org	13	M	10	H-204	Gilbert, Sean M.	Quiroz Delgado, Edson Guadalupe	f	\N
8903	Jaiden	Rader	56988	8	j.rader988@cvuhsd.org	13	M	10	G-201	Doan, Andrew	Rader, Jaiden Damien	f	\N
8904	Ashley	Ramires	56066	8	a.ramires066@cvuhsd.org	13	F	10	GYM 6	Singleton, Sigmund	Ramires, Ashley	f	\N
8905	Madelyne	Ramirez Arellano	56603	8	m.ramirezarellano603@cvuhsd.org	13	F	10	G-102	Davis, Bryce	Ramirez Arellano, Madelyne Azalya	f	\N
8906	Miguel	Ramirez Tacuba	56330	8	m.ramireztacuba330@cvuhsd.org	13	M	10	GYM 4	Whitt, James	Ramirez Tacuba, Miguel Angel	f	\N
8907	Ethan	Ramirez	55791	8	e.ramirez791@cvuhsd.org	13	M	10	G-201	Doan, Andrew	Ramirez, Ethan Jose	f	\N
8908	Valeria	Ramirez	56114	8	v.ramirez114@cvuhsd.org	13	F	10	C-206	Stewart, Jomo K	Ramirez, Valeria	f	\N
8909	Victor	Ramirez	56115	8	v.ramirez115@cvuhsd.org	13	M	10	F-204	Brent, Sharone	Ramirez, Victor Manuel	f	\N
8910	Viviana	Ramirez	56116	8	v.ramirez116@cvuhsd.org	13	F	10	GYM 6	Singleton, Sigmund	Ramirez, Viviana	f	\N
8911	Vicente	Ramirez-Valentin	57007	8	v.ramirezvalentin007@cvuhsd.org	13	M	10	G-208	Tran, Maichi N.	Ramirez-Valentin, Vicente Miguel	f	\N
8912	Nathon	Ramos Lua	59223	8	n.ramoslua223@cvuhsd.org	13	M	10	E-205	Rollino, Christian P	Ramos Luam, Nathon Xander	f	\N
8913	Meleseini	Ramsey	57267	8	m.ramsey267@cvuhsd.org	13	F	10	F-202	Rogers, Marie	Ramsey, Meleseini Tutasi	f	\N
8914	Adrian	Razo Napoles	56598	8	a.razonapoles598@cvuhsd.org	13	M	10	F-103	Kaiser, Noah	Razo Napoles, Adrian Rodrigo	f	\N
8915	Aaden	Reaves	55761	8	a.reaves761@cvuhsd.org	13	M	10	E-205	Rollino, Christian P	Reaves, Aaden Jacob	f	\N
8916	Destiny	Rebollar	56059	8	d.rebollar059@cvuhsd.org	13	F	10	G-111	Romo, Jose A.	Rebollar, Destiny Chanelle	f	\N
8917	Leensay	Reyes Alvarado	56004	8	l.reyesalvarado004@cvuhsd.org	13	F	10	GYM 6	Singleton, Sigmund	Reyes Alvarado, Leensay Scarlett	f	\N
8918	Abraham	Reyes	56385	8	a.reyes385@cvuhsd.org	13	M	10	C-205	Dibrell, Renee	Reyes, Abraham	f	\N
8919	Keidy	Reyes	56082	8	k.reyes082@cvuhsd.org	13	F	10	G-202	Ann, Jane	Reyes, Keidy Anahi	f	\N
8920	Abigail	Reynaga	55743	8	a.reynaga743@cvuhsd.org	13	F	10	G-202	Ann, Jane	Reynaga, Abigail	f	\N
8921	Isaac	Reynoso	56402	8	i.reynoso402@cvuhsd.org	13	M	10	G-201	Doan, Andrew	Reynoso, Isaac	f	\N
8922	Sara	Riano Gomez	55922	8	s.rianogomez922@cvuhsd.org	13	F	10	G-102	Davis, Bryce	Riano Gomez, Sara Juliana	f	\N
8923	Josephine	Rivera Calvillo	56774	8	j.riveracalvillo774@cvuhsd.org	13	F	10	G-206	Thomas, Michelle	Rivera Calvillo, Josephine	f	\N
8924	Semaj	Robinson Jr	57163	8	s.robinsonjr163@cvuhsd.org	13	M	10	E-205	Rollino, Christian P	Robinson Jr, Semaj Yorel	f	\N
8925	Rafael	Robles Jr	56124	8	r.roblesjr124@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Robles Jr, Rafael Aiden	f	\N
8926	Rodney	Robles Jr.	56616	8	r.roblesjr616@cvuhsd.org	13	M	10	H-204	Gilbert, Sean M.	Robles Jr., Rodney	f	\N
8927	Selvin	Rodas Melendrez	56196	8	s.rodasmelendrez196@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Rodas Melendrez, Selvin Estuardo	f	\N
8928	Miranda	Rodriguez Lopez	56705	8	m.rodriguezlopez705@cvuhsd.org	13	F	10	F-201	Mai, Van C	Rodriguez Lopez, Miranda	f	\N
8929	Ana	Rodriguez Martinez	57239	8	a.rodriguezmartin239@cvuhsd.org	13	F	10	GYM 3	Tucker, Erich L	Rodriguez Martinez, Ana Lucia	f	\N
8930	Kaytlin	Rodriguez Mogrovejo	56535	8	k.rodriguezmogrov535@cvuhsd.org	13	F	10	GYM 3	Tucker, Erich L	Rodriguez Mogrovejo, Kaytlin Germonie	f	\N
8931	Angel	Rodriguez Morales	56907	8	a.rodriguezmorale907@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Rodriguez Morales, Angel Gerardo	f	\N
8932	Alina	Rodriguez	56650	8	a.rodriguez650@cvuhsd.org	13	F	10	E-205	Rollino, Christian P	Rodriguez, Alina	f	\N
8933	Jay Shawn	Rodriguez	55847	8	j.rodriguez847@cvuhsd.org	13	M	10	C-105	Williamson, Brianna R	Rodriguez, Jay Shawn D'Angelo	f	\N
8934	Matthew	Rodriguez	57296	8	m.rodriguez296@cvuhsd.org	13	M	10	F-201	Mai, Van C	Rodriguez, Matthew Alexander	f	\N
8935	Alexis	Rojas	57558	8	a.rojas558@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Rojas, Alexis Nathaniel	f	\N
8936	Elmer	Roman Duran	55788	8	e.romanduran788@cvuhsd.org	13	M	10	G-202	Ann, Jane	Roman Duran, Elmer Anthony	f	\N
8937	Dianne	Romero Gonzalez	59222	8	d.romerogonzalez222@cvuhsd.org	13	F	10	C-206	Stewart, Jomo K	Romero Gonzalez, Dianne Delilah	f	\N
8938	Darli	Ruano	58805	8	d.ruano805@cvuhsd.org	13	F	10	G-201	Doan, Andrew	Ruano, Darli Analia	f	\N
8939	Valerie	Ruesga	56761	8	v.ruesga761@cvuhsd.org	13	F	10	G-203	Torres, Walter	Ruesga, Valerie	f	\N
8940	Miguel	Ruiz Aquino	56147	8	m.ruizaquino147@cvuhsd.org	13	M	10	C-205	Dibrell, Renee	Ruiz Aquino, Miguel Angel	f	\N
8942	Carlos	Ruiz	56310	8	c.ruiz310@cvuhsd.org	13	M	10	D-205	Brown, Arianne	Ruiz, Carlos Alexis	f	\N
8943	Ixtzel	Sainz	55893	8	i.sainz893@cvuhsd.org	13	F	10	F-201	Mai, Van C	Sainz, Ixtzel Irene	f	\N
8944	Jonathan	Salcedo	56508	8	j.salcedo508@cvuhsd.org	13	M	10	G-206	Thomas, Michelle	Salcedo, Jonathan Matthew	f	\N
8945	Isaiah	Salgado	55890	8	i.salgado890@cvuhsd.org	13	M	10	GYM 6	Singleton, Sigmund	Salgado,Isaiah Javier	f	\N
8946	Joshua	Salgado	55990	8	j.salgado990@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Salgado,Joshua Angel	f	\N
8947	Stephanie	Salguero	56619	8	s.salguero619@cvuhsd.org	13	F	10	C-105	Williamson, Brianna R	Salguero, Stephanie  Sophia	f	\N
8948	Brayan	Sanchez Velazquez	55906	8	b.sanchezvelazque906@cvuhsd.org	13	M	10	G-102	Davis, Bryce	Sanchez Velazquez, Brayan	f	\N
8949	Jade	Sanchez	56150	8	j.sanchez150@cvuhsd.org	13	F	10	G-111	Romo, Jose A.	Sanchez, Jade Gisele	f	\N
8950	Luis	Sanchez	56764	8	l.sanchez764@cvuhsd.org	13	M	10	G-201	Doan, Andrew	Sanchez, Luis Angel	f	\N
8951	Manuel	Sanchez	56566	8	m.sanchez566@cvuhsd.org	13	M	10	C-105	Williamson, Brianna R	Sanchez, Manuel Armando	f	\N
8952	Michael	Sanchez	55936	8	m.guzman936@cvuhsd.org	13	M	10	G-202	Ann, Jane	Sanchez, Michael	f	\N
8953	Ashley	Sanchez-Vallejo	56338	8	a.sanchezvallejo338@cvuhsd.org	13	F	10	F-201	Mai, Van C	Sanchez-Vallejo, Ashley Marie	f	\N
8954	Aiden	Sandoval	56060	8	a.sandoval060@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Sandoval, Aiden Gusniel	f	\N
8955	George	Sandoval	56117	8	g.sandoval117@cvuhsd.org	13	M	10	F-201	Mai, Van C	Sandoval, George Stephan	f	\N
8956	Hennesy	Sandoval	56512	8	h.sandoval512@cvuhsd.org	13	F	10	F-202	Rogers, Marie	Sandoval, Hennesy Briana	f	\N
8957	Nicholas	Sandoval	58451	8	n.sandoval451@cvuhsd.org	13	M	10	F-202	Rogers, Marie	Sandoval, Nicholas Gregorio	f	\N
8958	Kelly	Santiago	56806	8	k.santiago806@cvuhsd.org	13	F	10	F-201	Mai, Van C	Santiago, Kelly Joanna	f	\N
8959	Jesus	Santillano	56119	8	j.santillano119@cvuhsd.org	13	M	10	F-202	Rogers, Marie	Santillano, Jesus Manuel	f	\N
8960	Isabell	Santofimio Hincapie	56410	8	i.santofimiohinca410@cvuhsd.org	13	F	10	C-205	Dibrell, Renee	Santofimio Hincapie, Isabell Sofia	f	\N
8961	Ricardo	Saucedo	56335	8	r.saucedo335@cvuhsd.org	13	M	10	F-204	Brent, Sharone	SaucedoRicardo	f	\N
8962	Rachel	Seabrook	57227	8	r.seabrook227@cvuhsd.org	13	F	10	F-201	Mai, Van C	Seabrook, Rachel Jessica	f	\N
8963	Jocelyn	Serpas	57052	8	j.serpas052@cvuhsd.org	13	F	10	F-204	Brent, Sharone	Serpas, Jocelyn Loveinna	f	\N
8964	Cherish	Shaw	56924	8	c.shaw924@cvuhsd.org	13	F	10	C-105	Williamson, Brianna R	Shaw, Cherish Earlene	f	\N
8965	Madison	Sianez	56992	8	m.sianez992@cvuhsd.org	13	F	10	G-206	Thomas, Michelle	Sianez, Madison	f	\N
8966	Margarita	Sianez	56991	8	m.sianez991@cvuhsd.org	13	X	10	G-201	Doan, Andrew	Sianez, Margarita	f	\N
8967	Terry	Soria Rivas	55907	8	t.soriarivas907@cvuhsd.org	13	M	10	E-205	Rollino, Christian P	Soria Rivas, Terry Aidan	f	\N
8968	Braylin	Spencer	56539	8	b.spencer539@cvuhsd.org	13	M	10	G-202	Ann, Jane	Spencer, Braylin Jamaal	f	\N
8969	A'Nya	Stafford	55744	8	a.stafford744@cvuhsd.org	13	F	10	C-105	Williamson, Brianna R	Stafford, A'Nya Dream	f	\N
8970	Rayceon	Stevens	59095	8	r.stevens095@cvuhsd.org	13	M	10	GYM 6	Singleton, Sigmund	Stevens, Rayceon James	f	\N
8971	Mike	Suarez	56457	8	m.suarez457@cvuhsd.org	13	M	10	C-206	Stewart, Jomo K	Suarez, Mike Joel	f	\N
8972	Diego	Tapia	56027	8	d.tapia027@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Tapia, Diego	f	\N
8973	Gavin	Tapia	55814	8	g.tapia814@cvuhsd.org	13	M	10	C-205	Dibrell, Renee	Tapia, Gavin Samuel	f	\N
8974	Stephanie	Tapia	55745	8	s.tapia745@cvuhsd.org	13	F	10	G-202	Ann, Jane	Tapia, Stephanie Michelle	f	\N
8975	Kanyinsola	Tayese	55831	8	k.tayese831@cvuhsd.org	13	F	10	F-204	Brent, Sharone	Tayese, Kanyinsola Racheal	f	\N
8976	Polly	Teng	55789	8	p.teng789@cvuhsd.org	13	F	10	G-202	Ann, Jane	Teng, Polly	f	\N
8977	Kristy	Thomas	57440	8	k.thomas440@cvuhsd.org	13	F	10	C-105	Williamson, Brianna R	Thomas, Kristy Ivette	f	\N
8978	Samaya	Tillman	55749	8	s.tillman749@cvuhsd.org	13	F	10	E-203	Soufl, Kalei	Tillman, Samaya Jayla Dili	f	\N
8979	Joshua	Toler	57350	8	j.toler350@cvuhsd.org	13	M	10	G-104	Mccoy, Bert L	Toler, Joshua Khmar	f	\N
8980	Audrey	Tominaga	56456	8	a.tominaga456@cvuhsd.org	13	F	10	D-205	Brown, Arianne	Tominaga, Audrey Sabine	f	\N
8981	Lavinia	Topui	59176	8	l.topui176@cvuhsd.org	13	F	10	F-202	Rogers, Marie	Topui, Lavinia Tuihakavalu	f	\N
8982	Alisson	Torres Dominguez	55905	8	a.torresdominguez905@cvuhsd.org	13	F	10	C-205	Dibrell, Renee	Torres Dominguez, Alisson	f	\N
8983	Eduardo	Torres Guzman	56453	8	e.torresguzman453@cvuhsd.org	13	M	10	F-202	Rogers, Marie	Torres Guzman, Eduardo Alejandro	f	\N
8984	Juan	Torres Villarreal	56995	8	j.torresvillarrea995@cvuhsd.org	13	M	10	C-203	Naluswa, Margaret	Torres Villarreal, Juan Carlos	f	\N
8985	Diego	Torres	55746	8	d.torres746@cvuhsd.org	13	M	10	G-202	Ann, Jane	Torres, Diego Eduardo	f	\N
8986	Maybeline	Torres	56063	8	m.torres063@cvuhsd.org	13	F	10	E-205	Rollino, Christian P	Torres, Maybeline Alexandra	f	\N
8987	Evingi	Toto	57211	8	e.toto211@cvuhsd.org	13	M	10	G-102	Davis, Bryce	Toto, Evingi Penateti	f	\N
8988	Elijah	Tran	56480	8	e.tran480@cvuhsd.org	13	M	10	G-202	Ann, Jane	Tran, ElijahLe	f	\N
8989	Kailey	Tran	56423	8	k.tran423@cvuhsd.org	13	F	10	C-205	Dibrell, Renee	Tran, Kailey Van	f	\N
8990	Lynn	Tran	56562	8	l.tran562@cvuhsd.org	13	F	10	G-108	Ramirez, Lourdes	Tran, Lynn Tuyet	f	\N
8991	Epeli	Uhamaka	59038	8	e.uhamaka038@cvuhsd.org	13	M	10	G-108	Ramirez, Lourdes	Uhamaka, Epeli Meiola	f	\N
8992	Daniel	Vargas Ortiz	56045	8	d.vargasortiz045@cvuhsd.org	13	M	10	H-204	Gilbert, Sean M.	Vargas Ortizm Daniel Alberto	f	\N
8993	Hazael	Vargas Reyes	56455	8	h.vargasreyes455@cvuhsd.org	13	M	10	GYM 3	Tucker, Erich L	Vargas Reyes, Hazael	f	\N
8994	Adrian	Vasquez Hermosillo	57031	8	a.vasquezhermosil031@cvuhsd.org	13	M	10	G-206	Thomas, Michelle	Vasquez Hermosillo, Adrian	f	\N
8995	Carlos	Vasquez	56662	8	c.vasquez662@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Vasquez, Carlos Samuel	f	\N
8996	Sophia	Vasquez	56645	8	s.vasquez645@cvuhsd.org	13	F	10	E-205	Rollino, Christian P	Vasquez, Sophia Victoria	f	\N
8997	Sipola	Vea	56963	8	s.vea963@cvuhsd.org	13	F	10	F-204	Brent, Sharone	Vea, Sipola Halia Tante-Mina	f	\N
8998	Cassandra	Vega	56301	8	c.vega301@cvuhsd.org	13	F	10	G-102	Davis, Bryce	Vega, Cassandra	f	\N
8999	Matthew	Vega	55832	8	m.vega832@cvuhsd.org	13	M	10	F-204	Brent, Sharone	Vega, Matthew Kain	f	\N
9000	Juan	Velasquez Jr	56905	8	j.velasquezjr905@cvuhsd.org	13	M	10	E-203	Soufl, Kalei	Velasquez Jr, Juan Pablo	f	\N
9001	Alondra	Velazco Parra	56437	8	a.velazcoparra437@cvuhsd.org	13	F	10	F-204	Brent, Sharone	Velazco Parra, Alondra Zulema	f	\N
9002	Melissa	Velez-Garcia	56664	8	m.velezgarcia664@cvuhsd.org	13	F	10	E-203	Soufl, Kalei	Velez-Garcia, Melissa Giselle	f	\N
9003	Jorge	Verduzco Jr	57151	8	j.verduzcojr151@cvuhsd.org	13	M	10	F-201	Mai, Van C	Verduzco Jr, Jorge	f	\N
9004	Aaden	Vielman	56506	8	a.turcios506@cvuhsd.org	13	M	10	D-205	Brown, Arianne	Vielman, Aaden Angel	f	\N
9005	Daniel	Villalobos	56469	8	d.villalobos469@cvuhsd.org	13	M	10	G-206	Thomas, Michelle	Villalobos, Daniel Javier	f	\N
9006	Jayleen	Villalobos	56999	8	j.villalobos999@cvuhsd.org	13	F	10	G-201	Doan, Andrew	Villalobos, Jayleen Antoinette	f	\N
9007	Jerimi	Villatoro	57317	8	j.villatoro317@cvuhsd.org	13	M	10	G-206	Thomas, Michelle	Villatoro, Jerimi David	f	\N
9008	Geraldine	Villegas	57363	8	g.villegas363@cvuhsd.org	13	F	10	F-201	Mai, Van C	Villegas, Geraldine Ariana	f	\N
9009	Abraham	Visoso	57125	8	a.visoso125@cvuhsd.org	13	M	10	H-204	Gilbert, Sean M.	Visoso, Abraham Isaias	f	\N
9010	Ny'ier	Wade	57478	8	n.wade478@cvuhsd.org	13	M	10	G-206	Miller, Jason	Wade, Ny'ier Lamar	f	\N
9011	Aaron	Walden	57248	8	a.walden248@cvuhsd.org	13	M	10	G-206	Thomas, Michelle	Walden, Aaron Jeff	f	\N
9012	Samuel	Walden	57250	8	s.walden250@cvuhsd.org	13	M	10	H-204	Gilbert, Sean M.	Walden, Samuel Paul	f	\N
9013	Asiyah	Walker	56668	8	a.walker668@cvuhsd.org	13	F	10	G-201	Doan, Andrew	Walker, Asiyah Jamesha	f	\N
9014	Jacob	Walker	56584	8	j.walker584@cvuhsd.org	13	M	10	H-204	Gilbert, Sean M.	Walker, Jacob Alexander	f	\N
9015	Harmony Arionna	Wallick	57133	8	h.wallick133@cvuhsd.org	13	F	10	E-203	Soufl, Kalei	Wallick, Harmony Arionna La'Shauwn	f	\N
9016	Paul	Ward Jr	56573	8	p.ward573@cvuhsd.org	13	M	10	GYM 6	Singleton, Sigmund	Ward Jr, Paul Marcus	f	\N
9017	Kayla	Williams	55747	8	k.williams747@cvuhsd.org	13	F	10	H-204	Gilbert, Sean M.	Williams, Kayla Michelle	f	\N
9018	Kayleon	Williams	58149	8	k.williams149@cvuhsd.org	13	F	10	G-201	Doan, Andrew	Williams, Kayleon Maddison	f	\N
9019	London	Williams	56465	8	l.williams465@cvuhsd.org	13	F	10	GYM 6	Singleton, Sigmund	Williams, London Giahni	f	\N
9020	Tyree	Williams	57359	8	t.williams359@cvuhsd.org	13	M	10	H-204	Gilbert, Sean M.	Williams, Tyree Bryant	f	\N
9021	Cincire	Wright	57032	8	c.wright032@cvuhsd.org	13	F	10	C-205	Dibrell, Renee	Wright, Cincire,Raneal	f	\N
9022	Caiya	Wynne	56127	8	c.wynne127@cvuhsd.org	13	F	10	E-205	Rollino, Christian P	Wynne, Caiya Chavon	f	\N
9023	A'miyah	Yates	57352	8	a.yates352@cvuhsd.org	13	F	10	C-203	Naluswa, Margaret	Yates,  A'miyah Alice Marie	f	\N
9024	Robert	Zapeta	56814	8	r.zapeta814@cvuhsd.org	13	M	10	D-107	Williams, Sherrevia A	Zapeta, Robert Matthew	f	\N
9025	Tatiana	Zavala Campos	58592	8	t.zavalacampos592@cvuhsd.org	13	F	10	B-1	Cassio, Michael J.	Zavala Campos, Tatiana Camila	f	\N
9026	Zadis	Zelaya	56541	8	z.zelaya541@cvuhsd.org	13	F	10	G-202	Ann, Jane	Zelaya, Zadis Yvette	f	\N
9027	Wilson	Acevedo	54684	8	w.acevedo684@cvuhsd.org	13	F	11	D-201	Villegas-Diaz, Jessica P.	Acevedo, Wilson Jairzhino	f	\N
9028	Elizabeth	Adame	54455	8	e.adame455@cvuhsd.org	13	F	11	D-104	Samuels, Kathleen C	Adame, Elizabeth	f	\N
9029	Ruth	Agbedor-Sombo	54554	8	r.agbedorsombo554@cvuhsd.org	13	F	11	H-105	Forster, Claire	Agbedor-Sombo, Ruth Yayira	f	\N
9030	Valkyrie	Agcaoili	59243	8	v.agcaoili243@cvuhsd.org	13	F	11	H-105	Forster, Claire	Agcaoili, Valkyrie Fletcher	f	\N
9031	Kenneth	Aguilar Argenal	57076	8	k.aguilarargenal076@cvuhsd.org	13	M	11	A-203	Deguzman, May R	Aguilar Argenal, Kenneth Alejandro	f	\N
9032	Francisco	Alarcon Jr	54555	8	f.alarconjr555@cvuhsd.org	13	M	11	G-104	Mccoy, Bert L	Alarcon Jr, Francisco Javier	f	\N
9033	Diego	Altamirano-Amaya	54239	8	d.altamiranoamaya239@cvuhsd.org	13	M	11	G-108	Ramirez, Lourdes	Altamirano-Amaya, Diego	f	\N
9034	Alexander	Alvarado	53739	8	a.alvarado739@cvuhsd.org	13	M	11	H-105	Forster, Claire	Alvarado, Alexander Alexis	f	\N
9035	Jose	Alvarez Garcia	53740	8	j.alvarezgarcia740@cvuhsd.org	13	M	11	E-201	Choi, Eric	Alvarez Garcia, Jose Manuel	f	\N
9036	McKayla	Amezcua-Vasquez	55238	8	m.amezcuavasquez238@cvuhsd.org	13	F	11	H-205	Matuz, Kristin M.	Amezcua-Vasquez, McKayla	f	\N
9037	Leila	Anaya Rodriguez	54743	8	l.anayarodriguez743@cvuhsd.org	13	F	11	C-102	Nguyen, Linda A	Anaya Rodriguez, Leila Angelina	f	\N
9038	Jayshell	Anderson	57504	8	j.anderson504@cvuhsd.org	13	F	11	GYM 6	Singleton, Sigmund	Anderson, Jayshell Mohgany	f	\N
9039	Gabriella	Andrade	54837	8	g.andrade837@cvuhsd.org	13	F	11	D-201	Villegas-Diaz, Jessica P.	Andrade, Gabriella Aileen	f	\N
9040	Reyes	Andrade	55254	8	r.andrade254@cvuhsd.org	13	M	11	GYM 4	Whitt, James	Andrade, Reyes Alejandro	f	\N
9041	Bryan	Annan	54131	8	b.annan131@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Annan, Bryan Kwesi	f	\N
9042	Jonathan	Aquino Antonio	53741	8	j.aquinoantonio741@cvuhsd.org	13	M	11	E-104	Hiller, Sean J	Aquino Antonio, Jonathan Emmanuel	f	\N
9043	Angel	Aquino	54373	8	a.aquino373@cvuhsd.org	13	M	11	H-205	Matuz, Kristin M.	Aquino, Angel	f	\N
9044	Yamileth	Arana Gomez	54745	8	y.aranagomez745@cvuhsd.org	13	F	11	G-208	Tran, Maichi N.	Arana Gomez, Yamileth Janine	f	\N
9045	Ronaldo	Aranzazu Arellano	53742	8	r.aranzazuarellan742@cvuhsd.org	13	M	11	B-1	Cassio, Michael J.	Aranzazu Arellano, Ronaldo	f	\N
9046	Ariana	Arevalo	53744	8	a.arevalo744@cvuhsd.org	13	F	11	G-108	Ramirez, Lourdes	Arevalo, Ariana Fabiola	f	\N
9047	Brandon	Arrecis Argueta	53745	8	b.arrecisargueta745@cvuhsd.org	13	M	11	D-204	Bravo, Ronald J	Arrecis Argueta, Brandon Oskary	f	\N
9048	Melanie	Arrecis Argueta	53818	8	m.arrecisargueta818@cvuhsd.org	13	F	11	E-201	Choi, Eric	Arrecis Argueta, Melanie Cristal	f	\N
9049	Yanixan	Arreola Munoz	54020	8	y.arreolamunoz020@cvuhsd.org	13	M	11	F-103	Kaiser, Noah	Arreola Munoz, Yanixan	f	\N
9050	Madelyn	Arriaza Ortiz	54405	8	m.arriazaortiz405@cvuhsd.org	13	F	11	E-104	Hiller, Sean J	Arriaza Ortiz, Madelyn Jovanna	f	\N
9051	Angela	Arteaga	53677	8	a.arteaga677@cvuhsd.org	13	F	11	G-104	Mccoy, Bert L	Arteaga, Angela Soanny	f	\N
9052	Israel	Artiga	54379	8	i.artiga379@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	ArtigaIsrael, Alexander	f	\N
9053	King Jordan	Ashby	54115	8	k.ashby115@cvuhsd.org	13	M	11	H-105	Forster, Claire	Ashby, King Jordan Shaejohn	f	\N
9054	Jayion	Avery	55222	8	j.avery222@cvuhsd.org	13	M	11	C-201	Haro, Nancy	Avery, Jayion	f	\N
9055	Sean	Azuela	53662	8	s.azuela662@cvuhsd.org	13	M	11	H-202	Saad, Eman	Azuela, Sean	f	\N
9056	Yanelli	Baltazar	58536	8	y.baltazar536@cvuhsd.org	13	F	11	G-108	Ramirez, Lourdes	Baltazar, Yanelli Marie	f	\N
9057	Denise	Banuelos	54022	8	d.banuelos022@cvuhsd.org	13	F	11	F-103	Kaiser, Noah	Banuelos, Denise Amberly	f	\N
9058	Roberto	Barajas	55191	8	r.barajas191@cvuhsd.org	13	M	11	H-202	Saad, Eman	Barajas, Roberto	f	\N
9059	TaShad	Barnes	53820	8	t.barnes820@cvuhsd.org	13	M	11	GYM 4	Whitt, James	Barnes, TaShad Nakai	f	\N
9060	Oliver	Barrera Escobar	54298	8	o.barreraescobar298@cvuhsd.org	13	M	11	D-206	Jones, Arturo M	Barrera Escobar, Oliver Josue	f	\N
9061	Khloe	Bayloe	55182	8	k.bayloe182@cvuhsd.org	13	F	11	H-105	Forster, Claire	Bayloe, Khloe Victoria	f	\N
9062	Adrian	Belizaire	53821	8	a.belizaire821@cvuhsd.org	13	M	11	G-104	Mccoy, Bert L	Belizaire, Adrian Jacob	f	\N
9063	Kimberly	Beltran Betancourt	54729	8	k.beltranbetancou729@cvuhsd.org	13	F	11	H-205	Matuz, Kristin M.	Beltran Betancourt, Kimberly	f	\N
9064	Zayra	Bendezu	54186	8	z.bendezu186@cvuhsd.org	13	F	11	H-105	Forster, Claire	Bendezu, Zayra Jimella	f	\N
9065	Evelyn	Benigno Aviles	55591	8	e.benignoaviles591@cvuhsd.org	13	F	11	E-201	Choi, Eric	Benigno Aviles, Evelyn Esmerelda	f	\N
9066	Tatiana	Bettis	53822	8	t.bettis822@cvuhsd.org	13	F	11	G-108	Ramirez, Lourdes	Bettis, Tatiana Nohaya	f	\N
9067	Myliaha	Bias	55346	8	m.bias346@cvuhsd.org	13	F	11	G-104	Mccoy, Bert L	Bias, Myliaha M	f	\N
9068	Tyree	Bishop	54326	8	t.bishop326@cvuhsd.org	13	M	11	C-201	Haro, Nancy	Bishop, Tyree Jerell	f	\N
9069	Jasmine	Bizarron	53823	8	j.bizarron823@cvuhsd.org	13	F	11	C-102	Nguyen, Linda A	Bizarron, Jasmine Naomi	f	\N
9070	Martha	Blanco	55055	8	m.blanco055@cvuhsd.org	13	F	11	H-205	Matuz, Kristin M.	Blanco, Martha Veronica	f	\N
9071	Chance	Booker	54749	8	c.booker749@cvuhsd.org	13	M	11	F-104	Saldana, Sonia	Booker, Chance Amorie	f	\N
9072	Jacqueline	Borja Castro	58656	8	j.borjacastro656@cvuhsd.org	13	F	11	A-203	Deguzman, May R	Borja Castro, Jacqueline Alejandra	f	\N
9074	Genesis	Brambila	59258	8	g.brambila258@cvuhsd.org	13	F	11	A-203	Deguzman, May R	Brambila, Genesis Mia	f	\N
9075	Ashley	Bran	53824	8	a.bran824@cvuhsd.org	13	F	11	H-105	Forster, Claire	Bran, Ashley	f	\N
9076	Cassey	Briseno	55183	8	c.briseno183@cvuhsd.org	13	F	11	E-201	Choi, Eric	Briseno, Cassey	f	\N
9077	Aidyn	Brown	57193	8	a.brown193@cvuhsd.org	13	F	11	D-201	Villegas-Diaz, Jessica P.	Brown, Aidyn Milaan	f	\N
9078	Tatyanna	Brown	57230	8	t.brown230@cvuhsd.org	13	F	11	G-108	Ramirez, Lourdes	Brown, Tatyanna Unique	f	\N
9079	Clarissa	Bruce	54433	8	c.bruce433@cvuhsd.org	13	F	11	H-105	Forster, Claire	Bruce, Clarissa Michelle	f	\N
9080	Julian	Buruca	53825	8	j.buruca825@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Buruca, Julian Agustin	f	\N
9081	Janeth	Cabrera	54428	8	j.cabrera428@cvuhsd.org	13	F	11	A-203	Deguzman, May R	Cabrera, Janeth	f	\N
9082	Emily	Cahuantzi	54834	8	e.cahuantzi834@cvuhsd.org	13	F	11	D-204	Bravo, Ronald J	Cahuantzi, Emily Elizabeth	f	\N
9083	Metztli	Camarillo	56747	8	m.camarillo747@cvuhsd.org	13	X	11	F-104	Saldana, Sonia	Camarillo, Metztli Ixchel	f	\N
9084	Kevin	Campbell Jr	58621	8	k.campbelljr621@cvuhsd.org	13	M	11	C-201	Haro, Nancy	Campbell Jr, Kevin Michael	f	\N
9085	Kalani	Cano	55097	8	k.cano097@cvuhsd.org	13	F	11	E-104	Hiller, Sean J	Cano, Kalani Teresa-Lelai	f	\N
9086	Briana	Cardenas	53827	8	b.cardenas827@cvuhsd.org	13	F	11	G-201	Doan, Andrew	Cardenas, Briana	f	\N
9087	Jesse	Cardenas	53828	8	j.cardenas828@cvuhsd.org	13	M	11	C-102	Nguyen, Linda A	Cardenas, Jesse	f	\N
9088	Persia	Carpenter	54559	8	p.carpenter559@cvuhsd.org	13	F	11	F-202	Rogers, Marie	Carpenter, Persia Ciera	f	\N
9089	Jose	Carreon	53864	8	j.carreon864@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Carreon, Jose Fernando	f	\N
9090	Camila	Carrillo	54560	8	c.carrillo560@cvuhsd.org	13	F	11	G-208	Tran, Maichi N.	Carrillo, Camila	f	\N
9091	David	Casillas	53829	8	d.casillas829@cvuhsd.org	13	M	11	G-112	Diaz, Maria I.	Casillas, David Esteban	f	\N
9092	Andrew	Castro	56973	8	a.castro973@cvuhsd.org	13	M	11	G-208	Tran, Maichi N.	Castro, Andrew Calli	f	\N
9093	Citlali	Catalan	57572	8	c.catalan572@cvuhsd.org	13	F	11	G-104	Mccoy, Bert L	Catalan, Citlali	f	\N
9094	Mishca Aliyah	Cayetano	54492	8	m.cayetano492@cvuhsd.org	13	F	11	G-108	Ramirez, Lourdes	Cayetano, Mishca Aliyah	f	\N
9095	J.C.	Chatman	55281	8	j.chatman281@cvuhsd.org	13	M	11	H-205	Matuz, Kristin M.	Chatman, J.C. Andres	f	\N
9096	Ayumi Yzzabel	Chavez	59083	8	a.chavez083@cvuhsd.org	13	F	11	H-105	Forster, Claire	Chavez, Ayumi Yzzabel Candido	f	\N
9097	Diego	Chavez	56527	8	d.chavez527@cvuhsd.org	13	M	11	E-104	Hiller, Sean J	Chavez, Diego Adolfo	f	\N
9098	Oliver	Cifuentes Rodriguez	53831	8	o.cifuentesrodrig831@cvuhsd.org	13	M	11	E-201	Choi, Eric	Cifuentes Rodriguez, Oliver Vinicio	f	\N
9099	Devan	Cisneros	54754	8	d.cisneros754@cvuhsd.org	13	M	11	G-104	Mccoy, Bert L	Cisneros, Devan Enedino	f	\N
9100	Jason	Cisneros	57387	8	j.cisneros387@cvuhsd.org	13	M	11	G-111	Romo, Jose A.	Cisneros, Jason Anthony	f	\N
9101	Cameran	Clay	55153	8	c.clay153@cvuhsd.org	13	M	11	C-102	Nguyen, Linda A	Clay, Cameran Alan	f	\N
9102	Ananias	Coleman	54826	8	a.coleman826@cvuhsd.org	13	M	11	D-204	Bravo, Ronald J	Coleman, Ananias Alexander	f	\N
9103	Juan	Contreras Garcia	55463	8	j.contrerasgarcia463@cvuhsd.org	13	M	11	D-208	Bedell, David D.	Contreras Garcia, Juan Sebastian	f	\N
9104	Allyson	Contreras	54446	8	a.contreras446@cvuhsd.org	13	F	11	G-208	Tran, Maichi N.	Contreras, Allyson	f	\N
9105	Haniyyah	Cooley	55065	8	h.cooley065@cvuhsd.org	13	F	11	G-108	Ramirez, Lourdes	Cooley, Haniyyah Heaven	f	\N
9106	Matthew	Cordova	54798	8	m.cordova798@cvuhsd.org	13	M	11	H-202	Saad, Eman	Cordova, Matthew Alfonso Joshua	f	\N
9107	Santos	Corona	54189	8	s.corona189@cvuhsd.org	13	M	11	C-102	Nguyen, Linda A	Corona, Santos Alonzo	f	\N
9108	Alberto	Correa	54438	8	a.correa438@cvuhsd.org	13	M	11	E-104	Hiller, Sean J	Correa, Alberto	f	\N
9109	Joey	Cortez	53842	8	j.cortez842@cvuhsd.org	13	M	11	E-104	Hiller, Sean J	Cortez, Joey	f	\N
9110	Martin	Corvera	53843	8	m.corvera843@cvuhsd.org	13	M	11	H-205	Matuz, Kristin M.	Corvera, Martin Eduardo	f	\N
9111	Emelin	Coutino Palafox	54601	8	e.coutinopalafox601@cvuhsd.org	13	F	11	B-1	Cassio, Michael J.	Coutino Palafox, Emelin Cristal	f	\N
9112	Viktoria	Cox	55224	8	v.cox224@cvuhsd.org	13	F	11	H-105	Forster, Claire	Cox, Viktoria Maria	f	\N
9113	Klyde	Cristobal	58722	8	k.cristobal722@cvuhsd.org	13	M	11	A-203	Deguzman, May R	Cristobal, Klyde Gregorio	f	\N
9114	Yasmin	Cruz Ventura	54387	8	y.cruzventura387@cvuhsd.org	13	F	11	G-108	Ramirez, Lourdes	Cruz Ventura, Yasmin	f	\N
9115	Ana	Cruz	53844	8	a.cruz844@cvuhsd.org	13	F	11	E-104	Hiller, Sean J	Cruz, Ana Cecilia	f	\N
9116	Camila	Cruz	54317	8	c.cruz317@cvuhsd.org	13	F	11	F-104	Saldana, Sonia	Cruz, Camila Sabina	f	\N
9117	Kevin	Cruz	54892	8	k.cruz892@cvuhsd.org	13	M	11	H-205	Matuz, Kristin M.	Cruz, Kevin	f	\N
9118	Nathan	Cruz	54489	8	n.cruz489@cvuhsd.org	13	M	11	H-204	Gilbert, Sean M.	Cruz, Nathan Ezequiel	f	\N
9119	Abigail	Cuellar Hernandez	54509	8	a.cuellarhernande509@cvuhsd.org	13	F	11	G-208	Tran, Maichi N.	Cuellar Hernandez, Abigail	f	\N
9120	Cesar	Dardon-Martinez	53689	8	c.dardonmartinez689@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Dardon-Martinez, Cesar Augusto	f	\N
9121	Fernando	Davila Castillo	55815	8	f.davilacastillo815@cvuhsd.org	13	M	11	G-210	Ibarra, Irvin A	Davila Castillo, Fernando Leonel	f	\N
9122	Demitri	Dawson	54368	8	d.dawson368@cvuhsd.org	13	M	11	C-201	Haro, Nancy	Dawson, Demitri Anthony	f	\N
9123	Heber	Del Cid	53846	8	h.delcid846@cvuhsd.org	13	M	11	C-102	Nguyen, Linda A	Del Cid, Heber Oraldo	f	\N
9124	Arantxa	Deleon Montufar	54378	8	a.deleonmontufar378@cvuhsd.org	13	F	11	F-104	Saldana, Sonia	Deleon Montufar, Arantxa Maydee	f	\N
9125	Ninive	Delgado	53847	8	n.delgado847@cvuhsd.org	13	F	11	E-202	Cara, Ryan G	Delgado, Ninive Sarai	f	\N
9126	Yareli	Diaz Sosa	56473	8	y.diazsosa473@cvuhsd.org	13	F	11	H-105	Forster, Claire	Diaz Sosa, Yareli	f	\N
9127	Juan	Donis Garcia	55202	8	j.donisgarcia202@cvuhsd.org	13	M	11	C-201	Haro, Nancy	Donis Garcia, Juan Miguel	f	\N
9128	Jeremiah	Dous	54367	8	j.dous367@cvuhsd.org	13	M	11	F-104	Saldana, Sonia	DousJeremiah, Magdy	f	\N
9129	Raven	Dupree	55857	8	r.dupree857@cvuhsd.org	13	F	11	G-104	Mccoy, Bert L	Dupree, Raven Jermaine	f	\N
9130	Jackie	Duran Molina	53849	8	j.duranmolina849@cvuhsd.org	13	F	11	H-105	Forster, Claire	Duran Molina, Jackie Rosselyn	f	\N
9131	Anaiya	Eddie	54435	8	a.eddie435@cvuhsd.org	13	F	11	D-204	Bravo, Ronald J	Eddie, Anaiya	f	\N
9132	Mia	Edwards	54464	8	m.edwards464@cvuhsd.org	13	F	11	G-108	Ramirez, Lourdes	Edwards, Mia Shanae'	f	\N
9133	Kouao	Elliam	54570	8	k.elliam570@cvuhsd.org	13	M	11	D-208	Bedell, David D.	Elliam, Kouao William	f	\N
9134	Terrance	Ellison	54345	8	t.ellison345@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Ellison, Terrance Ferron	f	\N
9135	Antonio	Enriquez Serrano	59131	8	a.enriquezserran131@cvuhsd.org	13	M	11	D-204	Bravo, Ronald J	Enriquez Serrano, Antonio Gabriel	f	\N
9136	Damien	Escobar	54894	8	d.escobar894@cvuhsd.org	13	M	11	GYM 4	Whitt, James	Escobar, Damien	f	\N
9137	Adrian	Espinosa Fajardo	55072	8	a.espinosafajardo072@cvuhsd.org	13	M	11	G-108	Ramirez, Lourdes	Espinosa Fajardo, Adrian	f	\N
9138	Juan	Espitia Copete	54802	8	j.espitiacopete802@cvuhsd.org	13	M	11	D-204	Bravo, Ronald J	Espitia Copete, Juan Diego	f	\N
9139	Jocelyne	Fabian	53679	8	j.fabian679@cvuhsd.org	13	F	11	G-208	Tran, Maichi N.	Fabian, Jocelyne Mariely	f	\N
9140	Paul	Fakatoumafi	55389	8	p.fakatoumafi389@cvuhsd.org	13	M	11	D-107	Williams, Sherrevia A	Fakatoumafi, Paul	f	\N
9141	Hazel	Ferman	54365	8	h.ferman365@cvuhsd.org	13	F	11	H-205	Matuz, Kristin M.	Ferman, Hazel Railene	f	\N
9142	Angel	Flores	53670	8	a.flores670@cvuhsd.org	13	M	11	H-202	Saad, Eman	Flores, Angel David	f	\N
9143	Julisa	Flores	53853	8	j.flores853@cvuhsd.org	13	F	11	F-104	Saldana, Sonia	Flores, Julisa	f	\N
9144	Nathan	Flores	54490	8	n.flores490@cvuhsd.org	13	M	11	D-201	Villegas-Diaz, Jessica P.	Flores, Nathan	f	\N
9145	Moises	Fonseca	54650	8	m.fonseca650@cvuhsd.org	13	M	11	H-205	Matuz, Kristin M.	Fonseca, Moises Israel	f	\N
9146	Mariah-Ann	Ford	54896	8	m.ford896@cvuhsd.org	13	F	11	H-202	Saad, Eman	Ford, Mariah-Ann Nicole	f	\N
9147	Amaiya Cristina	Fowler	54666	8	a.fowler666@cvuhsd.org	13	F	11	H-105	Forster, Claire	Fowler, Amaiya Cristina	f	\N
9148	Emma	Franco	56879	8	e.franco879@cvuhsd.org	13	F	11	F-104	Saldana, Sonia	Franco, Emma Aliikai	f	\N
9149	Jesse	Galan	54216	8	j.galan216@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Galan, Jesse Aden	f	\N
9150	Dyanne	Gallardo	54830	8	d.gallardo830@cvuhsd.org	13	F	11	G-112	Diaz, Maria I.	Gallardo, Dyanne Virginia	f	\N
9151	Johan	Galvan Torres	54829	8	j.galvantorres829@cvuhsd.org	13	M	11	H-205	Matuz, Kristin M.	Galvan Torres, Johan Edmundo	f	\N
9152	Samantha	Galvan	53672	8	s.galvan672@cvuhsd.org	13	F	11	G-201	Doan, Andrew	Galvan, Samantha Marybel	f	\N
9153	Jilarhy	Galvan-Ibanez	53854	8	j.galvanibanez854@cvuhsd.org	13	F	11	C-102	Nguyen, Linda A	Galvan-Ibanez, Jilarhy Samantha	f	\N
9154	Alberto	Galvez	54278	8	a.galvez278@cvuhsd.org	13	M	11	B-1	Cassio, Michael J.	Galvez, Alberto	f	\N
9155	Samuel	Gamboa	54832	8	s.gamboa832@cvuhsd.org	13	M	11	C-102	Nguyen, Linda A	Gamboa, Samuel Adel	f	\N
9156	Armando	Garcia De Jesus	58559	8	a.garciadejesus559@cvuhsd.org	13	M	11	GYM 6	Singleton, Sigmund	Garcia De Jesus, Armando	f	\N
9157	Wendy	Garcia Lucas	54154	8	w.garcialucas154@cvuhsd.org	13	F	11	G-208	Tran, Maichi N.	Garcia Lucas, Wendy Lizbeth	f	\N
9158	Andres	Garcia Morales	54401	8	a.garciamorales401@cvuhsd.org	13	M	11	H-202	Saad, Eman	Garcia Morales, Andres Alexander	f	\N
9159	Dylan	Garcia	54393	8	d.garcia393@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Garcia, Dylan Leonardo	f	\N
9160	Susan	Garcia	59229	8	s.garcia229@cvuhsd.org	13	F	11	GYM 6	Singleton, Sigmund	Garcia, Susan Alondra	f	\N
9161	Zuleyma	Garcia	55078	8	z.garcia078@cvuhsd.org	13	X	11	E-104	Hiller, Sean J	Garcia, Zuleyma Alexandra	f	\N
9162	Italia	Gastelum Armenta	54246	8	i.gastelumarmenta246@cvuhsd.org	13	F	11	C-102	Nguyen, Linda A	Gastelum Armenta, Italia Georgina	f	\N
9163	Eliana	Gavino	54821	8	e.gavino821@cvuhsd.org	13	F	11	F-202	Rogers, Marie	Gavino, Eliana	f	\N
9164	John	Gohr	54419	8	j.gohr419@cvuhsd.org	13	M	11	G-207	Rah, Choonglim	Gohr, John Anthony	f	\N
9165	Britanny	Gomez Galeano	54548	8	b.gomezgaleano548@cvuhsd.org	13	F	11	E-201	Choi, Eric	Gomez Galeano, Britanny Zharick	f	\N
9166	George	Gomez Mendez	53857	8	g.gomezmendez857@cvuhsd.org	13	M	11	H-205	Matuz, Kristin M.	Gomez Mendez, George Alexander	f	\N
9167	Wesly	Gomez Palacios	54458	8	w.gomezpalacios458@cvuhsd.org	13	M	11	A-203	Deguzman, May R	Gomez Palacios, WeslyJoan	f	\N
9168	Ashley	Gomez	54459	8	a.gomez459@cvuhsd.org	13	F	11	G-104	Mccoy, Bert L	Gomez, Ashley	f	\N
9169	Christian	Gomez	54380	8	c.gomez380@cvuhsd.org	13	M	11	E-104	Hiller, Sean J	Gomez, Christian Eliel	f	\N
9170	Jennifer	Gonzalez Montoya	53858	8	j.gonzalezmontoya858@cvuhsd.org	13	F	11	G-111	Romo, Jose A.	Gonzalez Montoya, Jennifer Soledad	f	\N
9171	Aimara	Gonzalez	53865	8	a.gonzalez865@cvuhsd.org	13	F	11	H-105	Forster, Claire	Gonzalez, Aimara	f	\N
9172	Damian	Gonzalez	55085	8	d.gonzalez085@cvuhsd.org	13	M	11	D-204	Bravo, Ronald J	Gonzalez, Damian Nery	f	\N
9173	Emily	Gonzalez	54245	8	e.gonzalez245@cvuhsd.org	13	F	11	D-201	Villegas-Diaz, Jessica P.	Gonzalez, Emily	f	\N
9174	Jorge	Gonzalez	56911	8	j.gonzalez911@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Gonzalez, Jorge Alberto	f	\N
9175	Xi	Gonzalez	53680	8	s.gonzalez680@cvuhsd.org	13	X	11	F-104	Saldana, Sonia	Gonzalez, Xi	f	\N
9176	Blake	Graham	54316	8	b.graham316@cvuhsd.org	13	M	11	E-201	Choi, Eric	Graham, Blake Anderson	f	\N
9177	Zachary	Grant Jr	54536	8	z.grantjr536@cvuhsd.org	13	M	11	H-205	Matuz, Kristin M.	Grant Jr, Zachary Robert	f	\N
9178	Brandon	Grant	55213	8	b.grant213@cvuhsd.org	13	M	11	F-202	Rogers, Marie	Grant, Brandon Keith	f	\N
9179	Kaden	Gray	59125	8	k.gray125@cvuhsd.org	13	M	11	F-202	Rogers, Marie	Gray, Kaden Cordell	f	\N
9180	Rehanna	Griggley	55301	8	r.griggley301@cvuhsd.org	13	F	11	D-204	Bravo, Ronald J	Griggley, Rehanna Dior	f	\N
9181	Eduardo	Gudino	53659	8	e.gudino659@cvuhsd.org	13	M	11	C-204	Kenning, Sara J	Gudino, Eduardo Luis	f	\N
9182	Adrian	Gutierrez Jr.	55034	8	a.gutierrezjr034@cvuhsd.org	13	M	11	D-206	Jones, Arturo M	Gutierrez Jr., Adrian	f	\N
9183	Andrew	Gutierrez	54399	8	a.gutierrez399@cvuhsd.org	13	M	11	G-112	Diaz, Maria I.	Gutierrez, Andrew	f	\N
9184	Fernando	Gutierrez	53861	8	f.gutierrez861@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Gutierrez, Fernando	f	\N
9185	Jocelyn	Gutierrez	54290	8	j.gutierrez290@cvuhsd.org	13	F	11	G-208	Tran, Maichi N.	Gutierrez, Jocelyn Noelle	f	\N
9186	Randy	Gutierrez	53860	8	r.gutierrez860@cvuhsd.org	13	M	11	G-108	Ramirez, Lourdes	Gutierrez, Randy Joe	f	\N
9187	Joshua	Hartley	55031	8	j.hartley031@cvuhsd.org	13	M	11	E-201	Choi, Eric	Hartley, Joshua Adam	f	\N
9188	Skyah	Hearn	58856	8	s.hearn856@cvuhsd.org	13	F	11	C-201	Haro, Nancy	Hearn, Skyah Jewelle	f	\N
9189	Ja'Meice	Henry	54121	8	j.henry121@cvuhsd.org	13	F	11	F-104	Saldana, Sonia	Henry, Ja'Meice Breshone	f	\N
9190	Destiny	Hermosillo Diaz	54120	8	d.hermosillodiaz120@cvuhsd.org	13	F	11	C-102	Nguyen, Linda A	Hermosillo Diaz, Destiny	f	\N
9191	Juan	Hermosillo Moreno	54716	8	j.hermosillomoren716@cvuhsd.org	13	M	11	E-104	Hiller, Sean J	Hermosillo Moreno, Juan Ramon	f	\N
9192	Caroline	Hernandez	55268	8	c.hernandez268@cvuhsd.org	13	F	11	H-205	Matuz, Kristin M.	Hernandez, Caroline	f	\N
9193	Caylee	Hernandez	53866	8	c.hernandez866@cvuhsd.org	13	F	11	G-111	Romo, Jose A.	Hernandez, Caylee	f	\N
9194	Fernanda	Hernandez	53924	8	f.hernandez924@cvuhsd.org	13	F	11	G-104	Mccoy, Bert L	Hernandez, Fernanda Yaritzza	f	\N
9195	Jordan	Hernandez	54044	8	j.hernandez044@cvuhsd.org	13	M	11	F-103	Kaiser, Noah	Hernandez, Jordan Xavier Hooks	f	\N
9196	Joseph	Hernandez	54897	8	j.hernandez897@cvuhsd.org	13	M	11	D-204	Bravo, Ronald J	Hernandez, Joseph Anthony	f	\N
9197	Laisha	Hernandez	53862	8	l.hernandez862@cvuhsd.org	13	F	11	G-112	Diaz, Maria I.	Hernandez, Laisha	f	\N
9198	Carlos	Herrera	58996	8	c.herrera996@cvuhsd.org	13	M	11	G-108	Ramirez, Lourdes	Herrera, Carlos Adrian	f	\N
9199	Taryn	Hill	58723	8	t.hill723@cvuhsd.org	13	F	11	F-202	Rogers, Marie	Hill, Taryn Lena	f	\N
9200	Khoa	Ho	54349	8	k.ho349@cvuhsd.org	13	M	11	H-105	Forster, Claire	Ho, Khoa Anh	f	\N
9201	Alexis	Hoang Mai	53867	8	k.hoangmai867@cvuhsd.org	13	F	11	E-202	Cara, Ryan G	Hoang Mai, Alexis	f	\N
9202	Sinamoni	Hola	58929	8	s.hola929@cvuhsd.org	13	M	11	H-205	Matuz, Kristin M.	Hola, Sinamoni	f	\N
9203	Isabella	Holguin	54516	8	i.holguin516@cvuhsd.org	13	F	11	H-105	Forster, Claire	Holguin, Isabella Leilani	f	\N
9204	Zayra	Huezo-Diaz	53692	8	z.huezodiaz692@cvuhsd.org	13	F	11	D-204	Bravo, Ronald J	Huezo-Diaz, Zayra Michelle	f	\N
9205	Jazmin	Ibanez	54511	8	j.ibanez511@cvuhsd.org	13	F	11	E-104	Hiller, Sean J	Ibanez, Jazmin Gisell	f	\N
9206	Kaosisochukwu	Ibewuike	54114	8	k.ibewuike114@cvuhsd.org	13	M	11	H-105	Forster, Claire	Ibewuike, Kaosisochukwu Edwin	f	\N
9207	David	Ihezuoh	57473	8	d.ihezuoh473@cvuhsd.org	13	M	11	H-105	Forster, Claire	Ihezuoh, David Ebubechukwu	f	\N
9208	Brianna	Ike	54450	8	b.ike450@cvuhsd.org	13	F	11	E-202	Cara, Ryan G	Ike, Brianna Kasie	f	\N
9209	Xavier	Imperial	54232	8	x.imperial232@cvuhsd.org	13	M	11	G-112	Diaz, Maria I.	Imperial, Xavier Valencia	f	\N
9210	Nkemdirim	Iwobi	53868	8	n.iwobi868@cvuhsd.org	13	M	11	D-104	Samuels, Kathleen C	Iwobi, Nkemdirim Chigozirim	f	\N
9211	Christopher	Jackson	55210	8	c.jackson210@cvuhsd.org	13	M	11	C-203	Naluswa, Margaret	Jackson, Christopher Diijon	f	\N
9212	Jordyn	Jackson	54651	8	j.jackson651@cvuhsd.org	13	F	11	C-204	Kenning, Sara J	Jackson, Jordyn Xian	f	\N
9213	La'Niyah	Jackson	53869	8	l.jackson869@cvuhsd.org	13	F	11	F-104	Saldana, Sonia	Jackson, La'Niyah Domonique	f	\N
9214	Mekhel	Jackson	54496	8	m.jackson496@cvuhsd.org	13	M	11	G-112	Diaz, Maria I.	Jackson, Mekhel De'Shawn	f	\N
9215	Myron	Jackson	54672	8	m.jackson672@cvuhsd.org	13	M	11	H-202	Saad, Eman	Jackson, Myron David	f	\N
9216	Martin	Jaramillo Torres	53870	8	m.jaramillotorres870@cvuhsd.org	13	M	11	G-208	Tran, Maichi N.	Jaramillo Torres, Martin Manuel	f	\N
9217	Brian	Jauregui	54190	8	b.jauregui190@cvuhsd.org	13	M	11	GYM 4	Whitt, James	Jauregui, Brian	f	\N
9218	Esai	Jimenez Vasquez	53872	8	e.jimenezvasquez872@cvuhsd.org	13	M	11	H-205	Matuz, Kristin M.	Jimenez Vasquez, Esai	f	\N
9219	Giancarlo	Jimenez	54833	8	g.jimenez833@cvuhsd.org	13	M	11	F-104	Saldana, Sonia	Jimenez, Giancarlo	f	\N
9220	Candice	Jones	55405	8	c.jones405@cvuhsd.org	13	F	11	D-206	Jones, Arturo M	Jones, Candice Anaya	f	\N
9221	Sean	Jones	57885	8	s.jones885@cvuhsd.org	13	M	11	H-205	Matuz, Kristin M.	Jones, Sean Khaleb	f	\N
9222	Lyriq	Jordan-Shepard	55608	8	l.jordanshepard608@cvuhsd.org	13	M	11	D-204	Bravo, Ronald J	Jordan-Shepard, Lyriq De'Shaun	f	\N
9223	Jusuana	Justice	54814	8	j.justice814@cvuhsd.org	13	F	11	G-108	Ramirez, Lourdes	Justice, Jusuana Sanaa	f	\N
9224	Seneti	Kalolo	55024	8	s.kalolo024@cvuhsd.org	13	F	11	G-207	Rah, Choonglim	Kalolo, Seneti Kalauni	f	\N
9225	Haedn	Kelley	54456	8	h.kelley456@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Kelley, Haedn Aleksander	f	\N
9226	Soleil	Klein	53873	8	s.klein873@cvuhsd.org	13	F	11	C-102	Nguyen, Linda A	Klein, Soleil Alexandra	f	\N
9227	James	Kuenstler	54811	8	j.kuenstler811@cvuhsd.org	13	M	11	H-205	Matuz, Kristin M.	Kuenstler, James Trevor	f	\N
9228	Londyn	Lagarde	54221	8	l.lagarde221@cvuhsd.org	13	F	11	H-105	Forster, Claire	Lagarde, Londyn Marie	f	\N
9229	Ostman	Lara Otavo	56278	8	o.laraotavo278@cvuhsd.org	13	M	11	D-208	Bedell, David D.	Lara Otavo, Ostman Sneyder	f	\N
9230	Izabella	Lara	54360	8	i.lara360@cvuhsd.org	13	F	11	G-112	Diaz, Maria I.	LaraIzabella, Abigail	f	\N
9231	Aiden	Larios Erazo	53874	8	a.larioserazo874@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Larios Erazo, Aiden Alexander	f	\N
9232	Rocco	Latchman	59136	8	r.latchman136@cvuhsd.org	13	M	11	G-104	Mccoy, Bert L	Latchman, Rocco Adnan	f	\N
9233	Khang	Le	54810	8	k.le810@cvuhsd.org	13	M	11	C-102	Nguyen, Linda A	Le, Khang	f	\N
9234	James Jr	Leka	55020	8	j.leka020@cvuhsd.org	13	M	11	G-112	Diaz, Maria I.	Leka, James Jr Havea	f	\N
9235	Angel	Lezama	54348	8	a.lezama348@cvuhsd.org	13	M	11	H-205	Matuz, Kristin M.	Lezama, Angel	f	\N
9236	Davon	Lloyd Jr	54835	8	d.lloydjr835@cvuhsd.org	13	M	11	E-201	Choi, Eric	Lloyd Jr, Davon	f	\N
9237	Koby	London	54132	8	k.london132@cvuhsd.org	13	M	11	C-204	Kenning, Sara J	London, Koby A'mar	f	\N
9238	Estrella	Lopez Barrios	54564	8	e.lopezbarrios564@cvuhsd.org	13	F	11	A-203	Deguzman, May R	Lopez Barrios, Estrella Azul	f	\N
9239	Allan	Lopez Cardona	55411	8	a.lopezcardona411@cvuhsd.org	13	M	11	G-210	Ibarra, Irvin A	Lopez Cardona, Allan Estuardo	f	\N
9240	Karla	Lopez Gonzalez	53667	8	k.lopezgonzalez667@cvuhsd.org	13	F	11	D-201	Villegas-Diaz, Jessica P.	Lopez Gonzalez, Karla Giselle	f	\N
9241	Antonio	Lopez Velazquez	54386	8	a.lopezvelazquez386@cvuhsd.org	13	M	11	G-112	Diaz, Maria I.	Lopez Velazquez, Antonio	f	\N
9242	Aidan	Lopez	53876	8	a.lopez876@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Lopez, Aidan Moi	f	\N
9243	Isabella	Lopez	53878	8	i.lopez878@cvuhsd.org	13	F	11	G-108	Ramirez, Lourdes	Lopez, Isabella Catalina	f	\N
9244	Kelly	Lopez	54197	8	k.lopez197@cvuhsd.org	13	F	11	C-102	Nguyen, Linda A	Lopez, Kelly Brianna	f	\N
9245	Diego	Lovera	54807	8	d.lovera807@cvuhsd.org	13	M	11	D-206	Jones, Arturo M	Lovera, Diego Aly	f	\N
9246	Esmeralda	Lozano	53879	8	e.lozano879@cvuhsd.org	13	F	11	E-104	Hiller, Sean J	Lozano, Esmeralda	f	\N
9247	Bryan	Lozano-Saravia	55014	8	b.lozanosaravia014@cvuhsd.org	13	M	11	GYM 4	Whitt, James	Lozano-Saravia, Bryan Alexander	f	\N
9248	Melanie	Lucero-Bojorquez	53880	8	m.lucerobojorquez880@cvuhsd.org	13	F	11	D-104	Samuels, Kathleen C	Lucero-Bojorquez, Melanie Jasmin	f	\N
9249	Jose	Madrigal Jr.	54484	8	j.madrigaljr484@cvuhsd.org	13	M	11	D-206	Jones, Arturo M	Madrigal Jr., Jose	f	\N
9250	Delilah	Madrigal	53882	8	d.madrigal882@cvuhsd.org	13	F	11	E-202	Cara, Ryan G	Madrigal, Delilah Marie	f	\N
9251	Emily	Magana	53883	8	e.magana883@cvuhsd.org	13	F	11	G-104	Mccoy, Bert L	Magana, Emily Abigail	f	\N
9252	Roberto	Maldonado Rabanales	56051	8	r.maldonadorabana051@cvuhsd.org	13	M	11	G-104	Mccoy, Bert L	Maldonado Rabanales, Roberto Carlos	f	\N
9253	Sabrina	Maldonado Rojas	53691	8	s.maldonadorojas691@cvuhsd.org	13	F	11	D-201	Villegas-Diaz, Jessica P.	Maldonado Rojas, Sabrina Angeline	f	\N
9254	Alexander	Maldonado	54370	8	a.maldonado370@cvuhsd.org	13	M	11	E-201	Choi, Eric	Maldonado, Alexander Jesus	f	\N
9255	Zhane	Maldonado	53885	8	z.maldonado885@cvuhsd.org	13	M	11	F-104	Saldana, Sonia	Maldonado, Zhane Alexander	f	\N
9256	Tiana	Malone	58700	8	t.malone700@cvuhsd.org	13	F	11	GYM 3	Tucker, Erich L	Malone, Tiana	f	\N
9257	Peyton	Mancillas	54344	8	p.mancillas344@cvuhsd.org	13	F	11	C-102	Nguyen, Linda A	Mancillas, Peyton Arlette	f	\N
9258	Jose	Manzaneda Morales	59233	8	j.manzanedamoral233@cvuhsd.org	13	M	11	GYM 3	Tucker, Erich L	Manzaneda Morales, Jose Akemi Anderson	f	\N
9259	Bryan	Marroquin Jr	54410	8	b.marroquinjr410@cvuhsd.org	13	M	11	G-112	Diaz, Maria I.	Marroquin Jr, Bryan Alexander	f	\N
9260	Daniel	Martin	54283	8	d.martin283@cvuhsd.org	13	M	11	D-206	Jones, Arturo M	Martin, Daniel Benito	f	\N
9261	Jorge	Martinez Jr.	54790	8	j.martinezjr790@cvuhsd.org	13	M	11	D-206	Jones, Arturo M	Martinez Jr., Jorge Alberto	f	\N
9262	Diego	Martinez Ramos	53888	8	d.martinezramos888@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Martinez Ramos, Diego Emanuel	f	\N
9263	Eduardo	Martinez Rivera	53696	8	e.martinez696@cvuhsd.org	13	M	11	GYM 4	Whitt, James	Martinez Rivera, Eduardo	f	\N
9264	Benjamin	Martinez	53886	8	b.martinez886@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Martinez, Benjamin	f	\N
9265	Edgar	Martinez	54441	8	e.martinez441@cvuhsd.org	13	M	11	A-203	Deguzman, May R	Martinez, Edgar Alexander	f	\N
9266	Joshua	Martinez	57298	8	j.martinez298@cvuhsd.org	13	M	11	A-203	Deguzman, May R	Martinez, Joshua	f	\N
9267	Kevin	Martinez	54567	8	k.martinez567@cvuhsd.org	13	M	11	C-204	Kenning, Sara J	Martinez, Kevin	f	\N
9268	Joshua	Matadama	54427	8	j.matadama427@cvuhsd.org	13	M	11	GYM 6	Singleton, Sigmund	Matadama, Joshua Eliel	f	\N
9269	Brenda	Matute Herrera	54568	8	b.matuteherrera568@cvuhsd.org	13	F	11	G-112	Diaz, Maria I.	Matute Herrera, Brenda Esperanza	f	\N
9270	Marcus	McDowell	54054	8	m.mcdowell054@cvuhsd.org	13	M	11	E-201	Choi, Eric	McDowell, Marcus Lamar	f	\N
9271	Sameka	McGregor	57543	8	s.mcgregor543@cvuhsd.org	13	F	11	G-108	Ramirez, Lourdes	McGregor, Sameka Davia Zara	f	\N
9272	Aiden	McIntyre	58113	8	a.mcintyre113@cvuhsd.org	13	M	11	H-205	Matuz, Kristin M.	McIntyre, Aiden Matthew Deshawn	f	\N
9273	Michelle	McKoy	56484	8	m.mckoy484@cvuhsd.org	13	F	11	G-108	Ramirez, Lourdes	McKoy, Michelle Melanie	f	\N
9274	Kyren	McNeil	54366	8	k.mcneil366@cvuhsd.org	13	M	11	C-204	Kenning, Sara J	McNeil, Kyren Lee	f	\N
9275	Michael	Medel	53921	8	m.medel921@cvuhsd.org	13	M	11	H-202	Saad, Eman	Medel, Michael Angelo	f	\N
9276	Kayln	Melendez	59171	8	k.melendez171@cvuhsd.org	13	F	11	E-202	Cara, Ryan G	Melendez, Kayln Erizma	f	\N
9277	Monica	Melgar Bonilla	55408	8	m.melgarbonilla408@cvuhsd.org	13	F	11	A-203	Deguzman, May R	Melgar Bonillam Monica Valeria	f	\N
9278	Jade	Mendieta	53926	8	j.mendieta926@cvuhsd.org	13	F	11	H-105	Forster, Claire	Mendieta, Jade	f	\N
9279	Johan	Mendoza Martinez	57512	8	j.mendozamartinez512@cvuhsd.org	13	M	11	D-202	Chung, Joshua S	Mendoza Martinez, Johan Daniel	f	\N
9280	Katherine	Menendez Ibarra	53927	8	k.menendezibarra927@cvuhsd.org	13	F	11	F-104	Saldana, Sonia	Menendez Ibarra, Katherine Ileana	f	\N
9281	Dominic	Mikes Quarles	54431	8	d.mikesquarles431@cvuhsd.org	13	M	11	C-204	Kenning, Sara J	Mikes Quarles, Dominic Kevion	f	\N
9282	Yaneiry	Milla Palacios	54572	8	y.millapalacios572@cvuhsd.org	13	F	11	A-203	Deguzman, May R	Milla Palacios, Yaneiry Sarai	f	\N
9283	Mason	Miller	55323	8	m.miller323@cvuhsd.org	13	M	11	B-1	Cassio, Michael J.	Miller, Mason Eugene	f	\N
9284	Sagisagi	Moala	55004	8	s.moala004@cvuhsd.org	13	M	11	D-204	Bravo, Ronald J	Moala, Sagisagi Fuauli Samu	f	\N
9285	Nunia	Moli	54786	8	n.moli786@cvuhsd.org	13	F	11	G-108	Ramirez, Lourdes	Moli, Nunia Adilua	f	\N
9286	Dylan	Molina	53928	8	d.molina928@cvuhsd.org	13	M	11	C-102	Nguyen, Linda A	Molina, Dylan Anthony	f	\N
9287	Kyli Trixie	Molina	54487	8	k.molina487@cvuhsd.org	13	F	11	F-104	Saldana, Sonia	Molina, Kyli Trixie Romua	f	\N
9288	Sherly	Moncada Ordonez	56089	8	s.moncadaordonez089@cvuhsd.org	13	F	11	D-202	Chung, Joshua S	Moncada Ordonez, Sherly Aymar	f	\N
9289	Vanessa	Montalvo Marin	53929	8	v.montalvomarin929@cvuhsd.org	13	F	11	C-102	Nguyen, Linda A	Montalvo Marin, Vanessa	f	\N
9290	Giselle	Montes-Pulido	55819	8	g.montespulido819@cvuhsd.org	13	F	11	GYM 3	Tucker, Erich L	Montes-Pulido, Giselle Alexandra	f	\N
9291	O'Mari	Moore	54362	8	o.moore362@cvuhsd.org	13	M	11	C-102	Nguyen, Linda A	Moore, O'Mari Semaj	f	\N
9292	Bo	Mora Duran	53930	8	b.moraduran930@cvuhsd.org	13	F	11	E-202	Cara, Ryan G	Mora Duran, Bo Guilley	f	\N
9293	Alicia	Morales	53931	8	a.morales931@cvuhsd.org	13	F	11	F-104	Saldana, Sonia	Morales, Alicia	f	\N
9294	Tracey	Morales	54637	8	t.morales637@cvuhsd.org	13	M	11	G-112	Diaz, Maria I.	Morales, Tracey Alexander	f	\N
9295	Valentina	Morales	54785	8	v.morales785@cvuhsd.org	13	F	11	G-104	Mccoy, Bert L	Morales, Valentina Elizabeth	f	\N
9296	Hilary	Morataya	54418	8	h.morataya418@cvuhsd.org	13	F	11	C-204	Kenning, Sara J	Morataya, Hilary Odette	f	\N
9297	Luki	Moreno	55002	8	l.moreno002@cvuhsd.org	13	M	11	GYM 4	Whitt, James	Moreno, Luki Anthony	f	\N
9298	Kendale	Mouton	59147	8	k.mouton147@cvuhsd.org	13	M	11	F-202	Rogers, Marie	Mouton, Kendale Naeshaun	f	\N
9299	Lesly	Mulul	53933	8	l.mulul933@cvuhsd.org	13	F	11	D-206	Jones, Arturo M	Mulul, Lesly Sofia	f	\N
9300	Jiann Nathan	Nabago	54113	8	j.nabago113@cvuhsd.org	13	M	11	G-108	Ramirez, Lourdes	Nabago, Jiann Nathan Ligon	f	\N
9301	Nathan	Najera	53668	8	n.najera668@cvuhsd.org	13	M	11	G-108	Ramirez, Lourdes	Najera, Nathan Alfredo	f	\N
9302	Branden	Negrete	54782	8	b.negrete782@cvuhsd.org	13	M	11	G-111	Romo, Jose A.	Negrete, Branden	f	\N
9303	Angelina	Nguyen	53934	8	a.nguyen934@cvuhsd.org	13	F	11	E-202	Cara, Ryan G	Nguyen, Angelina	f	\N
9304	Jasmyne	Nguyen	54682	8	j.nguyen682@cvuhsd.org	13	F	11	E-202	Cara, Ryan G	Nguyen, Jasmyne Linh Nhi	f	\N
9305	Phong	Nguyen	59265	8	p.nguyen265@cvuhsd.org	13	M	11	G-209	Tadena, Ma S	Nguyen, Phong Nhat Tran	f	\N
9306	Thomas	Nguyen	57442	8	t.nguyen442@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Nguyen, Thomas	f	\N
9307	Y Nhi	Nguyen	55087	8	y.nguyen087@cvuhsd.org	13	F	11	G-108	Ramirez, Lourdes	Nguyen, Y Nhi	f	\N
9308	Victor	Nwadike	55541	8	v.nwadike541@cvuhsd.org	13	M	11	F-202	Rogers, Marie	Nwadike, Victor Ifeanyi	f	\N
9309	Jose	Ocampo	54998	8	j.ocampo998@cvuhsd.org	13	M	11	G-208	Tran, Maichi N.	Ocampo, Jose Miguel	f	\N
9310	Sarah	Ojeda	57600	8	s.ojeda600@cvuhsd.org	13	F	11	F-104	Saldana, Sonia	Ojeda, Sarah Nicole	f	\N
9311	Chibuisi	Onyeador	54717	8	c.onyeador717@cvuhsd.org	13	M	11	F-104	Saldana, Sonia	Onyeador, Chibuisi Charles	f	\N
9312	Roger	Ordonez	53951	8	r.ordonez951@cvuhsd.org	13	M	11	G-201	Doan, Andrew	Ordonez, Roger Eduardo	f	\N
9313	Alison	Ormeno	54633	8	a.ormeno633@cvuhsd.org	13	F	11	H-105	Forster, Claire	Ormeno, Alison Mikaela	f	\N
9314	Fredy	Orozco Espinosa	54251	8	f.orozco251@cvuhsd.org	13	M	11	G-111	Romo, Jose A.	Orozco Espinosa, Fredy	f	\N
9315	Adrian	Ortega Yanez	54343	8	a.ortegayanez343@cvuhsd.org	13	M	11	E-104	Hiller, Sean J	Ortega Yanez, Adrian	f	\N
9316	Wilmer	Ortiz Lima	54254	8	w.ortizlima254@cvuhsd.org	13	M	11	E-201	Choi, Eric	Ortiz Lima, Wilmer Raul	f	\N
9317	Elisa	Ortiz Montoya	59247	8	e.ortizmontoya247@cvuhsd.org	13	F	11	GYM 1	Miller, David L	Ortiz Montoya, Elisa	f	\N
9318	Heidy	Ortiz Padilla	54824	8	h.ortizpadilla824@cvuhsd.org	13	F	11	E-201	Choi, Eric	Ortiz Padilla, Heidy Nicole	f	\N
9319	Alonzo	Ortiz	58670	8	a.ortiz670@cvuhsd.org	13	M	11	C-102	Nguyen, Linda A	Ortiz, Alonzo David	f	\N
9320	Andrew	Otero	59280	8	a.otero280@cvuhsd.org	13	M	11	GYM 6	Singleton, Sigmund	Otero, Andrew John	f	\N
9321	Oluwabunkola	Owosibo	53952	8	o.owosibo952@cvuhsd.org	13	F	11	C-102	Nguyen, Linda A	Owosibo, Oluwabunkola Precious	f	\N
9322	Itzel	Padilla	54062	8	i.padilla062@cvuhsd.org	13	F	11	D-103	Sarpong, Kwame Kwakye	Padilla, Itzel Sarahi	f	\N
9323	Zariah	Padilla	54363	8	z.padilla363@cvuhsd.org	13	F	11	G-201	Doan, Andrew	Padilla, Zariah Nadine	f	\N
9324	Fabian	Padilla-Barajaz	55145	8	f.padillabarajaz145@cvuhsd.org	13	M	11	A-203	Deguzman, May R	Padilla-Barajaz, Fabian Salvador	f	\N
9325	Kevin	Paniagua	54470	8	k.paniagua470@cvuhsd.org	13	M	11	GYM 6	Singleton, Sigmund	Paniagua, Kevin	f	\N
9326	Ashley	Pantoja	54485	8	a.pantoja485@cvuhsd.org	13	F	11	A-203	Deguzman, May R	Pantoja, Ashley	f	\N
9327	Kayla	Pate	53954	8	k.pate954@cvuhsd.org	13	F	11	E-104	Hiller, Sean J	Pate, Kayla Nicole	f	\N
9328	Luigi	Paternoster	54381	8	l.paternoster381@cvuhsd.org	13	M	11	A-203	Deguzman, May R	Paternoster, Luigi Jr	f	\N
9329	Eduardo	Pena Salazar	54486	8	e.penasalazar486@cvuhsd.org	13	M	11	F-202	Rogers, Marie	Pena Salazar, Eduardo Antonio	f	\N
9330	Angie	Pena	54988	8	a.pena988@cvuhsd.org	13	F	11	E-201	Choi, Eric	Pena, Angie Sofia	f	\N
9331	Aiden	Pensri-Silva	53649	8	a.pensrisilva649@cvuhsd.org	13	M	11	H-202	Saad, Eman	Pensri-Silva, Aiden James	f	\N
9332	Moises	Perez Diaz	54903	8	m.perezdiaz903@cvuhsd.org	13	M	11	D-206	Jones, Arturo M	Perez Diaz, Moises Fernando	f	\N
9333	Sonia	Perez Orozco	58681	8	s.perezorozco681@cvuhsd.org	13	F	11	B-1	Cassio, Michael J.	Perez Orozco, Sonia Andrea	f	\N
9334	Gloria	Perez	54160	8	g.perez160@cvuhsd.org	13	F	11	G-208	Tran, Maichi N.	Perez, Gloria Yuridia	f	\N
9335	Joceline	Perez	53955	8	j.perez955@cvuhsd.org	13	F	11	E-202	Cara, Ryan G	Perez, Joceline Bianca	f	\N
9336	Jovanny	Perez	54466	8	j.perez466@cvuhsd.org	13	M	11	F-202	Rogers, Marie	Perez,Jovanny Angel	f	\N
9337	Raul	Perez	55349	8	r.perez349@cvuhsd.org	13	M	11	D-206	Jones, Arturo M	Perez, Raul Ignacio	f	\N
9338	Karla	Perez-Veliz	54299	8	k.perezveliz299@cvuhsd.org	13	F	11	E-104	Hiller, Sean J	Perez-Veliz, Karla Edith	f	\N
9339	Elijah	Pervis-Johnson	55796	8	e.pervisjohnson796@cvuhsd.org	13	M	11	C-204	Kenning, Sara J	Pervis-Johnson, Elijah Nee-Jon	f	\N
9340	Jason	Pham	55285	8	j.pham285@cvuhsd.org	13	M	11	C-102	Nguyen, Linda A	Pham, Jason Tam	f	\N
9341	Mikayla	Phan	53956	8	m.phan956@cvuhsd.org	13	F	11	G-108	Ramirez, Lourdes	Phan, Mikayla Kim	f	\N
9342	Cristian	Pineda-Calalang	53909	8	c.pinedacalalang909@cvuhsd.org	13	M	11	F-103	Kaiser, Noah	Pineda-Calalang, Cristian Fernando	f	\N
9343	Jose	Pineda-Cruz	54854	8	j.pinedacruz854@cvuhsd.org	13	M	11	E-104	Hiller, Sean J	Pineda-Cruz, Jose	f	\N
9344	Shyliyah	Pinkney	54956	8	s.pinkney956@cvuhsd.org	13	F	11	D-107	Williams, Sherrevia A	Pinkney, Shyliyah	f	\N
9345	Sharron	Ponce Gonzalez	53957	8	s.poncegonzalez957@cvuhsd.org	13	F	11	G-112	Diaz, Maria I.	Ponce Gonzalez, Sharron	f	\N
9346	Jorge	Pool Andrade	53958	8	j.poolandrade958@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Pool Andrade, Jorge Eduardo	f	\N
9347	Valerie	Pool	54161	8	v.pool161@cvuhsd.org	13	F	11	E-104	Hiller, Sean J	Pool, Valerie Ruby	f	\N
9348	Nathaly	Portilla Ronceros	54945	8	n.portilla945@cvuhsd.org	13	F	11	G-208	Tran, Maichi N.	Portilla Ronceros, Nathaly Isabella	f	\N
9349	Maria	Preciado Mondragon	55443	8	m.preciadomondrag443@cvuhsd.org	13	F	11	D-208	Bedell, David D.	Preciado Mondragon, Maria	f	\N
9350	Alyza	Preciado	55177	8	a.preciado177@cvuhsd.org	13	F	11	E-201	Choi, Eric	Preciado, Alyza Marie	f	\N
9351	Daniel	Pulido	57406	8	d.pulido406@cvuhsd.org	13	M	11	D-202	Chung, Joshua S	Pulido, Daniel	f	\N
9352	Joell	Quezada	54947	8	j.quezada947@cvuhsd.org	13	M	11	E-104	Hiller, Sean J	Quezada, Joell Joseph	f	\N
9353	Nathalie	Quinones	53962	8	n.quinones962@cvuhsd.org	13	F	11	E-202	Cara, Ryan G	Quinones, Nathalie Valeria	f	\N
9354	Leslie	Quintana Pineda	53963	8	l.quintanapineda963@cvuhsd.org	13	F	11	D-204	Bravo, Ronald J	Quintana Pineda, Leslie	f	\N
9355	Semaj	Raby	56209	8	s.raby209@cvuhsd.org	13	M	11	G-108	Ramirez, Lourdes	Raby, Semaj Kenneth	f	\N
9356	Jennifer	Ramirez Aplicano	57545	8	j.ramirezaplicano545@cvuhsd.org	13	F	11	G-112	Diaz, Maria I.	Ramirez Aplicano, Jennifer Nathalia	f	\N
9357	Pedro	Ramirez Arevalo	55817	8	p.ramirezarevalo817@cvuhsd.org	13	M	11	G-210	Ibarra, Irvin A	Ramirez Arevalo, Pedro Felipe	f	\N
9358	Angel	Ramirez Orozco	54495	8	a.ramirezorozco495@cvuhsd.org	13	M	11	G-109	Miranda, Denisse	Ramirez Orozco, Angel Antonio	f	\N
9359	Andrew	Ramirez	53685	8	a.ramirez685@cvuhsd.org	13	M	11	G-107	Lopez, Maria	Ramirez, Andrew Octavio	f	\N
9360	Donnie	Ramirez	53666	8	d.ramirez666@cvuhsd.org	13	M	11	H-202	Saad, Eman	Ramirez, Donnie Alija	f	\N
9361	Emiliano	Ramirez	53965	8	e.ramirez965@cvuhsd.org	13	M	11	E-201	Choi, Eric	Ramirez, Emiliano	f	\N
9362	Kaylin	Ramirez	53966	8	k.ramirez966@cvuhsd.org	13	F	11	E-104	Hiller, Sean J	Ramirez, Kaylin Adely	f	\N
9363	Nayeli	Ramirez	54904	8	n.ramirez904@cvuhsd.org	13	F	11	F-104	Saldana, Sonia	Ramirez, Nayeli Yasmine	f	\N
9364	Sean	Ramirez	54191	8	s.ramirez191@cvuhsd.org	13	M	11	H-202	Saad, Eman	Ramirez, Sean Angel	f	\N
9365	Star	Ramirez	53694	8	s.ramirez694@cvuhsd.org	13	F	11	E-202	Cara, Ryan G	Ramirez, Star Delilah	f	\N
9366	Sergio	Ramos Jr.	54319	8	s.ramosjr319@cvuhsd.org	13	M	11	G-108	Ramirez, Lourdes	Ramos Jr., Sergio	f	\N
9367	Miliani	Ramos	57598	8	m.ramos598@cvuhsd.org	13	F	11	F-202	Rogers, Marie	Ramos, Miliani Olivia	f	\N
9368	Ariana	Razo-Gonzalez	54067	8	a.razogonzalez067@cvuhsd.org	13	F	11	D-201	Villegas-Diaz, Jessica P.	Razo-Gonzalez, Ariana Alline	f	\N
9369	Donya	Redick	54272	8	d.redick272@cvuhsd.org	13	F	11	C-102	Nguyen, Linda A	Redick, Donya Karrin	f	\N
9370	Cecilia	Renteria	56809	8	c.renteria809@cvuhsd.org	13	F	11	E-104	Hiller, Sean J	Renteria, Cecilia	f	\N
9371	Natalia	Reveles	54545	8	n.reveles545@cvuhsd.org	13	F	11	F-104	Saldana, Sonia	Reveles, Natalia	f	\N
9372	Ashley	Reyes Alvarado	53645	8	a.reyesalvarado645@cvuhsd.org	13	F	11	E-202	Cara, Ryan G	Reyes Alvarado,Ashley Michelle	f	\N
9373	Jolean	Reyes	57477	8	j.reyes477@cvuhsd.org	13	F	11	C-102	Nguyen, Linda A	Reyes, Jolean Hope	f	\N
9374	Nicole	Rios Lopez	54780	8	n.rioslopez780@cvuhsd.org	13	F	11	G-104	Mccoy, Bert L	Rios Lopez, Nicole Angelie	f	\N
9375	Peter	Rios	53782	8	p.rios782@cvuhsd.org	13	M	11	G-108	Ramirez, Lourdes	Rios, Peter Arturo	f	\N
9376	David	Rivas Portillo	54823	8	d.rivasportillo823@cvuhsd.org	13	M	11	G-111	Romo, Jose A.	Rivas Portillo, David Anthony	f	\N
9377	Landon	Rivas Ramirez	54905	8	l.rivasramirez905@cvuhsd.org	13	M	11	E-201	Choi, Eric	Rivas Ramirez, Landon Gustavo	f	\N
9378	Jared	Rivas	54234	8	j.rivas234@cvuhsd.org	13	M	11	G-208	Tran, Maichi N.	Rivas, Jared Ernesto	f	\N
9379	Daniel	Rivera	54165	8	d.rivera165@cvuhsd.org	13	M	11	A-203	Deguzman, May R	Rivera, Daniel Jesus	f	\N
9380	Tiffany Ann	Robinson	56504	8	t.robinson504@cvuhsd.org	13	F	11	H-105	Forster, Claire	Robinson, Tiffany Ann Garcia	f	\N
9381	Keilly	Rocha	54546	8	k.rocha546@cvuhsd.org	13	F	11	D-201	Villegas-Diaz, Jessica P.	Rocha, Keilly Rachel	f	\N
9382	Sara	Rodriguez Borbon	53681	8	s.rodriguezborbon681@cvuhsd.org	13	F	11	D-204	Bravo, Ronald J	Rodriguez Borbon, Sara Mayerli	f	\N
9383	Melina	Rodriguez Juarez	53695	8	m.rodriguezjuarez695@cvuhsd.org	13	X	11	G-208	Tran, Maichi N.	Rodriguez Juarez, Melina	f	\N
9384	Jean	Rodriguez Montoya	54981	8	j.rodriguezmontoy981@cvuhsd.org	13	M	11	G-210	Ibarra, Irvin A	Rodriguez Montoya, Jean Carlos	f	\N
9385	Hayleen	Rodriguez Vera	54498	8	h.rodriguezvera498@cvuhsd.org	13	F	11	G-111	Romo, Jose A.	Rodriguez Vera, Hayleen	f	\N
9386	Alexander	Rodriguez	54173	8	a.rodriguez173@cvuhsd.org	13	M	11	D-107	Williams, Sherrevia A	Rodriguez, Alexander	f	\N
9387	Allyson	Rodriguez	53976	8	a.rodriguez976@cvuhsd.org	13	F	11	D-201	Villegas-Diaz, Jessica P.	Rodriguez, Allyson Joelline	f	\N
9388	Connie	Rodriguez	53968	8	c.rodriguez968@cvuhsd.org	13	F	11	C-102	Nguyen, Linda A	Rodriguez, Connie Noemi	f	\N
9389	Liliana	Rodriguez	58820	8	l.rodriguez820@cvuhsd.org	13	F	11	F-104	Saldana, Sonia	Rodriguez, Liliana Elizabeth	f	\N
9390	Lizette	Rodriguez	53813	8	l.rodriguez813@cvuhsd.org	13	F	11	F-104	Saldana, Sonia	Rodriguez, Lizette	f	\N
9391	Maximiliano	Rodriguez	53812	8	m.rodriguez812@cvuhsd.org	13	M	11	E-201	Choi, Eric	Rodriguez, Maximiliano Angel	f	\N
9392	Gisselle	Roman	54779	8	g.roman779@cvuhsd.org	13	F	11	H-205	Matuz, Kristin M.	Roman, Gisselle	f	\N
9393	Kevin	Roman	53979	8	k.roman979@cvuhsd.org	13	M	11	GYM 4	Whitt, James	Roman, Kevin Andrew	f	\N
9394	Carlos	Romero	53669	8	c.romero669@cvuhsd.org	13	M	11	H-202	Saad, Eman	Romero, Carlos Tomas	f	\N
9395	Katie	Romo	53637	8	k.romo637@cvuhsd.org	13	F	11	C-102	Nguyen, Linda A	Romo, Katie	f	\N
9396	Maria	Roncancio Ruiz	56225	8	m.roncancioruiz225@cvuhsd.org	13	F	11	A-203	Deguzman, May R	Roncancio Ruiz, Maria Fernanda	f	\N
9397	Jesus	Rosas	55192	8	j.rosas192@cvuhsd.org	13	M	11	D-206	Jones, Arturo M	Rosas, Jesus Alejandro	f	\N
9398	Melanie	Ruano	54166	8	m.ruano166@cvuhsd.org	13	F	11	C-102	Nguyen, Linda A	Ruano, Melanie Inez	f	\N
9399	Juan	Ruiz Bonilla	57277	8	j.ruizbonilla277@cvuhsd.org	13	M	11	D-202	Chung, Joshua S	Ruiz Bonillam Juan Felipe	f	\N
9400	Ximena	Ruiz	54581	8	x.ruiz581@cvuhsd.org	13	F	11	G-201	Doan, Andrew	Ruiz, Ximena	f	\N
9401	Youssef	Sabet	54076	8	y.sabet076@cvuhsd.org	13	M	11	A-203	Deguzman, May R	Sabet, Youssef Hany	f	\N
9402	Maryam	Sahak	58231	8	m.sahak231@cvuhsd.org	13	F	11	D-103	Sarpong, Kwame Kwakye	Sahak, Maryam	f	\N
9403	Destiny	Salazar Orellana	53982	8	d.salazarorellana982@cvuhsd.org	13	F	11	H-105	Forster, Claire	Salazar Orellana, Destiny Dania	f	\N
9404	Daniela	Saldana Salgado	54775	8	d.saldanasalgado775@cvuhsd.org	13	F	11	C-102	Nguyen, Linda A	Saldana Salgado, Daniela	f	\N
9405	Miley	Salgado	53803	8	m.salgado803@cvuhsd.org	13	F	11	H-105	Forster, Claire	Salgado, Miley Jamielyn	f	\N
9406	Jasel	Samayoa	54908	8	j.samayoa908@cvuhsd.org	13	F	11	D-201	Villegas-Diaz, Jessica P.	Samayoa, Jasel Alexis	f	\N
9407	Stephanie	Sanchez Duenas	54184	8	s.sanchezduenas184@cvuhsd.org	13	F	11	E-104	Hiller, Sean J	Sanchez Duenas, Stephanie	f	\N
9408	Erika	Sanchez Haro	53986	8	e.sanchezharo986@cvuhsd.org	13	F	11	F-104	Saldana, Sonia	Sanchez Haro, Erika	f	\N
9409	Fernanda	Sanchez Rodriguez	54262	8	f.sanchezrodrigue262@cvuhsd.org	13	F	11	C-102	Nguyen, Linda A	Sanchez Rodriguez, Fernanda	f	\N
9410	Christina	Sanchez	54582	8	c.sanchez582@cvuhsd.org	13	F	11	H-205	Matuz, Kristin M.	Sanchez, Christina Elizabeth	f	\N
9411	Natsuki	Sanchez	55196	8	n.sanchez196@cvuhsd.org	13	F	11	B-1	Cassio, Michael J.	Sanchez, Natsuki Vianney	f	\N
9412	Citlaly	Sandoval	59213	8	c.sandoval213@cvuhsd.org	13	F	11	GYM 1	Miller, David L	Sandoval, Citlaly	f	\N
9413	Khriz	Sandoval	55331	8	k.sandoval331@cvuhsd.org	13	M	11	A-203	Deguzman, May R	Sandoval, Khriz Ernesto	f	\N
9414	Fabiano	Santti Montalvo	55795	8	f.santtimontalvo795@cvuhsd.org	13	M	11	G-209	Tadena, Ma S	Santti Montalvo, Fabiano Andrei Jodano	f	\N
9415	Natalie	Saravia	54081	8	n.saravia081@cvuhsd.org	13	F	11	G-208	Tran, Maichi N.	Saravia, Natalie Corinne	f	\N
9416	Aylin	Sarmiento	54577	8	a.sarmiento577@cvuhsd.org	13	F	11	F-104	Saldana, Sonia	Sarmiento, Aylin	f	\N
9417	George	Savery	54583	8	g.savery583@cvuhsd.org	13	M	11	E-201	Choi, Eric	Savery, George Sione Lee'Mani	f	\N
9418	Paul	Sekona Jr	49978	8	p.sekonajr978@cvuhsd.org	13	M	11	H-205	Matuz, Kristin M.	Sekona Jr, Paul Roc	f	\N
9419	Andrew	Sepulveda	54976	8	a.sepulveda976@cvuhsd.org	13	M	11	B-1	Cassio, Michael J.	Sepulveda, Andrew Isaiah	f	\N
9420	Christopher	Serbellon	54591	8	c.serbellon591@cvuhsd.org	13	M	11	GYM 4	Whitt, James	Serbellon, Christopher Josue	f	\N
9421	Anai	Serrano	53987	8	a.serrano987@cvuhsd.org	13	F	11	F-104	Saldana, Sonia	Serrano, Anai	f	\N
9422	Chelsea Ann	Serrano	54584	8	c.serrano584@cvuhsd.org	13	F	11	E-202	Cara, Ryan G	Serrano, Chelsea AnnOria	f	\N
9423	LaDainian	Shaw	54295	8	l.shaw295@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Shaw, LaDainian Earl	f	\N
9424	Ruhana	Sherfa	55234	8	r.sherfa234@cvuhsd.org	13	F	11	E-104	Hiller, Sean J	Sherfa,Ruhana Kidemachwe	f	\N
9425	Alexis	Slaughter	54494	8	a.slaughter494@cvuhsd.org	13	F	11	C-102	Nguyen, Linda A	Slaughter, Alexis Cristina	f	\N
9426	Maverick	Smith	53988	8	m.smith988@cvuhsd.org	13	M	11	D-201	Villegas-Diaz, Jessica P.	Smith, Maverick Nathan	f	\N
9427	Tevaughn	Smith	54920	8	t.smith920@cvuhsd.org	13	M	11	H-202	Saad, Eman	Smith, Tevaughn La Danian	f	\N
9428	Jose	Soria Diaz	55104	8	j.soriadiaz104@cvuhsd.org	13	M	11	D-206	Jones, Arturo M	Soria Diaz, Jose	f	\N
9429	Marlon	Sosa Villatoro	54925	8	m.sosavillatoro925@cvuhsd.org	13	M	11	D-201	Villegas-Diaz, Jessica P.	Sosa Villatoro, MarlonAlexis	f	\N
9430	Ryan	Soto	54974	8	r.soto974@cvuhsd.org	13	M	11	C-102	Nguyen, Linda A	Soto, Ryan	f	\N
9431	Mauricio	Suazo	53693	8	m.suazo693@cvuhsd.org	13	M	11	G-112	Diaz, Maria I.	Suazo, Mauricio Eden	f	\N
9432	Aydin	Tamayo Leyva	54297	8	a.tamayoleyva297@cvuhsd.org	13	M	11	A-203	Deguzman, May R	Tamayo Leyva, Aydin Yair	f	\N
9433	Jose	Teodoro	54767	8	j.teodoro767@cvuhsd.org	13	M	11	G-104	Mccoy, Bert L	Teodoro, Jose Angel	f	\N
9434	Aniyjah	Thomas	56812	8	a.thomas812@cvuhsd.org	13	F	11	B-1	Cassio, Michael J.	Thomas, Aniyjah Rod'Shay	f	\N
9435	Alvaro	Tobar Galdamez	53990	8	a.tobargaldamez990@cvuhsd.org	13	M	11	G-208	Tran, Maichi N.	Tobar Galdamez, Alvaro Josue	f	\N
9436	Tahj	Tones	57551	8	t.tones551@cvuhsd.org	13	M	11	GYM 6	Singleton, Sigmund	Tones, Tahj Angelo	f	\N
9437	Journee	Tonga	56813	8	j.tonga813@cvuhsd.org	13	M	11	H-205	Matuz, Kristin M.	Tonga, Journee Vunatuioetau	f	\N
9438	Alexander	Topete	55209	8	a.topete209@cvuhsd.org	13	M	11	D-201	Villegas-Diaz, Jessica P.	Topete, Alexander	f	\N
9439	Taiana	Topui	59105	8	t.topui105@cvuhsd.org	13	F	11	E-201	Choi, Eric	Topui, Taiana Tilisa	f	\N
9440	Tomuhini	Topui	59181	8	t.topui181@cvuhsd.org	13	M	11	G-108	Ramirez, Lourdes	Topui, Tomuhini Ateldo	f	\N
9441	Briana	Torres	53665	8	b.torres665@cvuhsd.org	13	F	11	F-104	Saldana, Sonia	Torres, Briana Paola	f	\N
9442	Emanuel	Torres	54382	8	e.torres382@cvuhsd.org	13	M	11	G-104	Mccoy, Bert L	Torres, Emanuel	f	\N
9443	Hailey	Torres	56904	8	h.torres904@cvuhsd.org	13	F	11	GYM 3	Tucker, Erich L	Torres, Hailey Michelle	f	\N
9444	Isabelle	Torres	53992	8	i.torres992@cvuhsd.org	13	F	11	G-208	Tran, Maichi N.	Torres, Isabelle	f	\N
9445	Jose	Torrez	54013	8	j.torrez013@cvuhsd.org	13	M	11	F-202	Rogers, Marie	Torrez, Jose David	f	\N
9446	Katelynn	Tran	54014	8	k.tran014@cvuhsd.org	13	F	11	E-202	Cara, Ryan G	Tran, Katelynn Vy	f	\N
9447	Thi Thao Ngan	Tran	56654	8	t.tran654@cvuhsd.org	13	F	11	D-202	Chung, Joshua S	Tran, Thi Thao Ngan	f	\N
9448	Vinh	Tran	54193	8	v.trandoan193@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Tran, Vinh Quoc Doan	f	\N
9449	Jonathan	Tress	54223	8	j.tress223@cvuhsd.org	13	M	11	E-201	Choi, Eric	Tress, Jonathan Jeremiah	f	\N
9450	Michael	Trinh	54287	8	m.trinh287@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Trinh, Michael Thien	f	\N
9451	Josue	Tucubal Rabinal	56600	8	j.tucubalrabinal600@cvuhsd.org	13	M	11	G-210	Ibarra, Irvin A	Tucubal Rabinal, Josue Emanuel	f	\N
9452	Melefehi	Tuifua	57555	8	m.tuifua555@cvuhsd.org	13	F	11	H-105	Forster, Claire	Tuifua, Melefehi	f	\N
9453	Nunia	Tuihalamaka	55157	8	n.tuihalamaka157@cvuhsd.org	13	F	11	H-202	Saad, Eman	Tuihalamaka, Nunia Elizabeth	f	\N
9454	Ted	Tuimauga	57270	8	t.tuimauga270@cvuhsd.org	13	M	11	B-1	Cassio, Michael J.	Tuimauga, Ted Larry	f	\N
9455	Jaymein	Tuitele	54763	8	j.tuitele763@cvuhsd.org	13	M	11	GYM 4	Whitt, James	Tuitele, Jaymein Desmir	f	\N
9456	Blessing	Ugwunna	54932	8	b.ugwunna932@cvuhsd.org	13	F	11	D-201	Villegas-Diaz, Jessica P.	Ugwunna, Blessing Ezinwa	f	\N
9457	Dennis	Ulloa Diaz	54377	8	d.ulloadiaz377@cvuhsd.org	13	M	11	C-102	Nguyen, Linda A	Ulloa Diaz, Dennis Alexander	f	\N
9458	Marilynn	Uribe	54015	8	m.uribe015@cvuhsd.org	13	X	11	F-104	Saldana, Sonia	Uribe, Marilynn	f	\N
9459	Valerio	Valentin Castro	54468	8	v.valentin468@cvuhsd.org	13	M	11	H-205	Matuz, Kristin M.	Valentin Castro, Valerio Oswaldo	f	\N
9460	Emmanuel	Valenzuela Flores	55974	8	e.valenzuelaflore974@cvuhsd.org	13	M	11	D-202	Chung, Joshua S	Valenzuela Flores, Emmanuel	f	\N
9461	Elias	Vallejo	54296	8	e.vallejo296@cvuhsd.org	13	M	11	G-208	Tran, Maichi N.	Vallejo, Elias Rafael	f	\N
9462	Kiara	Valqui	56447	8	k.valqui447@cvuhsd.org	13	F	11	G-208	Tran, Maichi N.	Valqui, Kiara Nicole	f	\N
9463	Fakaanga	Vanisi	59197	8	f.vanisi197@cvuhsd.org	13	M	11	E-201	Choi, Eric	Vanisi, Fakaanga Havili	f	\N
9464	Justin	Vasquez Grajeda	55438	8	j.vasquezgrajeda438@cvuhsd.org	13	M	11	G-210	Ibarra, Irvin A	Vasquez Grajeda, Justin Emanuel	f	\N
9465	Delilah	Vazquez	58456	8	d.vazquez456@cvuhsd.org	13	F	11	G-111	Romo, Jose A.	Vazquez, Delilah Lisbeth	f	\N
9466	Luis	Vazquez	54605	8	l.vazquez605@cvuhsd.org	13	M	11	B-1	Cassio, Michael J.	Vazquez, Luis	f	\N
9467	Jayden	Vega	55375	8	j.vega375@cvuhsd.org	13	M	11	H-105	Forster, Claire	Vega, Jayden Prince	f	\N
9468	Aaron	Velasquez	54761	8	a.velasquez761@cvuhsd.org	13	M	11	GYM 4	Whitt, James	Velasquez, Aaron Eliseo	f	\N
9469	Emily	Ventura	54467	8	e.ventura467@cvuhsd.org	13	F	11	G-208	Tran, Maichi N.	Ventura, Emily Elizabeth	f	\N
9470	Mateo	Veronica	54024	8	m.veronicalopez024@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Veronica, Mateo Demian	f	\N
9471	Luana	Vidaurre Gonzales	57618	8	l.vidaurregonzale618@cvuhsd.org	13	F	11	D-208	Bedell, David D.	Vidaurre Gonzales, Luana Noemi	f	\N
9472	Deisy	Villalobos	54371	8	d.villalobos371@cvuhsd.org	13	F	11	G-111	Romo, Jose A.	Villalobos, Deisy	f	\N
9473	Miles	Vinson	59149	8	m.vinson149@cvuhsd.org	13	M	11	E-201	Choi, Eric	Vinson, Miles Alexander	f	\N
9474	James	Virgen Perez	54396	8	j.virgenperez396@cvuhsd.org	13	M	11	D-204	Bravo, Ronald J	Virgen Perez, James	f	\N
9475	Markus	Wade	54172	8	m.wade172@cvuhsd.org	13	M	11	F-202	Rogers, Marie	Wade, Markus Jahaad	f	\N
9476	Janada	Wadzani	55251	8	j.wadzani251@cvuhsd.org	13	F	11	A-203	Deguzman, May R	Wadzani, Janada	f	\N
9477	Jaydin	Walton	54940	8	j.walton940@cvuhsd.org	13	M	11	E-201	Choi, Eric	Walton, Jaydin Keon	f	\N
9478	James	Watkins	53683	8	j.watkins683@cvuhsd.org	13	M	11	E-202	Cara, Ryan G	Watkins, James David	f	\N
9479	Trustin	Wilson	54759	8	t.wilson759@cvuhsd.org	13	M	11	E-201	Choi, Eric	Wilson, Trustin Donnel	f	\N
9480	Landyn	Wise	54795	8	l.wise795@cvuhsd.org	13	M	11	H-105	Forster, Claire	Wise, Landyn Dylan	f	\N
9481	Amari	Wood	55227	8	a.wood227@cvuhsd.org	13	M	11	C-102	Nguyen, Linda A	Wood, Amari Tayshawn	f	\N
9482	Kaisuan	Woodard	54588	8	k.woodard588@cvuhsd.org	13	M	11	D-103	Sarpong, Kwame Kwakye	Woodard, Kaisuan Lakori	f	\N
9483	Dahlya	Woods	54032	8	d.woods032@cvuhsd.org	13	F	11	H-202	Saad, Eman	Woods, Dahlya Virginia Marie	f	\N
9484	Dominic	Yesilevsky	58935	8	d.yesilevsky935@cvuhsd.org	13	X	11	GYM 1	Miller, David L	Yesilevsky, Dominic Kaos Mantis	f	\N
9485	Drew	Yopp	55329	8	d.yopp329@cvuhsd.org	13	M	11	G-104	Mccoy, Bert L	Yopp, Drew Elijah	f	\N
9486	Keasan	Young	58601	8	k.young601@cvuhsd.org	13	M	11	GYM 6	Singleton, Sigmund	Young, Keasan Kaden Ainsworth	f	\N
9487	Kelly	Zarate	54188	8	k.zarate188@cvuhsd.org	13	F	11	E-201	Choi, Eric	Zarate, Kelly	f	\N
9488	Moises	Zavala Morales	53646	8	m.zavalamorales646@cvuhsd.org	13	M	11	GYM 3	Tucker, Erich L	Zavala Morales, Moises	f	\N
9489	Ali	Zein	54526	8	a.zein526@cvuhsd.org	13	M	11	C-102	Nguyen, Linda A	Zein, Ali Mohamad	f	\N
9490	Ruben	Zepeda	57839	8	r.zepeda839@cvuhsd.org	13	M	11	G-210	Ibarra, Irvin A	Zepeda, Ruben Stuard	f	\N
9491	Karen	Zuniga Garcia	53991	8	k.zunigagarcia991@cvuhsd.org	13	F	11	H-205	Matuz, Kristin M.	Zuniga Garcia, Karen Danae	f	\N
9492	Sama	Abusalah	51972	8	s.abusalah972@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Abusalah, Sama Kamal	f	\N
9493	Andrea	Acevedo	51566	8	a.acevedo566@cvuhsd.org	13	F	12	C-207	Park, John	Acevedo, Andrea	f	\N
9494	Luis	Acevedo-Almazan	52302	8	l.acevedoalmazan302@cvuhsd.org	13	M	12	C-202	Varee, Susan S.	Acevedo-Almazan, Luis Fernando	f	\N
9495	Palwasha	Afzali	55644	8	p.afzali644@cvuhsd.org	13	F	12	G-209	Tadena, Ma S	Afzali, Palwasha	f	\N
9496	Samaeer	Afzali	55645	8	s.afzali645@cvuhsd.org	13	M	12	D-202	Chung, Joshua S	Afzali, Samaeer	f	\N
9498	Fabian	Aguiar	52809	8	f.aguiar809@cvuhsd.org	13	M	12	D-201	Villegas-Diaz, Jessica P.	Aguiar,Fabian Erid	f	\N
9499	Armando	Aguilar Jr	51567	8	a.aguilarjr567@cvuhsd.org	13	M	12	D-212	Drake, Travis	Aguilar Jr, Armando	f	\N
9500	Moises	Aguirre Oajaca	51571	8	m.aguirreoajaca571@cvuhsd.org	13	M	12	G-207	Rah, Choonglim	Aguirre Oajaca, Moises Alexander	f	\N
9501	Diana	Aguirre	51569	8	d.aguirre569@cvuhsd.org	13	F	12	C-207	Park, John	Aguirre, Diana	f	\N
9502	Veer	Ahir	59072	8	v.ahir072@cvuhsd.org	13	M	12	G-210	Ibarra, Irvin A	Ahir, Veer	f	\N
9503	Ahmad	Ajayi	57439	8	a.ajayi439@cvuhsd.org	13	M	12	H-202	Saad, Eman	Ajayi, Ahmad Ariyo	f	\N
9504	Yara	Ake Ku	51572	8	y.akeku572@cvuhsd.org	13	F	12	D-212	Drake, Travis	Ake Ku, Yara Pamela	f	\N
9505	Emmanuel	Ake	53141	8	e.ake141@cvuhsd.org	13	M	12	D-204	Bravo, Ronald J	Ake, Emmanuel	f	\N
9506	Blessing	Akpa	52163	8	b.akpa163@cvuhsd.org	13	F	12	D-204	Bravo, Ronald J	Akpa, Blessing Chimerem	f	\N
9507	Linda	Alvarez Casimiro	57530	8	l.alvarezcasimiro530@cvuhsd.org	13	F	12	G-210	Ibarra, Irvin A	Alvarez Casimiro, Linda Floreidy	f	\N
9508	Emily	Arbizu	51629	8	e.arbizu629@cvuhsd.org	13	F	12	D-213	Gomez, Amalia L.	Arbizu, Emily Baleska	f	\N
9509	Josue	Ardon Ayala	53283	8	j.ardonayala283@cvuhsd.org	13	M	12	E-201	Choi, Eric	Ardon Ayala, Josue David	f	\N
9510	Damian	Arias	51576	8	d.arias576@cvuhsd.org	13	M	12	G-211	Espinoza, Derrick F.	Arias, Damian Patrick	f	\N
9511	Michael	Arias	52173	8	m.arias173@cvuhsd.org	13	M	12	G-207	Rah, Choonglim	Arias, Michael	f	\N
9512	Michelle	Arinze	55527	8	m.arinze527@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Arinze, Michelle Nkemakonam	f	\N
9513	Brandon	Arizmendi	52093	8	b.arizmendi093@cvuhsd.org	13	M	12	H-202	Saad, Eman	Arizmendi, Brandon	f	\N
9514	Victoria	Arredondo	52781	8	v.arredondo781@cvuhsd.org	13	F	12	D-204	Bravo, Ronald J	Arredondo, Victoria Rosafina	f	\N
9515	Estrella	Arriaga	52180	8	e.arriaga180@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Arriaga, Estrella Elizabeth	f	\N
9516	Sebastian	Arteaga	51579	8	s.arteaga579@cvuhsd.org	13	M	12	C-207	Park, John	Arteaga, Sebastian Jose	f	\N
9517	Jordan	Autrey	51577	8	j.autrey577@cvuhsd.org	13	M	12	E-204	Pham, Vuong	Autrey, Jordan Terry	f	\N
9518	Mi'Yonna	Avery	52816	8	m.avery816@cvuhsd.org	13	F	12	D-213	Gomez, Amalia L.	Avery, Mi'Yonna Shade'	f	\N
9519	Ethan Xander	Balonkita	51580	8	e.balonkita580@cvuhsd.org	13	M	12	E-102	Alvarez, Gary David	Balonkita, Ethan Xander Consolacion	f	\N
9520	Aibblin	Banos Conde	52147	8	a.banosconde147@cvuhsd.org	13	F	12	D-212	Drake, Travis	Banos Conde, Aibblin	f	\N
9521	Zion	Barnell	53275	8	z.barnell275@cvuhsd.org	13	M	12	GYM 4	Whitt, James	Barnell, Zion Dior	f	\N
9522	Julio	Barragan Deniz	58631	8	j.barragandeniz631@cvuhsd.org	13	M	12	G-201	Doan, Andrew	Barragan Deniz, Julio Cesar	f	\N
9523	Emily	Barrera Barrera	51581	8	e.barrerabarrera581@cvuhsd.org	13	F	12	C-202	Varee, Susan S.	Barrera Barrera, Emily Rosely	f	\N
9524	Gabriela	Barrera Contrera	57273	8	g.barreracontrera273@cvuhsd.org	13	F	12	GYM 1	Miller, David L	Barrera Contrera, Gabriela Abigail	f	\N
9525	Ever	Barrera	57625	8	e.barrera625@cvuhsd.org	13	M	12	GYM 4	Whitt, James	Barrera, Ever Jehovany	f	\N
9526	Kima	Barrett	52819	8	k.barrett819@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Barrett, Kima George	f	\N
9527	Youssef	Basta	55799	8	y.basta799@cvuhsd.org	13	M	12	G-207	Rah, Choonglim	Basta, Youssef	f	\N
9528	Ally	Bautista	51583	8	a.bautista583@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Bautista, Ally Janet	f	\N
9529	Anthony	Becerra	52820	8	a.becerra820@cvuhsd.org	13	M	12	D-207	Bryant, Kharizma A	Becerra, Anthony Carlos	f	\N
9530	Ricardo	Becerra	59184	8	r.becerra184@cvuhsd.org	13	M	12	D-104	Samuels, Kathleen C	Becerra, Ricardo Adrian	f	\N
9531	Sheyla	Bell Palmero	55677	8	s.bellpalmero677@cvuhsd.org	13	F	12	D-201	Villegas-Diaz, Jessica P.	Bell Palmero, Sheyla	f	\N
9532	Manuel	Bernal Mendoza	59267	8	m.bernalmendoza267@cvuhsd.org	13	M	12	GYM 4	Whitt, James	Bernal Mendoza, Manuel Santiago	f	\N
9533	Jose	Bernardino	51856	8	j.bernardino856@cvuhsd.org	13	M	12	G-211	Espinoza, Derrick F.	Bernardino, Jose Angel	f	\N
9534	Fernanda	Bibian	52703	8	f.bibian703@cvuhsd.org	13	F	12	C-204	Kenning, Sara J	Bibian, Fernanda	f	\N
9535	Brianna	Bonilla Pineda	53441	8	b.bonillapineda441@cvuhsd.org	13	F	12	D-204	Bravo, Ronald J	Bonilla Pineda, Brianna Valeria	f	\N
9536	Keith	Bonilla	53294	8	k.bonilla294@cvuhsd.org	13	M	12	D-212	Drake, Travis	Bonilla, Keith Rafael	f	\N
9537	Omar	Borunda-Lopez	51586	8	o.borundalopez586@cvuhsd.org	13	M	12	C-202	Varee, Susan S.	Borunda-Lopez, Omar	f	\N
9538	Derryl	Brown Jr	53076	8	d.brownjr076@cvuhsd.org	13	M	12	GYM 4	Whitt, James	Brown Jr, Derryl Loumont	f	\N
9539	Brayan	Bucio Arriaga	52189	8	b.bucioarriaga1892@cvuhsd.org	13	M	12	D-212	Drake, Travis	Bucio Arriaga, Brayan	f	\N
9540	Anjheli	Bueno Campos	56207	8	a.buenocampos207@cvuhsd.org	13	F	12	G-210	Ibarra, Irvin A	Bueno Campos, Anjheli Esther	f	\N
9541	Enrique	Burell Jr.	51588	8	e.burelljr588@cvuhsd.org	13	M	12	B-1	Cassio, Michael J.	Burell Jr., Enrique Santiago	f	\N
9542	Charles	Burton II	51589	8	c.burton589@cvuhsd.org	13	M	12	B-1	Cassio, Michael J.	Burton II, Charles Edward	f	\N
9543	Angel	Cabrera	52164	8	a.cabrera164@cvuhsd.org	13	M	12	D-213	Gomez, Amalia L.	Cabrera, Angel David	f	\N
9544	Fabrizzio	Callau Eguez	52825	8	f.callaueguez825@cvuhsd.org	13	M	12	E-204	Pham, Vuong	Callau Eguez, Fabrizzio	f	\N
9545	Joseph	Camarena	51857	8	j.camarena857@cvuhsd.org	13	M	12	D-212	Drake, Travis	Camarena, Joseph	f	\N
9546	Amelia	Campos	51642	8	a.campos642@cvuhsd.org	13	F	12	D-212	Drake, Travis	Campos, Amelia Del Milagro	f	\N
9547	Carlos	Canil	52306	8	c.canil306@cvuhsd.org	13	M	12	D-212	Drake, Travis	Canil, Carlos Brandon	f	\N
9548	Daisy	Cardenas	52307	8	d.cardenas307@cvuhsd.org	13	F	12	G-207	Rah, Choonglim	Cardenas, Daisy	f	\N
9549	Joshua	Cardenas	51605	8	j.cardenas605@cvuhsd.org	13	M	12	E-102	Alvarez, Gary David	Cardenas, Joshua	f	\N
9550	Emily	Cassio	51606	8	e.cassio606@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Cassio, Emily Marie	f	\N
9551	Stefany	Castaneda	51608	8	s.castaneda608@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Castaneda, Stefany	f	\N
9552	Stephanie	Castilla	52308	8	s.castilla308@cvuhsd.org	13	F	12	D-212	Drake, Travis	Castilla, Stephanie Sofia	f	\N
9553	Ainhoa	Castillo Moreira	51773	8	a.castillomoreira773@cvuhsd.org	13	F	12	D-103	Sarpong, Kwame Kwakye	Castillo Moreira, Ainhoa Paulina	f	\N
9554	Jazmin	Castillo	52721	8	j.castillo721@cvuhsd.org	13	F	12	G-207	Rah, Choonglim	Castillo, Jazmin Brisa	f	\N
9555	Miguel	Castro Alvarado	52117	8	m.castroalvarado117@cvuhsd.org	13	M	12	B-1	Cassio, Michael J.	Castro Alvarado, Miguel	f	\N
9556	Emmanuel	Castro Favela	53370	8	e.castrofavela370@cvuhsd.org	13	M	12	G-207	Rah, Choonglim	Castro Favela, Emmanuel	f	\N
9557	Adriana	Celis	52660	8	a.celis660@cvuhsd.org	13	F	12	C-204	Kenning, Sara J	Celis, Adriana Liseth	f	\N
9558	Angie	Centeno	51614	8	a.centeno614@cvuhsd.org	13	F	12	D-212	Drake, Travis	Centeno, Angie	f	\N
9559	Amanda	Cervantes	51615	8	a.cervantes615@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Cervantes, Amanda Laila	f	\N
9560	Daniel	Chavarria	51643	8	d.chavarria643@cvuhsd.org	13	M	12	G-112	Diaz, Maria I.	Chavarria, Daniel Alexander	f	\N
9561	Abigail	Chavez Alegre	55487	8	a.chavezalegre487@cvuhsd.org	13	F	12	G-209	Tadena, Ma S	Chavez Alegre, Abigai lZenaida	f	\N
9562	Chriss	Chavez	52310	8	c.chavez310@cvuhsd.org	13	M	12	GYM 3	Tucker, Erich L	Chavez, Chriss Axel	f	\N
9563	Emely	Chavez	51616	8	e.chavez616@cvuhsd.org	13	F	12	G-207	Rah, Choonglim	Chavez, Emely Lizette	f	\N
9564	Jaelynn	Chreng	51617	8	j.chreng617@cvuhsd.org	13	F	12	G-207	Rah, Choonglim	Chreng, Jaelynn Somsayorn	f	\N
9565	Richmond	Chukwuani	57550	8	r.chukwuani550@cvuhsd.org	13	M	12	GYM 4	Whitt, James	Chukwuani, Richmond Chukwunonso	f	\N
9566	Anahi	Cifuentes	52311	8	a.cifuentes311@cvuhsd.org	13	F	12	D-204	Bravo, Ronald J	Cifuentes, Anahi Alizey	f	\N
9567	Nain	Cobb Munoz	52118	8	n.cobbmunoz118@cvuhsd.org	13	M	12	E-204	Pham, Vuong	Cobb Munoz, Nain Ivan	f	\N
9568	Kaitlyn	Cocom	54628	8	k.cocom628@cvuhsd.org	13	F	12	C-207	Park, John	Cocom, Kaitlyn Brianne	f	\N
9569	Britney	Contreras	52072	8	b.contreras072@cvuhsd.org	13	F	12	A-201	Salgado, Efrain	Contreras, Britney Guadalupe	f	\N
9570	Kalob	Cook	55242	8	k.cook242@cvuhsd.org	13	M	12	E-204	Pham, Vuong	Cook, Kalob	f	\N
9571	Taylor	Cook	52579	8	t.cook579@cvuhsd.org	13	F	12	H-105	Forster, Claire	Cook, Taylor Makaylee	f	\N
9572	Alexandra	Cordova	51618	8	a.cordova618@cvuhsd.org	13	F	12	A-201	Salgado, Efrain	Cordova, Alexandra Valerie	f	\N
9573	Andrea	Corona	53031	8	a.corona031@cvuhsd.org	13	F	12	B-1	Cassio, Michael J.	Corona, Andrea Alejandra	f	\N
9574	Frank	Cortez	53246	8	f.cortez246@cvuhsd.org	13	M	12	D-107	Williams, Sherrevia A	Cortez, Frank Lysander	f	\N
9575	Kevin	Cruz Agustin	58087	8	k.cruzagustin087@cvuhsd.org	13	M	12	G-210	Ibarra, Irvin A	Cruz Agustin, Kevin Steven	f	\N
9576	Xiomara	Cruz	53343	8	x.cruz343@cvuhsd.org	13	F	12	D-204	Bravo, Ronald J	CruzXiomaraMaritza	f	\N
9577	Demetrious	Cupples	52565	8	d.cupples565@cvuhsd.org	13	M	12	D-107	Williams, Sherrevia A	Cupples, Demetrious Casper-Jorden	f	\N
9578	Kelly	Dang	54538	8	k.dang538@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Dang, Kelly	f	\N
9579	Vy Vy	Dao	51630	8	v.dao630@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Dao, Vy Vy Phan	f	\N
9580	Gabriella	Davidson	52766	8	g.davidson766@cvuhsd.org	13	F	12	D-207	Bryant, Kharizma A	Davidson, Gabriella Lorraine	f	\N
9581	Alaynna	Davila	51974	8	a.davila974@cvuhsd.org	13	F	12	C-204	Kenning, Sara J	Davila, Alaynna Jeralyn	f	\N
9582	Jesus	De Arcos	52490	8	j.dearcos490@cvuhsd.org	13	M	12	G-211	Espinoza, Derrick F.	De Arcos, Jesus	f	\N
9583	Diana	De Leon Barrios	51631	8	d.deleonbarrios631@cvuhsd.org	13	F	12	H-205	Matuz, Kristin M.	De Leon Barrios, Diana Melissa	f	\N
9584	Valentina	De Loera	52312	8	v.deloera312@cvuhsd.org	13	F	12	D-212	Drake, Travis	De Loera, Valentina	f	\N
9585	Danea	Delery	57800	8	d.delery800@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Delery, Danea Marie	f	\N
9586	Angel	Delgado	52205	8	a.delgado205@cvuhsd.org	13	M	12	B-1	Cassio, Michael J.	Delgado, Angel Nathaniel	f	\N
9587	Joanna	Delgado	55600	8	j.delgado600@cvuhsd.org	13	F	12	H-105	Forster, Claire	Delgado, Joanna Guadalupe	f	\N
9588	Jordan	Dennis	51632	8	j.dennis632@cvuhsd.org	13	M	12	D-212	Drake, Travis	Dennis, Jordan	f	\N
9589	Mia	Desrosiers	51633	8	m.desrosiers633@cvuhsd.org	13	F	12	C-204	Kenning, Sara J	Desrosiers, Mia Anali	f	\N
9590	Erick	Diaz Morales	52121	8	e.diazmorales121@cvuhsd.org	13	M	12	D-204	Bravo, Ronald J	Diaz Morales, Erick Geovanni	f	\N
9591	Chase	Dike	53091	8	c.dike091@cvuhsd.org	13	M	12	B-1	Cassio, Michael J.	Dike, Chase Nnamdi	f	\N
9592	Cong	Dinh	51634	8	c.dinh634@cvuhsd.org	13	M	12	G-207	Rah, Choonglim	Dinh, Cong Quoc	f	\N
9593	Henry	Doherty	53524	8	h.doherty524@cvuhsd.org	13	M	12	C-204	Kenning, Sara J	Doherty, Henry Bond	f	\N
9594	Noelia	Dominguez	52491	8	n.dominguez491@cvuhsd.org	13	F	12	D-212	Drake, Travis	Dominguez, Noelia	f	\N
9595	Samantha	Dominguez	52702	8	s.dominguez702@cvuhsd.org	13	F	12	D-204	Bravo, Ronald J	Dominguez, Samantha	f	\N
9596	Jabryan	Donald Jr.	54502	8	j.donald502@cvuhsd.org	13	M	12	E-204	Pham, Vuong	Donald Jr., Jabryan Delano	f	\N
9597	Gerardo	Doroteo	52049	8	g.doroteo049@cvuhsd.org	13	M	12	E-204	Pham, Vuong	Doroteo, Gerardo Francisco	f	\N
9598	Gustavo	Duarte	53335	8	g.duarte335@cvuhsd.org	13	M	12	C-202	Varee, Susan S.	Duarte, Gustavo Adolfo	f	\N
9599	Alondra	Dumas	51635	8	a.dumas635@cvuhsd.org	13	F	12	D-207	Bryant, Kharizma A	Dumas, Alondra	f	\N
9600	Thao	Dung	55952	8	t.dung952@cvuhsd.org	13	F	12	H-202	Saad, Eman	Dung, Thao Thanh	f	\N
9601	Katie	Duong	52313	8	k.duong313@cvuhsd.org	13	F	12	E-102	Alvarez, Gary David	Duong, Katie	f	\N
9602	Eriren	Edwards	54527	8	e.edwards527@cvuhsd.org	13	F	12	H-105	Forster, Claire	Edwards, Eriren Shacole	f	\N
9603	Kendahl	Edwards	52354	8	k.edwards354@cvuhsd.org	13	F	12	D-201	Villegas-Diaz, Jessica P.	Edwards, Kendahl Ja'ann	f	\N
9604	Ikechukwu	Emeruwa	55888	8	i.emeruwa888@cvuhsd.org	13	M	12	C-207	Park, John	Emeruwa, Ikechukwu Joshua	f	\N
9605	Angel	Enrique Trejo	58949	8	a.enriquetrejo949@cvuhsd.org	13	M	12	GYM 3	Tucker, Erich L	Enrique Trejo, Angel Miguel	f	\N
9606	Ashley	Enriquez	55070	8	a.enriquez070@cvuhsd.org	13	F	12	G-207	Rah, Choonglim	Enriquez, Ashley Jamilet	f	\N
9607	Hugo	Enriquez	52096	8	h.enriquez096@cvuhsd.org	13	M	12	D-212	Drake, Travis	Enriquez, Hugo Javier	f	\N
9608	Miracle	Enyoghwerho	55578	8	m.enyoghwerho578@cvuhsd.org	13	F	12	G-108	Ramirez, Lourdes	Enyoghwerho, Miracle Oghenemujekene	f	\N
9609	Tiffany	Escalantes	53022	8	t.escalantes022@cvuhsd.org	13	F	12	B-1	Cassio, Michael J.	Escalantes, Tiffany	f	\N
9610	Orlando	Escareno	51695	8	o.escareno695@cvuhsd.org	13	M	12	D-207	Bryant, Kharizma A	Escareno, Orlando	f	\N
9611	Ashley	Escobar	52839	8	a.escobar839@cvuhsd.org	13	F	12	GYM 3	Tucker, Erich L	Escobar, Ashley	f	\N
9612	Delilah	Escobar	53131	8	d.escobar131@cvuhsd.org	13	F	12	D-207	Bryant, Kharizma A	Escobar, Delilah Celeste	f	\N
9613	Philip	Escobar	52314	8	p.escobar314@cvuhsd.org	13	M	12	C-207	Park, John	Escobar, Philip Guadalupe	f	\N
9614	Yana Elisha Ysabelle	Espiritu	51636	8	y.espiritu636@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Espiritu, Yana Elisha Ysabelle Auxilian	f	\N
9615	Roland	Essah	59088	8	r.essah088@cvuhsd.org	13	M	12	D-201	Villegas-Diaz, Jessica P.	Essah, Roland Jackson	f	\N
9616	Gabriela	Estrada	51638	8	g.estrada638@cvuhsd.org	13	F	12	GYM 3	Tucker, Erich L	Estrada, Gabriela	f	\N
9617	Rene	Farmer Jr.	52521	8	r.farmerjr521@cvuhsd.org	13	M	12	G-112	Diaz, Maria I.	Farmer Jr., Rene Odell	f	\N
9618	Isaiah	Ferguson	57042	8	i.ferguson042@cvuhsd.org	13	M	12	GYM 4	Whitt, James	Ferguson, Isaiah Theodore	f	\N
9619	Nicolas	Fernandez	53034	8	n.fernandez034@cvuhsd.org	13	M	12	C-202	Varee, Susan S.	Fernandez, Nicolas Enrique	f	\N
9620	Anthony	Ferrer	51640	8	a.ferrer640@cvuhsd.org	13	M	12	C-202	Varee, Susan S.	Ferrer, Anthony Isaiah	f	\N
9621	Melani	Figueroa Berrelleza	57144	8	m.figueroaberrell144@cvuhsd.org	13	F	12	D-208	Bedell, David D.	Figueroa Berrelleza, Melani Guirley	f	\N
9622	Leilani	Figueroa	52079	8	l.figueroa079@cvuhsd.org	13	F	12	C-204	Kenning, Sara J	Figueroa, Leilani Dalilah	f	\N
9623	Kamryn	Finner	53203	8	k.finner203@cvuhsd.org	13	M	12	B-1	Cassio, Michael J.	Finner, Kamryn Marques	f	\N
9624	Michell	Flores	53316	8	m.flores316@cvuhsd.org	13	F	12	D-104	Samuels, Kathleen C	Flores, Michell Anahi	f	\N
9625	Andrea	Fonseca Morales	52568	8	a.fonsecamorales568@cvuhsd.org	13	F	12	D-204	Bravo, Ronald J	Fonseca Morales, Andrea Michelle	f	\N
9626	Natalie	Fonseca	51641	8	n.fonseca641@cvuhsd.org	13	F	12	G-112	Diaz, Maria I.	Fonseca, Natalie	f	\N
9627	Dilegend	Francis	52728	8	d.francis728@cvuhsd.org	13	M	12	E-102	Alvarez, Gary David	Francis, Dilegend Joseph	f	\N
9628	Roxanne	Freire	55752	8	r.freire752@cvuhsd.org	13	F	12	D-204	Bravo, Ronald J	Freire, Roxanne Ixchel	f	\N
9629	Joel	Gallegos Alvarez	52846	8	j.gallegosalvarez846@cvuhsd.org	13	M	12	G-111	Romo, Jose A.	Gallegos Alvarez, Joel	f	\N
9630	Miguel	Galvez Catalan	57149	8	m.galvezcatalan149@cvuhsd.org	13	M	12	G-210	Ibarra, Irvin A	Galvez Catalan, Miguel Angel	f	\N
9631	Allen	Gamez	52499	8	a.gamez499@cvuhsd.org	13	M	12	D-212	Drake, Travis	Gamez, Allen Jared	f	\N
9632	Marcos	Garcia Asencio	57994	8	m.garciaasencio994@cvuhsd.org	13	M	12	G-210	Ibarra, Irvin A	Garcia Asencio, Marcos Alexander	f	\N
9633	Lesley	Garcia Morales	52847	8	l.garciamorales847@cvuhsd.org	13	F	12	C-204	Kenning, Sara J	Garcia Morales, Lesley Yvonne	f	\N
9634	Andrew	Garcia	56467	8	a.garcia467@cvuhsd.org	13	M	12	G-201	Doan, Andrew	Garcia, Andrew Xavier	f	\N
9635	Jasline	Garcia	53156	8	j.garcia156@cvuhsd.org	13	F	12	E-102	Alvarez, Gary David	Garcia, Jasline Maria	f	\N
9636	Nereyda	Garcia	52110	8	n.garcia110@cvuhsd.org	13	F	12	C-202	Varee, Susan S.	Garcia, Nereyda Zarahy	f	\N
9637	Perla	Garcia	51645	8	p.garcia645@cvuhsd.org	13	F	12	G-207	Rah, Choonglim	Garcia, Perla Ruby	f	\N
9638	Yeressys	Garcia	53293	8	y.garcia293@cvuhsd.org	13	X	12	D-201	Villegas-Diaz, Jessica P.	Garcia, Yeressys	f	\N
9639	Joshua	Garland	52500	8	j.garland500@cvuhsd.org	13	M	12	E-204	Pham, Vuong	Garland, Joshua Armand	f	\N
9640	Evan	Garnier	53281	8	e.garnier281@cvuhsd.org	13	M	12	D-104	Samuels, Kathleen C	Garnier, Evan	f	\N
9641	Ka'Mori	Gates	58593	8	k.gates593@cvuhsd.org	13	M	12	G-201	Doan, Andrew	Gates, Ka'Mori De'shean	f	\N
9642	Sesen	Gebreselassie	57173	8	s.gebreselassie173@cvuhsd.org	13	F	12	D-212	Drake, Travis	Gebreselassie, Sesen Tsegaberhan	f	\N
9643	Loyce	Gnonsoa	55685	8	l.gnonsoa685@cvuhsd.org	13	F	12	G-108	Ramirez, Lourdes	Gnonsoa, Loyce Jennifer	f	\N
9644	Catherine	Godoy-Guevara	55237	8	c.godoy237@cvuhsd.org	13	F	12	D-201	Villegas-Diaz, Jessica P.	Godoy-Guevara, Catherine Raquel	f	\N
9645	Laila	Gomez	52097	8	l.gomez097@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Gomez, Laila	f	\N
9646	Gabriela	Gongora	51647	8	g.gongora647@cvuhsd.org	13	F	12	G-207	Rah, Choonglim	Gongora, Gabriela Rocio	f	\N
9647	Damian	Gonzalez Martinez	53169	8	d.gonzalezmartine169@cvuhsd.org	13	M	12	G-211	Espinoza, Derrick F.	Gonzalez Martinez, Damian	f	\N
9648	Dayana	Gonzalez	52577	8	d.gonzalez577@cvuhsd.org	13	F	12	B-1	Cassio, Michael J.	Gonzalez, Dayana Lourdes	f	\N
9649	Diego	Gonzalez	51549	8	d.gonzalez549@cvuhsd.org	13	M	12	D-212	Drake, Travis	Gonzalez, Diego	f	\N
9650	Esmeralda	Gonzalez	52850	8	e.gonzalez850@cvuhsd.org	13	F	12	D-213	Gomez, Amalia L.	Gonzalez, Esmeralda Ruby	f	\N
9651	Miriam	Gonzalez	51808	8	m.gonzalez808@cvuhsd.org	13	F	12	C-204	Kenning, Sara J	Gonzalez, Miriam Ailed	f	\N
9652	Valeria	Gonzalez	51668	8	v.gonzalez668@cvuhsd.org	13	F	12	D-212	Drake, Travis	Gonzalez, Valeria	f	\N
9653	Allyson	Gonzalez-Carrera	52330	8	a.gonzalezcarrera330@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Gonzalez-Carrera, Allyson Michelle	f	\N
9654	Skaila	Granados	51696	8	s.granados696@cvuhsd.org	13	F	12	D-213	Gomez, Amalia L.	Granados, Skaila Farina	f	\N
9655	Rashad	Green	53480	8	r.green480@cvuhsd.org	13	M	12	D-213	Gomez, Amalia L.	Green, Rashad Kwaliq	f	\N
9656	Kimberly	Guardado Escobar	53432	8	k.guardadoescobar432@cvuhsd.org	13	F	12	D-201	Villegas-Diaz, Jessica P.	Guardado Escobar, Kimberly Yamileth	f	\N
9657	Abril	Guardado	57316	8	a.guardado316@cvuhsd.org	13	F	12	GYM 1	Miller, David L	Guardado, Abril Chelsea	f	\N
9658	Jacob	Guerra	52978	8	j.guerra978@cvuhsd.org	13	M	12	G-112	Diaz, Maria I.	Guerra, Jacob Noah	f	\N
9659	Victor	Guerra-Alfaro	55140	8	v.guerraalfaro140@cvuhsd.org	13	M	12	G-211	Espinoza, Derrick F.	Guerra-Alfaro, Victor	f	\N
9660	Giselle	Guerrero	51697	8	g.guerrero697@cvuhsd.org	13	F	12	C-207	Park, John	Guerrero, Giselle	f	\N
9661	Salvador	Gutierrez Jr	53036	8	s.gutierrezjr036@cvuhsd.org	13	M	12	D-207	Bryant, Kharizma A	Gutierrez Jr, Salvador	f	\N
9662	Yvonne	Gutierrez Zavala	52123	8	y.gutierrezzavala123@cvuhsd.org	13	F	12	G-108	Ramirez, Lourdes	Gutierrez Zavala, Yvonne Hipolita	f	\N
9663	Aaron	Gutierrez	51698	8	a.gutierrez698@cvuhsd.org	13	M	12	B-1	Cassio, Michael J.	Gutierrez, Aaron Francesco	f	\N
9664	Alexandra	Gutierrez	52854	8	a.gutierrez854@cvuhsd.org	13	F	12	D-207	Bryant, Kharizma A	Gutierrez, Alexandra Sofia	f	\N
9665	Ingrid	Gutierrez	51699	8	i.gutierrez699@cvuhsd.org	13	F	12	H-202	Saad, Eman	Gutierrez, Ingrid	f	\N
9666	Nave'Yah	Hall	53518	8	n.hall518@cvuhsd.org	13	F	12	D-201	Villegas-Diaz, Jessica P.	Hall, Nave'Yah Jon'Nay	f	\N
9667	Rayne'	Harmon	55032	8	r.harmon032@cvuhsd.org	13	F	12	E-102	Alvarez, Gary David	Harmon, Rayne' Renee	f	\N
9668	Imaya	Haskins-Azueta	53247	8	i.haskinsazueta247@cvuhsd.org	13	F	12	D-207	Bryant, Kharizma A	Haskins-Azueta, Imaya Elida	f	\N
9669	Carlos	Heras	52774	8	c.heras774@cvuhsd.org	13	M	12	H-105	Forster, Claire	Heras, Carlos Abdiel	f	\N
9670	Andy	Hernandez Argueta	59268	8	a.hernandezargue268@cvuhsd.org	13	M	12	GYM 3	Tucker, Erich L	Hernandez Argueta, Andy Gerad de Jesus	f	\N
9671	Daniel	Hernandez Bacelis	52331	8	d.hernandezbaceli331@cvuhsd.org	13	M	12	C-207	Park, John	Hernandez Bacelis, Daniel Ulises	f	\N
9672	Heather	Hernandez Flores	52861	8	h.hernandezflores861@cvuhsd.org	13	F	12	G-207	Rah, Choonglim	Hernandez Flores, Heather	f	\N
9673	Leonardo	Hernandez Mata	52862	8	l.hernandezmata862@cvuhsd.org	13	M	12	E-204	Pham, Vuong	Hernandez Mata, Leonardo Antonio	f	\N
9674	Araceli	Hernandez	52859	8	a.hernandez859@cvuhsd.org	13	F	12	C-204	Kenning, Sara J	Hernandez, Araceli	f	\N
9675	Erik	Hernandez	52858	8	e.hernandez858@cvuhsd.org	13	M	12	D-212	Drake, Travis	Hernandez, Erik Josue	f	\N
9676	Karina	Hernandez	51700	8	k.hernandez700@cvuhsd.org	13	F	12	E-102	Alvarez, Gary David	Hernandez, Karina Lisette	f	\N
9677	Christopher	Herrera Morales	52864	8	c.herreramorales864@cvuhsd.org	13	M	12	G-112	Diaz, Maria I.	Herrera Morales, Christopher Jesus	f	\N
9678	Jeremiah	Herrera	51701	8	j.herrera701@cvuhsd.org	13	M	12	C-207	Park, John	Herrera, Jeremiah	f	\N
9679	Allison	Hidalgo Leon	51702	8	a.hidalgoleon702@cvuhsd.org	13	F	12	D-212	Drake, Travis	Hidalgo Leon, Allison	f	\N
9680	Anhviet	Hoang	51703	8	a.hoang703@cvuhsd.org	13	M	12	C-207	Park, John	Hoang, Anhviet Anh	f	\N
9681	Nhung	Hoang	51704	8	n.hoang704@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Hoang, Nhung Hong Thi	f	\N
9682	Troy	Hoeft	53136	8	t.hoeft136@cvuhsd.org	13	M	12	D-207	Bryant, Kharizma A	Hoeft, Troy Henry	f	\N
9683	Phuc	Hua	53071	8	g.hua071@cvuhsd.org	13	M	12	C-207	Park, John	Hua, Phuc Gia	f	\N
9684	Mariah	Hurtado Figueroa	53037	8	m.hurtadofigueroa037@cvuhsd.org	13	F	12	D-201	Villegas-Diaz, Jessica P.	Hurtado Figueroa, Mariah Hannah	f	\N
9685	Hoyan	Hurtado Funeme	55465	8	h.hurtadofuneme465@cvuhsd.org	13	M	12	G-209	Tadena, Ma S	Hurtado Funeme, Hoyan Camilo	f	\N
9686	Valeria	Hurtado Orozco	52080	8	v.hurtadoorozco080@cvuhsd.org	13	F	12	G-207	Rah, Choonglim	Hurtado Orozco, Valeria	f	\N
9687	James	Hurtado	52332	8	j.hurtado332@cvuhsd.org	13	M	12	C-204	Kenning, Sara J	Hurtado, James	f	\N
9688	Ruby	Isiah	51861	8	r.isiah861@cvuhsd.org	13	F	12	G-207	Rah, Choonglim	Isiah, Ruby Rose	f	\N
9689	Jemima	Israel	52124	8	j.israel124@cvuhsd.org	13	F	12	H-205	Matuz, Kristin M.	Israel, Jemima Okeoghene	f	\N
9690	Aimendi	Jacquet	50767	8	a.jacquet767@cvuhsd.org	13	M	12	D-103	Sarpong, Kwame Kwakye	Jacquet, Aimendi Mario Bernadel	f	\N
9691	Robert	Jauregui	53128	8	r.jauregui128@cvuhsd.org	13	M	12	C-202	Varee, Susan S.	Jauregui, Robert Daniel	f	\N
9692	Angel	Jimenez Bustamante	52870	8	a.jimenezbustaman870@cvuhsd.org	13	M	12	GYM 4	Whitt, James	Jimenez Bustamante, Angel Rogelio	f	\N
9693	Joaquin	Jimenez Jimenez	52338	8	j.jimenezjimenez338@cvuhsd.org	13	M	12	H-202	Saad, Eman	Jimenez Jimenez, Joaquin	f	\N
9694	Alexa	Jimenez	59246	8	a.jimenez246@cvuhsd.org	13	F	12	D-212	Drake, Travis	Jimenez, Alexa Lynn	f	\N
9695	Jannet	Jimenez	51867	8	j.jimenez867@cvuhsd.org	13	F	12	G-207	Rah, Choonglim	Jimenez, Jannet	f	\N
9696	Oscar	Jimenez	52868	8	o.jimenez868@cvuhsd.org	13	M	12	D-207	Bryant, Kharizma A	Jimenez,Oscar Guillermo Jr.	f	\N
9697	Matthew	Johnson	52078	8	m.johnson078@cvuhsd.org	13	M	12	G-207	Rah, Choonglim	Johnson, Matthew David	f	\N
9698	Dallas	Jones	52512	8	d.jones512@cvuhsd.org	13	F	12	C-204	Kenning, Sara J	Jones, Dallas Ciera	f	\N
9699	Eleen	Jones	52344	8	e.jones344@cvuhsd.org	13	F	12	D-213	Gomez, Amalia L.	Jones, Eleen Elyse	f	\N
9700	Dasia	Joseph	51868	8	d.joseph868@cvuhsd.org	13	F	12	H-205	Matuz, Kristin M.	Joseph, Dasia Monae	f	\N
9701	Misael	Juarez	52882	8	m.juarez882@cvuhsd.org	13	M	12	B-1	Cassio, Michael J.	Juarez, Misael	f	\N
9702	Melik	King	58831	8	m.king831@cvuhsd.org	13	M	12	G-104	Mccoy, Bert L	King, Melik Nicoles	f	\N
9703	Malachi	Knight	51836	8	m.knight836@cvuhsd.org	13	M	12	E-204	Pham, Vuong	Knight, Malachi Edward	f	\N
9704	Ricardo	Latchman Jr	59128	8	r.latchmanjr128@cvuhsd.org	13	M	12	D-201	Villegas-Diaz, Jessica P.	Latchman Jr, Ricardo Lucky	f	\N
9705	Andy	Le	52345	8	a.le345@cvuhsd.org	13	M	12	D-204	Bravo, Ronald J	LeAndy, Nguyen	f	\N
9706	Anna Lolohea	Leka	52569	8	a.leka569@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Leka, Anna Lolohea Danny Mahe	f	\N
9707	Paul	Lepule	52125	8	p.lepule125@cvuhsd.org	13	M	12	G-112	Diaz, Maria I.	Lepule, Paul Schultz	f	\N
9708	Tyler	Lewis	56786	8	t.lewis786@cvuhsd.org	13	F	12	H-202	Saad, Eman	Lewis, Tyler Jeanette	f	\N
9709	Issaria	Linson	53102	8	i.linson102@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Linson, Issaria Willetta	f	\N
9710	Keilly	Lopez Guzman	52697	8	k.lopezguzman697@cvuhsd.org	13	F	12	GYM 4	Whitt, James	Lopez Guzman, Keilly Sherlyn	f	\N
9711	Daniel	Lopez Navarrete	56788	8	d.lopeznavarrete788@cvuhsd.org	13	M	12	E-204	Pham, Vuong	Lopez Navarrete, Daniel John	f	\N
9712	Anthony	Lopez Rivera	50489	8	a.lopezrivera489@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Lopez Rivera, Anthony	f	\N
9713	Kaylen	Lopez Saenz	52514	8	k.lopezsaenz514@cvuhsd.org	13	F	12	G-108	Ramirez, Lourdes	Lopez Saenz, Kaylen Adaly	f	\N
9714	Angel	Lopez	53078	8	a.lopez078@cvuhsd.org	13	M	12	C-204	Kenning, Sara J	Lopez, Angel	f	\N
9715	Anthony	Lopez	53193	8	a.lopez193@cvuhsd.org	13	M	12	D-204	Bravo, Ronald J	Lopez, Anthony	f	\N
9716	Celeste	Lopez	59142	8	c.lopez9142@cvuhsd.org	13	F	12	GYM 4	Whitt, James	Lopez, Celeste	f	\N
9717	Dahlia	Lopez	52283	8	d.lopez283@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Lopez, Dahlia Johana	f	\N
9718	Oscar	Lopez	51898	8	o.lopez898@cvuhsd.org	13	M	12	C-204	Kenning, Sara J	Lopez, Oscar Alejandro	f	\N
9719	Anthony	Lopez-Rodriguez	51899	8	a.lopezrodriguez899@cvuhsd.org	13	M	12	G-207	Rah, Choonglim	Lopez-Rodriguez, Anthony	f	\N
9720	Celline	Ly	52116	8	c.ly116@cvuhsd.org	13	F	12	C-204	Kenning, Sara J	Ly, Celline Jeany	f	\N
9721	Francisco	Macias	54447	8	f.macias447@cvuhsd.org	13	M	12	C-204	Kenning, Sara J	Macias, Francisco Josue	f	\N
9722	Maya	Madrigal	51900	8	m.madrigal900@cvuhsd.org	13	F	12	C-207	Park, John	Madrigal, Maya Michelle	f	\N
9723	Kenechukwu	Maduka	51901	8	k.maduka901@cvuhsd.org	13	M	12	G-207	Rah, Choonglim	Maduka, Kenechukwu Kelvin	f	\N
9724	Karla	Magallon	52165	8	k.magallon165@cvuhsd.org	13	F	12	H-205	Matuz, Kristin M.	Magallon, Karla	f	\N
9725	Marilu	Magallon	53040	8	m.magallon040@cvuhsd.org	13	F	12	C-204	Kenning, Sara J	Magallon, Marilu Guadalupe	f	\N
9726	Jesus	Manzaneda Morales	59232	8	j.manzanedamoral232@cvuhsd.org	13	M	12	GYM 3	Tucker, Erich L	Manzaneda Morales, Jesus Adrian	f	\N
9727	Yuliana	Marinez	59241	8	y.marinez241@cvuhsd.org	13	F	12	D-212	Drake, Travis	Marinez, Yuliana Melanie	f	\N
9728	Ileen	Marquez Domingo	52513	8	i.marquezdomingo513@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Marquez Domingo, Ileen Guadalupe	f	\N
9729	Fernando	Marquez-Galvez	51997	8	f.marquezgalvez997@cvuhsd.org	13	M	12	B-1	Cassio, Michael J.	Marquez-Galvez, Fernando	f	\N
9730	Daniela	Martinez Duran	51999	8	d.martinezduran999@cvuhsd.org	13	F	12	E-102	Alvarez, Gary David	Martinez Duran, Daniela	f	\N
9731	Marilin	Martinez Saenz	54308	8	m.martinezsaenz308@cvuhsd.org	13	F	12	C-204	Kenning, Sara J	Martinez Saenz, Marilin Anahy	f	\N
9732	Allison	Martinez	51902	8	a.martinez902@cvuhsd.org	13	F	12	C-207	Park, John	Martinez, Allison	f	\N
9733	Braiyan	Martinez	51903	8	b.martinez903@cvuhsd.org	13	M	12	G-208	Tran, Maichi N.	Martinez, Braiyan	f	\N
9734	Elsa	Martinez	51998	8	e.martinez998@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Martinezm Elsa Valeria	f	\N
9735	Fabian	Martinez	54493	8	f.martinez493@cvuhsd.org	13	M	12	E-204	Pham, Vuong	Martinez, Fabian	f	\N
9736	Jordan	Martinez	52705	8	j.martinez705@cvuhsd.org	13	M	12	C-204	Kenning, Sara J	Martinez, Jordan Ricardo	f	\N
9737	Joshua	Martinez	55091	8	j.martinez091@cvuhsd.org	13	M	12	E-102	Alvarez, Gary David	Martinez, Joshua Angel	f	\N
9738	Kelly	Martinez	52887	8	k.martinez887@cvuhsd.org	13	F	12	C-204	Kenning, Sara J	Martinez, Kelly	f	\N
9739	Ramiro	Martinez	53042	8	r.martinez042@cvuhsd.org	13	M	12	GYM 4	Whitt, James	Martinez, Ramiro	f	\N
9740	Rodrigo	Martinez	52464	8	r.martinez464@cvuhsd.org	13	M	12	GYM 4	Whitt, James	Martinez, Rodrigo	f	\N
9741	Brayonna	Martinez-Singh	53094	8	b.martinezsingh094@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Martinez-Singh, Brayonna Jade	f	\N
9742	Sharol	Mata Urbina	52557	8	s.mataurbina557@cvuhsd.org	13	F	12	C-204	Kenning, Sara J	Mata Urbina, Sharol Nohemi	f	\N
9743	Alexander	Mayorga	52346	8	a.mayorga346@cvuhsd.org	13	M	12	G-207	Rah, Choonglim	Mayorga, Alexander	f	\N
9744	Jaycen	McCoy	55342	8	j.mccoy342@cvuhsd.org	13	M	12	GYM 4	Whitt, James	McCoy, Jaycen Amir	f	\N
9745	Michael	McDowell Jr.	53066	8	m.mcdowelljr066@cvuhsd.org	13	M	12	G-207	Rah, Choonglim	McDowell Jr., Michael Leon	f	\N
9746	Metztli	Medina	51905	8	m.medina905@cvuhsd.org	13	F	12	B-1	Cassio, Michael J.	Medina, Metztli	f	\N
9747	Jezer	Mejia Fernandez	51907	8	j.mejiafernandez907@cvuhsd.org	13	M	12	A-201	Salgado, Efrain	Mejia Fernandez, Jezer Josue	f	\N
9748	Angelica	Mendez Mercado	52126	8	a.mendezmercado126@cvuhsd.org	13	F	12	D-201	Villegas-Diaz, Jessica P.	Mendez Mercado, Angelica	f	\N
9749	Valeria	Mendoza	52720	8	v.mendoza720@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Mendoza, Valeria Mayte	f	\N
9750	Mirna	Merida	53129	8	m.merida129@cvuhsd.org	13	F	12	B-1	Cassio, Michael J.	Merida, Mirna Aida	f	\N
9751	Daykaris	Miranda Mendoza	59111	8	d.mirandamendoza111@cvuhsd.org	13	F	12	GYM 6	Singleton, Sigmund	Miranda Mendoza, Daykaris Taiz	f	\N
9752	Zaire	Miranda	53087	8	z.miranda087@cvuhsd.org	13	M	12	D-206	Jones, Arturo M	Miranda, Zaire Seraye	f	\N
9753	Fulitaunga	Moa	56900	8	f.moa900@cvuhsd.org	13	M	12	G-108	Ramirez, Lourdes	Moa, Fulitaunga	f	\N
9754	David-Mosaati	Moli	52899	8	d.moli899@cvuhsd.org	13	M	12	G-108	Ramirez, Lourdes	Moli, David-Mosaati Tala-Ki-Pulotu	f	\N
9755	Michael Andrew	Molina	51908	8	m.molina908@cvuhsd.org	13	M	12	H-105	Forster, Claire	Molina, Michael Andrew Gucela	f	\N
9756	Ashley	Montes Vela	52001	8	a.montesvela001@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Montes Vela, Ashley Emely	f	\N
9757	Stacy	Mora	53200	8	s.mora200@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Mora, Stacy Janelle	f	\N
9758	Sayli	Morales Cobon	58434	8	s.moralescobon434@cvuhsd.org	13	F	12	GYM 6	Singleton, Sigmund	Morales Cobon, Sayli Magali	f	\N
9759	Jeremy	Morales	52903	8	j.morales903@cvuhsd.org	13	M	12	C-202	Varee, Susan S.	Morales, Jeremy Alexander	f	\N
9760	Jorge	Morales	53060	8	j.morales060@cvuhsd.org	13	M	12	GYM 4	Whitt, James	Morales, Jorge Alberto	f	\N
9761	Lorraine	Moran-Maya	57464	8	l.moranmaya464@cvuhsd.org	13	F	12	G-207	Rah, Choonglim	Moran-Maya, Lorraine Angelique	f	\N
9762	Arona	Moreno	52904	8	a.moreno904@cvuhsd.org	13	M	12	B-1	Cassio, Michael J.	Moreno, Arona Foalima	f	\N
9763	Daniel	Moreno	52127	8	d.moreno127@cvuhsd.org	13	M	12	D-213	Gomez, Amalia L.	Moreno, Daniel Eli	f	\N
9764	Diana	Mundi	52002	8	d.mundi002@cvuhsd.org	13	F	12	G-105	Yorizane, Traci	Mundi, Diana Ama Anwi	f	\N
9765	Valerie	Naranjo	58226	8	v.naranjo226@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Naranjo, Valerie	f	\N
9766	Isam	Nasir	53044	8	i.nasir044@cvuhsd.org	13	M	12	GYM 6	Singleton, Sigmund	Nasir, Isam	f	\N
9767	Dompe Arachchige Linduli	Nayanapriya	54792	8	d.nayanapriya792@cvuhsd.org	13	F	12	G-208	Tran, Maichi N.	Nayanapriya, Dompe Arachchige Linduli Dihansa	f	\N
9768	Angel	Nguyen	52517	8	a.nguyen517@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Nguyen, Angel Tuyethan	f	\N
9769	Anh	Nguyen	58967	8	a.nguyen967@cvuhsd.org	13	M	12	G-209	Tadena, Ma S	Nguyen, Anh Tu	f	\N
9770	Christol	Nguyen	52128	8	c.nguyen128@cvuhsd.org	13	F	12	C-204	Kenning, Sara J	Nguyen, Christol Thi	f	\N
9771	David	Nguyen	52129	8	d.nguyen129@cvuhsd.org	13	M	12	E-204	Pham, Vuong	Nguyen, David	f	\N
9772	Michael	Nguyen	52005	8	m.nguyen005@cvuhsd.org	13	M	12	C-207	Park, John	Nguyen, Michael Tuan	f	\N
9773	Thomas	Nguyen	52130	8	t.nguyen130@cvuhsd.org	13	M	12	C-207	Park, John	Nguyen, Thomas	f	\N
9774	Truong	Nguyen	52006	8	t.nguyen006@cvuhsd.org	13	M	12	C-207	Park, John	Nguyen, Truong Huy	f	\N
9775	Steven	Nunez-Espinosa	52348	8	s.nunezespinosa348@cvuhsd.org	13	M	12	G-211	Espinoza, Derrick F.	Nunez-Espinosa, Steven	f	\N
9776	Natalia	Ochoa-Martinez	52007	8	n.ochoamartinez007@cvuhsd.org	13	F	12	D-213	Gomez, Amalia L.	Ochoa-Martinez, Natalia Valentina	f	\N
9777	Daniel	Ojerinde	52008	8	d.ojerinde008@cvuhsd.org	13	M	12	C-207	Park, John	Ojerinde, Daniel Ayomiposi	f	\N
9778	Alan	Olea	52009	8	a.olea009@cvuhsd.org	13	M	12	D-204	Bravo, Ronald J	Olea, Alan	f	\N
9779	Isaac	Olea	52010	8	i.olea010@cvuhsd.org	13	M	12	H-105	Forster, Claire	Olea, Isaac	f	\N
9780	Christopher	Olivares	52011	8	c.olivares011@cvuhsd.org	13	M	12	D-212	Drake, Travis	Olivares, Christopher	f	\N
9781	Onyinyechukwu	Onwuka	57236	8	o.onwuka236@cvuhsd.org	13	F	12	A-201	Salgado, Efrain	Onwuka, Onyinyechukwu Emmanuela America	f	\N
9782	Ailish	Orantes Guillen	56801	8	a.orantesguillen801@cvuhsd.org	13	F	12	D-201	Villegas-Diaz, Jessica P.	Orantes Guillen, Ailish Itamar	f	\N
9783	Angel	Orellana	52012	8	a.orellana012@cvuhsd.org	13	M	12	D-107	Williams, Sherrevia A	Orellana, Angel Jesus	f	\N
9784	Cesar	Ornelas	52013	8	c.ornelas013@cvuhsd.org	13	M	12	D-207	Bryant, Kharizma A	Ornelas, Cesar Sebastian	f	\N
9785	Alejandra	Orozco	53097	8	a.orozco097@cvuhsd.org	13	F	12	C-202	Varee, Susan S.	Orozco, Alejandra	f	\N
9786	Ulysses	Ortega Escobar	52015	8	u.ortegaescobar015@cvuhsd.org	13	M	12	G-112	Diaz, Maria I.	Ortega Escobar, Ulysses Amaru	f	\N
9787	Christian	Ortega Martinez	54870	8	c.ortegamartinez870@cvuhsd.org	13	M	12	G-208	Tran, Maichi N.	Ortega Martinez, Christian	f	\N
9788	Giselle	Ortega	52014	8	g.ortega014@cvuhsd.org	13	F	12	D-212	Drake, Travis	Ortega, Giselle Joselyn	f	\N
9789	Gilberto	Ortiz	52016	8	g.ortiz016@cvuhsd.org	13	M	12	C-207	Park, John	Ortiz, Gilberto Jr.	f	\N
9790	Justin	Ortiz-Justice	52911	8	j.ortizjustice911@cvuhsd.org	13	M	12	GYM 4	Whitt, James	Ortiz-Justice, Justin Deon	f	\N
9791	Emerson	Osorto Antunez	53440	8	e.osortoantunez440@cvuhsd.org	13	M	12	GYM 4	Whitt, James	Osorto Antunez, Emerson Yair	f	\N
9792	Geraldine	Osorto Orsorto	58082	8	g.osortoorsorto082@cvuhsd.org	13	F	12	E-201	Choi, Eric	Osorto Orsorto, Geraldine Valeria	f	\N
9793	Godspower	Otuonye	52536	8	g.otuonye536@cvuhsd.org	13	M	12	D-201	Villegas-Diaz, Jessica P.	Otuonye, Godspower Chimeremeze	f	\N
9794	Kate	Palacios Perez	56436	8	k.palaciosperez436@cvuhsd.org	13	F	12	G-210	Ibarra, Irvin A	Palacios Perez, Kate Nayely	f	\N
9795	Kayla	Palacios Perez	56434	8	k.palaciosperez434@cvuhsd.org	13	F	12	G-210	Ibarra, Irvin A	Palacios Perez, Kayla Marielos	f	\N
9796	Diana	Panti	52701	8	d.panti701@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Panti, Diana Emily	f	\N
9797	Jorge	Paredes Bencomo	57300	8	j.paredesbencomo300@cvuhsd.org	13	M	12	F-202	Rogers, Marie	Paredes Bencomo, Jorge Xavier	f	\N
9798	Cameron	Pasina	52349	8	c.pasina349@cvuhsd.org	13	M	12	D-201	Villegas-Diaz, Jessica P.	Pasina, Cameron Joseph Clayton	f	\N
9799	Leanna	Pech	54739	8	l.pech739@cvuhsd.org	13	F	12	E-102	Alvarez, Gary David	Pech, Leanna	f	\N
9800	Citlaly	Pena Doroteo	57362	8	c.penadoroteo362@cvuhsd.org	13	F	12	GYM 6	Singleton, Sigmund	Pena Doroteo, Citlaly	f	\N
9801	Marlon	Perez Ordones	53116	8	m.perezordones116@cvuhsd.org	13	M	12	C-202	Varee, Susan S.	Perez Ordones, Marlon Hilario	f	\N
9802	Geoffrey	Perez Orozco	58680	8	g.perezorozco680@cvuhsd.org	13	M	12	B-1	Cassio, Michael J.	Perez Orozco, Geoffrey Alexander	f	\N
9803	Alexander	Perez	52018	8	a.perez018@cvuhsd.org	13	M	12	C-204	Kenning, Sara J	Perez, Alexander	f	\N
9804	Celeste	Perez	52019	8	c.perez019@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Perez, Celeste Marie	f	\N
9805	Issac	Perez	54862	8	i.perez862@cvuhsd.org	13	M	12	E-102	Alvarez, Gary David	Perez, Issac David	f	\N
9806	Kristy	Perez-Marquez	52020	8	k.perezmarquez020@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Perez-Marquez, Kristy Haydee	f	\N
9807	Julie	Pham	52021	8	j.pham021@cvuhsd.org	13	F	12	E-102	Alvarez, Gary David	Pham, Julie Hoang	f	\N
9808	An	Phan	52023	8	a.phan023@cvuhsd.org	13	M	12	C-207	Park, John	Phan, An Trong	f	\N
9809	Kaitlynn	Phan	52024	8	k.phan024@cvuhsd.org	13	F	12	G-207	Rah, Choonglim	Phan, Kaitlynn	f	\N
9810	Denyson	Phillippe	55423	8	d.phillippe423@cvuhsd.org	13	M	12	G-209	Tadena, Ma S	Phillippe, Denyson	f	\N
9811	Alejandro	Pineda Duran	55427	8	a.pinedaduran427@cvuhsd.org	13	M	12	G-209	Tadena, Ma S	Pineda Duran, Alejandro Balmore	f	\N
9812	Daejalynne	Pinkney	52636	8	d.pinkney636@cvuhsd.org	13	F	12	F-103	Kaiser, Noah	Pinkney, Daejalynne	f	\N
9813	Anthony	Platero Cordero	52558	8	a.platerocordero558@cvuhsd.org	13	M	12	C-202	Varee, Susan S.	Platero Cordero, Anthony	f	\N
9814	Sebastian	Polanco	52174	8	s.polanco174@cvuhsd.org	13	M	12	C-202	Varee, Susan S.	Polanco, Sebastian	f	\N
9815	Miguel	Quinones	52057	8	m.quinones057@cvuhsd.org	13	M	12	C-207	Park, John	Quinones, Miguel Angel	f	\N
9816	Michael	Quintanilla	52915	8	m.quintanilla915@cvuhsd.org	13	M	12	B-1	Cassio, Michael J.	Quintanilla, Michael	f	\N
9817	Roman	Quintero	53182	8	r.quintero182@cvuhsd.org	13	M	12	D-207	Bryant, Kharizma A	Quintero, Roman Valentin	f	\N
9818	Danyal	Rafiq	57576	8	d.rafiq576@cvuhsd.org	13	M	12	C-207	Park, John	Rafiq, Danyal	f	\N
9819	Eydan	Ramirez Palomino	55582	8	e.ramirezpalomino582@cvuhsd.org	13	M	12	GYM 6	Singleton, Sigmund	Ramirez Palomino, Eydan Alberto	f	\N
9820	Diego	Ramirez	52030	8	d.ramirez030@cvuhsd.org	13	M	12	C-207	Park, John	Ramirez, Diego Alejandro	f	\N
9821	Mauricio	Ramirez	52918	8	m.ramirez918@cvuhsd.org	13	M	12	H-205	Matuz, Kristin M.	Ramirez, Mauricio	f	\N
9822	Rodrigo	Ramirez	52919	8	r.ramirez919@cvuhsd.org	13	M	12	E-204	Pham, Vuong	Ramirez, Rodrigo	f	\N
9823	Gloria	Ramos	52763	8	g.ramos763@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Ramos, Gloria Stephanie	f	\N
9824	Isabella	Ramos	53050	8	i.ramos050@cvuhsd.org	13	F	12	A-201	Salgado, Efrain	Ramos, Isabella	f	\N
9825	Nicole	Ramos	52031	8	n.ramos031@cvuhsd.org	13	F	12	C-207	Park, John	Ramos, Nicole Marie	f	\N
9826	Ricardo	Ramos	53162	8	r.ramos162@cvuhsd.org	13	M	12	D-107	Williams, Sherrevia A	Ramos, Ricardo Jonathan	f	\N
9827	Stephanie	Rauda	53158	8	s.rauda158@cvuhsd.org	13	F	12	D-212	Drake, Travis	Rauda, Stephanie Gisselle	f	\N
9828	Marcus	Ray Jr.	52796	8	m.rayjr796@cvuhsd.org	13	M	12	G-112	Diaz, Maria I.	Ray Jr., Marcus Lynch	f	\N
9829	Andrew	Rayon Castro	52032	8	a.rayoncastro032@cvuhsd.org	13	M	12	C-204	Kenning, Sara J	Rayon Castro, Andrew David	f	\N
9830	Jose	Rebollo Medina	52352	8	j.rebollomedina352@cvuhsd.org	13	M	12	H-202	Saad, Eman	Rebollo Medina, Jose Miguel	f	\N
9831	Cris	Recinos Juarez	53082	8	c.recinosjuarez082@cvuhsd.org	13	M	12	D-212	Drake, Travis	Recinos Juarez, CrisAlexis	f	\N
9832	Emma	Renteria	53212	8	e.renteria212@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Renteria, Emma Roxanna	f	\N
9833	Angel	Reveles-Rosas	51946	8	a.revelesrosas946@cvuhsd.org	13	M	12	F-103	Kaiser, Noah	Reveles-Rosas, Angel	f	\N
9834	Rebekah	Richardson	52036	8	r.richardson036@cvuhsd.org	13	F	12	A-201	Salgado, Efrain	Richardson, Rebekah Zoe	f	\N
9835	Taylor	Richardson	52037	8	t.richardson037@cvuhsd.org	13	F	12	D-103	Sarpong, Kwame Kwakye	Richardson, Taylor Chloe	f	\N
9836	Trinity	Richardson	55931	8	t.richardson931@cvuhsd.org	13	F	12	A-201	Salgado, Efrain	Richardson, Trinity Sanai	f	\N
9837	Aiden	Rios	52353	8	a.rios353@cvuhsd.org	13	M	12	C-207	Park, John	Rios, Aiden Nicholas	f	\N
9838	Marvelin	Rivas Hernandez	52038	8	m.rivashernandez038@cvuhsd.org	13	F	12	C-207	Park, John	Rivas Hernandez, Marvelin Areli	f	\N
9839	Alice	Rivas	52926	8	a.rivas926@cvuhsd.org	13	F	12	D-212	Drake, Travis	Rivas, Alice Alize	f	\N
9840	Andres	Rivera Gutierrez	52527	8	a.riveragutierrez527@cvuhsd.org	13	M	12	C-202	Varee, Susan S.	Rivera Gutierrez, Andres	f	\N
9841	Alexia	Rivera	52039	8	a.rivera039@cvuhsd.org	13	F	12	D-201	Villegas-Diaz, Jessica P.	Rivera, Alexia	f	\N
9842	Joshua	Rivera	52355	8	j.rivera355@cvuhsd.org	13	M	12	D-212	Drake, Travis	Rivera, Joshua	f	\N
9843	Jaxon	Rizo-Martinez	57466	8	j.royce466@cvuhsd.org	13	M	12	D-213	Gomez, Amalia L.	Rizo-Martinez, Jaxon Rain	f	\N
9844	Alexa	Robledo Martinez	52132	8	a.robledomartinez132@cvuhsd.org	13	X	12	D-213	Gomez, Amalia L.	Robledo Martinez, Alexa	f	\N
9845	Brittney	Rodarte-Davila	52077	8	b.rodartedavila077@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Rodarte-Davila, Brittney Ophelia	f	\N
9846	Marilyn	Rodas Mazariegos	57213	8	m.rodasmazariegos213@cvuhsd.org	13	F	12	D-208	Bedell, David D.	Rodas Mazariegos, Marilyn Gisell	f	\N
9847	Nathan	Rodas Melendrez	52040	8	n.rodasmelendrez040@cvuhsd.org	13	M	12	C-204	Kenning, Sara J	Rodas Melendrez, Nathan Isaiah	f	\N
9848	Ruben	Rodriguez Jr.	53047	8	r.rodriguez047@cvuhsd.org	13	M	12	A-201	Salgado, Efrain	Rodriguez Jr., Ruben Jessee	f	\N
9849	Mixi	Rodriguez Reyes	59138	8	m.rodriguez138@cvuhsd.org	13	F	12	GYM 3	Tucker, Erich L	Rodriguez Reyes, Mixi Dayana	f	\N
9850	Jacob	Rodriguez Valle	53151	8	j.rodriguezvalle151@cvuhsd.org	13	M	12	D-213	Gomez, Amalia L.	Rodriguez Valle, Jacob Rafael	f	\N
9851	Abrei	Rodriguez	55208	8	a.rodriguez208@cvuhsd.org	13	F	12	E-102	Alvarez, Gary David	Rodriguez, Abrei Monique	f	\N
9852	Andrew	Rodriguez	52041	8	a.rodriguez041@cvuhsd.org	13	M	12	G-211	Espinoza, Derrick F.	Rodriguez, Andrew Manuel	f	\N
9853	Gabriel	Rodriguez	52141	8	g.rodriguez141@cvuhsd.org	13	M	12	G-207	Rah, Choonglim	Rodriguez, Gabriel	f	\N
9854	Jayden	Rodriguez	52559	8	j.rodriguez559@cvuhsd.org	13	M	12	C-204	Kenning, Sara J	Rodriguez, Jayden Alexander	f	\N
9855	Dylan	Roldan Orjuela	55283	8	d.roldanorjuela283@cvuhsd.org	13	M	12	D-208	Bedell, David D.	Roldan Orjuela, Dylan	f	\N
9856	Alisson	Romero Ramirez	57492	8	a.romeroramirez492@cvuhsd.org	13	F	12	D-202	Chung, Joshua S	Romero Ramirez, Alisson Renata	f	\N
9857	Andrew	Rosales	54590	8	a.rosales590@cvuhsd.org	13	M	12	C-207	Park, John	Rosales, Andrew Steve	f	\N
9858	Terron	Rucker	52357	8	t.rucker357@cvuhsd.org	13	M	12	GYM 4	Whitt, James	Rucker, Terron LeAnder	f	\N
9859	Jaslene	Rueda	52932	8	j.rueda932@cvuhsd.org	13	F	12	C-204	Kenning, Sara J	Rueda, Jaslene Eliana	f	\N
9860	Harold	Ruiz Corredor	55520	8	h.ruizcorredor520@cvuhsd.org	13	M	12	D-208	Bedell, David D.	Ruiz Corredor, Harold Mauricio	f	\N
9861	Angela	Ruiz	52359	8	a.ruiz359@cvuhsd.org	13	F	12	F-202	Rogers, Marie	Ruiz, Angela Maria	f	\N
9862	Amare	Russell	57169	8	a.russell169@cvuhsd.org	13	M	12	H-205	Matuz, Kristin M.	Russell, Amare Emanuel	f	\N
9863	Sebastian Jorge	Saenz Llauca	55554	8	s.saenzllauca554@cvuhsd.org	13	M	12	D-202	Chung, Joshua S	Saenz Llauca, Sebastian Jorge	f	\N
9864	Piero	Saez Pacahuala	55818	8	p.saezpacahuala818@cvuhsd.org	13	M	12	D-208	Bedell, David D.	Saez Pacahuala, Piero Italo	f	\N
9865	Matthew	Sagastume	52081	8	m.sagastume081@cvuhsd.org	13	M	12	D-201	Villegas-Diaz, Jessica P.	Sagastume, Matthew Alexander	f	\N
9866	Josue	Salazar Santos	52059	8	j.salazarsantos059@cvuhsd.org	13	M	12	C-207	Park, John	Salazar Santos, Josue Daniel	f	\N
9867	Ashley	Salgado	52133	8	a.salgado133@cvuhsd.org	13	F	12	GYM 4	Whitt, James	Salgado, Ashley Sharitza	f	\N
9868	Alex	Salvajan Azurdia	53058	8	a.salvajanazurdia058@cvuhsd.org	13	M	12	GYM 3	Tucker, Erich L	Salvajan Azurdia, Alex Josue	f	\N
9869	Teisha	Sanchez Padilla	52061	8	t.sanchezpadilla061@cvuhsd.org	13	F	12	D-212	Drake, Travis	Sanchez Padilla, Teisha Brianey	f	\N
9870	Ashly	Sanchez	53163	8	a.sanchez163@cvuhsd.org	13	F	12	G-209	Tadena, Ma S	Sanchez, Ashly Michelle	f	\N
9871	Christopher	Sanchez	52102	8	c.sanchez102@cvuhsd.org	13	M	12	E-201	Choi, Eric	Sanchez, Christopher Jose	f	\N
9872	Jorge	Santiago	52361	8	j.santiago361@cvuhsd.org	13	M	12	D-213	Gomez, Amalia L.	Santiago, Jorge Luis	f	\N
9873	Yoselin	Santos Donis	55535	8	y.santosdonis535@cvuhsd.org	13	F	12	G-209	Tadena, Ma S	Santos Donis, Yoselin Magali	f	\N
9874	Aaron	Santoyo	53088	8	a.santoyo088@cvuhsd.org	13	M	12	E-204	Pham, Vuong	Santoyo, Aaron Charles	f	\N
9875	Christopher	Sauceda Gaytan	52363	8	c.saucedagaytan363@cvuhsd.org	13	M	12	G-211	Espinoza, Derrick F.	Sauceda Gaytan, Christopher	f	\N
9876	Joshua	Sawyer	52752	8	j.sawyer752@cvuhsd.org	13	M	12	GYM 4	Whitt, James	Sawyer, Joshua Elijah	f	\N
9877	Jared Kristopher	Sayas	52364	8	j.sayas364@cvuhsd.org	13	M	12	C-207	Park, John	Sayas, Jared Kristopher J.	f	\N
9878	Justine Marie	Scott	51981	8	j.scott981@cvuhsd.org	13	F	12	H-205	Matuz, Kristin M.	Scott, Justine Marie	f	\N
9879	Janet	Secundino	52062	8	j.secundino062@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Secundino, Janet	f	\N
9880	Andres	Serapio Camacho	52365	8	a.serapiocamacho365@cvuhsd.org	13	M	12	E-204	Pham, Vuong	Serapio Camacho, Andres	f	\N
9881	Jeremy	Serna	52771	8	j.serna771@cvuhsd.org	13	M	12	GYM 4	Whitt, James	Serna, Jeremy	f	\N
9882	Gabriel	Sianez Jr.	53196	8	g.sianezjr196@cvuhsd.org	13	M	12	D-204	Bravo, Ronald J	Sianez Jr., Gabriel	f	\N
9883	Lilyanna	Smalls	53083	8	l.smalls083@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Smalls, Lilyanna Frances	f	\N
9884	Kenyatta	Smith Jr	53348	8	k.smithjr348@cvuhsd.org	13	M	12	GYM 4	Whitt, James	Smith Jr, Kenyatta	f	\N
9885	Brandon	Smith	53117	8	b.smith117@cvuhsd.org	13	M	12	D-213	Gomez, Amalia L.	Smith, Brandon James	f	\N
9886	Ella-Mae	Smith	58614	8	e.smith614@cvuhsd.org	13	F	12	H-105	Forster, Claire	Smith, Ella-Mae Rose	f	\N
9887	Gabriel	Solis Castellanos	55595	8	g.soliscastellano595@cvuhsd.org	13	M	12	G-210	Ibarra, Irvin A	Solis Castellanos, Gabriel Andres	f	\N
9888	Amaris	Solis	52367	8	a.solis367@cvuhsd.org	13	F	12	G-112	Diaz, Maria I.	Solis, Amaris Lynnette	f	\N
9889	Esteban	Solis	52063	8	e.solis063@cvuhsd.org	13	M	12	D-212	Drake, Travis	Solis, Esteban Abraham	f	\N
9890	Jermaine	Spears	51988	8	j.spears988@cvuhsd.org	13	M	12	D-212	Drake, Travis	Spears, Jermaine Richard	f	\N
9891	Ray'Ley	Stevens	52961	8	r.stevens961@cvuhsd.org	13	F	12	H-205	Matuz, Kristin M.	Stevens, Ray'Ley Sey	f	\N
9892	Alexander	Suarez	53051	8	a.suarez051@cvuhsd.org	13	M	12	E-102	Alvarez, Gary David	Suarez, Alexander Joseph	f	\N
9893	Brian	Suarez	52515	8	b.suarez515@cvuhsd.org	13	M	12	D-212	Drake, Travis	Suarez, Brian	f	\N
9894	Christian	Swartzbaugh	52959	8	c.swartzbaugh959@cvuhsd.org	13	M	12	G-207	Rah, Choonglim	Swartzbaugh, Christian Davis	f	\N
9895	Dai'Mel	Taylor	53074	8	d.taylor074@cvuhsd.org	13	M	12	E-204	Pham, Vuong	Taylor, Dai'Mel Malie Malachi	f	\N
9896	Nardos	Tegegne	56994	8	n.tegegne994@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Tegegne, Nardos Addis	f	\N
9897	Jayden	Thompson	57047	8	j.thompson047@cvuhsd.org	13	M	12	C-204	Kenning, Sara J	Thompson, Jayden Jamar	f	\N
9898	Jordan	Tonga	52437	8	j.tonga437@cvuhsd.org	13	M	12	D-204	Bravo, Ronald J	Tonga, Jordan Manitisa	f	\N
9899	Brayan	Tornez	51853	8	b.tornez853@cvuhsd.org	13	M	12	G-109	Miranda, Denisse	Tornez, Brayan	f	\N
9900	Vincent	Tovar	52166	8	v.tovar166@cvuhsd.org	13	M	12	C-207	Park, John	Tovar, Vincent Andrew	f	\N
9901	Minh Nguyet	Tran	53333	8	m.tran333@cvuhsd.org	13	F	12	H-202	Saad, Eman	Tran, Minh Nguyet Thi	f	\N
9902	Toa Jr	Tu'uholoaki	55586	8	t.tuuholoaki586@cvuhsd.org	13	M	12	A-201	Salgado, Efrain	Tu'uholoakiToa JrSolomon	f	\N
9903	Manaola	Tupou	57390	8	m.tuplu390@cvuhsd.org	13	M	12	B-1	Cassio, Michael J.	Tupou, Manaola	f	\N
9904	Joey	Turnage	52134	8	j.turnage134@cvuhsd.org	13	M	12	H-105	Forster, Claire	Turnage, Joey J'Mar	f	\N
9905	Nathaniel	Turner	53374	8	n.turner374@cvuhsd.org	13	M	12	D-213	Gomez, Amalia L.	Turner, Nathaniel Langston	f	\N
9906	Grace	Ucheegbu-Ezeocha	52067	8	g.ucheegbuezeocha067@cvuhsd.org	13	F	12	D-204	Bravo, Ronald J	Ucheegbu-Ezeocha, Grace Chidera	f	\N
9907	Nathaly	Vargas Bernal	52371	8	n.vargasbernal371@cvuhsd.org	13	F	12	E-201	Choi, Eric	Vargas Bernal, Nathaly Rachelle	f	\N
9908	Carla	Vasquez Avelar	52372	8	c.vasquezavelar372@cvuhsd.org	13	F	12	E-204	Pham, Vuong	Vasquez Avelar, Carla Julissa	f	\N
9909	Hamilton	Vasquez Estrada	52944	8	h.vasquezestrada944@cvuhsd.org	13	M	12	D-201	Villegas-Diaz, Jessica P.	Vasquez Estrada, Hamilton Alexis	f	\N
9910	Brianna	Vasquez	52708	8	b.vasquez708@cvuhsd.org	13	F	12	C-207	Park, John	Vasquez, Brianna Karina	f	\N
9911	Drake	Vazquez	52068	8	d.vazquez068@cvuhsd.org	13	M	12	D-201	Villegas-Diaz, Jessica P.	Vazquez, Drake Gerardo	f	\N
9912	Trevall	Vega	52733	8	t.vega733@cvuhsd.org	13	M	12	GYM 4	Whitt, James	Vega, Trevall Deon	f	\N
9913	Jose	Venavides	52548	8	j.venavides548@cvuhsd.org	13	M	12	C-207	Park, John	Venavides, Jose Luis	f	\N
9914	Richard	Venegas	52069	8	r.venegas069@cvuhsd.org	13	M	12	G-104	Mccoy, Bert L	Venegas, Richard Giovanny	f	\N
9915	Marilyn	Ventura Bello	52373	8	m.venturabello373@cvuhsd.org	13	F	12	H-205	Matuz, Kristin M.	Ventura Bello, Marilyn	f	\N
9916	Miguel Rodel	Vetus	52452	8	m.vetus452@cvuhsd.org	13	M	12	C-207	Park, John	Vetus, Miguel Rodel Borlaza	f	\N
9917	Juan	Villa	52736	8	j.villa736@cvuhsd.org	13	M	12	D-201	Villegas-Diaz, Jessica P.	Villa, Juan Eduardo	f	\N
9918	Natalie	Villa	52519	8	n.villa519@cvuhsd.org	13	F	12	D-204	Bravo, Ronald J	Villa, Natalie	f	\N
9919	Alejandro	Villafana	51866	8	a.villafana866@cvuhsd.org	13	M	12	D-201	Villegas-Diaz, Jessica P.	Villafana, Alejandro	f	\N
9920	Kenneth	Villegas Martinez	51870	8	k.villegasmartine870@cvuhsd.org	13	M	12	C-204	Kenning, Sara J	Villegas Martinez, Kenneth Sebastian	f	\N
9921	Azul	Viveros	52047	8	a.viveros047@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Viveros, Azul Ruby	f	\N
9922	Angel	Vizcarra	52374	8	a.vizcarra374@cvuhsd.org	13	M	12	H-202	Saad, Eman	Vizcarra,Angel Gabriel	f	\N
9923	Lakaylaa	Walker	54965	8	l.walker965@cvuhsd.org	13	F	12	G-211	Espinoza, Derrick F.	Walker, Lakaylaa Desire Carletta	f	\N
9924	Genelle	Wallace	52575	8	g.wallace575@cvuhsd.org	13	F	12	G-207	Rah, Choonglim	Wallace, Genelle Janice	f	\N
9925	Genette	Wallace	52574	8	g.wallace574@cvuhsd.org	13	F	12	D-204	Bravo, Ronald J	Wallace, Genette Patricia	f	\N
9926	Jocelyn	Williams	52440	8	j.williams440@cvuhsd.org	13	F	12	GYM 6	Singleton, Sigmund	Williams, Jocelyn Ymani	f	\N
9927	Makailah	Williams	53155	8	m.williams155@cvuhsd.org	13	F	12	D-204	Bravo, Ronald J	Williams, Makailah Rai'Ann	f	\N
9928	Antonio	Wilson	52995	8	a.wilson995@cvuhsd.org	13	M	12	GYM 4	Whitt, James	Wilson, Antonio Michael	f	\N
9929	Kenneth	Winzer	55607	8	k.winzer607@cvuhsd.org	13	M	12	G-101	Komatsu, Chase	Winzer, Kenneth Duane	f	\N
9930	Kaliyah	Woolridge	52874	8	k.woolridge874@cvuhsd.org	13	F	12	H-205	Matuz, Kristin M.	Woolridge, Kaliyah Monique	f	\N
9931	Said	Zambrano Burga	55602	8	s.zambranoburga602@cvuhsd.org	13	M	12	G-209	Tadena, Ma S	Zambrano Burga,Said Josue	f	\N
9932	Kevin	Zaragoza Marquez	52070	8	k.zaragozamarquez070@cvuhsd.org	13	M	12	D-212	Drake, Travis	Zaragoza Marquez, Kevin Alexander	f	\N
9933	Diego	Zepeda	52869	8	d.zepeda869@cvuhsd.org	13	M	12	C-202	Varee, Susan S.	Zepeda, Diego Ali	f	\N
6446	Xylus	Lara'Viltrez	58713	4	x.laraviltrez713@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Lara'Viltrez, Xylus Rayvon	f	\N
6447	Austin	Lee	58858	4	a.lee858@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Lee, Austin James	f	\N
6448	Reagan	Lee	58310	4	r.lee310@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Lee, Reagan Bryan	f	\N
6449	Sergio	Leon	58328	4	s.leon328@cvuhsd.org	15	M	9	D-108	Infante Razo, Carlos	Leon, Sergio Alexander	f	\N
6450	Christopher	Lopez Cintora	58099	4	c.lopezcintora099@cvuhsd.org	15	M	9	M-110	Segovia, Jose M	Lopez Cintora, Christopher	f	\N
6451	Abner	Lopez Gomez	58351	4	a.lopezgomez351@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Lopez Gomez, Abner Eli	f	\N
6452	Chayanne	Lopez Sanchez	58914	4	c.lopezsanchez914@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Lopez Sanchez, Chayanne Raul	f	\N
6453	Grayson	Lopez Zavala	58209	4	g.lopezzavala209@cvuhsd.org	15	M	9	F-106	Givens, Kathy E.	Lopez Zavala, Grayson Isaac	f	\N
6454	Alison	Lopez	58781	4	a.lopez781@cvuhsd.org	15	F	9	L-202	Isozaki, Jonathan	Lopez, Alison	f	\N
6455	Angel	Lopez	58859	4	a.lopez859@cvuhsd.org	15	M	9	C-106	Howard Johnson, Crystal	Lopez, Angel	f	\N
6456	Aurelia	Lopez	58001	4	a.lopez001@cvuhsd.org	15	F	9	L-201	Haynes, Cordell	Lopez, Aurelia Sapphira	f	\N
6457	Kevin	Lopez	57969	4	k.lopez969@cvuhsd.org	15	M	9	D-108	Infante Razo, Carlos	Lopez, Kevin Alexander	f	\N
6458	Lucy	Lopez	57912	4	l.lopez912@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Lopez, Lucy Elizabeth Avery	f	\N
6459	Melinda	Lopez	58900	4	m.lopez900@cvuhsd.org	15	F	9	C-106	Howard Johnson, Crystal	Lopez, Melinda	f	\N
6460	Nathaniel	Lopez	58902	4	n.lopez902@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Lopez, Nathaniel Raul	f	\N
6461	Catherine	Lopez-Lopez	57925	4	c.lopezlopez925@cvuhsd.org	15	F	9	C-106	Howard Johnson, Crystal	Lopez-Lopez, Catherine Lisbeth	f	\N
6462	Yasmin	Lopez-Vaquedano	57913	4	y.lopezvaquedano913@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Lopez-Vaquedano, Yasmin Elizabeth	f	\N
6463	Jose	Lorenzana Fernando	58703	4	j.lorenzanaferna703@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	Lorenzana Fernando, Jose Miguel	f	\N
6464	Ariana	Lugo	58298	4	a.lugo298@cvuhsd.org	15	F	9	E-107	Takamoto, Jason K.	Lugo, Ariana Michelle	f	\N
6465	Alondra	Maceda	59120	4	a.maceda120@cvuhsd.org	15	F	9	K-105	Gonzalez, Alejandra	Maceda, Alondra	f	\N
6466	Joseph	Macias	58782	4	j.macias782@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Macias, Joseph Alan	f	\N
6467	Kaelei	Madrid-Hartman	59146	4	k.madridhartman146@cvuhsd.org	15	F	9	L-102	Farkouh, Raphael M.	Madrid-Hartman, Kaelei Danyale	f	\N
6468	Lanxton	Magana	58905	4	l.magana905@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Magana, Lanxton Elijah	f	\N
6469	Eduardo	Magdaleno	57848	4	e.magdaleno848@cvuhsd.org	15	M	9	M-110	Segovia, Jose M	Magdaleno, Eduardo Jesus	f	\N
6470	Bryant	Marin	57674	4	b.marin674@cvuhsd.org	15	M	9	C-203	Duran, Dominic J	Marin, Bryant David	f	\N
6471	Carlos	Marquez	58192	4	c.marquez192@cvuhsd.org	15	M	9	M-110	Segovia, Jose M	Marquez, Carlos Daniel	f	\N
6472	Angela	Marroquin Arredondo	58097	4	a.marroquinarredo097@cvuhsd.org	15	F	9	C-203	Duran, Dominic J	Marroquin Arredondo, Angela Lizbeth	f	\N
6473	Jaiden	Marshall	58253	4	j.marshall253@cvuhsd.org	15	M	9	J-118	Gray, Ron	Marshall, Jaiden Deshon	f	\N
6474	Santiago	Martin	57849	4	s.martin849@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Martin, Santiago Thomas	f	\N
6475	Lidia	Martinez Barajas	58892	4	l.martinezbaraja892@cvuhsd.org	15	F	9	L-103	Castillo, Amy	Martinez Barajas, Lidia Stacey Sinai	f	\N
6476	Alexander	Martinez	58581	4	a.martinez581@cvuhsd.org	15	M	9	C-106	Howard Johnson, Crystal	Martinez, Alexander Rae	f	\N
6477	Crystal	Martinez	57746	4	c.martinez746@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Martinez, Crystal Valeria	f	\N
6478	Lucia	Martinez	58264	4	l.martinez264@cvuhsd.org	15	F	9	L-201	Haynes, Cordell	Martinez, Lucia Andrea	f	\N
6479	Mia	Martinez-Perez	58488	4	m.martinezperez488@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Martinez-Perez, Mia Gabriella	f	\N
6480	Zack	Mayorga	58143	4	z.mayorga143@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	Mayorga, Zack Stuward	f	\N
6481	Kimora	Mays	59285	4	k.mays285@cvuhsd.org	15	F	9	C-106	Howard Johnson, Crystal	Mays, Kimora Lee	f	\N
6482	Victor	Mazariegos-Monterroso	58299	4	v.mazariegosmonte299@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Mazariegos-Monterroso, Victor Manuel	f	\N
6483	Zefana	McClellan	58837	4	z.mcclellan837@cvuhsd.org	15	F	9	C-106	Howard Johnson, Crystal	McClellan, Zefana Mone	f	\N
6484	Roberto	Meda	57644	4	r.meda644@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Meda, Roberto Carlos	f	\N
6485	Katerine	Medellin Hernandez	59009	4	k.medellinhernan009@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Medellin Hernandez, Katerine	f	\N
6486	Pavel	Mejia Velasquez	58157	4	p.mejiavelasquez157@cvuhsd.org	15	M	9	G-101	Galt, Douglas S	Mejia Velasquez, Pavel Santiago	f	\N
6487	Fabian	Mejia	58794	4	f.mejia794@cvuhsd.org	15	M	9	M-213	Morin, Jasmine	Mejia, Fabian	f	\N
6488	Kenneth	Melara-Hernandez	57815	4	k.melarahernandez815@cvuhsd.org	15	M	9	M-112	Barahona, Iris	Melara-Hernandez, Kenneth Jeancarlos	f	\N
6489	Daiana	Melendrez Carmona	58125	4	d.melendrezcarmon125@cvuhsd.org	15	F	9	C-106	Howard Johnson, Crystal	Melendrez Carmona, Daiana Valeria	f	\N
6490	Jake	Mencos Estrada	57675	4	j.mencosestrada675@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Mencos Estrada, Jake Bryan Javier	f	\N
6491	Nathan	Mendez	58072	4	n.mendez072@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Mendez, Nathan	f	\N
6492	Nicholas	Mendez	58073	4	n.mendez073@cvuhsd.org	15	M	9	M-110	Segovia, Jose M	Mendez, Nicholas	f	\N
6493	Anthony	Mendoza	57816	4	a.mendoza816@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Mendoza, Anthony Elias	f	\N
6494	Emmanuel	Mendoza	58690	4	e.mendoza690@cvuhsd.org	15	M	9	M-110	Segovia, Jose M	Mendoza, Emmanuel Jordan	f	\N
6495	Cristal	Mercado	58467	4	c.mercado467@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Mercado, Cristal	f	\N
6496	Yocelyn	Mercado	57958	4	y.mercado958@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Mercado, Yocelyn Alejandra	f	\N
6497	Travis	Meza	57878	4	t.meza878@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Meza, Travis	f	\N
6498	Tosh	Michaels	57914	4	t.michaels914@cvuhsd.org	15	M	9	M-110	Segovia, Jose M	Michaels, Tosh Kelly	f	\N
6499	Dilcia	Mier	57833	4	d.mier833@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Mier, Dilcia Savannah	f	\N
6500	Josselin	Milian Aquino	58352	4	j.milianaquino352@cvuhsd.org	15	F	9	C-203	Duran, Dominic J	Milian Aquino, Josselin Meaildy	f	\N
6501	Allison	Miranda	58353	4	a.miranda353@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Miranda, Allison	f	\N
6502	Briana	Mireles	57817	4	b.mireles817@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Mireles, Briana Nicole	f	\N
6503	Ameerah	Mitchell	57761	4	a.mitchell761@cvuhsd.org	15	F	9	L-201	Haynes, Cordell	Mitchell, Ameerah Karma	f	\N
6504	Samiyah	Mitchell	57760	4	s.mitchell760@cvuhsd.org	15	F	9	E-107	Takamoto, Jason K.	Mitchell, Samiyah Destiny	f	\N
6505	Ahmed	Mohamed	59271	4	a.mohamed271@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Mohamed, Ahmed Abdirahman	f	\N
6506	Brayan	Molina Baltodano	58074	4	b.molinabaltodano074@cvuhsd.org	15	M	9	L-103	Castillo, Amy	Molina Baltodano, Brayan Reymundo	f	\N
6507	Isaac	Molina	57927	4	i.molina927@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Molina, Isaac	f	\N
6508	Nathaniel	Molina	58918	4	n.molina918@cvuhsd.org	15	M	9	C-106	Howard Johnson, Crystal	Molina, Nathaniel Moises	f	\N
6509	Yaretzi	Molina	58015	4	y.molina015@cvuhsd.org	15	F	9	M-110	Segovia, Jose M	Molina, Yaretzi	f	\N
6510	Fatima	Monjaras	58903	4	f.monjaras903@cvuhsd.org	15	F	9	J-112	Levine, Allison A	Monjaras, Fatima Adriana	f	\N
6511	Daniel	Montoya	58686	4	d.montoya686@cvuhsd.org	15	M	9	C-106	Howard Johnson, Crystal	Montoya, Daniel Andres	f	\N
6512	Sofia	Morales Arceo	57702	4	s.moralesarceo702@cvuhsd.org	15	F	9	C-203	Duran, Dominic J	Morales Arceo, Sofia	f	\N
6513	Katherine	Morales Ciau	58330	4	k.moralesciau330@cvuhsd.org	15	F	9	M-213	Traylor, Dean S.	Morales Ciau, Katherine Isabel	f	\N
6514	Aaron	Morales	58874	4	a.morales874@cvuhsd.org	15	M	9	D-108	Infante Razo, Carlos	Morales, Aaron Leonel	f	\N
6515	James	Morales	58583	4	j.morales583@cvuhsd.org	15	M	9	K-105	Gonzalez, Alejandra	Morales, James Emanuel	f	\N
6516	Leamadai	Morales	58462	4	l.morales462@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Morales, Leamadai	f	\N
6517	Sophia	Morales	58520	4	s.morales520@cvuhsd.org	15	F	9	L-103	Castillo, Amy	Morales, Sophia Adrienne	f	\N
6518	Luke	Moran Faria	57866	4	l.faria866@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Moran Faria, Luke	f	\N
6519	Rylie	Morrow	59012	4	r.morrow012@cvuhsd.org	15	F	9	L-102	Farkouh, Raphael M.	Morrow, Rylie Antonia Lynn	f	\N
6520	Littman	Mucha Ventura	58247	4	l.muchaventura247@cvuhsd.org	15	M	9	D-207	Gonzalez, Deborah A	Mucha Ventura, Littman George	f	\N
6521	Clarissa	Munoz Melero	58085	4	c.munozmelero085@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Munoz Melero, Clarissa	f	\N
6522	Gustavo	Munoz-Donis	58468	4	g.munozdonis468@cvuhsd.org	15	M	9	M-113	Aispuro, Mayte	Munoz-Donis, Gustavo Amir	f	\N
6523	David	Muratalla	57953	4	d.muratalla953@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Muratalla, David Leonel	f	\N
6524	Angel	Naja Calvo	57747	4	a.najacalvo747@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Naja Calvo, Angel Dario	f	\N
6525	Abigail	Navarro	57756	4	a.navarro756@cvuhsd.org	15	F	9	G-101	Galt, Douglas S	Navarro, Abigail	f	\N
6526	Marlize	Neal	58221	4	m.neal221@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Neal, Marlize Lillie	f	\N
6527	Johana	Negrete-Guzman	58286	4	j.negreteguzman286@cvuhsd.org	15	F	9	M-110	Segovia, Jose M	Negrete-Guzman, Johana Valeria	f	\N
6528	Ben	Nelson Holguina	58684	4	b.nelsonholguina684@cvuhsd.org	15	F	9	C-106	Howard Johnson, Crystal	Nelson Holguina, Ben	f	\N
6529	Tram	Nguyen	57916	4	t.nguyen916@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Nguyen, Tram Phan Hoai	f	\N
6530	Leilani	Novelo	57818	4	l.novelo818@cvuhsd.org	15	F	9	F-106	Givens, Kathy E.	Novelo, Leilani Jayde	f	\N
6531	Geofrey	Nzeogu	58272	4	g.nzeogu272@cvuhsd.org	15	M	9	M-118	Aguilar Hernandez, Leslie	Nzeogu, Geofrey Ikechukwu	f	\N
6532	Nieelah	Oates Josephs	59148	4	n.oatesjosephs148@cvuhsd.org	15	F	9	L-201	Haynes, Cordell	Oates Josephs, Nieelah Lorshea	f	\N
6533	Salvador	Ochoa	58567	4	s.ochoa567@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	Ochoa, Salvador	f	\N
6534	Cody	Olazaba	58034	4	c.olazaba034@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Olazaba, Cody Brian	f	\N
6535	David	Onyema	58998	4	d.onyema998@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Onyema, David Chukwudubem	f	\N
6536	Jhony	Orellana Aguilera	58869	4	j.orellanaaguile869@cvuhsd.org	15	M	9	D-105	Lesan, Kristine M	Orellana Aguilera, Jhony Stheben	f	\N
6537	Andrew	Ortega	57749	4	a.ortega749@cvuhsd.org	15	M	9	M-110	Segovia, Jose M	Ortega, Andrew Alexander	f	\N
6538	Caelan	Otto	57819	4	c.otto819@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Otto, Caelan Foster	f	\N
6539	Xavier	Page	59016	4	x.page016@cvuhsd.org	15	M	9	K-105	Gonzalez, Alejandra	Page, Xavier Jermaine	f	\N
6540	Rudy	Paniagua Reyes	57763	4	r.paniaguareyes763@cvuhsd.org	15	M	9	D-108	Infante Razo, Carlos	Paniagua Reyes, Rudy Josue	f	\N
6541	Doon	Parada	58668	4	d.parada668@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	Parada, Doon Alexander	f	\N
6542	Destiny	Parga-Garcia	59053	4	d.pargagarcia053@cvuhsd.org	15	F	9	L-102	Farkouh, Raphael M.	Parga-Garcia, Destiny Skarleth	f	\N
6543	Kaniel	Paz	58239	4	k.paz239@cvuhsd.org	15	M	9	D-108	Infante Razo, Carlos	Paz, Kaniel Kaled	f	\N
6544	Ceyanna	Peoples	57970	4	c.peoples970@cvuhsd.org	15	F	9	M-118	Aguilar Hernandez, Leslie	Peoples, Ceyanna Shireen	f	\N
6545	Linda	Peralta-Santos	58039	4	l.peraltasantos039@cvuhsd.org	15	F	9	C-203	Duran, Dominic J	Peralta-Santos, Linda Nicole	f	\N
6546	Benigno	Perez Cano	57964	4	b.perezcano964@cvuhsd.org	15	M	9	M-213	Traylor, Dean S.	Perez Cano, Benigno	f	\N
6547	Leonardo	Perez	57901	4	l.perez901@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Perez, Leonardo	f	\N
6548	Richard	Perez	58972	4	r.perez972@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Perez, Richard Anthonie	f	\N
6549	Yadash	Piedrasanta-Vasquez	57851	4	y.piedrasantavasq851@cvuhsd.org	15	F	9	M-213	Morin, Jasmine	Piedrasanta-Vasquez, Yadash Berakah	f	\N
6550	Belinda	Pineda-Perez	58333	4	b.pinedaperez333@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Pineda-Perez, Belinda Bibiana	f	\N
6551	Rosmery	Pivaral-Vargas	59094	4	r.pivaralvargas094@cvuhsd.org	15	F	9	C-203	Duran, Dominic J	Pivaral-Vargas, Rosmery	f	\N
6552	Sabella	Porter	59010	4	s.porter010@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Porter, Sabella Suejay	f	\N
6553	Wilmar	Portillo	58523	4	w.portillo523@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	Portillo, Wilmar Leandro	f	\N
6554	Matthew	Posada	58035	4	m.posada035@cvuhsd.org	15	M	9	D-108	Infante Razo, Carlos	Posada, Matthew Carlos	f	\N
6555	Steven	Pulido	57788	4	s.pulido788@cvuhsd.org	15	M	9	C-203	Duran, Dominic J	Pulido, Steven	f	\N
6556	Ma'nijah	Quarles	59260	4	m.quarles260@cvuhsd.org	15	F	9	K-202	Allen, Richard E	Quarles, Ma'nijah Colleen	f	\N
6557	Nathan	Quijada	58311	4	n.quijada311@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Quijada, Nathan Alexander	f	\N
6558	Chris	Quinteros	58445	4	c.quinteros445@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	Quinteros, Chris Anthony	f	\N
6559	Ashley	Ramirez Cruz	59034	4	a.ramirezcruz034@cvuhsd.org	15	F	9	C-203	Duran, Dominic J	Ramirez Cruz, Ashley Marie	f	\N
6560	Ricardo	Ramirez	59061	4	r.ramirez061@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	Ramirez, Ricardo	f	\N
6561	Samuel	Ramirez	58569	4	s.ramirez569@cvuhsd.org	15	M	9	D-108	Infante Razo, Carlos	Ramirez, Samuel Jose	f	\N
6562	Joseph	Ramirez-Mora	58767	4	j.ramirezmora767@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Ramirez-Mora, Joseph	f	\N
6563	Matthew	Ramos	58224	4	m.ramos224@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Ramos, Matthew Israel	f	\N
6564	Moses	Ramos	58548	4	m.ramos548@cvuhsd.org	15	M	9	D-108	Infante Razo, Carlos	Ramos, Moses	f	\N
6565	Donald	Reese-Glover	57984	4	d.reeseglover984@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Reese-Glover, Donald Frederick	f	\N
6566	Kayley	Rendon	57646	4	k.rendon646@cvuhsd.org	15	F	9	M-110	Segovia, Jose M	Rendon, Kayley Marie	f	\N
6567	Renatto	Renteria Parreno	57867	4	r.renteriaparreno867@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Renteria Parreno, Renatto	f	\N
6568	Madelynn	Renteria	58043	4	m.renteria043@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Renteria, Madelynn Elena	f	\N
6569	Rocio	Retana Silva	57764	4	r.retanasilva764@cvuhsd.org	15	F	9	J-112	Levine, Allison A	Retana Silva, Rocio Samantha	f	\N
6570	Emilio	Reyes Ornelas	58587	4	e.reyesornelas587@cvuhsd.org	15	M	9	G-101	Galt, Douglas S	Reyes Ornelas, Emilio Angel	f	\N
6571	Angie	Reyes	58636	4	a.reyes636@cvuhsd.org	15	F	9	K-115	Poland, Susan M.	Reyes, Angie Giselle	f	\N
6572	Chris	Reyes	58471	4	c.reyes471@cvuhsd.org	15	M	9	M-213	Traylor, Dean S.	Reyes, Chris David	f	\N
6573	Christian	Reyes	57789	4	c.reyes789@cvuhsd.org	15	M	9	J-118	Gray, Ron	Reyes, Christian	f	\N
6574	Lily	Reyes	58640	4	l.reyes640@cvuhsd.org	15	F	9	L-201	Haynes, Cordell	Reyes, Lily Noelle	f	\N
6575	Brianna	Riley	58588	4	b.riley588@cvuhsd.org	15	F	9	C-106	Howard Johnson, Crystal	Riley, Brianna	f	\N
6576	Leezah	Rios	58866	4	l.rios866@cvuhsd.org	15	F	9	M-213	Morin, Jasmine	Rios, Leezah Marie	f	\N
6577	Malakhai	Rivera	58863	4	m.rivera863@cvuhsd.org	15	M	9	M-213	Morin, Jasmine	Rivera, Malakhai Tatumbre	f	\N
6578	Natalie	Rivera	58919	4	n.rivera919@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Rivera, Natalie	f	\N
6579	Noel	Rizo Jimenez	59046	4	n.rizojimenez046@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Rizo Jimenez, Noel Daniel	f	\N
6580	Legend	Roberts	59114	4	l.roberts114@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Roberts, Legend Kartier	f	\N
6581	Janice	Rodriguez Pego	58122	4	j.rodriguezpego122@cvuhsd.org	15	F	9	M-213	Morin, Jasmine	Rodriguez Pego, Janice Marlyn	f	\N
6582	Antonio	Rodriguez Ziga	58075	4	a.rodriguezziga075@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Rodriguez Ziga, Antonio Joseph	f	\N
6583	Izabella	Rodriguez	58300	4	i.rodriguez300@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Rodriguez, Izabella Castaneda	f	\N
6584	Joel	Rodriguez	58798	4	j.rodriguez798@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Rodriguez, Joel	f	\N
6585	Liliana	Rodriguez	58667	4	l.rodriguez667@cvuhsd.org	15	F	9	D-207	Gonzalez, Deborah A	Rodriguez, Liliana	f	\N
6586	Samantha	Rodriguez	58589	4	s.rodriguez589@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Rodriguez, Samantha Sherlyn	f	\N
6587	Yaretzi	Rodriguez	59007	4	y.rodriguez007@cvuhsd.org	15	F	9	K-105	Gonzalez, Alejandra	Rodriguez, Yaretzi Gizelle	f	\N
6588	Zarahi	Rodriguez-Alfaro	58501	4	z.rodriguezalfar501@cvuhsd.org	15	F	9	M-213	Traylor, Dean S.	Rodriguez-Alfaro, Zarahi Alicia	f	\N
6589	Gael	Rojas Bejar	59035	4	g.rojasbejar035@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	Rojas Bejar, Gael Leonardo	f	\N
6590	Mia	Rojas	59190	4	m.rojas190@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Rojas, Mia	f	\N
6591	Brandon	Romero	59000	4	b.romero000@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Romero, Brandon Osael	f	\N
6592	Chris	Romero-Monroy	58201	4	c.romeromonroy201@cvuhsd.org	15	M	9	C-203	Duran, Dominic J	Romero-Monroy, Chris Steven	f	\N
6593	Stephanie	Ruano Lopez	58629	4	s.ruanolopez629@cvuhsd.org	15	F	9	K-115	Poland, Susan M.	Ruano Lopez, Stephanie Viviana	f	\N
6594	Natali	Rubio	57856	4	n.rubio856@cvuhsd.org	15	F	9	J-112	Levine, Allison A	Rubio, Natali Victoria	f	\N
6595	Valeria	Rubio	58799	4	v.rubio799@cvuhsd.org	15	F	9	D-105	Lesan, Kristine M	Rubio, Valeria Alejandra	f	\N
6596	Fernanda	Ruelas	58862	4	f.ruelas862@cvuhsd.org	15	F	9	D-207	Gonzalez, Deborah A	Ruelas, Fernanda Yarel	f	\N
6597	Vivianna	Ruelas	58665	4	v.ruelas665@cvuhsd.org	15	F	9	L-102	Farkouh, Raphael M.	Ruelas, Vivianna Esther	f	\N
6598	Dana	Ruiz Salgado	59157	4	d.ruizsalgado157@cvuhsd.org	15	F	9	D-207	Gonzalez, Deborah A	Ruiz Salgado, Dana Jineth	f	\N
6599	Jesus	Ruiz	59067	4	j.ruiz067@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Ruiz, Jesus Anheiser	f	\N
6600	Landon	Ruiz	59191	4	l.ruiz191@cvuhsd.org	15	M	9	M-213	Morin, Jasmine	Ruiz, Landon Noah	f	\N
6601	Kaithlyn	Ruvalcaba Santos	58679	4	k.ruvalcabasanto679@cvuhsd.org	15	F	9	M-118	Aguilar Hernandez, Leslie	Ruvalcaba Santos, Kaithlyn Yaretzi	f	\N
6602	Kellan	Saintecy	58664	4	k.saintecy664@cvuhsd.org	15	M	9	M-213	Morin, Jasmine	Saintecy, Kellan	f	\N
6603	David	Sajche Palacios	58616	4	d.sajchepalacios616@cvuhsd.org	15	M	9	M-213	Morin, Jasmine	Sajche Palacios, David	f	\N
6604	Melanie	Salas-Tovar	58255	4	m.salastovar255@cvuhsd.org	15	F	9	M-110	Segovia, Jose M	Salas-Tovar, Melanie	f	\N
6605	Joaquin	Saldivar Santos	58490	4	j.saldivarsantos490@cvuhsd.org	15	M	9	L-204	Ishii, Emily	Saldivar Santos, Joaquin	f	\N
6606	Kevin	Samayoa Gomez	57960	4	k.samayoagomez960@cvuhsd.org	15	M	9	G-101	Galt, Douglas S	Samayoa Gomez, Kevin Eduardo	f	\N
6607	Adrian	Sanchez	59003	4	a.sanchez003@cvuhsd.org	15	M	9	C-106	Howard Johnson, Crystal	Sanchez, Adrian Raul	f	\N
6608	Chelsea	Sanchez	58189	4	c.sanchez189@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Sanchez, Chelsea Aurora	f	\N
6609	Jocelyn	Sanchez	57727	4	j.sanchez727@cvuhsd.org	15	F	9	L-103	Castillo, Amy	Sanchez, Jocelyn Denise	f	\N
6610	Rachel	Sanchez	58524	4	r.sanchez524@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Sanchez, Rachel	f	\N
6611	Charlie	Sanders	58450	4	c.sanders450@cvuhsd.org	15	M	9	F-106	Givens, Kathy E.	Sanders, Charlie C	f	\N
6612	Juan	Santiago Olivera	58765	4	j.santiagooliver765@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Santiago Olivera, Juan Carlos	f	\N
6613	Esmeralda	Santiago	58165	4	e.santiago165@cvuhsd.org	15	F	9	K-115	Poland, Susan M.	Santiago, Esmeralda	f	\N
6614	Maria	Santos	57918	4	m.santos918@cvuhsd.org	15	F	9	L-102	Farkouh, Raphael M.	Santos, Maria Eugenia	f	\N
6615	Nineth	Santos	59158	4	n.santos158@cvuhsd.org	15	F	9	K-105	Gonzalez, Alejandra	Santos, Nineth Joanna	f	\N
6616	Andrew	Saucedo	58525	4	a.saucedo525@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Saucedo, Andrew	f	\N
6617	Abylynn	Serrano Estrada	58628	4	a.serranoestrada628@cvuhsd.org	15	F	9	M-110	Segovia, Jose M	Serrano Estrada, Abylynn Annise	f	\N
6618	Bryant	Servin	58256	4	b.servin256@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	Servin, Bryant Ethan	f	\N
6619	Ryan	Shimoda	57825	4	r.shimoda825@cvuhsd.org	15	M	9	M-117	Tarkington, Cole	Shimoda, Ryan Zan-Xiang	f	\N
6620	Sophia	Sigala	58663	4	s.sigala663@cvuhsd.org	15	F	9	M-213	Morin, Jasmine	Sigala, Sophia	f	\N
6621	Mikell	Smith Mcalpin	59116	4	m.smithmcalpin116@cvuhsd.org	15	M	9	F-106	Givens, Kathy E.	Smith Mcalpin, Mikell Christen	f	\N
6622	Juan	Solorsano	58861	4	j.solorsano861@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	Solorsano, Juan Humberto	f	\N
6623	Zaire	Spence	58575	4	z.spence575@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Spence, Zaire Sefton	f	\N
6624	Navae	Spirlin	58801	4	n.spirlin801@cvuhsd.org	15	F	9	J-105	Bowman, Lauren C.	Spirlin, Navae Ma'r	f	\N
6625	Damiann	Stewart	59117	4	d.stewart117@cvuhsd.org	15	F	9	M-213	Morin, Jasmine	Stewart, Damiann Claire	f	\N
6626	Sakai	Stewart	59199	4	s.stewart199@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Stewart, Sakai Anthony	f	\N
6627	Kern	Sylvester	58119	4	k.sylvester119@cvuhsd.org	15	M	9	M-110	Segovia, Jose M	Sylvester, Kern Jehue	f	\N
6628	Shawn	Taylor	59017	4	s.taylor017@cvuhsd.org	15	M	9	M-110	Segovia, Jose M	Taylor, Shawn Jayceon	f	\N
6629	Stacy	Terrones Solis	57826	4	s.terronessolis826@cvuhsd.org	15	F	9	M-110	Segovia, Jose M	Terrones Solis, Stacy	f	\N
6630	Jayshawn	Thomas	59312	4	j.thomas312@cvuhsd.org	15	M	9	K-105	Gonzalez, Alejandra	Thomas, Jayshawn Darion	f	\N
6631	Camron	Tillage	58292	4	c.tillage292@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Tillage, Camron Michael	f	\N
6632	Klaze	Tillett	58308	4	k.tillett308@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Tillett, Klaze Kelvin	f	\N
6633	Roberto	Tobias Perez	59284	4	r.tobiasperez284@cvuhsd.org	15	M	9	D-207	Gonzalez, Deborah A	Tobias Perez, Roberto	f	\N
6634	Abubakar	Tootla	58040	4	a.tootla040@cvuhsd.org	15	M	9	L-204	Ishii, Emily	Tootla, Abubakar Yousuf	f	\N
6635	Gerson	Torres Fuentes	58098	4	g.torresfuentes098@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Torres Fuentes, Gerson Jair	f	\N
6636	Isabella	Torres Jauregui	58190	4	i.torresjauregui190@cvuhsd.org	15	F	9	L-201	Haynes, Cordell	Torres Jauregui, Isabella	f	\N
6637	Adrian	Torres	59118	4	a.torres118@cvuhsd.org	15	M	9	F-107	Rice, Christopher A.	Torres, Adrian	f	\N
6638	Eli	Torres	58007	4	e.torres007@cvuhsd.org	15	M	9	L-103	Castillo, Amy	Torres, Eli	f	\N
6639	Jesus	Torres	58214	4	j.torres214@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Torres, Jesus Javier	f	\N
6640	Katelyn	Torres	58590	4	k.torres590@cvuhsd.org	15	F	9	L-103	Castillo, Amy	Torres, Katelyn Liana	f	\N
6641	Melissa	Tovar Ruesga	57697	4	m.tovarruesga697@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Tovar Ruesga, Melissa Eva	f	\N
6642	Josue	Tuche Agustin	59073	4	j.tucheagustin073@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Tuche Agustin, Josue Emanuel	f	\N
6643	Gairon	Tuquer	59043	4	g.tuquer043@cvuhsd.org	15	M	9	K-115	Poland, Susan M.	Tuquer, Gairon Anthony	f	\N
6644	Amaya	Turner	58336	4	a.turner336@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Turner, Amaya Maribel	f	\N
6645	Somtochukwu	Uduji	59005	4	s.uduji005@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Uduji, Somtochukwu Daniel	f	\N
6646	Daniel	Umana	59069	4	d.umana069@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Umana, Daniel Anthony	f	\N
6647	Prevailer	Umejesi	58678	4	p.umejesi678@cvuhsd.org	15	F	9	E-107	Takamoto, Jason K.	Umejesi, Prevailer Uchenna	f	\N
6648	Christopher	Urbano	58208	4	c.urbano208@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Urbano, Christopher	f	\N
6649	Steven	Urbina	59245	4	s.urbina245@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Urbina, Steven	f	\N
6650	O'lee Arthur	Usherstarks	59207	4	o.usherstarks207@cvuhsd.org	15	M	9	C-106	Howard Johnson, Crystal	Usherstarks, O'lee Arthur Francis Miracle	f	\N
6651	Dylan	Uvidia Salazar	57754	4	d.uvidiasalazar754@cvuhsd.org	15	M	9	D-105	Lesan, Kristine M	Uvidia Salazar, Dylan Joel	f	\N
6652	Isaac	Valdivia	58377	4	i.valdivia377@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Valdivia, Isaac Alexander	f	\N
6653	Izel	Valdovinos	58528	4	i.valdovinos528@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Valdovinos, Izel	f	\N
6654	Jayleen	Valenzuela	58661	4	j.valenzuela661@cvuhsd.org	15	F	9	D-108	Infante Razo, Carlos	Valenzuela, Jayleen Gisselle	f	\N
6655	Elmer	Valladares Ventura	58059	4	e.valladaresventu059@cvuhsd.org	15	M	9	E-107	Takamoto, Jason K.	Valladares Ventura, Elmer Eliezer	f	\N
6656	Pamela	Vallejo Ramirez	58607	4	p.vallejoramirez607@cvuhsd.org	15	F	9	D-207	Gonzalez, Deborah A	Vallejo Ramirez, Pamela Guadalup	f	\N
6657	Andres	Vallejo	59163	4	a.vallejo163@cvuhsd.org	15	M	9	M-213	Morin, Jasmine	Vallejo, Andres Jhovanny	f	\N
6658	Ethan	Vasquez	59047	4	e.vasquez047@cvuhsd.org	15	M	9	C-106	Howard Johnson, Crystal	Vasquez, Ethan Abel	f	\N
6659	Isabella	Vasquez	57682	4	i.vasquez682@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Vasquez, Isabella Ashley	f	\N
6660	Mia	Vazquez	58503	4	m.vazquez503@cvuhsd.org	15	F	9	K-115	Poland, Susan M.	Vazquez, Mia Alexa	f	\N
6661	Jay'vee	Vercher	59011	4	j.vercher011@cvuhsd.org	15	M	9	K-202	Allen, Richard E	Vercher, Jay'vee Kwane	f	\N
6662	Ivan	Verdugo	58338	4	i.verdugo338@cvuhsd.org	15	M	9	G-101	Galt, Douglas S	Verdugo, Ivan	f	\N
6663	Damien	Villalobos	57726	4	d.villalobos726@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Villalobos, Damien Alberto	f	\N
6664	Andrew	Villalta	58459	4	a.villalta459@cvuhsd.org	15	M	9	GYM	Jones, Isiah J	Villalta, Andrew Jeremiah	f	\N
6665	Marcus	Waters	58148	4	m.waters148@cvuhsd.org	15	M	9	L-102	Farkouh, Raphael M.	Waters, Marcus Donell-Ray	f	\N
6666	Ashannie	Webster	59008	4	a.webster008@cvuhsd.org	15	F	9	M-213	Morin, Jasmine	Webster, Ashannie Kimara	f	\N
6667	Amiyah	Williams	58339	4	a.williams339@cvuhsd.org	15	F	9	M-213	Traylor, Dean S.	Williams, Amiyah Amor	f	\N
6668	Jayvon'tay	Williams	58950	4	j.williams950@cvuhsd.org	15	M	9	L-201	Haynes, Cordell	Williams, Jayvon'tay Elijah	f	\N
6669	Emilia	Zinko	59293	4	e.zinko293@cvuhsd.org	15	F	9	C-106	Howard Johnson, Crystal	Zinko, Emilia	f	\N
6670	Ivanna	Zuniga-Alvarez	58120	4	i.zunigaalvarez120@cvuhsd.org	15	F	9	GYM	Jones, Isiah J	Zuniga-Alvarez, Ivanna	f	\N
6671	Janny	Acevedo	56513	4	j.acevedo513@cvuhsd.org	15	F	10	D-101	Fikes, Leyla T	Acevedo, Janny Lisseth	f	\N
6672	Andrea	Aceves	57079	4	a.aceves079@cvuhsd.org	15	F	10	L-103	Castillo, Amy	Aceves, Andrea	f	\N
6673	Tavon	Adams	59309	4	t.adams309@cvuhsd.org	15	M	10	K-202	Allen, Richard E	Adams, Tavon Edward	f	\N
6674	Tomas	Ajanel Calderon	56614	4	t.ajanelcalderon614@cvuhsd.org	15	M	10	D-104	Gonzalez, Anthony	Ajanel Calderon, Tomas Ismael	f	\N
6675	Brytanny	Alcantara Gomez	55693	4	b.alcantaragomez693@cvuhsd.org	15	F	10	M-102	Swain, James L.	Alcantara Gomez, Brytanny Maibet	f	\N
6676	Randy	Alcaraz	58906	4	r.alcaraz906@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Alcaraz, Randy	f	\N
6677	Melisa	Alfaro	57834	4	m.alfaro834@cvuhsd.org	15	F	10	D-204	Fuchs, Frank J	Alfaro, Melisa	f	\N
6678	Shannon	Allen	56172	4	s.allen172@cvuhsd.org	15	F	10	C-215	Barnes, Daniel R.	Allen, Shannon Makela Marie	f	\N
6679	Lizeth	Altamirano	56458	4	l.altamirano458@cvuhsd.org	15	F	10	GYM	Phillips, Morris L	Altamirano, Lizeth	f	\N
6680	Eduardo	Alvarez Rivas	56208	4	e.alvarezrivas208@cvuhsd.org	15	M	10	K-116	Giron, Jovana J	Alvarez Rivas, Eduardo Jahir	f	\N
6681	Alejandro	Alvarez	55695	4	a.alvarez695@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Alvarez, Alejandro Arturo	f	\N
6682	Arabella	Alvarez	58694	4	a.alvarez694@cvuhsd.org	15	F	10	GYM	Phillips, Morris L	Alvarez, Arabella Angelic	f	\N
6683	Isidro	Amador	57185	4	i.amador185@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Amador, Isidro Jayden	f	\N
6684	Prince	Amerson	57033	4	p.amerson033@cvuhsd.org	15	M	10	D-104	Gonzalez, Anthony	Amerson, Prince Luis	f	\N
6685	Tiffany	Andrade	56132	4	t.andrade132@cvuhsd.org	15	F	10	D-202	Contarsy, Dayne	Andrade, Tiffany	f	\N
6686	Bettina	Anekwe Godwin	56284	4	b.anekwegodwin284@cvuhsd.org	15	F	10	M-102	Swain, James L.	Anekwe Godwin, Bettina Chiasokam	f	\N
6687	Roberto	Angulo	56369	4	r.angulo369@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Angulo, Roberto	f	\N
6688	Jade	Anicama Pastrana	55962	4	j.anicamapastrana962@cvuhsd.org	15	F	10	L-103	Castillo, Amy	Anicama Pastrana, Jade Brisa	f	\N
6689	Jude	Anubalu	56159	4	j.anubalu159@cvuhsd.org	15	M	10	M-110	Segovia, Jose M	Anubalu, Jude Chiemelie	f	\N
6690	Anabella	Arana	56016	4	a.arana016@cvuhsd.org	15	F	10	D-204	Fuchs, Frank J	Arana, Anabella	f	\N
6691	Joaquin	Arana	56017	4	j.arana017@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Arana, Joaquin	f	\N
6692	Jasmine	Arias	59296	4	j.arias296@cvuhsd.org	15	F	10	M-111	Valencia, Sandra	Arias, Jasmine Annalys	f	\N
6693	Natalie	Avalos	56748	4	n.avalos748@cvuhsd.org	15	F	10	D-204	Fuchs, Frank J	Avalos, Natalie Jissel	f	\N
6694	Allysson	Avalos-Flores	56261	4	a.avalosflores261@cvuhsd.org	15	F	10	GYM	Phillips, Morris L	Avalos-Flores, Allysson Michelle	f	\N
6695	Jade	Ayala Cardona	56405	4	j.ayalacardona405@cvuhsd.org	15	F	10	L-104	Najarro, Claudia	Ayala Cardona, Jade Michelle	f	\N
6696	Jacob	Baires	56563	4	j.baires563@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Baires, Jacob Nicholas	f	\N
6697	Julissa	Bakzin	56273	4	j.bakzin273@cvuhsd.org	15	F	10	L-202	Isozaki, Jonathan	Bakzin, Julissa Angelina	f	\N
6698	Jane	Balderas	58384	4	j.balderas384@cvuhsd.org	15	F	10	L-202	Isozaki, Jonathan	Balderas, Jane	f	\N
6699	Carlos	Barajas	59269	4	c.barajas269@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Barajas, Carlos	f	\N
6700	Valerie	Barcenas	55702	4	v.barcenas702@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Barcenas, Valerie	f	\N
6701	Katherine	Barillas	56199	4	k.barillas199@cvuhsd.org	15	F	10	K-117	Gutierrez, Veronica	Barillas, Katherine Analie	f	\N
6702	Reily	Barrera Garcia	56289	4	r.barreragarcia289@cvuhsd.org	15	M	10	L-103	Castillo, Amy	Barrera Garcia, Reily Jose	f	\N
6703	Richard	Barrientos	56315	4	r.barrientos315@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Barrientos, Richard Albert	f	\N
6704	Delailah	Barrios	56236	4	d.barrios236@cvuhsd.org	15	F	10	K-117	Gutierrez, Veronica	Barrios, Delailah Marlyn	f	\N
6705	Adan	Barron	56931	4	a.barron931@cvuhsd.org	15	M	10	L-204	Ishii, Emily	Barron, Adan Ethan	f	\N
6706	Melanie	Becerra	56692	4	m.becerra692@cvuhsd.org	15	F	10	D-204	Fuchs, Frank J	Becerra, Melanie	f	\N
6707	Steven	Beck	57127	4	s.beck127@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Beck, Steven	f	\N
6708	Jesse	Bedolla	56932	4	j.bedolla932@cvuhsd.org	15	M	10	M-116	Juarez Fuertes, Judy	Bedolla, Jesse Ruben	f	\N
6709	Nahum	Belette	55767	4	n.belette767@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Belette, Nahum	f	\N
6710	Kaleb	Benavides	56636	4	k.benavides636@cvuhsd.org	15	M	10	D-204	Fuchs, Frank J	Benavides, Kaleb Santiago	f	\N
6711	Briana	Benitez Cedillos	56736	4	b.benitezcedillos736@cvuhsd.org	15	F	10	C-215	Barnes, Daniel R.	Benitez Cedillos, Briana Gissell	f	\N
6712	Sasha	Benitez Ortiz	56350	4	s.benitezortiz350@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Benitez Ortiz, Sasha	f	\N
6713	Haylee	Berben	55719	4	h.berben719@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Berben, Haylee Marie	f	\N
6714	Aviantay	Berry	57421	4	a.berry421@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Berry, Aviantay Nehemiah	f	\N
6715	Julio	Boudreault	56526	4	j.boudreault526@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Boudreault, Julio Oliver	f	\N
6716	Anthony	Bravieri	57015	4	a.bravieri015@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Bravieri, Anthony Vincent	f	\N
6717	Collin	Brooks	56104	4	c.brooks104@cvuhsd.org	15	M	10	L-204	Ishii, Emily	Brooks, Collin Joseph	f	\N
6718	Billy	Brown	57219	4	b.brown219@cvuhsd.org	15	M	10	M-112	Barahona, Iris	Brown, Billy Lavel	f	\N
6719	Laidon	Butcher	57204	4	l.butcher204@cvuhsd.org	15	F	10	M-102	Swain, James L.	Butcher, Laidon	f	\N
6720	Tristan	Cabudol Mikel	57092	4	t.cabudolmikel092@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Cabudol Mikel, Tristan Jaremiah	f	\N
6721	Lauren	Caceros	56317	4	l.caceros317@cvuhsd.org	15	F	10	M-102	Swain, James L.	Caceros, Lauren Giselle	f	\N
6722	Ruben	Camel Martinez	56432	4	r.camelmartinez432@cvuhsd.org	15	M	10	K-117	Gutierrez, Veronica	Camel Martinez, Ruben Gabriel	f	\N
6723	Joseph	Campos	56057	4	j.campos057@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Campos, Joseph	f	\N
6724	Genesis	Canas	56970	4	g.canas970@cvuhsd.org	15	F	10	D-204	Fuchs, Frank J	Canas, Genesis Giselle	f	\N
6725	Yamile	Canil	56125	4	y.canil125@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Canil, Yamile Moncerrat	f	\N
6726	John	Cannon	56254	4	j.cannon254@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Cannon, John Earl	f	\N
6727	Damianne	Canul	56296	4	d.canul296@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Canul, Damianne Albert	f	\N
6728	Joseph	Cardenas	55703	4	j.cardenas703@cvuhsd.org	15	M	10	D-204	Fuchs, Frank J	Cardenas, Joseph Michael	f	\N
6729	Kevin	Cardenas	56971	4	k.cardenas971@cvuhsd.org	15	M	10	G-101	Galt, Douglas S	Cardenas, Kevin Estuardo	f	\N
6730	Emma	Carmona	56917	4	e.carmona917@cvuhsd.org	15	F	10	K-117	Gutierrez, Veronica	Carmona, Emma Aileen	f	\N
6731	Melany	Carmona-Alvarado	57364	4	m.carmonaalvarado364@cvuhsd.org	15	F	10	M-116	Juarez Fuertes, Judy	Carmona-Alvarado, Melany	f	\N
6732	Jordan	Carranza	56318	4	j.carranza318@cvuhsd.org	15	M	10	M-111	Valencia, Sandra	Carranza, Jordan Michael	f	\N
6733	Jesus	Carrasco	57264	4	j.carrasco264@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Carrasco, Jesus Edmundo	f	\N
6734	Nicole	Carrasco	56014	4	n.carrasco014@cvuhsd.org	15	F	10	M-117	Tarkington, Cole	Carrasco, Nicole	f	\N
6735	Julio	Carrillo	57111	4	j.carrillo111@cvuhsd.org	15	M	10	M-215	Sanchez, Nicolas	Carrillo, Julio Sebastian	f	\N
6787	Julian	Espericueta	56534	4	j.espericueta534@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Espericueta, Julian Jean	f	\N
6736	Emiliano	Carrillo-Gonzalez	56155	4	e.carrillogonzale155@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Carrillo-Gonzalez, Emiliano	f	\N
6737	Addison	Carter	56319	4	a.carter319@cvuhsd.org	15	F	10	L-202	Isozaki, Jonathan	Carter, Addison Lynne	f	\N
6738	Andrew	Castaneda	56360	4	a.castaneda360@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Castaneda, Andrew Jaiden	f	\N
6739	Ian	Castaneda	56371	4	i.castaneda371@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Castaneda, Ian Amauri	f	\N
6740	Julian	Castaneda	56590	4	j.castaneda590@cvuhsd.org	15	M	10	D-104	Gonzalez, Anthony	Castaneda, Julian Anthony	f	\N
6741	Andrew	Castaneda-Pulliam	58624	4	a.castanedapulli624@cvuhsd.org	15	M	10	K-116	Giron, Jovana J	Castaneda-Pulliam, Andrew David	f	\N
6742	Rodrigo	Castillo	56314	4	r.castillo314@cvuhsd.org	15	M	10	D-104	Gonzalez, Anthony	Castillo, Rodrigo Alberto	f	\N
6743	Jocelyn	Castro Castro	57765	4	j.castrocastro765@cvuhsd.org	15	F	10	D-101	Fikes, Leyla T	Castro Castro, Jocelyn Aislinn	f	\N
6744	Anthony	Castro	57115	4	a.castro115@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Castro, Anthony	f	\N
6745	Christian	Castro	57017	4	c.castro017@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Castro, Christian Daniel	f	\N
6746	Emily	Castro	56079	4	e.castro079@cvuhsd.org	15	F	10	K-117	Gutierrez, Veronica	Castro, Emily Guadalupe	f	\N
6747	Joshua	Castro	56974	4	j.castro974@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Castro, Joshua Joseph	f	\N
6748	Noah	Castro	56085	4	n.castro085@cvuhsd.org	15	M	10	M-111	Valencia, Sandra	Castro, Noah Fernando Oswaldo	f	\N
6749	Orlin	Cativo Andrade	56259	4	o.cativoandrade259@cvuhsd.org	15	M	10	D-204	Fuchs, Frank J	Cativo Andrade, Orlin Jaffeth	f	\N
6750	Alexander	Cazares	57103	4	a.cazares103@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Cazares, Alexander	f	\N
6751	Christian	Cazares	57104	4	c.cazares104@cvuhsd.org	15	M	10	M-110	Segovia, Jose M	Cazares, Christian	f	\N
6752	Wendy	Cedillo Del Valle	57344	4	w.cedillodelvalle344@cvuhsd.org	15	F	10	K-116	Giron, Jovana J	Cedillo Del Valle, Wendy Estrella	f	\N
6753	Jose	Cerda Mendoza	56069	4	j.cerdamendoza069@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Cerda Mendoza, Jose	f	\N
6754	Diego	Ceron	56811	4	d.ceron811@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Ceron, Diego Alberto	f	\N
6755	Daniel	Cervantes Barajas	56735	4	d.cervantesbaraja735@cvuhsd.org	15	M	10	D-204	Fuchs, Frank J	Cervantes Barajas, Daniel Esteban	f	\N
6756	Alina	Cervantes	56037	4	a.cervantes037@cvuhsd.org	15	F	10	C-214	Abrahams, Thomas L.	Cervantes, Alina	f	\N
6757	Anthony	Chacon	56238	4	a.chacon238@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Chacon, Anthony Mauricio	f	\N
6758	Cristian	Chavez Ponce	55782	4	c.chavezponce782@cvuhsd.org	15	M	10	K-117	Gutierrez, Veronica	Chavez Ponce, Cristian	f	\N
6759	Brayan	Chavez	57265	4	b.chavez265@cvuhsd.org	15	M	10	M-116	Juarez Fuertes, Judy	Chavez, Brayan	f	\N
6760	Yvette	Chavez	56222	4	y.chavez222@cvuhsd.org	15	F	10	D-204	Fuchs, Frank J	Chavez, Yvette Adriana	f	\N
6761	Tehila	Chinakwe	56106	4	t.chinakwe106@cvuhsd.org	15	F	10	K-117	Gutierrez, Veronica	Chinakwe, Tehila Chimerelem	f	\N
6762	Heidy	Chipana	57902	4	h.chipanachipana902@cvuhsd.org	15	F	10	D-101	Fikes, Leyla T	Chipana, Heidy Kimiko	f	\N
6763	Payton	Chonay Tapia	57974	4	p.chonaytapia974@cvuhsd.org	15	M	10	D-101	Fikes, Leyla T	Chonay Tapia, Payton Anthony Jair	f	\N
6764	Loyda	Chumil Ixtos	57085	4	l.chumilixtoc085@cvuhsd.org	15	F	10	D-105	Lesan, Kristine M	Chumil Ixtos, Loyda Maria	f	\N
6765	Avonna	Cleveland	57116	4	a.cleveland116@cvuhsd.org	15	F	10	M-102	Swain, James L.	Cleveland, Avonna Anjeannette	f	\N
6766	Katelyn	Cobian	55956	4	k.cobian956@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Cobian, Katelyn Isabelle	f	\N
6767	Valeria	Coca	55665	4	v.coca665@cvuhsd.org	15	F	10	M-102	Swain, James L.	Coca, Valeria Roxette	f	\N
6768	Valerie	Cornejo-Lopez	56601	4	v.cornejolopez601@cvuhsd.org	15	F	10	D-204	Fuchs, Frank J	Cornejo-Lopez, Valerie Thelma	f	\N
6769	Nicolas	Corral	57019	4	n.corral019@cvuhsd.org	15	M	10	D-204	Fuchs, Frank J	Corral, Nicolas Jonathan	f	\N
6770	Octavio	Cortes	56773	4	o.cortes773@cvuhsd.org	15	M	10	M-215	Morris, Dorothy E	Cortes, Octavio Geovany	f	\N
6771	Krystal	Coyote	58163	4	k.coyote163@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Coyote, Krystal Monique	f	\N
6772	Aaron	Cruz	56361	4	a.cruz361@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Cruz, Aaron	f	\N
6773	Thomas	Cruz	56935	4	t.cruz935@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Cruz, Thomas	f	\N
6774	Davion	Curtiss	56937	4	d.curtiss937@cvuhsd.org	15	M	10	K-105	Gonzalez, Alejandra	Curtiss, Davion Keith	f	\N
6775	Israel	Cutz Gonzalez	56913	4	i.cutzgonzalez913@cvuhsd.org	15	M	10	M-102	Swain, James L.	Cutz Gonzalez, Israel	f	\N
6776	Lindsay	Davila	56130	4	l.davila130@cvuhsd.org	15	F	10	K-117	Gutierrez, Veronica	Davila, Lindsay	f	\N
6777	Adrian	Del Cid	57020	4	a.delcid020@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Del Cid, Adrian Efer	f	\N
6778	Miley	Del Cid	56176	4	m.delcid176@cvuhsd.org	15	F	10	I-2	Pimentel, Carlina	Del Cid, Miley	f	\N
6779	Brianna	Diaz Mariscal	57183	4	b.diazmariscal183@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Diaz Mariscal, Brianna	f	\N
6780	Ethan	Donis	57132	4	e.donis132@cvuhsd.org	15	M	10	K-116	Giron, Jovana J	Donis, Ethan Isaiah	f	\N
6781	Samuel	Escalera Campos	57095	4	s.escaleracampos095@cvuhsd.org	15	M	10	L-103	Castillo, Amy	Escalera Campos, Samuel	f	\N
6782	Patricia	Escobar	56141	4	p.escobar141@cvuhsd.org	15	F	10	M-116	Juarez Fuertes, Judy	Escobar, Patricia Cindy	f	\N
6783	Jayden	Escobar-Ortiz	56441	4	j.escobarortiz441@cvuhsd.org	15	M	10	M-215	Morris, Dorothy E	Escobar-Ortiz, Jayden Joshua	f	\N
6784	Juan	Escobedo Ortiz	56708	4	j.escobedoortiz708@cvuhsd.org	15	M	10	M-102	Swain, James L.	Escobedo Ortiz, Juan David	f	\N
6785	Genesis	Esparza	56188	4	g.esparza188@cvuhsd.org	15	F	10	C-214	Abrahams, Thomas L.	Esparza, Genesis	f	\N
6786	Natalia	Esparza	56042	4	n.esparza042@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Esparza, Natalia Ruby	f	\N
6788	Emma	Espindola	56025	4	e.espindola025@cvuhsd.org	15	F	10	C-215	Barnes, Daniel R.	Espindola, Emma Lynn	f	\N
6789	Isaiah	Espinoza	56707	4	i.espinoza707@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Espinoza, Isaiah Vidal	f	\N
6790	Joshua	Estrada Moran	57375	4	j.estradamoran375@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Estrada Moran, Joshua Dylan	f	\N
6791	Camryn	Estrada	56450	4	c.estrada450@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Estrada, Camryn James	f	\N
6792	Angel	Estrella Uicab	57155	4	a.estrellauicab155@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Estrella Uicab, Angel Jacob	f	\N
6793	Jaazzimir	Fields	57021	4	j.fields021@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Fields, Jaazzimir Desean	f	\N
6794	Andrew	Fletes	56135	4	a.fletes135@cvuhsd.org	15	M	10	D-104	Gonzalez, Anthony	Fletes, Andrew	f	\N
6795	Henesys	Flores	57081	4	h.flores081@cvuhsd.org	15	F	10	C-215	Barnes, Daniel R.	Flores, Henesys Samantha	f	\N
6796	Simione	Fonua	57117	4	s.fonua117@cvuhsd.org	15	M	10	M-215	Morris, Dorothy E	Fonua, Simione Alexander Pouha	f	\N
6797	John	Franco	56706	4	j.franco706@cvuhsd.org	15	M	10	M-102	Swain, James L.	Franco, John Mike	f	\N
6798	Eliazar	Fuentes Gonzalez	56980	4	e.fuentesgonzalez980@cvuhsd.org	15	M	10	K-116	Giron, Jovana J	Fuentes Gonzalez, Eliazar Wosbeli	f	\N
6799	Jacob	Galang	57129	4	j.galang129@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Galang, Jacob Isaac	f	\N
6800	Jimmy	Galindo Cardona	56251	4	j.galindocardona251@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Galindo Cardona, Jimmy Eduardo	f	\N
6801	Heidi	Galindo	56028	4	h.galindo028@cvuhsd.org	15	F	10	D-202	Contarsy, Dayne	Galindo, Heidi Avigail	f	\N
6802	Ahtziry	Gallardo Valenzuela	56509	4	a.gallardovalenzu509@cvuhsd.org	15	F	10	D-202	Contarsy, Dayne	Gallardo Valenzuela, Ahtziry Teresita	f	\N
6803	Kimberly	Gallardo	56421	4	k.gallardo421@cvuhsd.org	15	F	10	L-103	Castillo, Amy	Gallardo, Kimberly	f	\N
6804	Juan	Garcia De Leon	56545	4	j.garciadeleon545@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Garcia De Leon, Juan Jose	f	\N
6805	Damian	Garcia	57131	4	d.garcia131@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Garcia, Damian Geovanny	f	\N
6806	Haylie	Garcia	56179	4	h.garcia179@cvuhsd.org	15	F	10	M-215	Sanchez, Nicolas	Garcia, Haylie Michelle	f	\N
6807	Marcos	Garcia	56589	4	m.garcia589@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Garcia, Marcos Antonio	f	\N
6808	Santiago	Garcia	56140	4	s.garcia140@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Garcia, Santiago	f	\N
6809	Sayavela	Garcia	56211	4	s.garcia211@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Garcia, Sayavela Star	f	\N
6810	Yulissa	Garcia	56246	4	y.garcia246@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Garcia, Yulissa	f	\N
6811	Richard	Gilliam	57377	4	r.gilliam377@cvuhsd.org	15	M	10	M-113	Aispuro, Mayte	Gilliam, Richard Rufus	f	\N
6812	Youssef	Girgis	56452	4	y.girgis452@cvuhsd.org	15	M	10	D-104	Gonzalez, Anthony	Girgis, Youssef Maged Farag Fahim	f	\N
6813	Glenda	Gomez Barrera	57968	4	g.gomezbarrera968@cvuhsd.org	15	F	10	GYM	Phillips, Morris L	Gomez Barrera, Glenda Nayeli	f	\N
6814	Steven	Gomez Carrillo	56260	4	s.gomezcarrillo260@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Gomez Carrillo, Steven	f	\N
6815	Marlen	Gomez Castaneda	56514	4	m.gomezcastaneda514@cvuhsd.org	15	F	10	D-202	Contarsy, Dayne	Gomez Castaneda, Marlen	f	\N
6816	Justin	Gomez Vasquez	57321	4	j.gomezvasquez321@cvuhsd.org	15	M	10	F-107	Rice, Christopher A.	Gomez Vasquez, Justin Jared	f	\N
6817	Lucy	Gomez Villatoro	56557	4	l.gomezvillatoro557@cvuhsd.org	15	F	10	I-2	Pimentel, Carlina	Gomez Villatoro, Lucy Valentina	f	\N
6818	Emily	Gomez	56154	4	e.gomez154@cvuhsd.org	15	F	10	K-117	Gutierrez, Veronica	Gomez, Emily Margarita	f	\N
6819	Humberto	Gomez	55781	4	h.gomez781@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Gomez, Humberto	f	\N
6820	Jaden	Gomez-Avalos	55714	4	j.gomezavalos714@cvuhsd.org	15	M	10	M-102	Swain, James L.	Gomez-Avalos, Jaden Taylor	f	\N
6821	Irene	Gonzalez Boleres	57139	4	i.gonzalezboleres139@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Gonzalez Boleres, Irene Getzemani	f	\N
6822	Rafael	Gonzalez Gonzalez	57100	4	r.gonzalezgonzale100@cvuhsd.org	15	M	10	D-204	Fuchs, Frank J	Gonzalez Gonzalez, Rafael	f	\N
6823	Luis	Gonzalez Romero	56355	4	l.gonzalezromero355@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Gonzalez Romero, Luis Angel	f	\N
6824	Andrew	Gonzalez	56579	4	a.gonzalez579@cvuhsd.org	15	M	10	M-215	Sanchez, Nicolas	Gonzalez, Andrew Royce	f	\N
6825	Carlos	Gonzalez	55809	4	c.gonzalez809@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Gonzalez, Carlos Simon	f	\N
6826	Izabell	Gonzalez	56734	4	i.gonzalez734@cvuhsd.org	15	F	10	M-102	Swain, James L.	Gonzalez, Izabell	f	\N
6827	Jacob	Gonzalez	56459	4	j.gonzalez459@cvuhsd.org	15	M	10	M-102	Swain, James L.	Gonzalez, Jacob Michael	f	\N
6828	Josiah	Gonzalez	57544	4	j.gonzalez544@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Gonzalez, Josiah Leonadius	f	\N
6829	Marissa	Gonzalez	56393	4	m.gonzalez393@cvuhsd.org	15	F	10	M-215	Morris, Dorothy E	Gonzalez, Marissa Trinidad	f	\N
6830	Rafael	Gonzalez	57793	4	r.gonzalez793@cvuhsd.org	15	M	10	M-215	Sanchez, Nicolas	Gonzalez, Rafael	f	\N
6831	Yara	Gonzalez	56195	4	y.gonzalez195@cvuhsd.org	15	F	10	D-202	Contarsy, Dayne	Gonzalez, Yara	f	\N
6832	Yurem	Gonzalez	57314	4	y.gonzalez314@cvuhsd.org	15	M	10	M-114	Garcia, Manuel	Gonzalez, Yurem Roberto	f	\N
6833	Jordan	Grado	56547	4	j.grado547@cvuhsd.org	15	M	10	M-102	Swain, James L.	Grado, Jordan Alexander	f	\N
6834	Luis	Granados	56558	4	l.granados558@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Granados, Luis David	f	\N
6835	Jonah	Gray	56549	4	j.gray549@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Gray, Jonah Edward	f	\N
6836	Seairah-Joy	Green	56738	4	s.green738@cvuhsd.org	15	F	10	M-112	Barahona, Iris	Green, Seairah-Joy Trenae	f	\N
6837	Darali	Guardado Ruiz	56110	4	d.guardadoruiz110@cvuhsd.org	15	F	10	D-204	Fuchs, Frank J	Guardado Ruiz, Darali Sophia	f	\N
6838	Kaylah	Guerra	57190	4	k.guerra190@cvuhsd.org	15	F	10	M-102	Swain, James L.	Guerra, Kaylah Maria	f	\N
6839	Alexis	Guerra-Rivas	57408	4	a.guerrarivas408@cvuhsd.org	15	X	10	D-204	Fuchs, Frank J	Guerra-Rivas, Alexis Antonio	f	\N
6840	Adrian	Guido	56944	4	a.guido944@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Guido, Adrian Antonio	f	\N
6841	Chastelyn	Gutierrez Gonzalez	57001	4	c.gutierrezgonzal001@cvuhsd.org	15	F	10	I-2	Pimentel, Carlina	Gutierrez Gonzalez, Chastelyn Aileen	f	\N
6842	Yamilex	Gutierrez	56730	4	y.gutierrez730@cvuhsd.org	15	F	10	GYM	Phillips, Morris L	Gutierrez, Yamilex	f	\N
6843	Angel	Guzman Campos	56731	4	a.guzmancampos731@cvuhsd.org	15	M	10	M-102	Swain, James L.	Guzman Campos, Angel Josue	f	\N
6844	Brallan	Guzman Juarez	58891	4	b.guzmanjuarez891@cvuhsd.org	15	F	10	L-103	Castillo, Amy	Guzman Juarez, Brallan Ribai	f	\N
6845	Kristal	Guzman Juarez	56332	4	k.guzmanjuarez332@cvuhsd.org	15	F	10	C-215	Barnes, Daniel R.	Guzman Juarez, Kristal Lidia	f	\N
6846	Camila	Guzman Renderos	57632	4	c.guzmanrenderos632@cvuhsd.org	15	F	10	I-2	Pimentel, Carlina	Guzman Renderos, Camila Fernanda	f	\N
6847	Jaime	Guzman	55712	4	j.guzman712@cvuhsd.org	15	M	10	D-204	Fuchs, Frank J	Guzman, Jaime Jr.	f	\N
6848	Saul	Guzman-Burciaga	56023	4	s.guzmanburciaga023@cvuhsd.org	15	M	10	M-215	Morris, Dorothy E	Guzman-Burciaga, Saul Ernesto	f	\N
6849	Vanessa	Guzman-Burciaga	56022	4	v.guzmanburciaga022@cvuhsd.org	15	F	10	C-214	Abrahams, Thomas L.	Guzman-Burciaga, Vanessa Valeria	f	\N
6850	Bahaeldin	Hamad	56494	4	b.hamad494@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Hamad, Bahaeldin	f	\N
6851	Jeremy	Hearn	56846	4	j.hearn846@cvuhsd.org	15	M	10	D-104	Gonzalez, Anthony	Hearn, Jeremy Tre'veon	f	\N
6852	Terrell	Henry	56420	4	t.henry420@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Henry, Terrell Damar	f	\N
6853	Miguel	Hernandez Amezquita	56854	4	m.hernandezamezqu854@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Hernandez Amezquita, Miguel	f	\N
6854	Cynthia	Hernandez Delgado	56365	4	c.hernandezdelgad365@cvuhsd.org	15	F	10	D-202	Contarsy, Dayne	Hernandez Delgado, Cynthia Guadalupe	f	\N
6855	Annette	Hernandez Escamilla	57339	4	a.hernandezescami339@cvuhsd.org	15	F	10	M-215	Morris, Dorothy E	Hernandez Escamilla, Annette	f	\N
6856	Daniela	Hernandez Gomez	56782	4	d.hernandezgomez782@cvuhsd.org	15	F	10	GYM	Phillips, Morris L	Hernandez Gomez, Daniela Noemi	f	\N
6857	Bryan	Hernandez Lopez	57366	4	b.hernandezlopez366@cvuhsd.org	15	M	10	J-118	Gray, Ron	Hernandez Lopez, Bryan Nicolas	f	\N
6858	Elisa	Hernandez	57187	4	e.hernandez187@cvuhsd.org	15	F	10	D-204	Fuchs, Frank J	Hernandez, Elisa Esperanza	f	\N
6859	Johnathan	Hernandez	56490	4	j.hernandez490@cvuhsd.org	15	M	10	D-204	Fuchs, Frank J	Hernandez, Johnathan	f	\N
6860	Liana	Hernandez	56754	4	l.hernandez754@cvuhsd.org	15	F	10	D-204	Fuchs, Frank J	Hernandez, Liana Eileen	f	\N
6861	Mathew	Hernandez	56204	4	m.hernandez204@cvuhsd.org	15	M	10	M-118	Aguilar Hernandez, Leslie	Hernandez, Mathew	f	\N
6862	Paloma	Hernandez	56495	4	p.hernandez495@cvuhsd.org	15	F	10	D-202	Contarsy, Dayne	Hernandez, Paloma Sareth	f	\N
6863	Valeria	Hernandez	56595	4	v.hernandez595@cvuhsd.org	15	F	10	M-102	Swain, James L.	Hernandez, Valeria Guadalupe	f	\N
6864	Alberto	Hernandez-Fuentes	57627	4	a.hernandezfuente627@cvuhsd.org	15	M	10	G-101	Galt, Douglas S	Hernandez-Fuentes, Alberto	f	\N
6865	Eduardo	Hernandez-Fuentes	57628	4	e.hernandezfuente628@cvuhsd.org	15	M	10	D-204	Fuchs, Frank J	Hernandez-Fuentes, Eduardo	f	\N
6866	Yahaira	Hernandez-Garcia	56134	4	y.hernandezgarcia134@cvuhsd.org	15	F	10	C-214	Abrahams, Thomas L.	Hernandez-Garcia, Yahaira	f	\N
6867	Alexis	Herrera	57388	4	a.herrera388@cvuhsd.org	15	F	10	M-215	Morris, Dorothy E	Herrera, Alexis Rocio	f	\N
6868	Evelyn	Herrera	56819	4	e.herrera819@cvuhsd.org	15	F	10	D-202	Contarsy, Dayne	Herrera, Evelyn Samantha	f	\N
6869	Hector	Herrera	56921	4	h.herrera921@cvuhsd.org	15	M	10	L-103	Castillo, Amy	Herrera, Hector	f	\N
6870	Allen	Hicks	56471	4	a.hicks471@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Hicks, Allen David	f	\N
6871	Estevan	Holguin	56915	4	e.holguin915@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Holguin, Estevan Gael	f	\N
6872	Amy	Ibarra	58883	4	a.ibarra883@cvuhsd.org	15	F	10	M-102	Swain, James L.	Ibarra, Amy Stella	f	\N
6873	Ashley	Ibarra	56307	4	a.ibarra307@cvuhsd.org	15	F	10	D-202	Contarsy, Dayne	Ibarra, Ashley Lucia	f	\N
6874	Justin	Ibarra	57112	4	j.ibarra112@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Ibarra, Justin	f	\N
6875	Alexander	Iniguez	57087	4	a.iniguez087@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Iniguez, Alexander	f	\N
6876	David	Israel	56623	4	d.israel623@cvuhsd.org	15	M	10	G-101	Galt, Douglas S	Israel, David Oghenetega	f	\N
6877	Elias	Istazuy	56166	4	e.istazuy166@cvuhsd.org	15	M	10	M-102	Swain, James L.	Istazuy, Elias Abraham	f	\N
6878	Omar	Jameel	56802	4	o.jameel802@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Jameel, Omar Warithudeen	f	\N
6879	Makayah	Johnson	57093	4	m.johnson093@cvuhsd.org	15	F	10	GYM	Phillips, Morris L	Johnson, Makayah Ann Marie	f	\N
6880	Zyon	Jones	57528	4	z.jones528@cvuhsd.org	15	M	10	D-104	Gonzalez, Anthony	Jones, Zyon Alexander	f	\N
6881	Melanie	Juan	57310	4	m.juan310@cvuhsd.org	15	F	10	K-105	Gonzalez, Alejandra	Juan, Melanie	f	\N
6882	Cristofer	Juarez	56507	4	c.juarez507@cvuhsd.org	15	M	10	M-102	Swain, James L.	Juarez, Cristofer	f	\N
6883	Conner	June	56392	4	c.june392@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	June, Conner Jayden	f	\N
6884	Angela	Lara	58159	4	a.lara159@cvuhsd.org	15	F	10	M-111	Valencia, Sandra	Lara, Angela Neomi	f	\N
6885	Arely	Leanos	55808	4	a.leanos808@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Leanos, Arely	f	\N
6886	Nasharie	Lee	56071	4	n.lee071@cvuhsd.org	15	F	10	C-215	Barnes, Daniel R.	Lee, Nasharie Lathea-Yolon	f	\N
6887	Matthew	Lemus	59206	4	m.lemus206@cvuhsd.org	15	M	10	K-117	Gutierrez, Veronica	Lemus, Matthew Alexander	f	\N
6888	Yahir	Lesso Castaneda	56241	4	y.lessocastaneda241@cvuhsd.org	15	M	10	K-117	Gutierrez, Veronica	Lesso Castaneda, Yahir	f	\N
6889	Mariana	Leyva	56817	4	m.leyva817@cvuhsd.org	15	F	10	C-214	Abrahams, Thomas L.	Leyva, Mariana	f	\N
6890	Afumbom	Lobti	56793	4	a.lobti793@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Lobti, Afumbom Hope	f	\N
6891	Darwin	Lopez Cea	57167	4	d.lopezcea167@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Lopez Cea, Darwin Efrain	f	\N
6892	Clely	Lopez Cifuentes	56269	4	c.lopezcifuentes269@cvuhsd.org	15	F	10	I-2	Pimentel, Carlina	Lopez Cifuentes, Clely Elena	f	\N
6893	Sofia	Lopez Corea	56033	4	s.lopezcorea033@cvuhsd.org	15	F	10	L-202	Isozaki, Jonathan	Lopez Corea, Sofia	f	\N
6894	Brittany	Lopez Esteban	56293	4	b.lopezesteban293@cvuhsd.org	15	F	10	GYM	Phillips, Morris L	Lopez Esteban, Brittany Mischel	f	\N
6895	Gabriel	Lopez Lorenzana	55971	4	g.lopezlorenzana971@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Lopez Lorenzana, Gabriel	f	\N
6896	Abel	Lopez	57105	4	a.lopez105@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Lopez, Abel Alexander	f	\N
6897	Adrian	Lopez	55682	4	a.lopez682@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Lopez, Adrian Alfredo	f	\N
6898	Emily	Lopez	55927	4	e.lopez927@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Lopez, Emily Daniela	f	\N
6899	Josue	Lopez	56517	4	j.lopez517@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Lopez, Josue Daniel	f	\N
6900	Naarai	Lopez	55688	4	n.lopez688@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Lopez, Naarai Del Carmen	f	\N
6901	Nakai	Lopez	56053	4	n.lopez053@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Lopez, Nakai Manuel	f	\N
6902	Sophia	Lopez	56277	4	s.lopez277@cvuhsd.org	15	F	10	M-102	Swain, James L.	Lopez, Sophia	f	\N
6903	Valery	Lopez	57096	4	v.lopez096@cvuhsd.org	15	F	10	I-2	Pimentel, Carlina	Lopez, Valery Daniela	f	\N
6904	Alejandro	Lugo	57588	4	a.lugo588@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Lugo, Alejandro Javier	f	\N
6905	Brian	Lupio	55705	4	b.lupio705@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Lupio, Brian	f	\N
6906	Aaron	Machado Rodriguez	59044	4	a.machadorodrigu044@cvuhsd.org	15	M	10	D-204	Fuchs, Frank J	Machado Rodriguez, Aaron Joseph	f	\N
6907	Helen	Madrid Benitez	56673	4	h.madridbenitez673@cvuhsd.org	15	F	10	M-102	Swain, James L.	Madrid Benitez, Helen Michelle	f	\N
6908	Ethan	Magana	56789	4	e.magana789@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Magana, Ethan Alexander	f	\N
6909	Ferdaws	Malang Zada	56948	4	f.malangzada948@cvuhsd.org	15	M	10	M-102	Swain, James L.	Malang Zada, Ferdaws	f	\N
6910	Raquel	Mancia	56145	4	r.mancia145@cvuhsd.org	15	F	10	C-215	Barnes, Daniel R.	Mancia, Raquel Estefany	f	\N
6911	Angel	Mares	56776	4	a.mares776@cvuhsd.org	15	M	10	D-204	Fuchs, Frank J	Mares, Angel Eduardo	f	\N
6912	Santino	Mariano	56949	4	s.mariano949@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Mariano, Santino	f	\N
6913	Matthew	Marmolejo	56985	4	m.marmolejo985@cvuhsd.org	15	M	10	L-103	Castillo, Amy	Marmolejo, Matthew Hugo	f	\N
6914	Giselle	Martinez Castro	57003	4	g.martinezcastro003@cvuhsd.org	15	F	10	M-102	Swain, James L.	Martinez Castro, Giselle	f	\N
6915	Oscar	Martinez De Castro Velasco	55696	4	o.martinezdecastr696@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Martinez De Castro Velasco, Oscar Andre	f	\N
6916	Braulio	Martinez Landa	56286	4	b.martinezlanda286@cvuhsd.org	15	M	10	D-204	Fuchs, Frank J	Martinez Landa, Braulio	f	\N
6917	Ruth	Martinez Lima	57993	4	r.martinezlima993@cvuhsd.org	15	F	10	D-101	Fikes, Leyla T	Martinez Lima, Ruth Yamileth	f	\N
6918	Stiven	Martinez Lopez	56427	4	s.martinezlopez427@cvuhsd.org	15	M	10	K-216	Arangoa Ramirez, Christian	Martinez Lopez, Stiven Alexander	f	\N
6919	Adrian	Martinez	56138	4	a.martinez138@cvuhsd.org	15	M	10	M-102	Swain, James L.	Martinez, Adrian Alejandro	f	\N
6920	Jonathan	Martinez	56274	4	j.martinez274@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Martinez, Jonathan Devine	f	\N
6921	Randy	Martinez	56070	4	r.martinez070@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Martinez, Randy	f	\N
6922	Amy	Martos	56883	4	a.martos883@cvuhsd.org	15	F	10	M-102	Swain, James L.	Martos, Amy	f	\N
6923	Tyrese	Mathelus	57333	4	t.mathelus333@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Mathelus, Tyrese Joshua	f	\N
6924	Jacob	Mayorga	56156	4	j.mayorga156@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Mayorga, Jacob Alexander	f	\N
6925	Ashly	Mazariegos Monterroso	55707	4	a.mazariegosmonte707@cvuhsd.org	15	F	10	D-204	Fuchs, Frank J	Mazariegos Monterroso, Ashly Natalia	f	\N
6926	Delilah	McCollom	56040	4	d.mccollom040@cvuhsd.org	15	F	10	D-202	Contarsy, Dayne	McCollom, Delilah Marie	f	\N
6927	Antwain	McConnell	57158	4	a.mcconell158@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	McConnell, Antwain Rene	f	\N
6928	Aylin	Mejia Estrada	56797	4	a.mejiaestrada797@cvuhsd.org	15	F	10	L-202	Isozaki, Jonathan	Mejia Estrada, Aylin Yaslin	f	\N
6929	Dayanna	Mendez Echeverria	56795	4	d.mendezecheverri795@cvuhsd.org	15	F	10	L-202	Isozaki, Jonathan	Mendez Echeverria, Dayanna Victoria	f	\N
6930	Bryan	Mendez Marquez	56621	4	b.mendezmarquez621@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Mendez Marquez, Bryan Alexander	f	\N
6931	Lizeth	Mendivil	56551	4	l.mendivil551@cvuhsd.org	15	F	10	M-215	Sanchez, Nicolas	Mendivil, Lizeth	f	\N
6932	Fatima	Mendoza-Barrera	56120	4	f.mendozabarrera120@cvuhsd.org	15	F	10	I-2	Pimentel, Carlina	Mendoza-Barrera, Fatima Nicole	f	\N
6933	Ma-Kalah	Miles	57354	4	m.miles354@cvuhsd.org	15	F	10	D-202	Contarsy, Dayne	Miles, Ma-Kalah Skyy Anyiah	f	\N
6934	Zyneb	Mohmood	57374	4	z.mohmood374@cvuhsd.org	15	F	10	C-215	Barnes, Daniel R.	Mohmood, Zyneb Hussien	f	\N
6935	Yostin	Monroy Rodriguez	56870	4	y.monroyrodriguez870@cvuhsd.org	15	M	10	M-102	Swain, James L.	Monroy Rodriguez, Yostin Jair	f	\N
6936	Alan	Montenegro Baracaldo	58112	4	a.montenegrobarac112@cvuhsd.org	15	M	10	D-204	Fuchs, Frank J	Montenegro Baracaldo, Alan Joel	f	\N
6937	Joel	Montero Ramirez	55766	4	j.monteroramirez766@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Montero Ramirez, Joel Anthony	f	\N
6938	Samaria	Moore	58875	4	s.moore875@cvuhsd.org	15	F	10	L-202	Isozaki, Jonathan	Moore, Samaria Precious Lee	f	\N
6939	Andrew	Mora	56839	4	a.mora839@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Mora, Andrew	f	\N
6940	Luis	Mora	56612	4	l.mora612@cvuhsd.org	15	M	10	M-215	Morris, Dorothy E	Mora, Luis Matthew	f	\N
6941	Kristhel	Morales Camey	57571	4	k.moralescamey571@cvuhsd.org	15	F	10	K-216	Arangoa Ramirez, Christian	Morales Camey, Kristhel Abril	f	\N
6942	Guillermo	Morales De Leon	57889	4	g.moralesdeleon889@cvuhsd.org	15	M	10	D-101	Fikes, Leyla T	Morales De Leon, Guillermo Antonio	f	\N
6943	Ligia	Morales Sillas	56270	4	l.moralessillas270@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Morales Sillas, Ligia Judith	f	\N
6944	Kimberley	Morales	56019	4	k.morales019@cvuhsd.org	15	F	10	M-102	Swain, James L.	Morales, Kimberley Elizabeth	f	\N
6945	Rocio	Morales-Perez	55708	4	r.perezmorales708@cvuhsd.org	15	F	10	K-117	Gutierrez, Veronica	Morales-Perez, Rocio	f	\N
6946	Paula	Moreno Banuelos	55861	4	p.morenobanuelos861@cvuhsd.org	15	F	10	L-202	Isozaki, Jonathan	Moreno Banuelos, Paula	f	\N
6947	Damian	Moreno Cabada	56753	4	d.morenocabada753@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Moreno Cabada, Damian Jesus	f	\N
6948	Millie	Moreno Yepez	56953	4	m.morenoyepez953@cvuhsd.org	15	F	10	M-118	Aguilar Hernandez, Leslie	Moreno Yepez, Millie Michelle	f	\N
6949	Camila	Moreno	56831	4	c.moreno831@cvuhsd.org	15	F	10	D-204	Fuchs, Frank J	Moreno, Camila Alexandra	f	\N
6950	David	Moreno	56771	4	d.moreno771@cvuhsd.org	15	M	10	K-116	Giron, Jovana J	Moreno, David Anthony	f	\N
6951	Keimani	Mosby	56596	4	k.mosby596@cvuhsd.org	15	F	10	K-117	Gutierrez, Veronica	Mosby, Keimani Kimora	f	\N
6952	Jonathan	Munguia Bautista	55769	4	j.munguiabautista769@cvuhsd.org	15	M	10	L-103	Castillo, Amy	Munguia Bautista, Jonathan Daniel	f	\N
6953	Shelsy	Munoz Duarte	59215	4	s.duarte215@cvuhsd.org	15	F	10	D-101	Fikes, Leyla T	Munoz Duarte, Shelsy Alejandra	f	\N
6954	Rene	Munoz Flores	57089	4	r.munozflores089@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Munoz Flores, Rene Alessandro	f	\N
6955	Luna	Munoz	55588	4	l.munoz588@cvuhsd.org	15	F	10	L-103	Castillo, Amy	Munoz, Luna	f	\N
6956	Sebastian	Munoz	56256	4	s.munoz256@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Munoz, Sebastian	f	\N
6957	Jennifer	Murillo Arciniega	56178	4	j.murilloarcinieg178@cvuhsd.org	15	F	10	D-204	Fuchs, Frank J	Murillo Arciniega, Jennifer	f	\N
6958	Omar	Murillo Iniguez	57311	4	o.murilloiniguez311@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Murillo Iniguez, Omar Enrique	f	\N
6959	Heriberto	Murillo	55917	4	h.murillo917@cvuhsd.org	15	M	10	M-111	Valencia, Sandra	Murillo, Heriberto Alexander	f	\N
6960	Jasmine	Murillo	56721	4	j.murillo721@cvuhsd.org	15	F	10	M-112	Barahona, Iris	Murillo, Jasmine	f	\N
6961	Ricardo	Muro Duarte	57124	4	r.muroduarte124@cvuhsd.org	15	M	10	M-116	Juarez Fuertes, Judy	Muro Duarte, Ricardo	f	\N
6962	Precious	Narh	57617	4	p.narh617@cvuhsd.org	15	F	10	C-214	Abrahams, Thomas L.	Narh, Precious Portia Kwekie	f	\N
6963	Davian	Navarrete	56217	4	d.navarrete217@cvuhsd.org	15	M	10	D-104	Gonzalez, Anthony	Navarrete, Davian Nick	f	\N
6964	Yuritza	Navia	57278	4	y.navia278@cvuhsd.org	15	F	10	C-215	Barnes, Daniel R.	Navia, Yuritza	f	\N
6965	Frederick	Nelson	56530	4	f.nelson530@cvuhsd.org	15	M	10	K-117	Gutierrez, Veronica	Nelson, Frederick Dexter	f	\N
6966	Julien	Nunez	56485	4	j.nunez485@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Nunez, Julien Juan	f	\N
6967	Alexandra	Ocampo Soto	57024	4	a.ocamposoto024@cvuhsd.org	15	F	10	I-2	Pimentel, Carlina	Ocampo Soto, Alexandra Michell	f	\N
6968	Marlyn	Ochoa	56800	4	m.ochoa800@cvuhsd.org	15	F	10	M-215	Morris, Dorothy E	Ochoa, Marlyn	f	\N
6969	Henry	Oliva Monterroso	56227	4	h.olivamonterroso227@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Oliva Monterroso, Henry Fernando	f	\N
6970	Gabriel	Olivera	57097	4	g.olivera097@cvuhsd.org	15	M	10	D-204	Fuchs, Frank J	Olivera, Gabriel Eduardo	f	\N
6971	Carlos	Ordonez	57028	4	c.ordonez028@cvuhsd.org	15	M	10	L-104	Najarro, Claudia	Ordonez, Carlos Yossef	f	\N
6972	Angie	Ortega De Marco	56954	4	a.ortegademarco954@cvuhsd.org	15	F	10	M-215	Morris, Dorothy E	Ortega De Marco, Angie Karina	f	\N
6973	Kevin	Ortiz	56020	4	k.ortiz020@cvuhsd.org	15	M	10	M-111	Valencia, Sandra	Ortiz, Kevin	f	\N
6974	Nathan	Ortiz	56193	4	n.ortiz193@cvuhsd.org	15	M	10	M-116	Juarez Fuertes, Judy	Ortiz, Nathan Anthony	f	\N
6975	Noemi	Ovando-Ballesteros	56292	4	n.ovandoballester292@cvuhsd.org	15	F	10	C-214	Abrahams, Thomas L.	Ovando-Ballesteros, Noemi Alejandra	f	\N
6976	Katherine	Pacheco Ramos	56502	4	k.pacheco502@cvuhsd.org	15	F	10	GYM	Phillips, Morris L	Pacheco Ramos, Katherine Nicole	f	\N
6977	Suri	Palacios Lopez	56987	4	s.palacioslopez987@cvuhsd.org	15	F	10	M-102	Swain, James L.	Palacios Lopez, Suri Monserrat	f	\N
6978	Kimberly	Palacios Valdez	57090	4	k.palaciosvaldez090@cvuhsd.org	15	F	10	L-202	Isozaki, Jonathan	Palacios Valdez, Kimberly Alexandra	f	\N
6979	Guadalupe	Palomino	56597	4	g.palomino597@cvuhsd.org	15	F	10	M-112	Barahona, Iris	Palomino, Guadalupe Sophia	f	\N
6980	Dayana	Pargas-Zavala	56694	4	d.pargaszavala694@cvuhsd.org	15	F	10	C-214	Abrahams, Thomas L.	Pargas-Zavala, Dayana Lizbeth	f	\N
6981	Leah	Parra	56231	4	l.parra231@cvuhsd.org	15	F	10	C-214	Abrahams, Thomas L.	Parra, Leah Anne	f	\N
6982	Jayden	Pasten Camarena	57452	4	j.pastencamarena452@cvuhsd.org	15	M	10	J-112	Levine, Allison A	Pasten Camarena, Jayden Nael	f	\N
6983	Mia	Payan	57397	4	m.payan397@cvuhsd.org	15	F	10	D-101	Fikes, Leyla T	Payan, Mia Jamileth	f	\N
6984	Andy	Pech	56955	4	a.pech955@cvuhsd.org	15	M	10	M-114	Garcia, Manuel	Pech, Andy Obed	f	\N
6985	Jack	Pedro	56445	4	j.pedro445@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Pedro, Jack	f	\N
6986	Michael	Peralta	59198	4	m.peralta198@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Peralta, Michael Alexander	f	\N
6987	Valerie	Peralta	59040	4	v.peralta040@cvuhsd.org	15	F	10	K-105	Gonzalez, Alejandra	Peralta, Valerie Nicole	f	\N
6988	Areana	Perez Lozano	56174	4	a.perezlozano174@cvuhsd.org	15	F	10	L-202	Isozaki, Jonathan	Perez Lozano, Areana Michelle	f	\N
6989	Bruce	Perez	56384	4	b.perez384@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Perez, Bruce O'Ryan	f	\N
6990	Desi	Perez	56750	4	d.perez750@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Perez, Desi Ja'Bari	f	\N
6991	Isabella	Perez	55979	4	i.perez979@cvuhsd.org	15	F	10	M-118	Aguilar Hernandez, Leslie	Perez, Isabella Juliette	f	\N
6992	Landon	Perez-Juarez	56339	4	l.perezjuarez339@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Perez-Juarez, Landon	f	\N
6993	Elmer	Perez-Mendez	56046	4	e.perezmendez046@cvuhsd.org	15	M	10	F-106	Givens, Kathy E.	Perez-Mendez, Elmer Alfredo	f	\N
6994	Yeray	Piedrasanta	55811	4	y.piedrasanta811@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Piedrasanta, Yeray Nahum	f	\N
6995	Misty	Plascencia	58114	4	m.plascencia114@cvuhsd.org	15	F	10	L-202	Isozaki, Jonathan	Plascencia, Misty Katelyn	f	\N
6996	Donnell	Posey Jr.	55813	4	d.posey813@cvuhsd.org	15	M	10	G-101	Galt, Douglas S	Posey Jr., Donnell Terrell	f	\N
6997	Ranee	Prasad	55771	4	r.prasad771@cvuhsd.org	15	F	10	K-117	Gutierrez, Veronica	Prasad, Ranee Riti	f	\N
6998	Iliana	Quezada	55704	4	i.quezada704@cvuhsd.org	15	F	10	M-102	Swain, James L.	Quezada, Iliana	f	\N
6999	Nathaniel	Quintanilla	56359	4	n.quintanilla359@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Quintanilla, Nathaniel Erik	f	\N
7000	Madina	Rakhimova	56442	4	m.rakhimova442@cvuhsd.org	15	F	10	I-2	Pimentel, Carlina	Rakhimova, Madina	f	\N
7001	Anthony	Ramirez Mosqueda	56299	4	a.ramirezmosqueda299@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Ramirez Mosqueda, Anthony Abel	f	\N
7002	Erick	Ramirez	56362	4	e.ramirez362@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Ramirez, Erick	f	\N
7003	Esmeralda	Ramirez	58968	4	e.ramirez968@cvuhsd.org	15	F	10	GYM	Phillips, Morris L	Ramirez, Esmeralda Marie	f	\N
7004	Isabella	Ramirez	57086	4	i.ramirez086@cvuhsd.org	15	F	10	M-110	Segovia, Jose M	Ramirez, Isabella Ariana	f	\N
7005	Jesse	Ramirez	56240	4	j.ramirez240@cvuhsd.org	15	M	10	M-110	Segovia, Jose M	Ramirez, Jesse Jeremiah	f	\N
7006	Julia	Ramirez	55843	4	j.ramirez843@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Ramirez, Julia Nicole	f	\N
7007	Darlin	Ramos Gomez	56039	4	d.ramosgomez039@cvuhsd.org	15	F	10	I-2	Pimentel, Carlina	Ramos Gomez, Darlin Jorllely	f	\N
7008	Leslie	Ramos Lino	55713	4	l.ramoslino713@cvuhsd.org	15	F	10	K-117	Gutierrez, Veronica	Ramos Lino, Leslie Melany	f	\N
7009	Omar	Ramos	56322	4	o.ramos322@cvuhsd.org	15	M	10	M-114	Garcia, Manuel	Ramos, Omar	f	\N
7010	Vincent	Ramos	55768	4	v.ramos768@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Ramos, Vincent Alexander	f	\N
7011	Nery	Ramos-Mejia	55944	4	n.ramosmejia944@cvuhsd.org	15	M	10	K-202	Allen, Richard E	Ramos-Mejia, Nery Emanuel	f	\N
7012	Tahjir	Raymond	57241	4	t.raymond241@cvuhsd.org	15	M	10	M-102	Swain, James L.	Raymond, Tahjir Maurice	f	\N
7013	Samantha	Rebolledo	58642	4	s.rebolledo642@cvuhsd.org	15	F	10	D-204	Fuchs, Frank J	Rebolledo, Samantha Maribel	f	\N
7014	Derek	Reed	56989	4	d.reed989@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Reed, Derek	f	\N
7015	Khalid	Rehman	57242	4	k.rehman242@cvuhsd.org	15	M	10	M-114	Garcia, Manuel	Rehman, Khalid Abdul	f	\N
7016	Rose	Remy	57282	4	r.remy282@cvuhsd.org	15	F	10	C-214	Abrahams, Thomas L.	Remy, Rose	f	\N
7017	Sarah	Rendon	55946	4	s.rendon946@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Rendon, Sarah Abigail	f	\N
7018	Leticia	Renteria	56752	4	l.renteria752@cvuhsd.org	15	F	10	K-116	Giron, Jovana J	Renteria, Leticia Genesis	f	\N
7019	Marlissa	Renteria	57083	4	m.renteria083@cvuhsd.org	15	F	10	D-204	Fuchs, Frank J	Renteria, Marlissa	f	\N
7020	Anthony	Reyes Gamarro	59013	4	a.reyesgamarro013@cvuhsd.org	15	M	10	M-215	Morris, Dorothy E	Reyes Gamarro, Anthony Reuben	f	\N
7021	Obed	Reyes Medina	57616	4	o.reyesmedina616@cvuhsd.org	15	M	10	D-101	Fikes, Leyla T	Reyes Medina, Obed	f	\N
7022	Louie	Reyes Platas	55651	4	l.reyesplatas651@cvuhsd.org	15	M	10	M-102	Swain, James L.	Reyes Platas, Louie Albert	f	\N
7023	Alejandro	Reyes	57135	4	a.reyes135@cvuhsd.org	15	M	10	M-116	Juarez Fuertes, Judy	Reyes, Alejandro	f	\N
7024	Flor Violeta	Richerd Galvez	56343	4	f.richerdgalvez343@cvuhsd.org	15	F	10	M-114	Garcia, Manuel	Richerd Galvez, Flor Violeta	f	\N
7025	King	Riley	58130	4	k.riley130@cvuhsd.org	15	M	10	C-106	Howard Johnson, Crystal	Riley, King Edward	f	\N
7026	Katherine	Rincon	56791	4	k.rincon791@cvuhsd.org	15	F	10	K-116	Giron, Jovana J	Rincon, Katherine Alizey	f	\N
7027	Irene	Rios	56732	4	i.rios732@cvuhsd.org	15	F	10	I-2	Pimentel, Carlina	Rios, Irene Ashley	f	\N
7028	Natalie	Rios	56733	4	n.rios733@cvuhsd.org	15	F	10	I-2	Pimentel, Carlina	Rios, Natalie Paula	f	\N
7029	Erika	Rivera-Sevilla	55941	4	e.riverasevilla941@cvuhsd.org	15	F	10	K-117	Gutierrez, Veronica	Rivera-Sevilla, Erika Alexandra	f	\N
7030	Adelynn	Rizo	56599	4	a.rizo599@cvuhsd.org	15	F	10	GYM	Phillips, Morris L	Rizo, Adelynn Desiree	f	\N
7031	Minahil	Rizvi	57119	4	m.rizvi119@cvuhsd.org	15	F	10	M-118	Aguilar Hernandez, Leslie	Rizvi, Minahil Sajjad	f	\N
7032	Kimberly	Robledo	56804	4	k.robledo804@cvuhsd.org	15	F	10	I-2	Pimentel, Carlina	Robledo, Kimberly Sarai	f	\N
7033	Evelyn	Rodriguez De Paz	56923	4	e.rodriguezdepaz923@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Rodriguez De Paz, Evelyn Vanessa	f	\N
7034	Giselle	Rodriguez Espinoza	57330	4	g.rodriguezespino330@cvuhsd.org	15	F	10	L-103	Castillo, Amy	Rodriguez Espinoza, Giselle	f	\N
7035	Aliyah	Rodriguez	56169	4	a.rodriguez169@cvuhsd.org	15	F	10	D-202	Contarsy, Dayne	Rodriguez, Aliyah Annette	f	\N
7036	Fabian	Rodriguez	57402	4	f.rodriguez402@cvuhsd.org	15	M	10	G-101	Galt, Douglas S	Rodriguez, Fabian Alexander	f	\N
7037	Jesse	Rodriguez	57128	4	j.rodriguez128@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Rodriguez, Jesse Jonathan	f	\N
7038	Audrey	Rojas	56816	4	a.rojas816@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Rojas, Audrey Marie	f	\N
7039	Ramiro	Romero	57130	4	r.romero130@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Romero, Ramiro Alejandro	f	\N
7040	Ariel	Ruiz	57275	4	a.ruiz275@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Ruiz, Ariel	f	\N
7041	Sophia	Sabaj	56958	4	s.sabaj958@cvuhsd.org	15	F	10	K-117	Gutierrez, Veronica	Sabaj, Sophia Alyssa	f	\N
7042	Juan	Salamanca Rivera	56537	4	j.salamancarivera537@cvuhsd.org	15	M	10	D-105	Lesan, Kristine M	Salamanca Rivera, Juan Diego	f	\N
7043	Jordan	Salas Quintanilla	56959	4	j.salasquintanill959@cvuhsd.org	15	M	10	D-204	Fuchs, Frank J	Salas Quintanilla, Jordan	f	\N
7044	Miley	Salas-Lopes	56303	4	m.salaslopes303@cvuhsd.org	15	F	10	I-2	Pimentel, Carlina	Salas-Lopes, Miley Rose	f	\N
7045	Carol	Sanchez Diego	56030	4	c.sanchezdiego030@cvuhsd.org	15	F	10	M-113	Aispuro, Mayte	Sanchez Diego, Carol Esmeralda	f	\N
7046	David	Sanchez Gonzalez	56180	4	d.sanchezgonzalez180@cvuhsd.org	15	M	10	D-104	Gonzalez, Anthony	Sanchez Gonzalez, David Serafin	f	\N
7047	Avery	Sanchez Suarez	56608	4	a.sanchezsuarez608@cvuhsd.org	15	F	10	K-117	Gutierrez, Veronica	Sanchez Suarez, Avery Leilani	f	\N
7048	Andrea	Sanchez	55692	4	a.sanchez692@cvuhsd.org	15	F	10	K-117	Gutierrez, Veronica	Sanchez, Andrea Irais	f	\N
7049	Isabella	Sanchez	57084	4	i.sanchez084@cvuhsd.org	15	F	10	M-112	Barahona, Iris	Sanchez, Isabella	f	\N
7050	Jacob	Sanchez	57134	4	j.sanchez134@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Sanchez, Jacob Alexander	f	\N
7051	Michael	Sanchez	57201	4	m.sanchez201@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Sanchez, Michael Jose	f	\N
7052	Shane	Sanchez	56866	4	s.sanchez866@cvuhsd.org	15	M	10	M-112	Barahona, Iris	Sanchez, Shane	f	\N
7053	Leslie	Sandoval Aponte	56960	4	l.sandovalaponte960@cvuhsd.org	15	F	10	C-215	Barnes, Daniel R.	Sandoval Aponte, Leslie	f	\N
7054	Suleyma	Santiago	56990	4	s.santiago990@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Santiago, Suleyma Janely	f	\N
7055	Brando	Santti	55709	4	b.santti709@cvuhsd.org	15	M	10	M-111	Valencia, Sandra	Santti, Brando Hubertt	f	\N
7056	Joanna	Segura	58452	4	j.segura452@cvuhsd.org	15	F	10	M-102	Swain, James L.	Segura, Joanna Mayliene	f	\N
7057	Luis	Segura	57120	4	l.segura120@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Segura, Luis Manuel	f	\N
7058	Lehua Lani	Sekona	57088	4	l.sekona088@cvuhsd.org	15	F	10	GYM	Phillips, Morris L	Sekona, Lehua Lani Delianati	f	\N
7059	Camila	Sevilla Moran	57482	4	c.sevillamoran482@cvuhsd.org	15	F	10	D-101	Fikes, Leyla T	Sevilla Moran, Camila	f	\N
7060	Danyal	Siddiqui	59161	4	d.siddiqui161@cvuhsd.org	15	M	10	D-104	Gonzalez, Anthony	Siddiqui, Danyal	f	\N
7061	Grace	Sierra	56298	4	g.sierra298@cvuhsd.org	15	F	10	D-202	Contarsy, Dayne	Sierra, Grace	f	\N
7062	Wesley	Sirias Juarez	56961	4	w.siriasjuarez961@cvuhsd.org	15	M	10	D-101	Fikes, Leyla T	Sirias Juarez, Wesley Alfredo	f	\N
7063	Kamaria	Smith	56829	4	k.smith829@cvuhsd.org	15	F	10	D-204	Fuchs, Frank J	Smith, Kamaria Anikia	f	\N
7064	Rosa	Solchaga	56542	4	r.solchaga542@cvuhsd.org	15	F	10	GYM	Phillips, Morris L	Solchaga, Rosa Guadalupe	f	\N
7065	Ian	Solis Gaspar	55711	4	i.solisgaspar711@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Solis Gaspar, Ian Metzin	f	\N
7066	Mili	Solis Laparra	56287	4	m.solislaparra287@cvuhsd.org	15	F	10	C-215	Barnes, Daniel R.	Solis Laparra, Mili Jasmin	f	\N
7067	Jacob	Sosa	56242	4	j.sosa242@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Sosa, Jacob Nathaniel	f	\N
7068	Skyler	Stevens	56691	4	s.stevens691@cvuhsd.org	15	M	10	K-116	Giron, Jovana J	Stevens, Skyler Alexander	f	\N
7069	Adrian	Suarez	56351	4	a.suarez351@cvuhsd.org	15	M	10	G-101	Galt, Douglas S	Suarez, Adrian Gerardo	f	\N
7070	Raine	Sullivan	57379	4	r.sullivan379@cvuhsd.org	15	F	10	M-118	Aguilar Hernandez, Leslie	Sullivan, Raine Elyse-Yvette	f	\N
7071	Nayeli	Tavera Robles	56430	4	n.taverarobles430@cvuhsd.org	15	F	10	I-2	Pimentel, Carlina	Tavera Robles, Nayeli Beyonce	f	\N
7072	Braylon	Tillett	56540	4	b.tillett540@cvuhsd.org	15	M	10	J-112	Levine, Allison A	Tillett, Braylon Nesanie	f	\N
7073	Camilla	Tinoco	56414	4	c.tinoco414@cvuhsd.org	15	F	10	D-202	Contarsy, Dayne	Tinoco, Camilla	f	\N
7074	Meriyen	Tipaz Gudiel	56805	4	m.tipazgudiel805@cvuhsd.org	15	F	10	L-104	Najarro, Claudia	Tipaz Gudiel, Meriyen Lisethe	f	\N
7075	Jose	Tirado Sanchez	56477	4	j.tiradosanchez477@cvuhsd.org	15	M	10	D-202	Contarsy, Dayne	Tirado Sanchez, Jose Alonso	f	\N
7076	Adrian	Tolaque	56778	4	a.tolaque778@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Tolaque, Adrian Alexander	f	\N
7077	Kathya	Tolentino Alvarez	56152	4	k.tolentinoalvare152@cvuhsd.org	15	F	10	C-215	Barnes, Daniel R.	Tolentino Alvarez, Kathya	f	\N
7078	Isaiah	Tolentino	55904	4	i.tolentino904@cvuhsd.org	15	M	10	M-112	Barahona, Iris	Tolentino, Isaiah	f	\N
7079	Ailaoa	Toli	56658	4	a.toli658@cvuhsd.org	15	M	10	GYM	Phillips, Morris L	Toli, Ailaoa Tovia	f	\N
7080	Joey	Torres Magana	57109	4	j.torresmagana109@cvuhsd.org	15	M	10	K-105	Gonzalez, Alejandra	Torres Magana, Joey Anthony	f	\N
7081	Daniel	Trevisan	57094	4	d.trevisan094@cvuhsd.org	15	M	10	M-102	Swain, James L.	Trevisan, Daniel Alexander Nicholas	f	\N
7082	Emily	Tristan	57091	4	e.tristan091@cvuhsd.org	15	F	10	D-202	Contarsy, Dayne	Tristan, Emily Elizabeth	f	\N
7083	Kyel	Tun	58100	4	k.tun100@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Tun, Kyel Sin	f	\N
7084	Javier	Urias Martinez	56925	4	j.uriasmartinez925@cvuhsd.org	15	M	10	M-117	Tarkington, Cole	Urias Martinez, Javier Alexander	f	\N
7085	Yareli	Uribe Gonzalez	55691	4	y.uribegonzalez691@cvuhsd.org	15	F	10	D-105	Lesan, Kristine M	Uribe Gonzalez, Yareli	f	\N
7086	Anya	Usher	55710	4	a.usher710@cvuhsd.org	15	F	10	C-215	Barnes, Daniel R.	Usher, Anya Marie	f	\N
7087	Leslie	Valdivia Manzo	56373	4	l.valdiviamanzo373@cvuhsd.org	15	F	10	L-202	Isozaki, Jonathan	Valdivia Manzo, Leslie Jakeline	f	\N
7088	Briahna	Valdovinos	56659	4	b.valdovinos659@cvuhsd.org	15	F	10	K-117	Gutierrez, Veronica	Valdovinos, Briahna Alyce	f	\N
7089	Alison	Valencia Uribe	56035	4	a.valenciauribe035@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Valencia Uribe, Alison Jaritzi	f	\N
7090	Ashley	Valencia	58024	4	a.valencia024@cvuhsd.org	15	F	10	I-2	Pimentel, Carlina	Valencia, Ashley Dayana	f	\N
7091	Hanna	Varela	58677	4	h.varela677@cvuhsd.org	15	F	10	D-204	Fuchs, Frank J	Varela, Hanna Joan	f	\N
7092	Eduardo	Vargas	56799	4	e.vargas799@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Vargas, Eduardo Jose	f	\N
7093	Tlacae'lel	Vargas	57029	4	t.vargas029@cvuhsd.org	15	M	10	C-214	Abrahams, Thomas L.	Vargas, Tlacae'lel	f	\N
7094	Aryana	Vasquez	56333	4	a.vasquez333@cvuhsd.org	15	F	10	M-102	Swain, James L.	Vasquez, Aryana Michelle	f	\N
7095	Emily	Vasquez	56239	4	e.vasquez239@cvuhsd.org	15	F	10	GYM	Phillips, Morris L	Vasquez, Emily Faith	f	\N
7096	Manuel	Vasquez	56998	4	m.vasquez998@cvuhsd.org	15	M	10	G-101	Galt, Douglas S	Vasquez, Manuel Damian	f	\N
7097	Sender	Vasquez	56249	4	s.vasquez249@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Vasquez, Sender Daniel	f	\N
7098	Ma'Ciere	Vaughn-Clayton	55945	4	m.vaughnclayton945@cvuhsd.org	15	M	10	K-116	Giron, Jovana J	Vaughn-Clayton, Ma'Ciere Stephon	f	\N
7099	Maria de Jesus	Vazquez Garcia	56663	4	m.vazquezgarcia663@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Vazquez Garcia, Maria de Jesus	f	\N
7100	Ariana	Vazquez	56234	4	a.vazquez234@cvuhsd.org	15	F	10	D-104	Gonzalez, Anthony	Vazquez, Ariana	f	\N
7101	Haley	Vazquez	55706	4	h.vazquez706@cvuhsd.org	15	F	10	C-214	Abrahams, Thomas L.	Vazquez, Haley	f	\N
7102	Alonso	Vela Mendoza	57153	4	a.velamendoza153@cvuhsd.org	15	M	10	M-116	Juarez Fuertes, Judy	Vela Mendoza, Alonso Jesus	f	\N
7103	Angelica	Velez Hernandez	57483	4	a.velezhernandez483@cvuhsd.org	15	F	10	K-116	Giron, Jovana J	Velez Hernandez, Angelica Isabel	f	\N
7104	Desteny	Vera Antunez	56352	4	d.veraantunez352@cvuhsd.org	15	F	10	K-216	Arangoa Ramirez, Christian	Vera Antunez, Desteny Jordana	f	\N
7105	Jan	Vera	56818	4	j.vera818@cvuhsd.org	15	M	10	C-215	Barnes, Daniel R.	Vera, Jan	f	\N
7106	Denise	Vidrio	56032	4	d.vidrio032@cvuhsd.org	15	F	10	L-202	Isozaki, Jonathan	Vidrio, Denise	f	\N
7107	Anahi	Villalobos-Castro	56926	4	a.villaloboscastr926@cvuhsd.org	15	F	10	GYM	Phillips, Morris L	Villalobos-Castro, Anahi	f	\N
7108	Isabella	Wagner	56613	4	i.wagner613@cvuhsd.org	15	F	10	I-2	Pimentel, Carlina	Wagner, Isabella Mary-Velasco	f	\N
7109	Marco	Walker	56015	4	m.walker015@cvuhsd.org	15	M	10	M-215	Sanchez, Nicolas	Walker, Marco Enrique	f	\N
7110	Jaylen	Wallace	56964	4	j.wallace964@cvuhsd.org	15	M	10	D-104	Gonzalez, Anthony	Wallace, Jaylen Joe-Eulic	f	\N
7111	Eva	Wallace-Sattiewhite	57995	4	e.wallacesattiewh995@cvuhsd.org	15	F	10	L-201	Haynes, Cordell	Wallace-Sattiewhite, Eva	f	\N
7112	Sarai	Washington	56075	4	s.washington075@cvuhsd.org	15	F	10	J-112	Levine, Allison A	Washington, Sarai Sheree	f	\N
7113	Taylor	Wayne	57055	4	t.wayne055@cvuhsd.org	15	F	10	M-102	Swain, James L.	Wayne, Taylor Nasiaire	f	\N
7114	Jayden	Williamson	56928	4	j.williamson928@cvuhsd.org	15	M	10	L-202	Isozaki, Jonathan	Williamson, Jayden Keanan	f	\N
7115	Ervin	Xicay Pech	56965	4	e.xicaypech965@cvuhsd.org	15	M	10	M-116	Juarez Fuertes, Judy	Xicay Pech, Ervin	f	\N
7116	Kevin	Xicay Pech	56966	4	k.xicaypech966@cvuhsd.org	15	M	10	M-116	Juarez Fuertes, Judy	Xicay Pech, Kevin	f	\N
7117	Cali	Young	59299	4	c.young299@cvuhsd.org	15	F	10	J-105	Bowman, Lauren C.	Young, Cali Michelle	f	\N
7118	Carlos	Zamora Martinez	56203	4	c.zamoramartinez203@cvuhsd.org	15	M	10	M-102	Swain, James L.	Zamora Martinez, Carlos Daniel	f	\N
7119	Baylee	Zamora	56929	4	b.zamora929@cvuhsd.org	15	F	10	I-2	Pimentel, Carlina	Zamora, Baylee Marie	f	\N
7120	Salome	Abadia Morales	54263	4	s.abadiamorales263@cvuhsd.org	15	F	11	K-202	Allen, Richard E	Abadia Morales, Salome	f	\N
7121	Marco	Abarca Renderos	54621	4	m.abarcarenderos621@cvuhsd.org	15	M	11	D-110	Rosales, Virginia	Abarca Renderos, Marco Reynaldo	f	\N
7122	Denis	Abarca	54313	4	d.abarca313@cvuhsd.org	15	M	11	K-215	Obeso, Setareh	Abarca, Denis A.J.	f	\N
7123	Eduardo	Acosta Avila	53652	4	e.acostaavila652@cvuhsd.org	15	M	11	K-106	Gonzalez, Veronica C.	Acosta Avila, Eduardo Abraham	f	\N
7124	Yasmin	Aguilar Bernal	53738	4	y.aguilarbernal738@cvuhsd.org	15	F	11	D-211	Collins, Matthew A	Aguilar Bernal, Yasmin Cira	f	\N
7125	Arely	Aguilar Sanchez	54911	4	a.aguilarsanchez911@cvuhsd.org	15	F	11	K-105	Gonzalez, Alejandra	Aguilar Sanchez, Arely Guadalupe	f	\N
7126	Gabby	Aguilar	54623	4	g.aguilar623@cvuhsd.org	15	F	11	J-113	Urquidez, Donald	Aguilar, Gabby	f	\N
7127	Esmeralda	Aguirre	57503	4	e.aguirre503@cvuhsd.org	15	F	11	K-202	Allen, Richard E	Aguirre, Esmeralda	f	\N
7128	Michael	Ake Ramirez	55099	4	m.akeramirez099@cvuhsd.org	15	M	11	L-101	Legg, Adam	Ake Ramirez, Michael Anthony	f	\N
7129	James	Alba	53653	4	j.alba653@cvuhsd.org	15	M	11	M-111	Valencia, Sandra	Alba, James Alexander	f	\N
7130	Ashley	Alcerro Morales	53980	4	a.alcerromorales980@cvuhsd.org	15	F	11	L-204	Ishii, Emily	Alcerro Morales, Ashley Maria	f	\N
7131	Matthew	Aldaco	54912	4	m.aldaco912@cvuhsd.org	15	M	11	D-110	Rosales, Virginia	Aldaco, Matthew James	f	\N
7132	Sofia	Aldana Solorzano	55115	4	s.aldana115@cvuhsd.org	15	F	11	G-101	Galt, Douglas S	Aldana Solorzano, Sofia Isabella	f	\N
7133	Jose	Alfaro Alas	55043	4	j.alfaroalas043@cvuhsd.org	15	M	11	L-103	Castillo, Amy	Alfaro Alas, Jose Steven	f	\N
7134	Matthew	Alvarado	54688	4	m.alvarado688@cvuhsd.org	15	M	11	M-110	Segovia, Jose M	Alvarado, Matthew Eduardo	f	\N
7135	Melanie	Alvarez	53655	4	m.alvarez655@cvuhsd.org	15	F	11	I-2	Pimentel, Carlina	Alvarez, Melanie Jaylene	f	\N
7136	Angela	Ambrosio Aguirre	58295	4	a.ambrosioaguirre295@cvuhsd.org	15	F	11	J-105	Bowman, Lauren C.	Ambrosio Aguirre, Angela Isabeli	f	\N
7137	Brisa	Amezcua Saldana	53940	4	b.amezcuasaldana940@cvuhsd.org	15	F	11	I-2	Pimentel, Carlina	Amezcua Saldana, Brisa Airmar	f	\N
7138	Catherine	Angeles	53656	4	c.angeles656@cvuhsd.org	15	F	11	K-215	Obeso, Setareh	Angeles, Catherine Jael	f	\N
7139	Laramie	Angeles-Hilarion	53657	4	l.angeleshilarion657@cvuhsd.org	15	M	11	J-113	Urquidez, Donald	Angeles-Hilarion, Laramie Emmanuel	f	\N
7140	Halo	Aparicio	53993	4	h.aparicio993@cvuhsd.org	15	F	11	D-211	Collins, Matthew A	Aparicio, Halo Mia	f	\N
7141	Elena	Aragon	57014	4	e.aragon014@cvuhsd.org	15	F	11	K-106	Gonzalez, Veronica C.	Aragon, Elena	f	\N
7142	Matthew	Arango	54268	4	m.arango268@cvuhsd.org	15	M	11	D-211	Collins, Matthew A	Arango, Matthew	f	\N
7143	Adrian	Arauza	54746	4	a.arauza746@cvuhsd.org	15	M	11	M-117	Tarkington, Cole	Arauza, Adrian Angel	f	\N
7144	Leslie	Arciniega Vasquez	55045	4	l.arciniegavasque045@cvuhsd.org	15	F	11	M-111	Valencia, Sandra	Arciniega Vasquez, Leslie Diane	f	\N
7145	Santiago	Arias Solares	54452	4	s.ariassolares452@cvuhsd.org	15	M	11	M-111	Valencia, Sandra	Arias Solares, Santiago Humberto	f	\N
7146	Michael	Arizmendi	55046	4	m.arizmendi046@cvuhsd.org	15	M	11	L-101	Legg, Adam	Arizmendi, Michael Daniel	f	\N
7147	Azhar	Arju	54460	4	a.arju460@cvuhsd.org	15	M	11	D-211	Collins, Matthew A	Arju, Azhar Hossain	f	\N
7148	Yanet	Arriaga Alvarez	55603	4	y.arriagaalvarez603@cvuhsd.org	15	F	11	D-105	Lesan, Kristine M	Arriaga Alvarez, Yanet	f	\N
7149	Maxime Samuel	Ashu	56838	4	m.ashumofoko838@cvuhsd.org	15	M	11	K-106	Gonzalez, Veronica C.	Ashu, Maxime Samuel Mofoko	f	\N
7150	Semaj	Atiase	54473	4	s.atiase473@cvuhsd.org	15	M	11	M-111	Valencia, Sandra	Atiase, Semaj Lawrence	f	\N
7151	Omar	Avalos Loera	54594	4	o.avalosloera594@cvuhsd.org	15	M	11	D-110	Rosales, Virginia	Avalos Loera, Omar	f	\N
7152	Dahlia	Ayala	53658	4	d.ayala658@cvuhsd.org	15	F	11	K-105	Gonzalez, Alejandra	Ayala, Dahlia Michelle	f	\N
7153	Kevin	Ayala	55049	4	k.ayala049@cvuhsd.org	15	M	11	M-117	Tarkington, Cole	Ayala, Kevin Alejandro	f	\N
7154	Goodness	Baadi	53660	4	g.baadi660@cvuhsd.org	15	M	11	D-211	Collins, Matthew A	Baadi, Goodness Ikechukwu	f	\N
7155	Serenity	Bailey-Morris	55326	4	s.baileymorris326@cvuhsd.org	15	F	11	M-113	Aispuro, Mayte	Bailey-Morris, Serenity Love	f	\N
7156	Alexa	Balam	55050	4	a.balam050@cvuhsd.org	15	F	11	K-215	Obeso, Setareh	Balam, Alexa Mayte	f	\N
7157	Hector	Barahona Perez	55179	4	h.barahonaperez179@cvuhsd.org	15	M	11	GYM	Harm, Kirk J.	Barahona Perez, Hector Gonzalo	f	\N
7158	Jeremy	Barahona	53663	4	j.barahona663@cvuhsd.org	15	M	11	C-103	Hoang, Huy T.	Barahona, Jeremy Josue	f	\N
7159	Juan	Barba	53664	4	j.barba664@cvuhsd.org	15	M	11	C-103	Hoang, Huy T.	Barba, Juan Pablo	f	\N
7160	Ammy	Barrios - Montiel	58478	4	a.barriosmontiel478@cvuhsd.org	15	F	11	C-117	Jones, Michael R.	Barrios - Montiel, Ammy Anelys	f	\N
7161	Emmanuel	Barrios Orozco	53673	4	e.barriosorozco673@cvuhsd.org	15	M	11	D-211	Collins, Matthew A	Barrios Orozco, Emmanuel	f	\N
7162	Lucia	Barron	54501	4	l.barron501@cvuhsd.org	15	F	11	J-105	Bowman, Lauren C.	Barron, Lucia Clarissa	f	\N
7163	Jade	Bautista	57220	4	j.bautista220@cvuhsd.org	15	F	11	C-204	Rios, James	Bautista, Jade Delilah	f	\N
7164	Isabella	Benavides	53674	4	i.benavides674@cvuhsd.org	15	F	11	K-215	Obeso, Setareh	Benavides, Isabella Aurora	f	\N
7165	Briana	Blanco	55056	4	b.blanco056@cvuhsd.org	15	F	11	K-114	Loera, Jorge Antonio	Blanco, Briana Elizabeth	f	\N
7166	Anthony	Bravo	54212	4	a.bravo212@cvuhsd.org	15	M	11	K-114	Loera, Jorge Antonio	Bravo, Anthony Ichiro	f	\N
7167	Jocelyn	Briseno	54558	4	j.briseno558@cvuhsd.org	15	F	11	C-204	Rios, James	Briseno, Jocelyn	f	\N
7168	Ryan	Broussard	54461	4	r.broussard461@cvuhsd.org	15	M	11	D-110	Rosales, Virginia	Broussard, Ryan James	f	\N
7169	Lupillo	Buenrrostro Gonzalez	54750	4	l.buenrrostrogonz750@cvuhsd.org	15	M	11	L-103	Castillo, Amy	Buenrrostro Gonzalez, Lupillo Max	f	\N
7170	Oscar	Bustos Robles	53682	4	o.bustosrobles682@cvuhsd.org	15	M	11	D-211	Collins, Matthew A	Bustos Robles, Oscar Sebastian	f	\N
7171	Shanti	Cabrera	53684	4	s.cabrera684@cvuhsd.org	15	F	11	D-211	Collins, Matthew A	Cabrera, Shanti Rebecca	f	\N
7172	Anson	Cabudol Mikel	55160	4	a.cabudol160@cvuhsd.org	15	M	11	L-101	Legg, Adam	Cabudol Mikel, Anson	f	\N
7173	Fernando	Caceres	54391	4	f.caceres391@cvuhsd.org	15	M	11	K-114	Loera, Jorge Antonio	Caceres, Fernando Johaf	f	\N
7174	Samantha	Camacho	53686	4	s.camacho686@cvuhsd.org	15	F	11	J-112	Levine, Allison A	Camacho, Samantha	f	\N
7175	Elvin	Campos-Rivera	54626	4	e.camposrivera626@cvuhsd.org	15	M	11	K-202	Allen, Richard E	Campos-Rivera, Elvin	f	\N
7176	Saul	Can	54333	4	s.can333@cvuhsd.org	15	M	11	J-105	Bowman, Lauren C.	Can, Saul Oswaldo	f	\N
7177	Elizabeth	Cano	54136	4	e.cano136@cvuhsd.org	15	F	11	GYM	Phillips, Morris L	Cano, Elizabeth Perez	f	\N
7178	Fredy	Cano	54944	4	f.cano944@cvuhsd.org	15	M	11	L-104	Najarro, Claudia	Cano, Fredy	f	\N
7179	Henry	Canul	54314	4	h.canul314@cvuhsd.org	15	M	11	K-215	Obeso, Setareh	Canul, Henry Alberto	f	\N
7180	Kelvin	Carbajal Elias	54915	4	k.carbajalelias915@cvuhsd.org	15	M	11	J-105	Bowman, Lauren C.	Carbajal Elias, Kelvin Owen	f	\N
7181	Leyla	Cardenas Campos	55061	4	l.cardenascampos061@cvuhsd.org	15	F	11	K-215	Obeso, Setareh	Cardenas Campos, Leyla Maria	f	\N
7182	Giovani	Cardenas Diaz	53687	4	g.cardenasdiaz687@cvuhsd.org	15	M	11	K-105	Gonzalez, Alejandra	Cardenas Diaz, Giovani Daniel	f	\N
7183	Joyce	Cardenas Duenas	54505	4	j.cardenasduenas505@cvuhsd.org	15	F	11	M-118	Aguilar Hernandez, Leslie	Cardenas Duenas, Joyce Valeria	f	\N
7184	Chris	Cardenas-Lopez	57016	4	c.cardenaslopez016@cvuhsd.org	15	M	11	K-202	Allen, Richard E	Cardenas-Lopez, Chris Anthony	f	\N
7185	Stacy	Carpio	54689	4	s.carpio689@cvuhsd.org	15	F	11	M-111	Valencia, Sandra	Carpio, Stacy Nicole	f	\N
7186	Cinai	Carr	55604	4	c.carr604@cvuhsd.org	15	F	11	K-106	Gonzalez, Veronica C.	Carr, Cinai Elaine	f	\N
7187	Leonardo	Carrillo Escareno	59292	4	l.carrilloescare292@cvuhsd.org	15	M	11	L-204	Ishii, Emily	Carrillo Escareno, Leonardo	f	\N
7188	Jared	Castaneda	54259	4	j.castaneda259@cvuhsd.org	15	M	11	L-101	Legg, Adam	Castaneda, Jared Anthony	f	\N
7189	Fatima	Castillo Rivera	57384	4	f.castillorivera384@cvuhsd.org	15	F	11	I-2	Pimentel, Carlina	Castillo Rivera, Fatima Jasmin	f	\N
7190	Celise	Castillo	54855	4	c.castillo855@cvuhsd.org	15	F	11	K-106	Gonzalez, Veronica C.	Castillo, Celise Semone	f	\N
7191	Christopher	Cedillos Santamaria	55062	4	c.cedillossantama062@cvuhsd.org	15	M	11	K-106	Gonzalez, Veronica C.	Cedillos Santamaria, Christopher Gonzalo	f	\N
7192	Katie	Ceja-Gonzalez	54600	4	k.cejagonzalez600@cvuhsd.org	15	F	11	K-106	Gonzalez, Veronica C.	Ceja-Gonzalez, Katie Samara	f	\N
7193	Robert	Ceniceros	54865	4	r.ceniceros865@cvuhsd.org	15	M	11	M-117	Tarkington, Cole	Ceniceros, Robert Julian	f	\N
7194	Mathew	Cerda	54943	4	m.cerda943@cvuhsd.org	15	M	11	K-106	Gonzalez, Veronica C.	Cerda, Mathew Nicholas	f	\N
7195	Anthony	Cerna Preza	54127	4	a.cernapreza127@cvuhsd.org	15	M	11	L-101	Legg, Adam	Cerna Preza, Anthony Manuel	f	\N
7196	Jacqueline	Cervantes	53699	4	j.cervantes699@cvuhsd.org	15	F	11	D-211	Collins, Matthew A	Cervantes, Jacqueline Renee	f	\N
7197	Anaya	Chamblee	54125	4	a.chamblee125@cvuhsd.org	15	F	11	D-211	Collins, Matthew A	Chamblee, Anaya Mariah	f	\N
7198	Isaac	Chan	55063	4	i.chan063@cvuhsd.org	15	M	11	L-103	Castillo, Amy	Chan, Isaac Gabriel	f	\N
7199	Angel	Chavez	53700	4	a.chavez700@cvuhsd.org	15	M	11	K-215	Obeso, Setareh	Chavez, Angel Enrique	f	\N
7200	Jimmi	Chile Menendez	57704	4	j.chilemenendez704@cvuhsd.org	15	M	11	GYM	Harm, Kirk J.	Chile Menendez, Jimmi Jardel	f	\N
7201	Dakodah	Clark	54721	4	b.clark721@cvuhsd.org	15	F	11	M-111	Valencia, Sandra	Clark, Dakodah Marie	f	\N
7202	Angela	Clements	57423	4	a.clements423@cvuhsd.org	15	F	11	D-105	Lesan, Kristine M	Clements, Angela Noemi	f	\N
7203	Gabriela	Connors	54561	4	g.connors561@cvuhsd.org	15	F	11	L-104	Najarro, Claudia	Connors, Gabriela Jaylee	f	\N
7204	Eion	Cooper Torrez	55394	4	e.coopertorrez394@cvuhsd.org	15	M	11	L-104	Najarro, Claudia	Cooper Torrez, Eion Dwigth	f	\N
7205	Isaiah	Cordova	55328	4	i.cordova328@cvuhsd.org	15	M	11	K-105	Gonzalez, Alejandra	Cordova, Isaiah Armando	f	\N
7206	Justin	Corona	58178	4	j.corona178@cvuhsd.org	15	M	11	K-215	Obeso, Setareh	Corona, Justin Feliciano	f	\N
7207	Valerie	Corral	54462	4	v.corral462@cvuhsd.org	15	F	11	K-106	Gonzalez, Veronica C.	Corral, Valerie Genesis	f	\N
7208	Kenner	Cortes Caal	54699	4	k.cortescaal699@cvuhsd.org	15	M	11	L-104	Najarro, Claudia	Cortes Caal, Kenner Amilkar	f	\N
7209	Deborah	Covarrubias	53701	4	d.covarrubias701@cvuhsd.org	15	F	11	K-105	Gonzalez, Alejandra	Covarrubias, Deborah Judith	f	\N
7210	Joel	Covarrubias	54508	4	j.covarrubias508@cvuhsd.org	15	M	11	K-114	Loera, Jorge Antonio	Covarrubias, Joel	f	\N
7211	Fabiola	Cruz Lopez	55676	4	f.cruzlopez676@cvuhsd.org	15	F	11	GYM	Harm, Kirk J.	Cruz Lopez, Fabiola Isabel	f	\N
7212	Debie	Cruz	54336	4	d.cruz336@cvuhsd.org	15	F	11	L-103	Castillo, Amy	Cruz, Debie Lizett	f	\N
7213	Isaac	Cruz	54532	4	i.cruz532@cvuhsd.org	15	M	11	L-204	Ishii, Emily	Cruz, Isaac Emmanuel	f	\N
7214	Jose	Cruz-Farias	54756	4	j.cruzfarias756@cvuhsd.org	15	M	11	G-101	Galt, Douglas S	Cruz-Farias, Jose Emmanuel	f	\N
7215	Javier	Cuevas V	54310	4	j.cuevasv310@cvuhsd.org	15	M	11	G-101	Galt, Douglas S	Cuevas V, Javier Santos	f	\N
7216	Diamond	Curtiss	55439	4	d.curtiss439@cvuhsd.org	15	F	11	M-111	Valencia, Sandra	Curtiss, Diamond Tranice	f	\N
7217	Jefferson	Davila Abrigo	54690	4	j.davilaabrigo690@cvuhsd.org	15	M	11	GYM	Harm, Kirk J.	Davila Abrigo, Jefferson Omar	f	\N
7218	Mason	Davila	54422	4	s.davila422@cvuhsd.org	15	F	11	K-215	Obeso, Setareh	Davila, Mason	f	\N
7219	Jhillian Kate	De Jesus	56122	4	j.dejesus122@cvuhsd.org	15	F	11	J-112	Levine, Allison A	De Jesus, Jhillian Kate Agudo	f	\N
7220	Meliza	De La Cruz Camacho	53704	4	m.delacruzcamacho704@cvuhsd.org	15	F	11	L-104	Najarro, Claudia	De La Cruz Camacho, Meliza	f	\N
7221	Kaory	De La Cruz Vazquez	57456	4	k.delacruzvazquez456@cvuhsd.org	15	F	11	D-105	Lesan, Kristine M	De La Cruz Vazquez, Kaory Yolit	f	\N
7222	Zomatecuhtli	De La Mora	53705	4	z.delamora705@cvuhsd.org	15	M	11	L-104	Najarro, Claudia	De La Mora, Zomatecuhtli Benito	f	\N
7223	Katelyn	De La Torre	53706	4	k.delatorre706@cvuhsd.org	15	F	11	F-107	Rice, Christopher A.	De La Torre, Katelyn	f	\N
7224	Kimberly	De Lao	53981	4	k.delao981@cvuhsd.org	15	F	11	K-215	Obeso, Setareh	De Lao, Kimberly Michelle	f	\N
7225	Genesis	De Leon Chavac	57888	4	g.deleonchavac888@cvuhsd.org	15	F	11	M-218	Navarro, Isis E.	De Leon Chavac, Genesis Lourdes	f	\N
7226	Alondra	Deleon Oliva	53707	4	a.deleonoliva707@cvuhsd.org	15	F	11	L-104	Najarro, Claudia	Deleon Oliva, Alondra Sarai	f	\N
7227	Maudiel	Diaz Garcia	58179	4	m.diazgarcia179@cvuhsd.org	15	M	11	GYM	Phillips, Morris L	Diaz Garcia, Maudiel Josue	f	\N
7228	Odalis	Diaz	54179	4	o.diaz179@cvuhsd.org	15	F	11	K-106	Gonzalez, Veronica C.	Diaz, Odalis Raelene	f	\N
7229	Christopher	Dimas	54267	4	c.dimas267@cvuhsd.org	15	M	11	G-101	Galt, Douglas S	Dimas, Christopher Alejandro	f	\N
7230	Emma	Dominguez	53848	4	e.dominguez848@cvuhsd.org	15	F	11	D-211	Collins, Matthew A	Dominguez, Emma Sophia	f	\N
7231	Oscar	Dominguez	54479	4	o.dominguez479@cvuhsd.org	15	M	11	M-111	Valencia, Sandra	Dominguez, Oscar	f	\N
7232	Ashley	Duenas	55205	4	a.duenas205@cvuhsd.org	15	F	11	M-111	Valencia, Sandra	Duenas, Ashley Jaslene	f	\N
7233	Eliana	Duenas	54329	4	e.duenasvelasquez329@cvuhsd.org	15	F	11	M-111	Valencia, Sandra	Duenas, Eliana Sarai	f	\N
7234	Daniel	Duran	54533	4	d.duran533@cvuhsd.org	15	M	11	K-106	Gonzalez, Veronica C.	Duran, Daniel	f	\N
7235	Asani	Durfield	56939	4	a.durfield939@cvuhsd.org	15	F	11	F-106	Givens, Kathy E.	Durfield, Asani Donata	f	\N
7236	Allisson	Elenes	55319	4	a.elenes319@cvuhsd.org	15	F	11	K-105	Gonzalez, Alejandra	Elenes, Allisson Altair	f	\N
7237	Brian	Escalera	54647	4	b.escalera647@cvuhsd.org	15	M	11	GYM	Harm, Kirk J.	Escalera, Brian Camilo	f	\N
7238	Juan	Escamilla	54569	4	j.escamilla569@cvuhsd.org	15	M	11	K-215	Obeso, Setareh	Escamilla, Juan	f	\N
7239	Alvaro	Escobar	54151	4	a.escobar151@cvuhsd.org	15	M	11	K-215	Obeso, Setareh	Escobar, Alvaro Jose	f	\N
7240	Sebastian	Espinoza	55365	4	s.espinoza365@cvuhsd.org	15	M	11	D-110	Rosales, Virginia	Espinoza, Sebastian Gabriel	f	\N
7241	Angela	Esquives Medina	53709	4	a.esquivesmedina709@cvuhsd.org	15	F	11	K-215	Obeso, Setareh	Esquives Medina, Angela	f	\N
7242	Danyel	Estrada Ortiz	53939	4	d.estradaortiz939@cvuhsd.org	15	M	11	M-111	Valencia, Sandra	Estrada Ortiz, Danyel Ernesto	f	\N
7243	Yani	Estrada Suchite	54679	4	y.estradasuchite679@cvuhsd.org	15	M	11	L-104	Najarro, Claudia	Estrada Suchite, Yani Fernando	f	\N
7244	Julieta	Estrada	53711	4	j.estrada711@cvuhsd.org	15	F	11	D-211	Collins, Matthew A	Estrada, Julieta	f	\N
7245	Jose	Farias	54727	4	j.farias727@cvuhsd.org	15	M	11	K-215	Obeso, Setareh	Farias, Jose Christian	f	\N
7246	Gabriel	Feria	53712	4	g.feria712@cvuhsd.org	15	M	11	D-110	Rosales, Virginia	Feria, Gabriel Erick	f	\N
7247	Aiyana	Figueroa	57548	4	a.figueroa548@cvuhsd.org	15	F	11	C-214	Abrahams, Thomas L.	Figueroa, Aiyana Ma'fia	f	\N
7248	Angely	Figueroa	54352	4	a.figueroa352@cvuhsd.org	15	F	11	C-117	Jones, Michael R.	Figueroa, Angely Dariela	f	\N
7249	Bryanna	Flores	57424	4	b.flores424@cvuhsd.org	15	F	11	F-106	Givens, Kathy E.	Flores, Bryanna	f	\N
7250	Jade	Forrest	55075	4	j.forrest075@cvuhsd.org	15	F	11	C-204	Rios, James	Forrest, Jade Marie	f	\N
7251	Alana	Franco	58044	4	a.franco044@cvuhsd.org	15	F	11	K-202	Allen, Richard E	Franco, Alana	f	\N
7252	Paola	Fuentes Hernandez	55457	4	p.fuenteshernande457@cvuhsd.org	15	F	11	K-106	Gonzalez, Veronica C.	Fuentes Hernandez, Paola Nayeli	f	\N
7253	Luna	Fuentes	55076	4	l.fuentes076@cvuhsd.org	15	F	11	D-211	Collins, Matthew A	Fuentes, Luna Genesis	f	\N
7254	Melanie	Fuentes	53715	4	m.fuentes715@cvuhsd.org	15	F	11	L-104	Najarro, Claudia	Fuentes, Melanie Guadalupe	f	\N
7255	Vianca	Gaddi	55590	4	v.gaddi590@cvuhsd.org	15	F	11	J-105	Bowman, Lauren C.	Gaddi, Vianca Medina	f	\N
7256	Michelle	Galindo Garcia	54534	4	m.galindogarcia534@cvuhsd.org	15	F	11	K-106	Gonzalez, Veronica C.	Galindo Garcia, Michelle	f	\N
7257	Bella	Gamez	54711	4	b.gamez711@cvuhsd.org	15	F	11	K-106	Gonzalez, Veronica C.	Gamez, Bella Ileana	f	\N
7258	Sharlyn	Gamiz	58013	4	s.gamiz013@cvuhsd.org	15	F	11	K-105	Gonzalez, Alejandra	Gamiz, Sharlyn Vanessa	f	\N
7259	Gael	Garayar	55660	4	g.garayar660@cvuhsd.org	15	M	11	GYM	Harm, Kirk J.	Garayar, Gael Federico	f	\N
7260	Angel	Garcia Renteria	54266	4	a.garciarenteria266@cvuhsd.org	15	M	11	D-110	Rosales, Virginia	Garcia Renteria, Angel Jesus	f	\N
7261	Geovanni	Garcia Saavedra	53720	4	g.garciasaavedra720@cvuhsd.org	15	M	11	K-202	Allen, Richard E	Garcia Saavedra, Geovanni Yitzhak	f	\N
7262	Alexander	Garcia	54660	4	a.garcia660@cvuhsd.org	15	M	11	D-110	Rosales, Virginia	Garcia, Alexander	f	\N
7263	Alina	Garcia	53716	4	a.garcia716@cvuhsd.org	15	F	11	L-101	Legg, Adam	Garcia, Alina Gisselle	f	\N
7264	Anthony	Garcia	54691	4	a.garcia691@cvuhsd.org	15	M	11	K-215	Obeso, Setareh	Garcia, Anthony Alexander	f	\N
7265	Jayla	Garcia	55243	4	j.garcia243@cvuhsd.org	15	F	11	C-103	Hoang, Huy T.	Garcia, Jayla Amari	f	\N
7266	Joyelin	Garcia	53719	4	j.garcia719@cvuhsd.org	15	F	11	D-211	Collins, Matthew A	Garcia, Joyelin Stephanie	f	\N
7267	Sara	Garcia	58225	4	s.garcia225@cvuhsd.org	15	F	11	K-202	Allen, Richard E	Garcia, Sara Valeria	f	\N
7268	Vanessa	Garcia	55077	4	v.garcia077@cvuhsd.org	15	F	11	J-105	Bowman, Lauren C.	Garcia, Vanessa Miley	f	\N
7269	Marco	Gaytan Burciaga	55079	4	d.gaytanburciaga079@cvuhsd.org	15	M	11	D-211	Collins, Matthew A	Gaytan Burciaga, Marco	f	\N
7270	Itzel	Gifarro	57345	4	i.gifarro345@cvuhsd.org	15	F	11	D-204	Fuchs, Frank J	Gifarro, Itzel	f	\N
7271	Kendal	Glover	57372	4	k.glover372@cvuhsd.org	15	F	11	M-111	Valencia, Sandra	Glover, Kendal Jaylyn	f	\N
7272	Kennedy	Glover	57371	4	k.glover371@cvuhsd.org	15	F	11	K-105	Gonzalez, Alejandra	Glover, Kennedy Jewel	f	\N
7273	Stephanie	Gomez Guzman	59090	4	s.gomezguzman090@cvuhsd.org	15	F	11	D-105	Lesan, Kristine M	Gomez Guzman, Stephanie Michelle	f	\N
7274	Ender	Gomez Lopez	54514	4	e.gomezlopez514@cvuhsd.org	15	M	11	M-218	Navarro, Isis E.	Gomez Lopez, Ender Damian	f	\N
7275	Johnathan	Gomez Vazquez	59075	4	j.gomezvazquez075@cvuhsd.org	15	M	11	GYM	Harm, Kirk J.	Gomez Vazquez, Johnathan	f	\N
7276	Alberto	Gomez	53721	4	a.gomez721@cvuhsd.org	15	M	11	C-204	Rios, James	Gomez, Alberto Miguel	f	\N
7277	Esmeralda	Gomez	54662	4	e.gomez662@cvuhsd.org	15	F	11	F-106	Givens, Kathy E.	Gomez, Esmeralda	f	\N
7278	Julian	Gomez	53722	4	j.gomez722@cvuhsd.org	15	M	11	C-117	Jones, Michael R.	Gomez, Julian	f	\N
7279	Juan Carlos	Gonzales	54844	4	j.gonzales844@cvuhsd.org	15	M	11	J-105	Bowman, Lauren C.	Gonzales, Juan Carlos King	f	\N
7280	Agnes	Gonzalez Castillo	58240	4	a.gonzalezcastill240@cvuhsd.org	15	M	11	D-207	Gonzalez, Deborah A	Gonzalez Castillo, Agnes Harold	f	\N
7281	Citlali	Gonzalez Gonzalez	58827	4	c.gonzalezgonzal827@cvuhsd.org	15	F	11	GYM	Phillips, Morris L	Gonzalez Gonzalez, Citlali Belen	f	\N
7282	Christian	Gonzalez Portillo	53723	4	c.gonzalezportill723@cvuhsd.org	15	M	11	K-202	Allen, Richard E	Gonzalez Portillo, Christian Adan	f	\N
7283	Alexis	Gonzalez	54134	4	a.gonzalez134@cvuhsd.org	15	M	11	M-113	Aispuro, Mayte	Gonzalez, Alexis	f	\N
7284	Martha	Gonzalez	59175	4	m.gonzalez175@cvuhsd.org	15	F	11	K-105	Gonzalez, Alejandra	Gonzalez, Martha Crystal	f	\N
7285	Stephanie	Graciano	54515	4	s.graciano515@cvuhsd.org	15	F	11	L-104	Najarro, Claudia	Graciano, Stephanie	f	\N
7286	Selvin	Gramajo Hernandez	54857	4	s.gramajohernande857@cvuhsd.org	15	M	11	J-105	Bowman, Lauren C.	Gramajo Hernandez, Selvin Orlando	f	\N
7287	Cameron	Greer	54664	4	c.greer664@cvuhsd.org	15	M	11	GYM	Phillips, Morris L	Greer, Cameron Jason	f	\N
7288	Dahlia	Guerra	55119	4	d.guerra119@cvuhsd.org	15	F	11	C-103	Hoang, Huy T.	Guerra, Dahlia Giselle	f	\N
7289	Hector	Guerra	56290	4	h.guerra290@cvuhsd.org	15	M	11	C-103	Hoang, Huy T.	Guerra, Hector Isaac	f	\N
7290	Adrian	Gutierrez	54325	4	a.gutierrez325@cvuhsd.org	15	M	11	D-110	Rosales, Virginia	Gutierrez, Adrian Angel	f	\N
7291	Kaily	Gutierrez	53724	4	k.gutierrez724@cvuhsd.org	15	F	11	K-202	Allen, Richard E	Gutierrez, Kaily Astrid	f	\N
7292	Leilani	Gutierrez	53726	4	l.gutierrez726@cvuhsd.org	15	F	11	C-103	Hoang, Huy T.	Gutierrez, Leilani Elvira	f	\N
7293	Monica	Gutierrez	53725	4	m.gutierrez725@cvuhsd.org	15	F	11	D-211	Collins, Matthew A	Gutierrez, Monica Guadalupe	f	\N
7294	Jordyn	Harrell	54432	4	j.harrell432@cvuhsd.org	15	M	11	K-106	Gonzalez, Veronica C.	Harrell, Jordyn Butros	f	\N
7295	Tiani	Harris	54311	4	t.harris311@cvuhsd.org	15	F	11	K-215	Obeso, Setareh	Harris, Tiani Jhene'	f	\N
7296	Zakari	Henley	54848	4	z.henley848@cvuhsd.org	15	F	11	M-111	Valencia, Sandra	Henley, Zakari Lyric	f	\N
7297	Zoe	Hernandez Espinoza	58727	4	z.hernandezespin727@cvuhsd.org	15	F	11	L-104	Najarro, Claudia	Hernandez Espinoza, Zoe Danielynn	f	\N
7298	Gerardo	Hernandez Lopez	55611	4	g.hernandezlopez611@cvuhsd.org	15	M	11	K-114	Loera, Jorge Antonio	Hernandez Lopez, Gerardo	f	\N
7299	Nathan	Hernandez Martinez	55265	4	n.hernandezmartin265@cvuhsd.org	15	M	11	D-211	Collins, Matthew A	Hernandez Martinez, Nathan Alexander	f	\N
7300	Natalia	Hernandez Novelo	57594	4	n.hernandeznovelo594@cvuhsd.org	15	F	11	C-103	Hoang, Huy T.	Hernandez Novelo, Natalia	f	\N
7301	Andrea	Hernandez Valdovinos	55110	4	a.hernandezvaldov110@cvuhsd.org	15	F	11	K-106	Elias, Michael	Hernandez Valdovinos, Andrea	f	\N
7302	Bella	Hernandez	55433	4	b.hernandez433@cvuhsd.org	15	F	11	K-202	Allen, Richard E	Hernandez, Bella Chanel	f	\N
7303	Brianna	Hernandez	53728	4	b.hernandez728@cvuhsd.org	15	F	11	C-204	Rios, James	Hernandez, Brianna Juliet	f	\N
7304	Carlos	Hernandez	55030	4	c.hernandez030@cvuhsd.org	15	M	11	G-101	Galt, Douglas S	Hernandez, Carlos Jose	f	\N
7305	Natalia	Hernandez	54656	4	n.hernandez656@cvuhsd.org	15	F	11	M-110	Segovia, Jose M	Hernandez, Natalia Marie	f	\N
7306	Pedro	Hernandez	54655	4	p.hernandez655@cvuhsd.org	15	M	11	D-110	Rosales, Virginia	Hernandez, Pedro Ismael	f	\N
7307	Uriel	Herrera	53730	4	u.herrera730@cvuhsd.org	15	M	11	D-211	Collins, Matthew A	Herrera, Uriel	f	\N
7308	Hector	Jacobo Campos	58413	4	h.jacobocampos413@cvuhsd.org	15	M	11	F-106	Givens, Kathy E.	Jacobo Campos, Hector	f	\N
7309	Abraham	Jaimes	53733	4	a.jaimes733@cvuhsd.org	15	M	11	K-215	Obeso, Setareh	Jaimes, Abraham	f	\N
7310	Israel	Jimenez	53734	4	i.jimenez734@cvuhsd.org	15	M	11	K-114	Loera, Jorge Antonio	Jimenez, Israel	f	\N
7311	Reymundo	Jimenez	54503	4	r.jimenez503@cvuhsd.org	15	M	11	M-117	Tarkington, Cole	Jimenez, Reymundo Isaac	f	\N
7312	Emmanuel	Johnson	57420	4	e.johnson420@cvuhsd.org	15	M	11	K-105	Gonzalez, Alejandra	Johnson, Emmanuel Kevin	f	\N
7313	Zaniyah	Jordan	57107	4	z.jordan107@cvuhsd.org	15	F	11	D-110	Rosales, Virginia	Jordan, Zaniyah Mavhani	f	\N
7314	Ashley	Julian	59310	4	a.julian310@cvuhsd.org	15	F	11	L-101	Legg, Adam	Julian, Ashley	f	\N
7315	Katherine	Kelly	54812	4	k.kelly812@cvuhsd.org	15	F	11	K-106	Gonzalez, Veronica C.	Kelly, Katherine Sinead	f	\N
7316	Bryan	Lara May	54244	4	b.laramay244@cvuhsd.org	15	M	11	K-215	Obeso, Setareh	Lara May, Bryan Albert	f	\N
7317	Sebastine	Lara	55022	4	s.lara022@cvuhsd.org	15	M	11	K-202	Allen, Richard E	Lara, Sebastine Serafin	f	\N
7318	Justice	Lawes	55173	4	j.lawes173@cvuhsd.org	15	M	11	J-112	Levine, Allison A	Lawes, Justice Kael	f	\N
7319	Karisma	Lee	59275	4	k.lee275@cvuhsd.org	15	F	11	D-211	Collins, Matthew A	Lee, Karisma Marie	f	\N
7320	Jesus	Lemus	53746	4	j.lemus746@cvuhsd.org	15	M	11	C-103	Hoang, Huy T.	Lemus, Jesus Luis Asch	f	\N
7321	Matthew	Letona	54451	4	m.letona451@cvuhsd.org	15	M	11	C-204	Rios, James	Letona, Matthew Aldair	f	\N
7322	Ashlyn	Lopez Martinez	55095	4	a.lopezmartinez095@cvuhsd.org	15	F	11	M-111	Valencia, Sandra	Lopez Martinez, Ashlyn Daniela	f	\N
7323	Sofia	Lopez Moran	53749	4	s.lopezmoran749@cvuhsd.org	15	F	11	D-211	Collins, Matthew A	Lopez Moran, Sofia Ximena	f	\N
7324	Geovanni	Lopez Orozco	55130	4	g.lopezorozco130@cvuhsd.org	15	M	11	L-103	Castillo, Amy	Lopez Orozco, Geovanni Gerardo	f	\N
7325	Maycol	Lopez Pena	57595	4	m.lopezpena595@cvuhsd.org	15	M	11	D-101	Fikes, Leyla T	Lopez Pena, Maycol Joseph	f	\N
7326	Ashley	Lopez Preciado	54156	4	a.lopezpreciado156@cvuhsd.org	15	F	11	L-103	Castillo, Amy	Lopez Preciado, Ashley Maite	f	\N
7327	Pedro	Lopez Quintero	55184	4	p.lopezquintero184@cvuhsd.org	15	M	11	G-101	Galt, Douglas S	Lopez Quintero, Pedro Daniel	f	\N
7328	Cristopher	Lopez Rodriguez	55015	4	c.lopezrodriguez015@cvuhsd.org	15	M	11	K-114	Loera, Jorge Antonio	Lopez Rodriguez, Cristopher	f	\N
7329	Anastacio	Lopez	53747	4	a.lopez747@cvuhsd.org	15	M	11	D-110	Rosales, Virginia	Lopez, Anastacio Marcello	f	\N
7330	Ashley	Lopez	53748	4	a.lopez748@cvuhsd.org	15	F	11	K-215	Obeso, Setareh	Lopez, Ashley	f	\N
7331	Cindy	Lopez	54867	4	c.lopez867@cvuhsd.org	15	F	11	J-105	Bowman, Lauren C.	Lopez, Cindy Samantha	f	\N
7332	Jennifer	Lopez	55367	4	j.lopez367@cvuhsd.org	15	F	11	K-106	Elias, Michael	Lopez, Jennifer	f	\N
7333	Rosemary	Lopez	54552	4	r.lopez552@cvuhsd.org	15	F	11	K-106	Gonzalez, Veronica C.	Lopez, Rosemary	f	\N
7334	Victor	Loredo	55127	4	v.loredo127@cvuhsd.org	15	M	11	GYM	Harm, Kirk J.	Loredo, Victor	f	\N
7335	Cristian	Lorenzana Fernando	54565	4	c.lorenzanafernan565@cvuhsd.org	15	M	11	C-103	Hoang, Huy T.	Lorenzana Fernando, Cristian	f	\N
7336	Ja Syer	Louie	55203	4	j.louie203@cvuhsd.org	15	M	11	M-110	Segovia, Jose M	Louie, Ja Syer Sir	f	\N
7337	Arianna	Lozada	54307	4	a.lozada307@cvuhsd.org	15	F	11	K-106	Gonzalez, Veronica C.	Lozada, Arianna Jelisse	f	\N
7338	Nayeli	Lozano	54642	4	n.lozano642@cvuhsd.org	15	F	11	D-204	Fuchs, Frank J	Lozano, Nayeli	f	\N
7339	Javier	Luna Gonzalez	53750	4	j.lunagonzalez750@cvuhsd.org	15	M	11	D-211	Collins, Matthew A	Luna Gonzalez, Javier Alexander	f	\N
7340	Christopher	Lynch	54640	4	c.lynch640@cvuhsd.org	15	M	11	M-110	Segovia, Jose M	Lynch, Christopher Joseph	f	\N
7341	Isabella	Mangiagli	57620	4	i.mangiagli620@cvuhsd.org	15	F	11	K-215	Obeso, Setareh	Mangiagli, Isabella Diane	f	\N
7342	Laura	Marin Valencia	55642	4	l.marinvalencia642@cvuhsd.org	15	F	11	K-216	Arangoa Ramirez, Christian	Marin Valencia, Laura Camila	f	\N
7343	Victor	Marin	53751	4	v.marin751@cvuhsd.org	15	M	11	D-211	Collins, Matthew A	Marin, Victor Josue	f	\N
7344	Fernando	Martinez Santos	55131	4	f.martinezsantos131@cvuhsd.org	15	M	11	L-104	Najarro, Claudia	Martinez Santos, Fernando Andres	f	\N
7345	Camila	Martinez	53752	4	c.martinez752@cvuhsd.org	15	F	11	D-110	Rosales, Virginia	Martinez, Camila Miranda	f	\N
7346	Cristian	Martinez	55403	4	c.martinez403@cvuhsd.org	15	M	11	M-118	Aguilar Hernandez, Leslie	Martinez, Cristian Saul	f	\N
7347	Daniella	Martinez	54952	4	d.martinez952@cvuhsd.org	15	F	11	M-112	Barahona, Iris	Martinez, Daniella	f	\N
7348	Fernando	Martinez	54417	4	f.martinez417@cvuhsd.org	15	M	11	D-110	Rosales, Virginia	Martinez, Fernando	f	\N
7349	Phoebe	Matsusaka	55009	4	p.matsusaka009@cvuhsd.org	15	F	11	C-103	Hoang, Huy T.	Matsusaka, Phoebe Lekili	f	\N
7350	Valentina	Medellin Hernandez	53754	4	v.medellinhernand754@cvuhsd.org	15	F	11	L-104	Najarro, Claudia	Medellin Hernandez, Valentina	f	\N
7351	Ana	Medina	54695	4	a.medina695@cvuhsd.org	15	F	11	K-105	Gonzalez, Alejandra	Medina, Ana Julissa	f	\N
7352	Axel	Melendrez Carmona	54513	4	a.melendrezcarmon513@cvuhsd.org	15	M	11	G-101	Galt, Douglas S	Melendrez Carmona, Axel Geovan	f	\N
7353	Kimberly	Mendez Cruz	54279	4	k.mendezcruz279@cvuhsd.org	15	F	11	C-204	Rios, James	Mendez Cruz, Kimberly	f	\N
7354	Jose	Mendez	53756	4	j.mendez756@cvuhsd.org	15	M	11	GYM	Harm, Kirk J.	Mendez, Jose Alberto	f	\N
7355	Marisol	Mendez	53755	4	m.mendez755@cvuhsd.org	15	F	11	C-103	Hoang, Huy T.	Mendez, Marisol	f	\N
7356	Adrien	Mendoza	53757	4	a.mendoza757@cvuhsd.org	15	M	11	GYM	Harm, Kirk J.	Mendoza, Adrien	f	\N
7357	Michael	Mercado De Leon	59006	4	m.mercadodeleon006@cvuhsd.org	15	M	11	K-106	Gonzalez, Veronica C.	Mercado De Leon, Michael	f	\N
7358	Yesenia	Mercado	53758	4	y.mercado758@cvuhsd.org	15	F	11	C-103	Hoang, Huy T.	Mercado, Yesenia Nohemi	f	\N
7359	Tru	Michaels	57295	4	t.michaels295@cvuhsd.org	15	F	11	M-111	Valencia, Sandra	Michaels, Tru Kimberly Michaels	f	\N
7360	Alfredo	Miguel Hernandez	55105	4	a.miguelhernandez105@cvuhsd.org	15	M	11	G-101	Galt, Douglas S	Miguel Hernandez, Alfredo	f	\N
7361	Miranda	Mijares	55112	4	m.mijares112@cvuhsd.org	15	F	11	I-2	Pimentel, Carlina	Mijares, Miranda	f	\N
7362	Jayden	Miranda	54159	4	j.miranda159@cvuhsd.org	15	M	11	GYM	Harm, Kirk J.	Miranda, Jayden	f	\N
7363	Chukwubuezem	Mmaduanusi	56798	4	c.mmaduanusi798@cvuhsd.org	15	M	11	J-118	Gray, Ron	Mmaduanusi, Chukwubuezem David	f	\N
7364	Helen	Monroy Gomez	58068	4	h.monroygomez068@cvuhsd.org	15	F	11	GYM	Phillips, Morris L	Monroy Gomez, Helen Mariana	f	\N
7365	Kaylee	Montiel	55121	4	k.montiel121@cvuhsd.org	15	F	11	K-202	Allen, Richard E	Montiel, Kaylee Maria	f	\N
7366	Evelyn	Montoya Lopez	54472	4	e.montoyalopez472@cvuhsd.org	15	F	11	K-216	Arangoa Ramirez, Christian	Montoya Lopez, Evelyn Samantha	f	\N
7367	Matthew	Montoya	53759	4	m.montoya759@cvuhsd.org	15	M	11	K-215	Obeso, Setareh	Montoya, Matthew Ramirez	f	\N
7368	Rebecca	Montoya	57327	4	r.montoya327@cvuhsd.org	15	F	11	D-211	Collins, Matthew A	Montoya, Rebecca Renee	f	\N
7369	Joshua	Monzon	53760	4	j.monzon760@cvuhsd.org	15	M	11	D-211	Collins, Matthew A	Monzon, Joshua Angel	f	\N
7370	Hector	Mora	53761	4	h.mora761@cvuhsd.org	15	M	11	K-106	Elias, Michael	Mora, Hector Abraham	f	\N
7371	Oscar	Morales Luna	53762	4	o.moralesluna762@cvuhsd.org	15	M	11	K-105	Gonzalez, Alejandra	Morales Luna, Oscar	f	\N
7372	Arian	Morales	55373	4	a.morales373@cvuhsd.org	15	M	11	C-103	Hoang, Huy T.	Morales, Arian Horacio	f	\N
7373	Daniel	Morales	57284	4	d.morales284@cvuhsd.org	15	M	11	C-106	Howard Johnson, Crystal	Morales, Daniel Albert	f	\N
7374	Nelson	Morales	54703	4	n.morales703@cvuhsd.org	15	M	11	C-204	Rios, James	Morales, Nelson Aldair	f	\N
7375	Nancy	Morales-Perez	53763	4	n.moralesperez763@cvuhsd.org	15	F	11	K-106	Gonzalez, Veronica C.	Morales-Perez, Nancy	f	\N
7376	Cristhofer	Moreno	53764	4	c.moreno764@cvuhsd.org	15	M	11	K-215	Obeso, Setareh	Moreno, Cristhofer Daniel	f	\N
7377	London	Morgan	53937	4	l.morgan937@cvuhsd.org	15	F	11	K-215	Obeso, Setareh	Morgan, London Marrie	f	\N
7378	Sheikh Uroosa	Mujeeb	55096	4	s.mujeeb096@cvuhsd.org	15	F	11	I-2	Pimentel, Carlina	Mujeeb, Sheikh Uroosa	f	\N
7379	Jude	Murillo	53765	4	j.murillo765@cvuhsd.org	15	M	11	D-211	Collins, Matthew A	Murillo, Jude Angel	f	\N
7380	Bernabeth	Navarrete-Marcial	53766	4	b.navarretemarcia766@cvuhsd.org	15	M	11	K-114	Loera, Jorge Antonio	Navarrete-Marcial, Bernabeth	f	\N
7381	Emily	Niedermeyer	53768	4	e.niedermeyer768@cvuhsd.org	15	F	11	I-2	Pimentel, Carlina	Niedermeyer, Emily Gretchen	f	\N
7382	Jaime	Nieto	54636	4	j.nieto636@cvuhsd.org	15	M	11	G-101	Galt, Douglas S	Nieto, Jaime	f	\N
7383	Rocelyn	Nunez Larios	54270	4	r.nunezlarios270@cvuhsd.org	15	F	11	I-2	Pimentel, Carlina	Nunez Larios, Rocelyn Christina	f	\N
7384	Andrea	Nunez Loayza	55362	4	a.nunezloayza362@cvuhsd.org	15	F	11	I-2	Pimentel, Carlina	Nunez Loayza, Andrea Milusca	f	\N
7385	Cristobal	Nunez	55218	4	c.nunez218@cvuhsd.org	15	M	11	C-103	Hoang, Huy T.	Nunez, Cristobal Dionicio	f	\N
7386	Ismael	Obando	55122	4	i.obando122@cvuhsd.org	15	M	11	K-106	Gonzalez, Veronica C.	Obando, Ismael	f	\N
7387	Cesar	Ochoa Rodas	58288	4	c.ochoarodas288@cvuhsd.org	15	M	11	G-101	Galt, Douglas S	Ochoa Rodas, Cesar Leonardo	f	\N
7388	Bella	Olivas Morales	55190	4	b.olivasmorales190@cvuhsd.org	15	F	11	K-105	Gonzalez, Alejandra	Olivas Morales, Bella Dalila	f	\N
7389	Luis	Olmeda	54996	4	l.olmeda996@cvuhsd.org	15	M	11	C-117	Jones, Michael R.	Olmeda, Luis Antonio	f	\N
7390	Herbert	Ordonez-Gomez	54518	4	h.ordonezgomez518@cvuhsd.org	15	M	11	K-215	Obeso, Setareh	Ordonez-Gomez, Herbert Manolo	f	\N
7391	Victor	Oropeza Torres	57887	4	v.oropezatorres887@cvuhsd.org	15	M	11	GYM	Phillips, Morris L	Oropeza Torres, Victor Daniel	f	\N
7392	Andrea	Ortiz Cordero	53771	4	a.ortizcordero771@cvuhsd.org	15	F	11	L-104	Najarro, Claudia	Ortiz Cordero, Andrea Nicolle	f	\N
7393	Jude Emmanuel	Ortiz	59300	4	j.ortiz300@cvuhsd.org	15	M	11	J-112	Levine, Allison A	Ortiz, Jude Emmanuel	f	\N
7394	Matthew	Ortiz	54124	4	m.ortiz124@cvuhsd.org	15	M	11	G-101	Galt, Douglas S	Ortiz, Matthew Sebastian	f	\N
7395	Skye	Oseguera	54465	4	s.oseguera465@cvuhsd.org	15	F	11	C-204	Rios, James	Oseguera, Skye Taylor	f	\N
7396	Zoey	Pacheco	53772	4	z.pacheco772@cvuhsd.org	15	F	11	K-202	Allen, Richard E	Pacheco, Zoey Laurette	f	\N
7397	Santiago	Paredes	54712	4	s.paredes712@cvuhsd.org	15	M	11	J-113	Urquidez, Donald	Paredes, Santiago Geronimo	f	\N
7398	Katherine	Parraguirre-Perez	54991	4	k.parraguirrepere991@cvuhsd.org	15	F	11	K-215	Obeso, Setareh	Parraguirre-Perez, Katherine Galilea	f	\N
7399	Harin	Patel	53773	4	h.patel773@cvuhsd.org	15	M	11	D-211	Collins, Matthew A	Patel, Harin Bharat	f	\N
7400	Zuleika Jacqzen	Pecson	55001	4	z.pecson001@cvuhsd.org	15	F	11	D-211	Collins, Matthew A	Pecson, Zuleika Jacqzen Quibal	f	\N
7401	Brianna	Perez Garcia	55093	4	b.perezgarcia093@cvuhsd.org	15	F	11	J-105	Bowman, Lauren C.	Perez Garcia, Brianna	f	\N
7402	Angel	Perez Hernandez	57378	4	a.perezhernandez378@cvuhsd.org	15	M	11	D-105	Lesan, Kristine M	Perez Hernandez, Angel Roberto	f	\N
7403	Gohan	Perez	55309	4	g.perez309@cvuhsd.org	15	M	11	K-215	Obeso, Setareh	Perez, Gohan Vang	f	\N
7404	Miguel	Perez	54987	4	m.perez987@cvuhsd.org	15	M	11	K-215	Obeso, Setareh	Perez, Miguel	f	\N
7405	Roxanne	Perez	54098	4	r.perez098@cvuhsd.org	15	F	11	J-105	Bowman, Lauren C.	Perez, Roxanne Leila	f	\N
7406	Valerie	Perez	55113	4	v.perez113@cvuhsd.org	15	F	11	C-204	Rios, James	Perez, Valerie Giselle	f	\N
7407	Juan	Pizano	54877	4	j.pizano877@cvuhsd.org	15	M	11	C-204	Rios, James	Pizano, Juan Carlos	f	\N
7408	Ricardo	Pizano	53774	4	r.pizano774@cvuhsd.org	15	M	11	D-211	Collins, Matthew A	Pizano, Ricardo Andres	f	\N
7409	Vinnie	Pollard	54713	4	v.pollard713@cvuhsd.org	15	M	11	K-114	Loera, Jorge Antonio	Pollard, Vinnie	f	\N
7410	Emily	Pool	53775	4	e.pool775@cvuhsd.org	15	F	11	D-110	Rosales, Virginia	Pool, Emily	f	\N
7411	Ashley	Poot Gonzalez	54443	4	a.pootgonzalez443@cvuhsd.org	15	F	11	K-215	Obeso, Setareh	Poot Gonzalez, Ashley Aimee	f	\N
7412	Melinda	Prado	54881	4	m.prado881@cvuhsd.org	15	F	11	C-204	Rios, James	Prado, Melinda	f	\N
7413	Carter	Preston	54521	4	c.preston521@cvuhsd.org	15	M	11	K-106	Elias, Michael	Preston, Carter Kieran	f	\N
7414	Jesse	Pulido Barraza	55146	4	j.pulidobarraza146@cvuhsd.org	15	M	11	L-101	Legg, Adam	Pulido Barraza, Jesse Jr.	f	\N
7415	Noris	Pulunto	55496	4	n.pulunto496@cvuhsd.org	15	F	11	K-202	Allen, Richard E	Pulunto, Noris Raquel	f	\N
7416	Steven	Ramirez Avila	53777	4	s.ramirezavila777@cvuhsd.org	15	M	11	M-218	Navarro, Isis E.	Ramirez Avila, Steven	f	\N
7417	Jairo	Ramirez Martinez	53778	4	j.ramirezmartinez778@cvuhsd.org	15	M	11	K-202	Allen, Richard E	Ramirez Martinez, Jairo Jesus	f	\N
7418	Jotzan	Ramirez Navarrete	59295	4	j.ramireznavarre295@cvuhsd.org	15	M	11	D-207	Gonzalez, Deborah A	Ramirez Navarrete, Jotzan	f	\N
7419	Brian	Ramirez	55132	4	b.ramirez132@cvuhsd.org	15	M	11	GYM	Harm, Kirk J.	Ramirez, Brian Bulmaro	f	\N
7420	Roselyn	Ramirez	53776	4	r.ramirez776@cvuhsd.org	15	F	11	C-204	Rios, James	Ramirez, Roselyn	f	\N
7421	Ruben	Ramirez	55094	4	r.ramirez094@cvuhsd.org	15	M	11	J-118	Gray, Ron	Ramirez, Ruben	f	\N
7422	Yosuel	Ramirez	54163	4	y.ramirez163@cvuhsd.org	15	M	11	G-101	Galt, Douglas S	Ramirez, Yosuel	f	\N
7423	Michelle	Ramos Medina	53779	4	m.ramosmedina779@cvuhsd.org	15	F	11	K-215	Obeso, Setareh	Ramos Medina, Michelle Isabella	f	\N
7424	Daisy	Ramos	54519	4	d.ramos519@cvuhsd.org	15	F	11	M-111	Valencia, Sandra	Ramos, Daisy Juliana	f	\N
7425	Ivan	Ramos	55167	4	i.ramos167@cvuhsd.org	15	M	11	C-103	Hoang, Huy T.	Ramos, Ivan Manuel	f	\N
7426	Jayden	Ramos	54416	4	j.ramos416@cvuhsd.org	15	M	11	M-111	Valencia, Sandra	Ramos, Jayden William	f	\N
7427	Jose	Ramos	54476	4	j.ramos476@cvuhsd.org	15	M	11	M-111	Valencia, Sandra	Ramos, Jose Manuel	f	\N
7428	Roxane	Ramos	54482	4	r.ramos482@cvuhsd.org	15	F	11	GYM	Phillips, Morris L	Ramos, Roxane Lorayne	f	\N
7429	Yahaira	Ramos	54164	4	y.ramos164@cvuhsd.org	15	F	11	K-215	Obeso, Setareh	Ramos, Yahaira Joceline	f	\N
7430	D'Anthony	Ramsay	57180	4	d.ramsay180@cvuhsd.org	15	M	11	K-114	Loera, Jorge Antonio	Ramsay, D'Anthony Micheal D'Andre	f	\N
7431	Yustin	Recinos	54192	4	y.recinos192@cvuhsd.org	15	M	11	D-110	Rosales, Virginia	Recinos, Yustin Gabriel	f	\N
7432	Isaac	Reyes Matias	53781	4	i.reyesmatias781@cvuhsd.org	15	M	11	D-211	Collins, Matthew A	Reyes Matias, Isaac	f	\N
7433	Ivan	Reyes	54850	4	i.reyes850@cvuhsd.org	15	M	11	K-106	Gonzalez, Veronica C.	Reyes, Ivan	f	\N
7434	Janely	Reyes	54265	4	j.reyes265@cvuhsd.org	15	F	11	C-204	Rios, James	Reyes, Janely Stacy	f	\N
7435	Nathan	Rios	53942	4	n.rios942@cvuhsd.org	15	M	11	C-204	Rios, James	Rios, Nathan Jonathan	f	\N
7436	Tony	Rivas Cruz	55220	4	t.rivascruz220@cvuhsd.org	15	M	11	K-202	Allen, Richard E	Rivas Cruz, Tony Brandon	f	\N
7437	Antonio	Rodarte	54875	4	a.rodarte875@cvuhsd.org	15	M	11	C-204	Rios, James	Rodarte, Antonio	f	\N
7438	Rodrigo	Rodas Roman	54907	4	r.rodasroman907@cvuhsd.org	15	M	11	M-113	Aispuro, Mayte	Rodas Roman, Rodrigo Manuel	f	\N
7439	Francisco	Rodriguez Cardenas	55136	4	f.rodriguezcarden136@cvuhsd.org	15	M	11	K-106	Gonzalez, Veronica C.	Rodriguez Cardenas, Francisco	f	\N
7440	Angel	Rodriguez Garcia	53811	4	a.rodriguezgarcia811@cvuhsd.org	15	M	11	G-101	Galt, Douglas S	Rodriguez Garcia, Angel	f	\N
7441	Sofia	Rodriguez Gurrola	53810	4	s.rodriguezgurrol810@cvuhsd.org	15	F	11	C-204	Rios, James	Rodriguez Gurrola, Sofia	f	\N
7442	Nathalia	Rodriguez Ziga	54445	4	n.rodriguezziga445@cvuhsd.org	15	F	11	K-106	Gonzalez, Veronica C.	Rodriguez Ziga, Nathalia Donaji	f	\N
7443	Dalilah	Rodriguez	56820	4	d.rodriguez820@cvuhsd.org	15	F	11	D-211	Collins, Matthew A	Rodriguez, Dalilah Delinda	f	\N
7444	Sebastian	Rodriguez	54276	4	s.rodriguez276@cvuhsd.org	15	M	11	L-204	Ishii, Emily	Rodriguez, Sebastian Daniel	f	\N
7445	Eliana	Romero	54520	4	e.romero520@cvuhsd.org	15	F	11	C-204	Rios, James	Romero, Eliana Sukkoth	f	\N
7446	Ruby	Romero	55324	4	r.romero324@cvuhsd.org	15	F	11	K-106	Elias, Michael	Romero, Ruby	f	\N
7447	Samantha	Rosales	53807	4	s.rosales807@cvuhsd.org	15	F	11	C-103	Hoang, Huy T.	Rosales, Samantha	f	\N
7448	Angel	Ruelas	55236	4	a.ruelas236@cvuhsd.org	15	M	11	GYM	Harm, Kirk J.	Ruelas, Angel Dael	f	\N
7449	Jose	Ruelas	54777	4	j.ruelas777@cvuhsd.org	15	M	11	D-110	Rosales, Virginia	Ruelas, Jose Andrew	f	\N
7450	Jacob	Rugeles Peraza	55616	4	j.rugelesperaza616@cvuhsd.org	15	M	11	K-216	Arangoa Ramirez, Christian	Rugeles Peraza, Jacob Roman	f	\N
7451	Shelsea	Ruiz Salgado	57011	4	s.ruizsalgado011@cvuhsd.org	15	F	11	M-218	Navarro, Isis E.	Ruiz Salgado, Shelsea Jired	f	\N
7452	Reizon Antonio	Salandanan	54960	4	r.salandanan960@cvuhsd.org	15	M	11	GYM	Harm, Kirk J.	Salandanan, Reizon Antonio Embrador	f	\N
7453	Tatiana	Salas-Lopes	53804	4	t.salaslopes804@cvuhsd.org	15	F	11	K-106	Elias, Michael	Salas-Lopes, Tatiana Nevaeh	f	\N
7454	David	Salazar	55114	4	d.salazar114@cvuhsd.org	15	M	11	D-110	Rosales, Virginia	Salazar, David Alexander	f	\N
7455	Danielle	Salcido	54609	4	d.salcido609@cvuhsd.org	15	F	11	K-106	Gonzalez, Veronica C.	Salcido, Danielle Mirna	f	\N
7456	Sebastian	Salcido	54610	4	s.salcido610@cvuhsd.org	15	M	11	L-101	Legg, Adam	Salcido, Sebastian	f	\N
7457	Nathalie	Salgado Palomera	53801	4	n.salgadopalomera801@cvuhsd.org	15	F	11	C-204	Rios, James	Salgado Palomera, Nathalie	f	\N
7458	Yandel	Salgado	53802	4	y.salgado802@cvuhsd.org	15	M	11	D-211	Collins, Matthew A	Salgado, Yandel Darek	f	\N
7459	Ellie	Sanchez Ochoa	59141	4	e.sanchezochoa141@cvuhsd.org	15	M	11	F-107	Rice, Christopher A.	Sanchez Ochoa, Ellie Anthony	f	\N
7460	Johan	Sanchez Vasquez	54608	4	j.sanchezvasquez608@cvuhsd.org	15	M	11	J-105	Bowman, Lauren C.	Sanchez Vasquez, Johan Daniel	f	\N
7461	Belen	Sanchez	55147	4	b.sanchez147@cvuhsd.org	15	F	11	K-106	Elias, Michael	Sanchez, Belen	f	\N
7462	Genesis	Sanchez	54439	4	g.sanchez439@cvuhsd.org	15	F	11	D-110	Rosales, Virginia	Sanchez, Genesis	f	\N
7463	Juan	Sanchez	53798	4	j.sanchez798@cvuhsd.org	15	M	11	K-215	Obeso, Setareh	Sanchez, Juan Lopez	f	\N
7464	Tanya	Sanchez	55000	4	t.sanchez000@cvuhsd.org	15	F	11	K-105	Gonzalez, Alejandra	Sanchez, Tanya	f	\N
7465	Andrew	Sandoval	53796	4	a.sandoval796@cvuhsd.org	15	M	11	F-106	Givens, Kathy E.	Sandoval, Andrew Carlos	f	\N
7466	Ernesto	Santos	55264	4	e.santos264@cvuhsd.org	15	M	11	GYM	Harm, Kirk J.	Santos, Ernesto Ezequiel	f	\N
7467	Giselle	Santos	55155	4	g.santos155@cvuhsd.org	15	F	11	L-104	Najarro, Claudia	Santos, Giselle Lizbeth	f	\N
7468	Adamaris	Sarabia	56496	4	a.sarabia496@cvuhsd.org	15	F	11	D-110	Rosales, Virginia	Sarabia, Adamaris Sol	f	\N
7469	Christian	Savino Vazquez	55449	4	c.sabinovasquez449@cvuhsd.org	15	M	11	K-202	Allen, Richard E	Savino Vazquez, Christian Joel	f	\N
7470	Angelina	Sedano	53795	4	a.sedano795@cvuhsd.org	15	F	11	C-204	Rios, James	Sedano, Angelina	f	\N
7471	Nathan	Sedano	54772	4	n.sedano772@cvuhsd.org	15	M	11	L-103	Castillo, Amy	Sedano, Nathan	f	\N
7472	Amy	Serrano Estrada	54770	4	a.serranoestrada770@cvuhsd.org	15	F	11	I-2	Pimentel, Carlina	Serrano Estrada, Amy Rosalyn	f	\N
7473	Sun Jordan	Sexton	55245	4	s.sexton245@cvuhsd.org	15	M	11	GYM	Harm, Kirk J.	Sexton, Sun Jordan Alexander	f	\N
7474	Thomas	Shehata Quillini	54885	4	t.shehataquillini885@cvuhsd.org	15	M	11	M-111	Valencia, Sandra	Shehata Quillini, Thomas Maged	f	\N
7475	Daniel	Sierra	55854	4	d.sierra854@cvuhsd.org	15	M	11	GYM	Harm, Kirk J.	Sierra, Daniel	f	\N
7476	Jose	Solis Ixcot	53794	4	j.solisixcot794@cvuhsd.org	15	M	11	C-103	Hoang, Huy T.	Solis Ixcot, Jose Yurem	f	\N
7477	Jimena	Soto-Garcia	53793	4	j.sotogarcia793@cvuhsd.org	15	F	11	M-111	Valencia, Sandra	Soto-Garcia, Jimena Claudeth	f	\N
7478	Anderson	Soyos Cuscul	53792	4	a.soyoscuscul792@cvuhsd.org	15	M	11	D-207	Gonzalez, Deborah A	Soyos Cuscul, Anderson Joel	f	\N
7479	Kennesha	Sylvester	55378	4	k.sylvester378@cvuhsd.org	15	F	11	M-110	Segovia, Jose M	Sylvester, Kennesha Johanna Alexa	f	\N
7480	Marely	Tello Calderon	53791	4	m.tellocalderon791@cvuhsd.org	15	F	11	C-204	Rios, James	Tello Calderon, Marely	f	\N
7481	Chloe	Temple	54931	4	c.temple931@cvuhsd.org	15	F	11	I-2	Pimentel, Carlina	Temple, Chloe Michelle	f	\N
7482	Jonathan	Tieger	54264	4	j.tieger264@cvuhsd.org	15	M	11	K-106	Elias, Michael	Tieger, Jonathan Tristan	f	\N
7483	Jilmary	Tinoco Perez	55327	4	j.tinocoperez327@cvuhsd.org	15	F	11	K-105	Gonzalez, Alejandra	Tinoco Perez, Jilmary Massiel	f	\N
7484	Kimberly	Tinti Lopez	54332	4	k.tintilopez332@cvuhsd.org	15	F	11	D-110	Rosales, Virginia	Tinti Lopez, Kimberly Abigail	f	\N
7485	Villanca	Tolaque	54413	4	v.tolaque413@cvuhsd.org	15	F	11	J-105	Bowman, Lauren C.	Tolaque, Villanca Aileen	f	\N
7486	Leonardo	Toledo	54169	4	l.toledo169@cvuhsd.org	15	M	11	D-110	Rosales, Virginia	Toledo, Leonardo Izac	f	\N
7487	Ryan	Tolentino Barrera	54725	4	r.tolentinobarrer725@cvuhsd.org	15	M	11	L-103	Castillo, Amy	Tolentino Barrera, Ryan	f	\N
7488	Vianney	Torres Jimenez	54696	4	v.torresjimenez696@cvuhsd.org	15	F	11	G-101	Galt, Douglas S	Torres Jimenez, Vianney Guadalupe	f	\N
7489	Danna	Torres Vargas	59200	4	d.torresvargas200@cvuhsd.org	15	F	11	L-104	Najarro, Claudia	Torres Vargas, Danna Camila	f	\N
7490	Angel	Torres	53790	4	a.torres790@cvuhsd.org	15	M	11	M-110	Segovia, Jose M	Torres, Angel Josue	f	\N
7491	Ayden	Torres	59238	4	a.torres238@cvuhsd.org	15	M	11	C-103	Hoang, Huy T.	Torres, Ayden Francisco	f	\N
7492	Daniel	Torres	54878	4	d.torres878@cvuhsd.org	15	M	11	K-215	Obeso, Setareh	Torres, Daniel Victorio	f	\N
7493	Sofia	Torres	54765	4	s.torres765@cvuhsd.org	15	F	11	M-113	Aispuro, Mayte	Torres, Sofia Elena	f	\N
7494	Kasandra	Tostado	55575	4	k.tostado575@cvuhsd.org	15	F	11	L-101	Legg, Adam	Tostado, Kasandra Diana	f	\N
7495	Vaniyah	Tucker	57597	4	v.tucker597@cvuhsd.org	15	F	11	M-111	Valencia, Sandra	Tucker, Vaniyah Vonsha	f	\N
7496	Ashlee	Turner	54426	4	a.turner426@cvuhsd.org	15	F	11	J-112	Levine, Allison A	Turner, Ashlee Latrice	f	\N
7497	Jade	Urrutia	54934	4	j.urrutia934@cvuhsd.org	15	F	11	J-105	Bowman, Lauren C.	Urrutia, Jade Angelina	f	\N
7498	Karoline	Valdovinos-Vargas	54448	4	k.valdovinosvarga448@cvuhsd.org	15	F	11	K-215	Obeso, Setareh	Valdovinos-Vargas, Karoline	f	\N
7499	Julio	Valenzuela	54324	4	j.valenzuela324@cvuhsd.org	15	M	11	L-103	Castillo, Amy	Valenzuela, Julio Cesar	f	\N
7500	Norallyn	Vallejano	55125	4	n.vallejano125@cvuhsd.org	15	F	11	K-114	Loera, Jorge Antonio	Vallejano, Norallyn	f	\N
7501	Cesar	Varela Hernandez	56052	4	c.varelahernandez052@cvuhsd.org	15	M	11	M-218	Navarro, Isis E.	Varela Hernandez, Cesar Eduardo	f	\N
7502	Victoria	Vargas	58660	4	v.vargas660@cvuhsd.org	15	F	11	C-204	Rios, James	Vargas, Victoria Mia	f	\N
7503	Victor	Vasquez Prestegui	54697	4	v.vasquezprestegu697@cvuhsd.org	15	M	11	K-202	Allen, Richard E	Vasquez Prestegui, Victor Manuel	f	\N
7504	Emiliano	Vasquez	54170	4	e.vasquez170@cvuhsd.org	15	M	11	C-103	Hoang, Huy T.	Vasquez, Emiliano Chimalli	f	\N
7505	Melody	Vasquez	55118	4	m.vasquez118@cvuhsd.org	15	F	11	G-101	Galt, Douglas S	Vasquez, Melody	f	\N
7506	Joshua	Vasquez-Marroquin	55142	4	j.vasquezmarroqui142@cvuhsd.org	15	M	11	C-106	Howard Johnson, Crystal	Vasquez-Marroquin, Joshua Dallary	f	\N
7507	Jaime	Vazquez Garcia	54698	4	j.vazquezgarcia698@cvuhsd.org	15	M	11	C-103	Hoang, Huy T.	Vazquez Garcia, Jaime Antonio	f	\N
7508	Yoaly	Velasquez Iniguez	53788	4	y.velasquezinigue788@cvuhsd.org	15	F	11	K-106	Gonzalez, Veronica C.	Velasquez Iniguez, Yoaly Lizeth	f	\N
7509	Jayla	Velasquez	55343	4	j.velasquez343@cvuhsd.org	15	F	11	K-202	Allen, Richard E	Velasquez, Jayla Stephanie	f	\N
7510	Steban	Velasquez	55100	4	s.velasquez100@cvuhsd.org	15	M	11	C-204	Rios, James	Velasquez, Steban Andres	f	\N
7511	Leonardo	Velazquez Coria	54967	4	l.velazquezcoria967@cvuhsd.org	15	M	11	GYM	Harm, Kirk J.	Velazquez Coria, Leonardo	f	\N
7512	Carla Tiffany	Venturina	54876	4	c.venturina876@cvuhsd.org	15	F	11	D-211	Collins, Matthew A	Venturina, Carla Tiffany Valera	f	\N
7513	Jayleen	Villalta	54966	4	j.villalta966@cvuhsd.org	15	F	11	D-110	Rosales, Virginia	Villalta, Jayleen Ellysa	f	\N
7514	Alexis	Villicana	53785	4	a.villicana785@cvuhsd.org	15	M	11	K-215	Obeso, Setareh	Villicana, Alexis	f	\N
7515	Brayan	Viveros	54629	4	b.viveros629@cvuhsd.org	15	M	11	L-103	Castillo, Amy	Viveros, Brayan Alexis	f	\N
7516	Tiyonika	Washington	58784	4	t.washington784@cvuhsd.org	15	F	11	K-106	Elias, Michael	Washington, Tiyonika Mary	f	\N
7517	Mahogany	Wilson Morgan	54889	4	m.wilsonmorgan889@cvuhsd.org	15	F	11	J-105	Bowman, Lauren C.	Wilson Morgan, Mahogany Tatianna	f	\N
7518	Randy	Winbush	55102	4	r.winbush102@cvuhsd.org	15	M	11	K-202	Allen, Richard E	Winbush, Randy Edward	f	\N
7519	Sokquira	Young	54983	4	s.young983@cvuhsd.org	15	F	11	L-101	Legg, Adam	Young, Sokquira Nevaeh Soranya	f	\N
7520	Christian	Zamora Rios	54421	4	c.zamorarios421@cvuhsd.org	15	M	11	G-101	Galt, Douglas S	Zamora Rios, Christian Ghaell	f	\N
7521	Jose	Zaragoza Hernandez	54454	4	j.zaragozahernan454@cvuhsd.org	15	M	11	C-103	Hoang, Huy T.	Zaragoza Hernandez, Jose Daniel	f	\N
7522	Adolfo	Zaragoza	53784	4	a.zaragoza784@cvuhsd.org	15	M	11	D-211	Collins, Matthew A	Zaragoza, Adolfo	f	\N
7523	Adriana	Zelaya Rosales	53783	4	a.zelayarosales783@cvuhsd.org	15	F	11	D-211	Collins, Matthew A	Zelaya Rosales, Adriana Carolina	f	\N
7524	Tayshaun	Abercrombie	52255	4	t.abercrombie255@cvuhsd.org	15	M	12	D-111	Agner, Maryalice	Abercrombie, Tayshaun Ramses	f	\N
7525	David	Acosta Avalos	51561	4	d.acostaavalos561@cvuhsd.org	15	M	12	F-107	Rice, Christopher A.	Acosta Avalos, David Christopher	f	\N
7526	Kevin	Acosta Nuno	52983	4	k.acosta983@cvuhsd.org	15	M	12	K-202	Allen, Richard E	Acosta Nuno, Kevin Martin	f	\N
7527	Brando	Acosta	51560	4	b.acosta560@cvuhsd.org	15	M	12	M-101	Smith, Bradley A	Acosta, Brando Manuel	f	\N
7528	Cristian	Adame Hernandez	51748	4	c.adamehernandez748@cvuhsd.org	15	M	12	D-205	Nunez Reynoso, Marisela	Adame Hernandez, Cristian	f	\N
7529	Sarah	Adkins	51562	4	s.adkins562@cvuhsd.org	15	F	12	D-201	Deutschle, Claudia E.	Adkins, Sarah Isabell	f	\N
7530	Venessa	Afam	51563	4	v.afam563@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Afam, Venessa Tochi	f	\N
7531	Angel	Aguilar Martinez	51564	4	a.aguilarmartinez564@cvuhsd.org	15	M	12	GYM	Harm, Kirk J.	Aguilar Martinez, Angel Noe	f	\N
7532	Jhordie	Aguilar	53276	4	j.aguilar276@cvuhsd.org	15	M	12	F-107	Rice, Christopher A.	Aguilar, Jhordie	f	\N
7533	Dylan	Aguilera	51565	4	d.aguilera565@cvuhsd.org	15	M	12	M-101	Smith, Bradley A	Aguilera, Dylan	f	\N
7534	Eduardo	Ajin	56519	4	e.ajin519@cvuhsd.org	15	M	12	C-204	Rios, James	Ajin, Eduardo Elias	f	\N
7535	Drew-Ibrahim	Al-Hanif'A	52551	4	d.alhanifa551@cvuhsd.org	15	M	12	K-101	Villacorta, Vanessa	Al-Hanif'A, Drew-Ibrahim Sharif Malik	f	\N
7536	Daniel	Alarcon Garcia	52666	4	d.alarcon666@cvuhsd.org	15	M	12	D-201	Deutschle, Claudia E.	Alarcon Garcia, Daniel Vicente	f	\N
7537	Christopher	Aldana	52966	4	c.aldana966@cvuhsd.org	15	M	12	M-114	Garcia, Manuel	Aldana, Christopher	f	\N
7538	Alejandro	Aleman	52228	4	a.aleman228@cvuhsd.org	15	M	12	C-103	Hoang, Huy T.	Aleman, Alejandro	f	\N
7539	Brendon	Alexander	52140	4	b.alexander140@cvuhsd.org	15	M	12	I-2	Pimentel, Carlina	Alexander, Brendon Cristian	f	\N
7540	Brianna	Alexander	57603	4	b.alexanderblas603@cvuhsd.org	15	F	12	L-104	Najarro, Claudia	Alexander, Brianna Destiny Fabiola	f	\N
7541	Francisco	Alfaro	51568	4	f.alfaro568@cvuhsd.org	15	M	12	D-205	Nunez Reynoso, Marisela	Alfaro, Francisco Manuel	f	\N
7542	JulioCesar	Alvarado	52337	4	j.alvarado337@cvuhsd.org	15	M	12	D-201	Deutschle, Claudia E.	Alvarado, JulioCesar	f	\N
7543	Ricardo	Alvarez Cardenas	55625	4	r.alvarezcardenas625@cvuhsd.org	15	M	12	K-216	Arangoa Ramirez, Christian	Alvarez Cardenas, Ricardo	f	\N
7544	Valerie	Alvizo	52498	4	v.alvizo498@cvuhsd.org	15	F	12	C-204	Rios, James	Alvizo, Valerie	f	\N
7545	Pablo	Andablo	52208	4	p.andablo208@cvuhsd.org	15	M	12	D-201	Deutschle, Claudia E.	Andablo, Pablo	f	\N
7546	Melanie	Andrade	54449	4	m.andrade449@cvuhsd.org	15	F	12	K-202	Allen, Richard E	Andrade, Melanie	f	\N
7547	Nathaniel	Angeles	51574	4	n.angeles574@cvuhsd.org	15	M	12	J-105	Bowman, Lauren C.	Angeles, Nathaniel	f	\N
7548	Kayla	Aragon	52598	4	k.aragon598@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Aragon, Kayla Gracie	f	\N
7549	Fernando	Argueta	52758	4	f.argueta758@cvuhsd.org	15	M	12	K-214	Chau, Peter	Argueta, Fernando Isaac	f	\N
7550	Mariana	Arizaga Parra	51575	4	m.arizagaparra575@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Arizaga Parra, Mariana Alondra	f	\N
7551	Karoline	Arizmendi	51578	4	k.arizmendi578@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Arizmendi, Karoline Angeline	f	\N
7552	Alexia	Armenta-Bull	53188	4	a.armentabull188@cvuhsd.org	15	F	12	D-201	Deutschle, Claudia E.	Armenta-Bull, Alexia Marie	f	\N
7553	Bridget	Arriaga	52455	4	b.arriaga455@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Arriaga, Bridget Violet	f	\N
7554	Xitlali	Arriaga	56914	4	x.arriaga914@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Arriaga, Xitlali	f	\N
7555	Ma. Katrina Andrea	Asi	55519	4	m.asi519@cvuhsd.org	15	F	12	D-204	Fuchs, Frank J	Asi, Ma. Katrina Andrea Marasigan	f	\N
7556	Adrian	Avalos	53450	4	a.avalos450@cvuhsd.org	15	M	12	K-101	Villacorta, Vanessa	Avalos, Adrian William	f	\N
7557	Sarai	Avelar	53277	4	s.avelar277@cvuhsd.org	15	F	12	I-2	Pimentel, Carlina	Avelar, Sarai	f	\N
7558	Yoan	Aviles Gallardo	55381	4	y.avilesgallardo381@cvuhsd.org	15	M	12	K-214	Chau, Peter	Aviles Gallardo, Yoan	f	\N
7559	Frankie	Ayala	51649	4	f.ayala649@cvuhsd.org	15	M	12	D-111	Agner, Maryalice	Ayala, Frankie Moises	f	\N
7560	Nicolas	Ayala	52094	4	n.ayala094@cvuhsd.org	15	M	12	D-201	Deutschle, Claudia E.	Ayala, Nicolas	f	\N
7561	Excel	Baadi	51750	4	e.baadi750@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Baadi, Excel Uchechukwu	f	\N
7562	Sean - Anthony	Babila	55414	4	s.babila414@cvuhsd.org	15	M	12	K-101	Villacorta, Vanessa	Babila, Sean - Anthony Pouegue	f	\N
7563	Joaquin	Barba Franco	51585	4	j.barbafranco585@cvuhsd.org	15	M	12	M-101	Smith, Bradley A	Barba Franco, Joaquin	f	\N
7564	Abraham	Barrer	51652	4	a.barrer652@cvuhsd.org	15	M	12	J-105	Bowman, Lauren C.	Barrer, Abraham Steven	f	\N
7565	Anthony	Barrera	53178	4	a.barrera178@cvuhsd.org	15	M	12	L-204	Ishii, Emily	Barrera, Anthony	f	\N
7566	Ricardo	Barrera	55051	4	r.barrera051@cvuhsd.org	15	M	12	K-216	Arangoa Ramirez, Christian	Barrera, Ricardo	f	\N
7567	Aamir	Bascomb	53509	4	a.bascomb509@cvuhsd.org	15	M	12	K-206	Macdonald, Jason W	Bascomb, Aamir Devell	f	\N
7568	Joel	Bazan	52772	4	j.bazan772@cvuhsd.org	15	M	12	M-117	Tarkington, Cole	Bazan, Joel Robert	f	\N
7569	Londie	Beck	53153	4	l.beck153@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Beck, Londie StarLee	f	\N
7570	Maria	Bello	51590	4	m.bello590@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Bello, Maria Fernanda	f	\N
7571	Edward	Belong	51753	4	e.belong753@cvuhsd.org	15	M	12	C-117	Jones, Michael R.	Belong, Edward Lopez	f	\N
7572	Delwin	Beltran	53140	4	d.beltran140@cvuhsd.org	15	M	12	J-105	Bowman, Lauren C.	Beltran, Delwin Emilio	f	\N
7573	Irain	Bindi	53256	4	i.bindi256@cvuhsd.org	15	M	12	F-106	Givens, Kathy E.	Bindi, Irain Elijah	f	\N
7574	Lucia	Binwie	54240	4	l.binwie240@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Binwie, Lucia Faith Tanwie	f	\N
7575	Bryan	Bolanos Mendez	53608	4	b.bolanosmendez608@cvuhsd.org	15	M	12	D-207	Gonzalez, Deborah A	Bolanos Mendez, Bryan Antonio	f	\N
7576	Ricardo	Bolanos Siguenza	53607	4	r.bolanossiguenza607@cvuhsd.org	15	M	12	J-105	Bowman, Lauren C.	Bolanos Siguenza, Ricardo Alexis	f	\N
7577	Fhernando	Bonilla Paz	51592	4	f.bonillapaz592@cvuhsd.org	15	M	12	K-101	Villacorta, Vanessa	Bonilla Paz, Fhernando	f	\N
7578	Me'jhonni	Bonner	52684	4	m.bonner684@cvuhsd.org	15	F	12	M-111	Valencia, Sandra	Bonner, Me'jhonni Seymone	f	\N
7579	Diego	Borges-Ramirez	52621	4	d.borgesramirez621@cvuhsd.org	15	M	12	D-205	Nunez Reynoso, Marisela	Borges-Ramirez, Diego	f	\N
7580	Angelique	Briseno	52243	4	a.briseno243@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Briseno, Angelique Jicel	f	\N
7581	Ryan	Brooks	51655	4	r.brooks655@cvuhsd.org	15	M	12	K-101	Villacorta, Vanessa	Brooks, Ryan Leon	f	\N
7582	Jayson	Brown	52767	4	j.brown767@cvuhsd.org	15	M	12	C-204	Rios, James	Brown, Jayson Jamall	f	\N
7583	Obie	Brown	52246	4	o.brown246@cvuhsd.org	15	M	12	K-206	Macdonald, Jason W	Brown, Obie	f	\N
7584	Pamela	Buezo Altamirano	51587	4	p.buezoaltamirano587@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Buezo Altamirano, Pamela Stephania	f	\N
7585	Yorleny	Bustos	52447	4	y.bustos447@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Bustos, Yorleny	f	\N
7586	Joanna	Cabello	51653	4	j.cabello653@cvuhsd.org	15	F	12	L-204	Ishii, Emily	Cabello, Joanna Michelle	f	\N
7587	Stefany	Cabrera	52485	4	s.cabrera485@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Cabrera, Stefany Yazmin	f	\N
7588	Jennifer	Caceros	51593	4	j.caceros593@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Caceros, Jennifer Faviola	f	\N
7589	Devon	Camacho	53501	4	d.camacho501@cvuhsd.org	15	M	12	E-101	Pacheco, Lucas J.	Camacho, Devon Angel	f	\N
7590	Emmanuel	Camacho	52200	4	e.camacho2002@cvuhsd.org	15	M	12	D-205	Nunez Reynoso, Marisela	Camacho, Emmanuel	f	\N
7591	Sebastian	Camarena	51594	4	s.camarena594@cvuhsd.org	15	M	12	K-214	Chau, Peter	Camarena, Sebastian	f	\N
7592	Nicoll	Camargo Gamboa	55540	4	n.camargogamboa540@cvuhsd.org	15	F	12	K-216	Arangoa Ramirez, Christian	Camargo Gamboa, Nicoll Jireh	f	\N
7593	Brooklynn	Campbell	51595	4	b.campbell595@cvuhsd.org	15	F	12	C-103	Hoang, Huy T.	Campbell, Brooklynn Marie	f	\N
7594	Gerson	Campos	52236	4	g.campos236@cvuhsd.org	15	M	12	M-113	Aispuro, Mayte	Campos, Gerson Rene	f	\N
7595	Dulce	Canales Sanchez	57306	4	d.canalessanchez306@cvuhsd.org	15	F	12	K-216	Arangoa Ramirez, Christian	Canales Sanchez, Dulce Michelle	f	\N
7596	Ana	Canas	51596	4	a.canas596@cvuhsd.org	15	F	12	C-103	Hoang, Huy T.	Canas, Ana Meah Belen	f	\N
7597	Fernando	Cardenas Valverde	57602	4	f.cardenasvalverd602@cvuhsd.org	15	M	12	GYM	Harm, Kirk J.	Cardenas Valverde, Fernando	f	\N
7598	T'Janay	Carpenter	52687	4	t.carpenter687@cvuhsd.org	15	F	12	C-103	Hoang, Huy T.	Carpenter, T'Janay Jessica	f	\N
7599	Damari	Carr	51973	4	d.carr973@cvuhsd.org	15	M	12	J-105	Bowman, Lauren C.	Carr, Damari Kamell	f	\N
7600	Saul	Castaneda	52780	4	s.castaneda780@cvuhsd.org	15	M	12	K-214	Chau, Peter	Castaneda, Saul Alberto	f	\N
7601	Cynthia	Castellanos	51770	4	c.castellanos770@cvuhsd.org	15	F	12	M-118	Aguilar Hernandez, Leslie	Castellanos, Cynthia Suzette	f	\N
7602	Nancy	Castellon	51609	4	n.castellon609@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Castellon, Nancy Arely	f	\N
7603	Annette	Castillo	52735	4	a.castillo735@cvuhsd.org	15	F	12	I-2	Pimentel, Carlina	Castillo, Annette Michell	f	\N
7604	Jorge	Cavalieri	52635	4	j.cavalieri635@cvuhsd.org	15	M	12	J-105	Bowman, Lauren C.	Cavalieri, Jorge Eduardo	f	\N
7605	Evelyn	Cazares	51657	4	e.cazares657@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Cazares, Evelyn	f	\N
7606	Anya	Cedillo	55669	4	a.cedillo669@cvuhsd.org	15	F	12	D-201	Deutschle, Claudia E.	Cedillo, Anya De Los Angeles	f	\N
7607	Emiliano	Ceja-Cruz	52597	4	e.cejacruz597@cvuhsd.org	15	M	12	K-214	Chau, Peter	Ceja-Cruz, Emiliano	f	\N
7608	Kimberly	Cervantes	52216	4	k.cervantes216@cvuhsd.org	15	F	12	C-204	Rios, James	Cervantes, Kimberly	f	\N
7609	Ryan	Cervantes-Quijada	53009	4	r.cervantesquijad009@cvuhsd.org	15	M	12	GYM	Harm, Kirk J.	Cervantes-Quijada, Ryan Ariel	f	\N
7610	Emily	Chaidez	52789	4	e.chaidez789@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Chaidez, Emily Esmeree	f	\N
7611	Alan	Chaires	52055	4	a.chaires055@cvuhsd.org	15	M	12	M-117	Tarkington, Cole	Chaires, Alan Eduardo	f	\N
7612	Jose	Chavarin	51601	4	j.chavarin601@cvuhsd.org	15	M	12	D-205	Nunez Reynoso, Marisela	Chavarin, Jose Guadalupe	f	\N
7613	Emmalie	Chavez	52609	4	e.chavez609@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Chavez, Emmalie	f	\N
7614	Jazmin	Chavez	52218	4	j.chavez218@cvuhsd.org	15	F	12	C-204	Rios, James	Chavez, Jazmin Abbi	f	\N
7615	Yocelyn	Chavez	58652	4	y.chavez652@cvuhsd.org	15	F	12	D-201	Deutschle, Claudia E.	Chavez, Yocelyn	f	\N
7616	Matthew	Coronado	53000	4	m.coronado000@cvuhsd.org	15	M	12	D-201	Deutschle, Claudia E.	Coronado, Matthew Javier	f	\N
7617	Byron	Cos	52616	4	b.cos616@cvuhsd.org	15	M	12	J-105	Bowman, Lauren C.	Cos, Byron Isaias	f	\N
7618	Anthony	Covarrubias	51960	4	a.covarrubias960@cvuhsd.org	15	M	12	M-101	Smith, Bradley A	Covarrubias, Anthony Manuel	f	\N
7619	Luis	Covarrubias	55518	4	l.covarrubias518@cvuhsd.org	15	M	12	D-201	Deutschle, Claudia E.	Covarrubias, Luis Jaime	f	\N
7620	Meliani	Cristobal	52762	4	m.cristobal762@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Cristobal, Meliani	f	\N
7621	Elvia Yolani	Cruz Avila	55672	4	e.cruzavila672@cvuhsd.org	15	F	12	M-218	Navarro, Isis E.	Cruz Avila, Elvia Yolani	f	\N
7622	Alexander	Cruz	52679	4	a.cruz679@cvuhsd.org	15	M	12	K-101	Villacorta, Vanessa	Cruz, Alexander Julian	f	\N
7623	Sebastian	Cruz	52111	4	s.cruz111@cvuhsd.org	15	M	12	GYM	Harm, Kirk J.	Cruz, Sebastian	f	\N
7624	Crystine	Dao	51611	4	c.dao611@cvuhsd.org	15	F	12	M-101	Smith, Bradley A	Dao, Crystine Nhi	f	\N
7625	Josselyn	Davila	54110	4	j.davila110@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Davila, Josselyn Nicole	f	\N
7626	Makayla	Davis	51752	4	m.davis752@cvuhsd.org	15	F	12	D-201	Deutschle, Claudia E.	Davis, Makayla Marie	f	\N
7627	Maria	De Avila Sanchez	52073	4	m.deavila073@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	De Avila Sanchez, Maria Fernanda	f	\N
7628	Krystal	De La Cruz	51613	4	k.delacruz613@cvuhsd.org	15	F	12	C-204	Rios, James	De La Cruz, Krystal Danelly	f	\N
7629	Alexis	De Paz Salazar	53201	4	a.depazsalazar201@cvuhsd.org	15	M	12	K-101	Villacorta, Vanessa	De Paz Salazar, Alexis	f	\N
7630	Viviana	Del Aguila	52670	4	v.delaguila670@cvuhsd.org	15	F	12	K-105	Gonzalez, Alejandra	Del Aguila, Viviana Kaily	f	\N
7631	Rebecca	Deleon Oliva	52217	4	r.deleon217@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Deleon Oliva, Rebecca Samantha	f	\N
7632	Kimberly	Delgadillo Medina	56756	4	k.delgadillomedin756@cvuhsd.org	15	F	12	K-216	Arangoa Ramirez, Christian	Delgadillo Medina, Kimberly	f	\N
7633	Ann	Desire	52533	4	a.desire533@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Desire, Ann Ebelyssa	f	\N
7634	Sarah	Diaz	51619	4	s.diaz619@cvuhsd.org	15	F	12	GYM	Harm, Kirk J.	Diaz, Sarah Marye	f	\N
7635	Sharlyn	Diaz-Bernal	51754	4	s.diazbernal754@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Diaz-Bernal, Sharlyn	f	\N
7636	Jose	Diaz-Velasquez	52836	4	j.diazvelasquez836@cvuhsd.org	15	M	12	GYM	Harm, Kirk J.	Diaz-Velasquez, Jose Angel	f	\N
7637	Kailani	Dillihunt	52837	4	k.dillihunt837@cvuhsd.org	15	F	12	F-106	Givens, Kathy E.	Dillihunt, Kailani Charlene	f	\N
7638	Naima	Diop	51621	4	n.diop621@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Diop, Naima Kallissa	f	\N
7639	Eduardo	Dos Santos	55613	4	e.dossantos613@cvuhsd.org	15	M	12	M-101	Smith, Bradley A	Dos Santos, Eduardo Antonio	f	\N
7640	Saul	Escobar Quitio	52159	4	s.escobarquitio159@cvuhsd.org	15	M	12	D-205	Nunez Reynoso, Marisela	Escobar Quitio, Saul Javier	f	\N
7641	Dalillah	Escobar	55071	4	d.escobar071@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Escobar, Dalillah Maribel	f	\N
7642	Robert	Escobar	53239	4	r.escobar239@cvuhsd.org	15	M	12	K-114	Loera, Jorge Antonio	Escobar, Robert Anthony Joel	f	\N
7643	Ethan	Esparza	52524	4	e.esparza524@cvuhsd.org	15	M	12	E-101	Pacheco, Lucas J.	Esparza, Ethan Joshua	f	\N
7644	Andrea	Espinoza	51625	4	a.espinoza625@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Espinoza, Andrea Jazmine	f	\N
7645	Ivan	Espinoza	52436	4	i.espinoza436@cvuhsd.org	15	M	12	K-214	Chau, Peter	Espinoza, Ivan Uriel	f	\N
7646	Osvin	Estrada Virula	54510	4	o.estradavirula510@cvuhsd.org	15	M	12	M-218	Navarro, Isis E.	Estrada Virula, Osvin Ariel	f	\N
7647	Juliana	Estrada	51626	4	j.estrada626@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Estrada, Juliana	f	\N
7648	Ademide	Falade	53263	4	a.falade263@cvuhsd.org	15	M	12	M-112	Barahona, Iris	Falade, Ademide Olaiwola Stephen	f	\N
7649	Nayleen	Figueroa	51660	4	n.figueroa660@cvuhsd.org	15	F	12	K-202	Allen, Richard E	Figueroa, Nayleen	f	\N
7650	Ethan	Floran	52843	4	e.floran843@cvuhsd.org	15	M	12	D-111	Agner, Maryalice	Floran, Ethan Gabriel	f	\N
7651	Axel	Flores Vazquez	51662	4	a.floresvazquez662@cvuhsd.org	15	M	12	K-214	Chau, Peter	Flores Vazquez, Axel Eduardo	f	\N
7652	Adrienne	Flores	51661	4	a.flores661@cvuhsd.org	15	F	12	C-204	Rios, James	Flores, Adrienne Marie	f	\N
7653	Alexia	Flores	53077	4	a.flores077@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Flores, Alexia Sweety	f	\N
7654	Valerie	Flores	54353	4	v.flores353@cvuhsd.org	15	F	12	GYM	Harm, Kirk J.	Flores, Valerie Kaitlyn	f	\N
7655	Janelly	Fonseca	52449	4	j.fonseca449@cvuhsd.org	15	F	12	E-107	Takamoto, Jason K.	Fonseca, Janelly Annette	f	\N
7656	Ahmaya	Fountano	53472	4	a.fountano472@cvuhsd.org	15	F	12	D-201	Deutschle, Claudia E.	Fountano, Ahmaya Faith	f	\N
7657	Samuel	Franco	52511	4	s.franco511@cvuhsd.org	15	M	12	E-101	Pacheco, Lucas J.	Franco, Samuel	f	\N
7658	April	Gallardo	51664	4	a.gallardo664@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Gallardo, April Angelina	f	\N
7659	Ethan	Gamez	51959	4	e.gamez959@cvuhsd.org	15	M	12	K-101	Villacorta, Vanessa	Gamez, Ethan Rene	f	\N
7660	Hannah	Garcia Calderon	54671	4	h.garciacalderon671@cvuhsd.org	15	F	12	M-101	Smith, Bradley A	Garcia Calderon, Hannah Milette	f	\N
7661	Alexis	Garcia Castro	55217	4	a.garcia217@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Garcia Castro, Alexis Veronica	f	\N
7662	Lily	Garcia Gutierrez	51665	4	l.garciagutierrez665@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Garcia Gutierrez, Lily Sarai	f	\N
7663	Moises	Garcia Mayorga	53557	4	m.garciamayorga557@cvuhsd.org	15	M	12	K-206	Macdonald, Jason W	Garcia Mayorga, Moises Israel	f	\N
7664	Emmanuel	Garcia Mendez	51757	4	e.garciamendez757@cvuhsd.org	15	M	12	J-105	Bowman, Lauren C.	Garcia Mendez, Emmanuel	f	\N
7665	Angel	Garcia	57441	4	a.garcia441@cvuhsd.org	15	M	12	D-101	Fikes, Leyla T	Garcia, Angel Andres	f	\N
7666	Antonio	Garcia	53240	4	a.garcia240@cvuhsd.org	15	M	12	K-214	Chau, Peter	Garcia, Antonio	f	\N
7667	Kevin	Garcia	52253	4	k.garcia253@cvuhsd.org	15	M	12	D-111	Agner, Maryalice	Garcia, Kevin Michael	f	\N
7668	Priscila	Garcia	52222	4	p.garcia222@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Garcia, Priscila Saray	f	\N
7669	Trinity	Garcia	56511	4	t.garcia511@cvuhsd.org	15	F	12	K-105	Gonzalez, Alejandra	Garcia, Trinity Valeya-Hevin	f	\N
7670	Estrella	Garcia-Lopez	59225	4	e.garcialopez225@cvuhsd.org	15	F	12	GYM	Phillips, Morris L	Garcia-Lopez, Estrella Merari	f	\N
7671	Leonel	Garcia-Muralles	53108	4	l.garciamuralles108@cvuhsd.org	15	M	12	C-103	Hoang, Huy T.	Garcia-Muralles, Leonel Brandon	f	\N
7672	Jocelynn	Gines	52454	4	j.gines454@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Gines, Jocelynn Jewels	f	\N
7673	Samuel	Giron	52193	4	s.giron1932@cvuhsd.org	15	M	12	GYM	Harm, Kirk J.	Giron, Samuel Isaac	f	\N
7674	Joshua	Godinez-Carrillo	52730	4	j.godinezcarrillo730@cvuhsd.org	15	M	12	D-201	Deutschle, Claudia E.	Godinez-Carrillo, Joshua	f	\N
7675	Sindi	Gomez Barrera	55358	4	s.gomezbarrera358@cvuhsd.org	15	F	12	M-218	Navarro, Isis E.	Gomez Barrera, Sindi Noemi	f	\N
7676	Angel	Gomez de Leon	57479	4	a.gomezdeleon479@cvuhsd.org	15	M	12	D-105	Lesan, Kristine M	Gomez de Leon, Angel Israel	f	\N
7677	Galilea	Gomez Ramirez	51839	4	g.gomezramirez839@cvuhsd.org	15	F	12	C-103	Hoang, Huy T.	Gomez Ramirez, Galilea Neri	f	\N
7678	Anaizabella	Gomez	52170	4	a.gomez170@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Gomez, Anaizabella	f	\N
7679	Destiny	Gomez	51667	4	d.gomez667@cvuhsd.org	15	F	12	M-113	Aispuro, Mayte	Gomez, Destiny	f	\N
7680	Elisa	Gonzales	52249	4	e.gonzales249@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Gonzales, Elisa Sofia	f	\N
7681	Oscar	Gonzalez Castro	52148	4	o.gonzalezcastro148@cvuhsd.org	15	M	12	K-202	Allen, Richard E	Gonzalez Castro, Oscar Francisco	f	\N
7682	Marvin	Gonzalez Chajon	55997	4	m.gonzalezchajon997@cvuhsd.org	15	M	12	M-218	Navarro, Isis E.	Gonzalez Chajon, Marvin Antonio	f	\N
7683	Ariana	Gonzalez Ramirez	51785	4	a.gonzalezramirez785@cvuhsd.org	15	F	12	M-118	Aguilar Hernandez, Leslie	Gonzalez Ramirez, Ariana Michell	f	\N
7684	Brian	Gonzalez Soria	51771	4	b.gonzalezsoria771@cvuhsd.org	15	M	12	F-106	Givens, Kathy E.	Gonzalez Soria, Brian	f	\N
7685	Adan	Gonzalez	51758	4	a.gonzalez758@cvuhsd.org	15	M	12	K-206	Macdonald, Jason W	Gonzalez, Adan	f	\N
7686	Janelle	Gonzalez	51762	4	j.gonzalez762@cvuhsd.org	15	F	12	D-201	Deutschle, Claudia E.	Gonzalez, Janelle	f	\N
7687	Samantha	Gonzalez	53516	4	s.gonzalez516@cvuhsd.org	15	F	12	M-101	Smith, Bradley A	Gonzalez, Samantha Joy	f	\N
7688	Sibia	Gonzalez	59315	4	s.gonzalez315@cvuhsd.org	15	F	12	GYM	Harm, Kirk J.	Gonzalez, Sibia Nicols	f	\N
7689	Veronica	Gonzalez	52382	4	v.gonzalez382@cvuhsd.org	15	F	12	C-103	Hoang, Huy T.	Gonzalez, Veronica Rubi	f	\N
7690	Braydon	Greene	52563	4	b.greene563@cvuhsd.org	15	M	12	E-101	Pacheco, Lucas J.	Greene, Braydon Dejon	f	\N
7691	Jorge	Guerra	49747	4	j.guerra747@cvuhsd.org	15	M	12	D-201	Deutschle, Claudia E.	Guerra, Jorge Alexander	f	\N
7692	Nestor	Guerra	58779	4	n.guerra779@cvuhsd.org	15	M	12	K-101	Villacorta, Vanessa	Guerra, Nestor Aiden	f	\N
7693	Rome	Guerra	53338	4	r.guerra338@cvuhsd.org	15	M	12	L-101	Legg, Adam	Guerra, Rome Alexander	f	\N
7694	Kerin	Guerrero	52467	4	k.guerrero467@cvuhsd.org	15	M	12	L-204	Ishii, Emily	Guerrero, Kerin Ivan	f	\N
7695	Jonathan	Gutierrez	51670	4	j.gutierrez670@cvuhsd.org	15	M	12	K-206	Macdonald, Jason W	Gutierrez, Jonathan	f	\N
7696	Vanessa	Gutierrez	52138	4	v.gutierrez138@cvuhsd.org	15	F	12	K-202	Allen, Richard E	Gutierrez, Vanessa	f	\N
7697	Dylan	Guzman	51671	4	d.guzman671@cvuhsd.org	15	M	12	K-105	Gonzalez, Alejandra	Guzman, Dylan	f	\N
7698	Lianee	Guzman	51672	4	l.guzman672@cvuhsd.org	15	F	12	I-2	Pimentel, Carlina	Guzman, Lianee Jezabel	f	\N
7699	Matthew	Hartley	52625	4	m.hartley625@cvuhsd.org	15	M	12	J-105	Bowman, Lauren C.	Hartley, Matthew Evan	f	\N
7700	Jacob	Heredia	51673	4	j.heredia673@cvuhsd.org	15	M	12	G-101	Galt, Douglas S	Heredia, Jacob	f	\N
7701	Brissia	Hernandez Gonzalez	51679	4	b.hernandezgonzal679@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Hernandez Gonzalez, Brissia	f	\N
7702	Madelyn	Hernandez Hernandez	57840	4	m.hernandezhernan840@cvuhsd.org	15	F	12	K-202	Allen, Richard E	Hernandez Hernandez, Madelyn Yorleni	f	\N
7703	Alexander	Hernandez	52594	4	a.hernandez594@cvuhsd.org	15	M	12	J-105	Bowman, Lauren C.	Hernandez, Alexander	f	\N
7704	Brandon	Hernandez	52615	4	b.hernandez615@cvuhsd.org	15	M	12	K-206	Macdonald, Jason W	Hernandez, Brandon	f	\N
7705	Esmeralda	Hernandez	51675	4	e.hernandez675@cvuhsd.org	15	F	12	M-101	Smith, Bradley A	Hernandez, Esmeralda	f	\N
7706	Jercinho	Hernandez	51676	4	j.hernandez676@cvuhsd.org	15	M	12	M-101	Smith, Bradley A	Hernandez, Jercinho Roberto	f	\N
7707	Maya	Hernandez	53005	4	m.hernandez005@cvuhsd.org	15	F	12	G-101	Galt, Douglas S	Hernandez, Maya	f	\N
7708	Sebastian	Hernandez	52489	4	s.hernandez489@cvuhsd.org	15	M	12	M-101	Smith, Bradley A	Hernandez, Sebastian De Emiliano	f	\N
7709	Sophia	Hernandez	53434	4	s.hernandez434@cvuhsd.org	15	F	12	K-214	Chau, Peter	Hernandez, Sophia	f	\N
7710	Valeria	Hernandez	51674	4	v.hernandez674@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Hernandez, Valeria Fernanda	f	\N
7711	Zoe	Hernandez	55228	4	z.hernandez228@cvuhsd.org	15	F	12	M-101	Smith, Bradley A	Hernandez, Zoe Abigail	f	\N
7712	Jaymz	Hollomon	52584	4	j.hollomon584@cvuhsd.org	15	M	12	L-101	Legg, Adam	Hollomon, Jaymz Mitchell	f	\N
7713	Paul	Honorio Honorio	53521	4	p.honoriohonorio521@cvuhsd.org	15	M	12	M-101	Smith, Bradley A	Honorio Honorio, Paul Joaquin	f	\N
7714	Laileen	Hubbard	53229	4	l.hubbard229@cvuhsd.org	15	F	12	D-201	Deutschle, Claudia E.	Hubbard, Laileen Veronica	f	\N
7715	Soraya	Huerta Chinchilla	52542	4	s.chinchilla542@cvuhsd.org	15	X	12	GYM	Harm, Kirk J.	Huerta Chinchilla, Soraya Elizabeth	f	\N
7716	Estrella	Huitron	51681	4	e.huitron681@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Huitron, Estrella	f	\N
7717	Alexis	Hunter	57705	4	a.hunter705@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Hunter, Alexis Kaylee	f	\N
7718	Rihanna	Hurtado	52629	4	r.hurtado629@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Hurtado, Rihanna Calderon	f	\N
7719	Nathan	Huynh	55333	4	n.huynh333@cvuhsd.org	15	M	12	M-113	Aispuro, Mayte	Huynh, Nathan Thomas	f	\N
7720	Yeneisy	Ibarra	52229	4	y.ibarra229@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Ibarra, Yeneisy	f	\N
7721	Probity	Irumundomon	53145	4	p.irumundomon145@cvuhsd.org	15	M	12	M-111	Valencia, Sandra	Irumundomon, Probity Osemudiamen	f	\N
7722	Matthew	Jacobo	52611	4	m.jacobo611@cvuhsd.org	15	M	12	G-101	Galt, Douglas S	Jacobo, Matthew	f	\N
7723	Jocelyn	Jaramillo	52160	4	j.jaramillo160@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Jaramillo, Jocelyn Michelle	f	\N
7724	Justin	Jauregui	52867	4	j.jauregui867@cvuhsd.org	15	M	12	G-101	Galt, Douglas S	Jauregui, Justin Angel	f	\N
7725	Luna	Jimenez Ramos	51684	4	l.jimenezramos684@cvuhsd.org	15	F	12	J-105	Bowman, Lauren C.	Jimenez Ramos, Luna Isabel	f	\N
7726	Damian	Jimenez	52794	4	d.jimenez794@cvuhsd.org	15	M	12	M-101	Smith, Bradley A	Jimenez, Damian Kenny Jr.	f	\N
7727	Jose	Jimenez	51883	4	j.jimenez883@cvuhsd.org	15	M	12	K-206	Macdonald, Jason W	Jimenez, Jose Eduardo	f	\N
7728	Ian	Juarez Rodriguez	53183	4	i.juarezrodriguez183@cvuhsd.org	15	M	12	C-103	Hoang, Huy T.	Juarez Rodriguez, Ian David	f	\N
7729	Serenity	Juarez	52543	4	s.juarez543@cvuhsd.org	15	F	12	J-105	Bowman, Lauren C.	Juarez, Serenity Marilyn	f	\N
7730	Sirin	Kadri	57992	4	s.kadri992@cvuhsd.org	15	F	12	D-105	Lesan, Kristine M	Kadri, Sirin	f	\N
7731	Brian	Klein	52392	4	b.klein392@cvuhsd.org	15	M	12	K-206	Macdonald, Jason W	Klein, Brian Alexander	f	\N
7732	Carlos	Landaverde	52599	4	c.landaverde599@cvuhsd.org	15	M	12	K-206	Macdonald, Jason W	Landaverde, Carlos Ernesto	f	\N
7733	Brayan	Lara	52520	4	b.lara520@cvuhsd.org	15	M	12	K-214	Chau, Peter	Lara, Brayan	f	\N
7734	Elvis	Lechuga-Pineda	56102	4	e.lechugapineda102@cvuhsd.org	15	M	12	C-204	Rios, James	Lechuga-Pineda, Elvis Jancarlo	f	\N
7735	Sean	Lee	51783	4	s.lee783@cvuhsd.org	15	M	12	GYM	Harm, Kirk J.	Lee, Sean Christopher	f	\N
7736	Richar	Leiva Vasquez	52422	4	r.leivavasquez422@cvuhsd.org	15	M	12	M-218	Navarro, Isis E.	Leiva Vasquez, Richar Moises	f	\N
7737	Natalie	Lemus	54330	4	n.lemus330@cvuhsd.org	15	F	12	K-105	Gonzalez, Alejandra	Lemus, Natalie Nicole	f	\N
7738	Gerardo	Leos	52534	4	g.leos534@cvuhsd.org	15	M	12	C-204	Rios, James	Leos, Gerardo Ramon	f	\N
7739	De'Onte	Lett	52177	4	d.lett177@cvuhsd.org	15	M	12	D-201	Deutschle, Claudia E.	Lett, De'Onte Charles	f	\N
7740	Jermaine	Lewis	55019	4	j.lewis019@cvuhsd.org	15	M	12	M-111	Valencia, Sandra	Lewis, Jermaine Joe	f	\N
7741	Precious	Lobti	55018	4	p.lobti018@cvuhsd.org	15	F	12	L-204	Ishii, Emily	Lobti, Precious Andensah	f	\N
7742	Sebastian	Londono	57626	4	s.londono626@cvuhsd.org	15	M	12	D-201	Deutschle, Claudia E.	Londono, Sebastian Shamir	f	\N
7743	Geovanni	Lopez Cintora	52056	4	g.lopezcintora056@cvuhsd.org	15	M	12	L-101	Legg, Adam	Lopez Cintora, Geovanni Martin	f	\N
7744	Jacob	Lopez	51796	4	j.lopez796@cvuhsd.org	15	M	12	C-103	Hoang, Huy T.	Lopez, Jacob Isaiah	f	\N
7745	Lizbeth	Lopez	55593	4	l.lopez593@cvuhsd.org	15	F	12	C-103	Hoang, Huy T.	Lopez, Lizbeth	f	\N
7746	Sherlin	Lopez	52884	4	s.lopez884@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Lopez, Sherlin Daniela	f	\N
7747	Jesse	Loza	52362	4	j.loza362@cvuhsd.org	15	M	12	F-106	Givens, Kathy E.	Loza, Jesse	f	\N
7748	Alina	Luna	51980	4	a.luna980@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Luna, Alina Denise	f	\N
7749	Desire	Luna	55425	4	d.luna425@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Luna, Desire Mia	f	\N
7750	Liber	Machon	54350	4	l.machon350@cvuhsd.org	15	M	12	J-112	Levine, Allison A	Machon, Liber Alberto	f	\N
7751	Yeshua	Magana Carboni	55090	4	y.maganacarboni090@cvuhsd.org	15	M	12	D-201	Deutschle, Claudia E.	Magana Carboni, Yeshua	f	\N
7752	Dania	Malpud Apraez	58263	4	d.malpudapraez263@cvuhsd.org	15	F	12	L-104	Najarro, Claudia	Malpud Apraez, Dania Yulixa	f	\N
7753	Steven	Mancia Martinez	56170	4	s.manciamartinez170@cvuhsd.org	15	M	12	K-216	Arangoa Ramirez, Christian	Mancia Martinez, Steven Jostin	f	\N
7754	Cesar	Mares Magallon	53366	4	c.maresmagallon366@cvuhsd.org	15	M	12	F-106	Givens, Kathy E.	Mares Magallon, Cesar Armando	f	\N
7755	Anthony	Martinez Carreon	52888	4	a.martinezcarreon888@cvuhsd.org	15	M	12	D-201	Deutschle, Claudia E.	Martinez Carreon, Anthony George	f	\N
7756	Julie	Martinez Perez	53016	4	j.martinezperez016@cvuhsd.org	15	F	12	K-105	Gonzalez, Alejandra	Martinez Perez, Julie	f	\N
7757	Jessica	Martinez Rodriguez	51705	4	j.martinezrodrigu705@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Martinez Rodriguez, Jessica	f	\N
7758	Vanessa	Martinez Rufino	55502	4	v.martinezrufino502@cvuhsd.org	15	F	12	I-2	Pimentel, Carlina	Martinez Rufino, Vanessa	f	\N
7759	Angel	Martinez	55012	4	a.martinez012@cvuhsd.org	15	M	12	K-101	Villacorta, Vanessa	Martinez, Angel Daniel	f	\N
7760	Gabriella	Martinez	51693	4	g.martinez693@cvuhsd.org	15	F	12	C-103	Hoang, Huy T.	Martinez, Gabriella Evangelina	f	\N
7761	Nicole	Martinez	52175	4	n.martinez175@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Martinez, Nicole	f	\N
7762	Shila	Martinez	52341	4	s.martinez341@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Martinez, Shila Paz	f	\N
7763	Ryan	Martinez-Villalobos	52889	4	r.martinezvillalo889@cvuhsd.org	15	M	12	K-214	Chau, Peter	Martinez-Villalobos, Ryan	f	\N
7764	Alexandria	Mata	52890	4	a.mata890@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Mata, Alexandria	f	\N
7765	Angie	Mata	52139	4	a.mata139@cvuhsd.org	15	F	12	D-201	Deutschle, Claudia E.	Mata, Angie Michell	f	\N
7766	Whitney	Mathelus	53149	4	w.mathelus149@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Mathelus, Whitney Rosedarlene	f	\N
7767	Jeffrey	May-Ruiz	52232	4	j.mayruiz232@cvuhsd.org	15	M	12	K-114	Loera, Jorge Antonio	May-Ruiz, Jeffrey Joseph	f	\N
7768	Aries	McCollom	52664	4	a.mccollom664@cvuhsd.org	15	M	12	K-202	Allen, Richard E	McCollom, Aries Cain	f	\N
7769	Trevor	McDonald	52396	4	t.mcdonald396@cvuhsd.org	15	M	12	M-112	Barahona, Iris	McDonald, Trevor Edward	f	\N
7770	Jane	McLaurin	51706	4	j.mclaurin706@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	McLaurin, Jane Allie	f	\N
7771	Angel	Medrano	52198	4	a.medrano1982@cvuhsd.org	15	M	12	L-204	Ishii, Emily	Medrano, Angel Jesus	f	\N
7772	Bryant	Mejia	52614	4	b.mejia614@cvuhsd.org	15	M	12	GYM	Harm, Kirk J.	Mejia, Bryant	f	\N
7773	Angeline	Mejia-Jimenez	52893	4	a.mejiajimenez893@cvuhsd.org	15	F	12	D-201	Deutschle, Claudia E.	Mejia-Jimenez, Angeline	f	\N
7774	Andrew	Mena	51707	4	a.mena707@cvuhsd.org	15	M	12	M-101	Smith, Bradley A	Mena, Andrew Matthew	f	\N
7775	Angellie	Mencos Estrada	51956	4	a.mencosestrada956@cvuhsd.org	15	F	12	D-201	Deutschle, Claudia E.	Mencos Estrada, Angellie Alexandra	f	\N
7776	Giovanny	Mendez Cruz	52593	4	g.mendezcruz593@cvuhsd.org	15	M	12	D-111	Agner, Maryalice	Mendez Cruz, Giovanny	f	\N
7777	Wendy	Mendez	52254	4	w.mendez254@cvuhsd.org	15	F	12	D-201	Deutschle, Claudia E.	Mendez, Wendy Michell	f	\N
7778	Gerardo	Mendieta	51798	4	g.mendieta798@cvuhsd.org	15	M	12	D-201	Deutschle, Claudia E.	Mendieta, Gerardo	f	\N
7779	Oscar	Mendoza	52109	4	o.mendoza109@cvuhsd.org	15	M	12	D-201	Deutschle, Claudia E.	Mendoza, Oscar	f	\N
7780	Ayla	Menjivar	52215	4	a.menjivar215@cvuhsd.org	15	F	12	F-106	Givens, Kathy E.	Menjivar, Ayla Samara	f	\N
7781	Gloria	Mercado Cruz	52988	4	g.mercadocruz988@cvuhsd.org	15	F	12	J-112	Levine, Allison A	Mercado Cruz, Gloria Yuliana	f	\N
7782	Emily	Meza	52000	4	e.meza000@cvuhsd.org	15	F	12	D-201	Deutschle, Claudia E.	Meza, Emily	f	\N
7783	Luzwin	Milian Campos	58653	4	l.miliancampos653@cvuhsd.org	15	M	12	GYM	Phillips, Morris L	Milian Campos, Luzwin Estuardo	f	\N
7784	Alex	Minor	53327	4	a.minor327@cvuhsd.org	15	M	12	G-101	Galt, Douglas S	Minor, Alex Manuel	f	\N
7785	Katie	Miramontes	51710	4	k.miramontes710@cvuhsd.org	15	F	12	D-201	Deutschle, Claudia E.	Miramontes, Katie Yoaly	f	\N
7786	John	Miranda	51711	4	j.miranda711@cvuhsd.org	15	M	12	D-201	Deutschle, Claudia E.	Miranda, John Steve	f	\N
7787	Chukwubuikem	Mmaduanusi	56796	4	c.mmaduanusi796@cvuhsd.org	15	M	12	M-111	Valencia, Sandra	Mmaduanusi, Chukwubuikem Michael	f	\N
7788	Alexander	Montejano	51799	4	a.montejano799@cvuhsd.org	15	M	12	K-202	Allen, Richard E	Montejano, Alexander	f	\N
7789	Caroline	Montero Ramirez	56281	4	c.monteroramirez281@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Montero Ramirez, Caroline Stephanie	f	\N
7790	Ace	Montes-Navarro	51712	4	a.montesnavarro712@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Montes-Navarro, Ace	f	\N
7791	Alexander	Montoya	52245	4	a.montoya245@cvuhsd.org	15	M	12	J-105	Bowman, Lauren C.	Montoya, Alexander	f	\N
7792	Jayzien	Morales	53133	4	j.morales133@cvuhsd.org	15	M	12	M-117	Tarkington, Cole	Morales, Jayzien Jesse	f	\N
7793	Giselle	Moreno	52989	4	g.moreno989@cvuhsd.org	15	F	12	J-105	Bowman, Lauren C.	Moreno, Giselle Elda	f	\N
7794	Ivan	Moreno	52194	4	i.moreno1942@cvuhsd.org	15	M	12	M-101	Smith, Bradley A	Moreno, Ivan Alexander	f	\N
7795	Michael	Moreno	51730	4	m.moreno730@cvuhsd.org	15	M	12	GYM	Harm, Kirk J.	Moreno, Michael	f	\N
7796	Elijah	Morti	59024	4	h.morti024@cvuhsd.org	15	M	12	K-105	Gonzalez, Alejandra	Morti, Elijah	f	\N
7797	Bailey	Munnings	54872	4	c.munnings872@cvuhsd.org	15	F	12	GYM	Harm, Kirk J.	Munnings, Bailey Faith	f	\N
7798	Raymond	Munoz	52340	4	r.munoz340@cvuhsd.org	15	M	12	L-204	Ishii, Emily	Munoz, Raymond Christopher	f	\N
7799	Joshua	Murillo	51713	4	j.murillo713@cvuhsd.org	15	M	12	K-206	Macdonald, Jason W	Murillo, Joshua	f	\N
7800	Jasmine	Najera Testa	52426	4	j.najeratesta426@cvuhsd.org	15	F	12	J-112	Levine, Allison A	Najera Testa, Jasmine Natalie	f	\N
7801	Meherun	Nessa	57621	4	m.nessa621@cvuhsd.org	15	F	12	K-105	Gonzalez, Alejandra	Nessa, Meherun	f	\N
7802	John	Ofoha	52998	4	j.ofoha998@cvuhsd.org	15	M	12	C-204	Rios, James	Ofoha, John Chibuke	f	\N
7803	Ana	Orellana Aguilera	55390	4	a.orellanaaguiler390@cvuhsd.org	15	F	12	M-218	Navarro, Isis E.	Orellana Aguilera, Ana Lucia	f	\N
7804	Whesly	Orozco Mejia	53579	4	w.orozcomejia579@cvuhsd.org	15	M	12	K-214	Chau, Peter	Orozco Mejia, Whesly Ricardo	f	\N
7805	Jazmin	Orozco	51718	4	j.orozco7182@cvuhsd.org	15	F	12	D-201	Deutschle, Claudia E.	Orozco, Jazmin Marie	f	\N
7806	Jocelyn	Orozco	51717	4	j.orozco717@cvuhsd.org	15	F	12	C-204	Rios, James	Orozco, Jocelyn Marie	f	\N
7807	Juan	Ortegon Forero	55219	4	j.ortegonforero219@cvuhsd.org	15	M	12	D-207	Gonzalez, Deborah A	Ortegon Forero, Juan Esteban	f	\N
7808	Alexis	Ortiz	52990	4	a.ortiz990@cvuhsd.org	15	M	12	D-111	Agner, Maryalice	Ortiz, Alexis	f	\N
7809	Roberto	Ovando-Ballesteros	52427	4	r.ovandoballester427@cvuhsd.org	15	M	12	K-114	Loera, Jorge Antonio	Ovando-Ballesteros, Roberto Jesus	f	\N
7810	Divinagloria	Ozuna-Aragon	52135	4	d.ozunaaragon135@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Ozuna-Aragon, Divinagloria	f	\N
7811	Jared	Pacheco Amador	52230	4	j.pachecoamador230@cvuhsd.org	15	M	12	F-106	Givens, Kathy E.	Pacheco Amador, Jared	f	\N
7812	Isaiah	Pacheco	52775	4	i.pacheco775@cvuhsd.org	15	M	12	K-206	Macdonald, Jason W	Pacheco, Isaiah Phillip	f	\N
7813	Omar	Padilla	53242	4	o.padilla242@cvuhsd.org	15	M	12	G-101	Galt, Douglas S	Padilla, Omar	f	\N
7814	Leo	Paez	51719	4	l.paez719@cvuhsd.org	15	M	12	J-112	Levine, Allison A	Paez, Leo	f	\N
7815	Francesco	Palomino Mercado	54141	4	f.palominomercado141@cvuhsd.org	15	M	12	E-107	Takamoto, Jason K.	Palomino Mercado, Francesco Henry	f	\N
7816	Mathew	Pardo-Zamora	52428	4	m.pardozamora428@cvuhsd.org	15	M	12	L-204	Ishii, Emily	Pardo-Zamora, Mathew Alexander	f	\N
7817	Anthony	Pena Miranda	57098	4	a.penamiranda098@cvuhsd.org	15	M	12	L-104	Najarro, Claudia	Pena Miranda, Anthony Julian	f	\N
7818	Jhon	Pena Miranda	57099	4	j.penamiranda099@cvuhsd.org	15	M	12	L-104	Najarro, Claudia	Pena Miranda, Jhon David	f	\N
7819	Daniel	Pereira De Carvalho Siqueira	57494	4	d.pereiradecarval494@cvuhsd.org	15	M	12	K-214	Chau, Peter	Pereira De Carvalho Siqueira, Daniel	f	\N
7820	Lauren	Perez Rodriguez	53554	4	l.perezrodriguez554@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Perez Rodriguez, Lauren Ariel	f	\N
7821	Patrick	Perez	52224	4	p.perez224@cvuhsd.org	15	M	12	M-101	Smith, Bradley A	Perez, Patrick Walter	f	\N
7822	Ethan	Piedrasanta	52613	4	e.piedrasanta613@cvuhsd.org	15	M	12	J-105	Bowman, Lauren C.	Piedrasanta, Ethan Amir	f	\N
7823	Brianna	Pinto	52602	4	b.pinto602@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Pinto, Brianna	f	\N
7824	Jose	Placeres	52339	4	j.placeres339@cvuhsd.org	15	M	12	GYM	Harm, Kirk J.	Placeres, Jose Luis	f	\N
7825	Wilfredo	Ponce Asencio	52144	4	w.ponce144@cvuhsd.org	15	M	12	J-105	Bowman, Lauren C.	Ponce Asencio, Wilfredo	f	\N
7826	Adrian	Ponce	52161	4	a.ponce161@cvuhsd.org	15	M	12	D-111	Agner, Maryalice	Ponce, Adrian Giovanny	f	\N
7827	Michael	Pope	53185	4	m.pope185@cvuhsd.org	15	M	12	GYM	Harm, Kirk J.	Pope, Michael Amado Anthony	f	\N
7828	Allen	Porron-Benitez	55311	4	a.porronbenitez311@cvuhsd.org	15	M	12	L-103	Castillo, Amy	Porron-Benitez, Allen Arthur	f	\N
7829	Dayanara	Prado	52089	4	d.prado089@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Prado, Dayanara	f	\N
7830	Gildardo	Prado	52668	4	g.prado668@cvuhsd.org	15	M	12	D-111	Agner, Maryalice	Prado, Gildardo Anthony	f	\N
7831	Annie	Prieto	52430	4	a.prieto430@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Prieto, Annie Adriana	f	\N
7832	Sabina	Pulido Barraza	52595	4	s.pulidobarraza595@cvuhsd.org	15	F	12	M-114	Garcia, Manuel	Pulido Barraza, Sabina Maribel	f	\N
7833	Gorka	Quijada Olano	53269	4	g.quijadaolano269@cvuhsd.org	15	M	12	K-214	Chau, Peter	Quijada Olano, Gorka Fernando	f	\N
7834	Gerardo	Quinonez	52488	4	g.quinonez488@cvuhsd.org	15	M	12	D-201	Deutschle, Claudia E.	Quinonez, Gerardo Cruz	f	\N
7835	Cesar	Quintero	52242	4	c.quintero242@cvuhsd.org	15	M	12	K-214	Chau, Peter	Quintero, Cesar	f	\N
7836	Jonathan	Quiroz Bravo	52622	4	j.quirozbravo622@cvuhsd.org	15	M	12	M-218	Navarro, Isis E.	Quiroz Bravo, Jonathan	f	\N
7837	Michael	Quiroz	52916	4	m.quiroz916@cvuhsd.org	15	M	12	M-113	Aispuro, Mayte	Quiroz, Michael Alexander	f	\N
7838	Charlize Phoebe Rae	Racelis	54271	4	c.racelis271@cvuhsd.org	15	F	12	M-101	Smith, Bradley A	Racelis, Charlize Phoebe Rae	f	\N
7839	Kimberly	Ramirez Barillas	54880	4	k.ramirezbarillas880@cvuhsd.org	15	F	12	E-107	Takamoto, Jason K.	Ramirez Barillas, Kimberly Isabel	f	\N
7840	Sofia	Ramirez Romo	53514	4	s.ramirezromo514@cvuhsd.org	15	F	12	M-101	Smith, Bradley A	Ramirez Romo, Sofia	f	\N
7841	Alfredo	Ramirez	52610	4	a.ramirez610@cvuhsd.org	15	M	12	M-101	Smith, Bradley A	Ramirez, Alfredo Giovanny	f	\N
7842	Branden	Ramirez	55589	4	b.ramirez589@cvuhsd.org	15	M	12	K-114	Loera, Jorge Antonio	Ramirez, Branden Adrian	f	\N
7843	Jade	Ramos	52445	4	j.ramos445@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Ramos, Jade Sarhaie	f	\N
7844	Ishika	Ransi	55542	4	i.ransi542@cvuhsd.org	15	F	12	I-2	Pimentel, Carlina	Ransi, Ishika	f	\N
7845	Maha	Rehman	53130	4	m.rehman130@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Rehman, Maha Meera	f	\N
7846	Roberta	Remy	52256	4	r.remy256@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Remy, Roberta	f	\N
7847	Nathan	Renteria Garcia	52137	4	n.renteriagarcia137@cvuhsd.org	15	M	12	L-204	Ishii, Emily	Renteria Garcia, Nathan Alexander	f	\N
7848	Oscar	Renteria Ramirez	52034	4	o.renteriaramirez034@cvuhsd.org	15	M	12	K-214	Chau, Peter	Renteria Ramirez, Oscar Eduardo	f	\N
7849	Kevin	Renteria	51721	4	k.renteria721@cvuhsd.org	15	M	12	L-104	Najarro, Claudia	Renteria, Kevin Jesus	f	\N
7850	William	Reyes Matias	51722	4	w.reyesmatias722@cvuhsd.org	15	M	12	L-204	Ishii, Emily	Reyes Matias, William	f	\N
7851	Mario	Reyes Najera	53098	4	m.reyesnajera098@cvuhsd.org	15	M	12	M-101	Smith, Bradley A	Reyes Najera, Mario Alberto	f	\N
7852	Cristal	Reyes Zepeda	51723	4	c.reyeszepeda723@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Reyes Zepeda, Cristal Esmeralda	f	\N
7853	Adrian	Reyes	52211	4	a.reyes211@cvuhsd.org	15	M	12	E-101	Pacheco, Lucas J.	Reyes, Adrian Joseph	f	\N
7854	Skylar	Reyes	53591	4	s.reyes591@cvuhsd.org	15	F	12	M-101	Smith, Bradley A	Reyes, Skylar Natalia	f	\N
7855	Yasmine	Reyes	52263	4	y.reyes263@cvuhsd.org	15	F	12	M-112	Barahona, Iris	Reyes, Yasmine Katty	f	\N
7856	Christopher	Rivas Campos	52750	4	c.rivascampos750@cvuhsd.org	15	M	12	K-101	Villacorta, Vanessa	Rivas Campos, Christopher Abraham	f	\N
7857	Rebecca	Rivas	51724	4	r.rivas724@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Rivas, Rebecca	f	\N
7858	Adrian	Rivera	52981	4	a.rivera981@cvuhsd.org	15	M	12	F-107	Rice, Christopher A.	Rivera, Adrian Nicolas	f	\N
7859	Darling	Rivera	53013	4	t.rivera013@cvuhsd.org	15	F	12	J-113	Urquidez, Donald	Rivera, Darling Tiffany Akeena	f	\N
7860	Irene	Rivera	52928	4	i.rivera928@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Rivera, Irene Fabiola	f	\N
7861	Kaila	Rivera	52209	4	k.rivera209@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Rivera, Kaila Sky	f	\N
7862	Joselin	Rodriguez Lopez	52195	4	j.rodriguez1952@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Rodriguez Lopez, Joselin Alondra	f	\N
7863	Luis	Rodriguez Moreno	52237	4	l.rodriguezmoreno237@cvuhsd.org	15	M	12	E-101	Pacheco, Lucas J.	Rodriguez Moreno, Luis Jesus	f	\N
7864	Alejandro	Rodriguez	52637	4	a.rodriguez637@cvuhsd.org	15	M	12	K-206	Macdonald, Jason W	Rodriguez, Alejandro	f	\N
7865	Hugo	Rodriguez	51725	4	h.rodriguez725@cvuhsd.org	15	M	12	E-101	Pacheco, Lucas J.	Rodriguez, Hugo Massimo	f	\N
7866	Julian	Rodriguez	52136	4	j.rodriguez136@cvuhsd.org	15	M	12	M-101	Smith, Bradley A	Rodriguez, Julian Emmanuel	f	\N
7867	Lucas	Rodriguez	57510	4	l.rodriguez510@cvuhsd.org	15	M	12	D-111	Agner, Maryalice	Rodriguez, Lucas Anthony	f	\N
7868	Andres	Roman	58510	4	a.roman510@cvuhsd.org	15	M	12	K-101	Villacorta, Vanessa	Roman, Andres Enrique	f	\N
7869	Angel	Roman	51726	4	a.roman726@cvuhsd.org	15	M	12	L-104	Najarro, Claudia	Roman, Angel Damian	f	\N
7870	Armando	Roman	52582	4	a.roman582@cvuhsd.org	15	M	12	L-101	Legg, Adam	Roman, Armando	f	\N
7871	Alvaro	Romero Lopez	57341	4	a.romerolopez341@cvuhsd.org	15	M	12	M-218	Navarro, Isis E.	Romero Lopez, Alvaro Josue	f	\N
7872	Mayra	Romero	51727	4	m.romero727@cvuhsd.org	15	F	12	M-101	Smith, Bradley A	Romero, Mayra Michelle	f	\N
7873	Sophia	Romo	52468	4	s.romo468@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Romo, Sophia Diana	f	\N
7874	Alanis	Rosas	52201	4	a.rosas2012@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Rosas, Alanis Fernanda	f	\N
7875	Adrian	Ruelas	52985	4	a.ruelas985@cvuhsd.org	15	X	12	M-113	Aispuro, Mayte	Ruelas, Adrian	f	\N
7876	Margarita	Ruiz	51728	4	m.ruiz728@cvuhsd.org	15	F	12	K-105	Gonzalez, Alejandra	Ruiz, Margarita	f	\N
7877	Eric	Rumery	52149	4	e.rumery149@cvuhsd.org	15	M	12	M-101	Smith, Bradley A	Rumery, Eric Lee	f	\N
7878	Jeremiah	Runnel	52681	4	j.runnel681@cvuhsd.org	15	M	12	J-105	Bowman, Lauren C.	Runnel, Jeremiah Lee	f	\N
7879	Eric	Sajche-Mercado	53045	4	e.sajchemercado045@cvuhsd.org	15	M	12	C-204	Rios, James	Sajche-Mercado, Eric Isaac	f	\N
7880	Anahi	Sanchez Garcia	51821	4	a.sanchezgarcia821@cvuhsd.org	15	F	12	C-204	Rios, James	Sanchez Garcia, Anahi	f	\N
7881	Beatriz	Sanchez Ramirez	52219	4	b.sanchezramirez219@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Sanchez Ramirez, Beatriz	f	\N
7882	Elisa	Sanchez	52935	4	e.sanchez935@cvuhsd.org	15	F	12	F-107	Rice, Christopher A.	Sanchez, Elisa Sinahi	f	\N
7883	Ethan	Sanchez	51819	4	e.sanchez819@cvuhsd.org	15	M	12	K-101	Villacorta, Vanessa	Sanchez, Ethan Abdon	f	\N
7884	Miguel	Sanchez	52212	4	m.sanchez212@cvuhsd.org	15	M	12	D-111	Agner, Maryalice	Sanchez, Miguel Angel	f	\N
7885	Sebastian	Sanchez	52936	4	s.sanchez936@cvuhsd.org	15	M	12	M-101	Smith, Bradley A	Sanchez, Sebastian Manuel	f	\N
7886	Susana	Sanchez	49970	4	s.sanchez970@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Sanchez, Susana Del Carmen	f	\N
7887	Emeli	Sandoval Villatoro	52504	4	e.sandovalvillato504@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Sandoval Villatoro, Emeli Alomi	f	\N
7888	Oscar	Santamaria	57502	4	o.santamaria502@cvuhsd.org	15	M	12	D-111	Agner, Maryalice	Santamaria, Oscar David	f	\N
7889	Angela	Santos	52608	4	a.santos608@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Santos, Angela	f	\N
7890	Irandani	Santos	51822	4	i.santos822@cvuhsd.org	15	F	12	D-201	Deutschle, Claudia E.	Santos, Irandani	f	\N
7891	German	Sarceno-Lasnibat	51823	4	g.sarcenolanibat823@cvuhsd.org	15	M	12	D-201	Deutschle, Claudia E.	Sarceno-Lasnibat, German Alexander	f	\N
7892	Sara	Sason	52993	4	s.sason993@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Sason, Sara Mia	f	\N
7893	Warain	Satitkitpichet	57599	4	w.satitkitpichet599@cvuhsd.org	15	M	12	K-214	Chau, Peter	Satitkitpichet, Warain	f	\N
7894	Emily	Sente	52226	4	e.sente226@cvuhsd.org	15	F	12	I-2	Pimentel, Carlina	Sente, Emily Yulisa	f	\N
7895	Jakobi	Smith	52712	4	j.smith712@cvuhsd.org	15	M	12	D-111	Agner, Maryalice	Smith, Jakobi Jahi	f	\N
7896	Leyla	Smith	52693	4	l.smith693@cvuhsd.org	15	F	12	J-105	Bowman, Lauren C.	Smith, Leyla Samahia	f	\N
7897	Lilian	Solares Solares	54524	4	l.solaressolares524@cvuhsd.org	15	F	12	L-104	Najarro, Claudia	Solares Solares, Lilian Elizabeth	f	\N
7898	Joselin	Solis Laparra	51841	4	j.solislaparra841@cvuhsd.org	15	F	12	M-101	Smith, Bradley A	Solis Laparra, Joselin Anai	f	\N
7899	Vilikesa	Sorovakarua	52503	4	v.sorovakarua503@cvuhsd.org	15	M	12	E-101	Pacheco, Lucas J.	Sorovakarua, Vilikesa Lotuma	f	\N
7900	Jazmin	Soto	51842	4	j.soto842@cvuhsd.org	15	F	12	D-201	Deutschle, Claudia E.	Soto, Jazmin	f	\N
7901	Ricardo	Soto	51845	4	r.soto845@cvuhsd.org	15	M	12	L-104	Najarro, Claudia	Soto, Ricardo	f	\N
7902	Je'Vaughn	Spicer	51989	4	j.spicer989@cvuhsd.org	15	M	12	K-101	Villacorta, Vanessa	Spicer, Je'Vaughn Sincere	f	\N
7903	Jeremiah	Tamene	52433	4	j.tamene433@cvuhsd.org	15	M	12	L-204	Ishii, Emily	Tamene, Jeremiah James	f	\N
7904	Daisy	Terrones Solis	51847	4	d.terronessolis847@cvuhsd.org	15	F	12	F-106	Givens, Kathy E.	Terrones Solis, Daisy	f	\N
7905	Zion	Titus	57631	4	z.titus631@cvuhsd.org	15	F	12	M-112	Barahona, Iris	Titus, Zion Vermell Faye	f	\N
7906	Ashley	Todd	57370	4	a.huffmantodd370@cvuhsd.org	15	F	12	M-114	Garcia, Manuel	Todd, Ashley Denise	f	\N
7907	Dylan	Tolentino Barrera	51849	4	d.tolentinobarrer849@cvuhsd.org	15	M	12	K-101	Villacorta, Vanessa	Tolentino Barrera, Dylan	f	\N
7908	Leni	Toli	52432	4	i.toli432@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Toli, Leni Fesili	f	\N
7909	Demian	Torres Montenegro	52973	4	d.torresmontenegr973@cvuhsd.org	15	M	12	D-201	Deutschle, Claudia E.	Torres Montenegro, Demian Alexandro	f	\N
7910	Diego	Torres	52588	4	d.torres588@cvuhsd.org	15	M	12	D-205	Nunez Reynoso, Marisela	Torres, Diego Alfonso	f	\N
7911	Vanessa	Torres	52586	4	v.torres586@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Torres, Vanessa	f	\N
7912	Janet	Tran	51850	4	j.tran850@cvuhsd.org	15	F	12	J-112	Levine, Allison A	Tran, Janet	f	\N
7913	Alexander	Trinidad Quintana	51852	4	a.trinidadquintan852@cvuhsd.org	15	M	12	K-206	Macdonald, Jason W	Trinidad Quintana, Alexander Elijha	f	\N
7914	Darrion	Tucker	53367	4	d.tucker367@cvuhsd.org	15	M	12	K-206	Macdonald, Jason W	Tucker, Darrion Dahmeer	f	\N
7915	Zayya	Tun	57622	4	z.tun622@cvuhsd.org	15	M	12	K-206	Macdonald, Jason W	Tun, Zayya	f	\N
7916	Julia	Urrutia Chajon	57200	4	j.urrutiachajon200@cvuhsd.org	15	F	12	D-105	Lesan, Kristine M	Urrutia Chajon, Julia Waleska	f	\N
7917	Nashly	Valdovinos Navarro	51876	4	n.valdovinosnavar876@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Valdovinos Navarro, Nashly Camila	f	\N
7918	Chipper	Valencia Torres	52223	4	c.valenciatorres223@cvuhsd.org	15	M	12	M-101	Smith, Bradley A	Valencia Torres, Chipper Jones	f	\N
7919	Ingrid	Valenzuela Rucuch	55511	4	i.valenzuelarucuc511@cvuhsd.org	15	F	12	M-218	Navarro, Isis E.	Valenzuela Rucuch, Ingrid Yojana	f	\N
7920	Anthony	Valenzuela	52950	4	a.valenzuela950@cvuhsd.org	15	M	12	L-104	Najarro, Claudia	Valenzuela, Anthony	f	\N
7921	Alyssa	Valeri	52495	4	a.virgen495@cvuhsd.org	15	F	12	M-101	Smith, Bradley A	Valeri, Alyssa Giselle	f	\N
7922	Bryan	Valladarez Rivera	51855	4	b.valladarezriver855@cvuhsd.org	15	M	12	GYM	Harm, Kirk J.	Valladarez Rivera, Bryan Omar	f	\N
7923	Paulina	Valle	51858	4	p.valle858@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Valle, Paulina	f	\N
7924	Brenda	Vanegas Maximiliano	52949	4	b.vanegasmaximili949@cvuhsd.org	15	F	12	I-2	Pimentel, Carlina	Vanegas Maximiliano, Brenda	f	\N
7925	Gabriela	Vargas Castellanos	52251	4	g.vargascastellan251@cvuhsd.org	15	F	12	E-101	Pacheco, Lucas J.	Vargas Castellanos, Gabriela Alexandra	f	\N
7926	Anthony	Vargas	51859	4	a.vargas859@cvuhsd.org	15	M	12	D-205	Nunez Reynoso, Marisela	Vargas, Anthony Andrey	f	\N
7927	Brianna	Vasquez	52206	4	b.vasquez206@cvuhsd.org	15	F	12	M-101	Smith, Bradley A	Vasquez, Brianna Dezerie	f	\N
7928	Alexander	Vazquez	52027	4	a.vazquez027@cvuhsd.org	15	M	12	F-106	Givens, Kathy E.	Vazquez, Alexander	f	\N
7929	Liliana	Vazquez	56047	4	l.vazquez047@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Vazquez, Liliana Michelle	f	\N
7930	Maya	Vega	52587	4	m.vega587@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Vega, Maya Andrea	f	\N
7931	Luis	Vela	51863	4	l.vela863@cvuhsd.org	15	M	12	J-112	Levine, Allison A	Vela, Luis Ruben	f	\N
7932	Carissa	Velasco	52451	4	c.velasco451@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Velasco, Carissa Marie	f	\N
7933	Gloria	Velasquez Cabrera	57101	4	g.velasquezcabrer101@cvuhsd.org	15	F	12	D-105	Lesan, Kristine M	Velasquez Cabrera, Gloria Eduvina	f	\N
7934	Guillermo	Velasquez Ibarra	51864	4	g.velasquezibarra864@cvuhsd.org	15	M	12	K-206	Macdonald, Jason W	Velasquez Ibarra, Guillermo Antonio	f	\N
7935	Isaac	Velasquez	52210	4	i.velasquez210@cvuhsd.org	15	M	12	L-204	Ishii, Emily	Velasquez, Isaac	f	\N
7936	Jovanny	Velazquez	51865	4	j.velazquez865@cvuhsd.org	15	M	12	F-106	Givens, Kathy E.	Velazquez, Jovanny	f	\N
7937	Serenity	Vercher	59039	4	s.vercher039@cvuhsd.org	15	F	12	L-204	Ishii, Emily	Vercher, Serenity Mairee-Scott	f	\N
7938	Ashley	Villagomez	52633	4	a.villagomez633@cvuhsd.org	15	F	12	D-111	Agner, Maryalice	Villagomez, Ashley	f	\N
7939	Jorge	Villalobos Castro	53017	4	j.villaloboscastr017@cvuhsd.org	15	M	12	K-202	Allen, Richard E	Villalobos Castro, Jorge Junior	f	\N
7940	Sherlyn	Villalobos	52880	4	s.villalobos880@cvuhsd.org	15	F	12	K-101	Villacorta, Vanessa	Villalobos, Sherlyn	f	\N
7941	Valerie	Villegas	51709	4	v.merida709@cvuhsd.org	15	F	12	D-205	Nunez Reynoso, Marisela	Villegas, Valerie Virginia	f	\N
7942	Krisalin	Virula	59048	4	k.virula048@cvuhsd.org	15	F	12	K-202	Allen, Richard E	Virula, Krisalin Nayely	f	\N
7943	Katherin	Vivas	53146	4	k.vivas146@cvuhsd.org	15	F	12	K-214	Chau, Peter	Vivas, Katherin Carolina	f	\N
7944	Tomas	Vogel	56418	4	t.vogel418@cvuhsd.org	15	M	12	GYM	Harm, Kirk J.	Vogel, Tomas Alejandro	f	\N
7945	Alex	Whitehead	53106	4	a.whitehead106@cvuhsd.org	15	M	12	GYM	Harm, Kirk J.	Whitehead, Alex Cashus	f	\N
7946	Kayla	Wilhite	59001	4	k.wilhite001@cvuhsd.org	15	F	12	I-2	Pimentel, Carlina	Wilhite, Kayla	f	\N
7947	Jason	Zavala	52624	4	j.zavala624@cvuhsd.org	15	M	12	K-101	Villacorta, Vanessa	Zavala, Jason Abraham	f	\N
7948	Everth	Zeledon Sanchez	52334	4	e.zeledonsanchez334@cvuhsd.org	15	M	12	GYM	Harm, Kirk J.	Zeledon Sanchez, Everth Efrain	f	\N
7949	Cesar	Zepeda Martinez	56499	4	c.zepeda499@cvuhsd.org	15	M	12	L-104	Najarro, Claudia	Zepeda Martinez, Cesar Antonio	f	\N
7950	Yarelli	Zepeda	51874	4	y.zepeda874@cvuhsd.org	15	F	12	K-206	Macdonald, Jason W	Zepeda, Yarelli Eneida	f	\N
3944	Tina	Akleh	22460	1	takleh_27@esusdstudents.org	7	F	9	R101	Hansen, Bjorn	Akleh, Tina	t	\N
8488	Andrea	Vaquerano	58973	8	a.vaquerano973@cvuhsd.org	13	F	9	H-201	Teichmann, Thomas E.	Vaquerano, Andrea Maritza	t	\N
8116	Jimmy	Garcia	57739	8	j.garcia739@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Garcia, Jimmy	t	\N
8295	Sariah	Moli	57865	8	s.moli865@cvuhsd.org	13	F	9	H-201	Teichmann, Thomas E.	Moli, Sariah Pasepa-Vokisi	t	\N
8223	Chastelyne	Lopez Gomez	58709	8	c.lopezgomez709@cvuhsd.org	13	F	9	H-201	Teichmann, Thomas E.	Lopez Gomez, Chastelyne Camila	t	\N
8138	Jazalene	Gonzalez	58406	8	j.gonzalez406@cvuhsd.org	13	F	9	H-201	Teichmann, Thomas E.	Gonzalez, Jazalene Fabia	t	\N
7989	Esmeralda	Arteaga	58081	8	e.arteaga081@cvuhsd.org	13	F	9	H-201	Teichmann, Thomas E.	Arteaga, Esmeralda Isabel	t	\N
8528	Ricshad	Wright	58963	8	r.wright963@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Wright, Ricshad Nathaniel	t	\N
8203	Sadie	Jones	59205	8	s.jones205@cvuhsd.org	13	F	9	H-201	Teichmann, Thomas E.	Jones, Sadie Kimora	t	\N
8430	Sheryl	Sanchez	58448	8	s.sanchez448@cvuhsd.org	13	F	9	H-201	Teichmann, Thomas E.	Sanchez, Sheryl Betsabe	t	\N
8326	Daniel	Nolasco Ruiz	58676	8	d.nolascoruiz676@cvuhsd.org	13	M	9	H-201	Teichmann, Thomas E.	Nolasco Ruiz, Daniel Dexter	t	\N
8022	Jorden	Carter	58790	8	j.carter790@cvuhsd.org	13	M	9	F-102	Massey-Sloan, Patricia A	Carter, Jorden Amir	t	\N
8092	Mevis	Flores Solis	58755	8	m.floressolis755@cvuhsd.org	13	F	9	F-102	Massey-Sloan, Patricia A	Flores Solis, Mevis Cecilia	t	\N
8412	Jade	Rodriguez	59196	8	j.rodriguez196@cvuhsd.org	13	F	9	F-102	Massey-Sloan, Patricia A	Rodriguez, Jade Isabella	t	\N
8941	Fernanda	Ruiz Mendoza	56957	8	f.ruizmendoza957@cvuhsd.org	13	F	10	D-202	Chung, Joshua S	Ruiz Mendoza, Fernanda	t	\N
9497	Shafiqullah	Afzali	55648	8	s.afzali648@cvuhsd.org	13	M	12	D-208	Bedell, David D.	Afzali, Shafiqullah	t	\N
8813	Pearl	Martinez	56951	8	p.martinez951@cvuhsd.org	13	F	10	C-203	Naluswa, Margaret	Martinez, Pearl Arlene	t	\N
9073	Alejandro	Boruel	54335	8	a.boruel335@cvuhsd.org	13	M	11	F-103	Kaiser, Noah	Boruel, Alejandro	t	\N
8045	Fernando	Cortes Lucumi	58092	8	f.corteslucumi092@cvuhsd.org	13	M	9	E-103	Talbott, Jose	Cortes Lucumi, Fernando George Jr.	t	\N
\.


--
-- Data for Name: SurveyAlternateCareers; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."SurveyAlternateCareers" ("AlternateCareersId", "Survey1Id") FROM stdin;
12	4
25	4
9	5
11	5
84	6
85	6
81	7
82	7
82	8
83	8
68	9
81	9
66	10
72	10
43	11
82	11
49	12
50	12
85	13
87	13
76	14
87	14
69	15
80	15
49	16
72	16
72	17
73	17
26	18
72	18
72	19
73	19
30	20
47	20
32	21
74	21
49	22
55	22
49	23
55	23
65	24
69	24
73	25
74	25
14	26
72	26
28	27
72	27
13	28
50	28
34	29
55	29
14	30
74	30
14	31
28	31
73	32
80	32
49	33
84	34
86	34
28	35
72	35
17	36
18	36
74	37
81	37
72	38
88	38
26	39
74	39
56	40
83	40
83	41
84	41
55	42
88	42
73	43
74	43
33	44
72	44
72	45
14	46
72	46
73	47
74	47
78	48
81	48
17	49
22	49
55	50
88	50
59	51
81	51
64	52
69	52
28	53
72	53
14	56
83	56
31	57
34	57
72	58
72	59
73	59
26	60
26	61
80	62
81	62
43	63
76	63
22	64
74	64
25	65
72	65
72	66
86	66
74	67
72	68
79	68
55	69
88	69
73	70
77	70
76	71
77	71
76	72
82	72
26	73
34	73
72	74
73	74
17	75
21	75
73	76
74	76
83	77
84	77
73	78
74	78
25	79
72	79
72	80
74	80
69	81
70	81
86	82
88	82
14	83
84	83
72	84
74	84
24	85
86	85
42	86
45	86
34	87
72	87
54	88
55	88
49	89
55	89
32	90
72	90
56	91
79	91
14	92
49	92
38	93
40	93
38	94
45	94
83	95
84	95
64	96
67	96
42	97
43	97
76	98
79	98
59	99
81	99
73	100
84	100
14	101
84	101
26	102
74	102
14	103
18	103
41	104
49	104
21	105
22	105
72	106
73	106
41	107
73	107
74	108
86	108
17	109
18	109
54	110
81	110
76	111
78	111
79	112
81	112
76	113
79	113
76	114
87	114
64	115
65	115
22	116
74	116
26	117
84	117
25	118
72	119
73	119
18	120
23	120
73	121
74	121
77	122
78	122
82	123
85	123
44	124
88	124
26	125
74	125
17	126
18	126
57	127
81	127
54	128
55	128
12	129
14	129
83	130
84	130
72	131
80	131
18	132
22	132
72	133
73	133
68	134
74	134
57	135
59	135
44	136
47	136
52	137
54	137
75	138
81	138
78	139
80	139
18	140
23	140
80	141
81	141
73	142
74	142
82	143
83	143
26	144
32	144
32	145
54	145
72	146
74	146
75	147
80	147
65	148
67	148
64	149
67	149
73	150
74	150
14	151
74	151
25	152
76	153
78	153
34	154
54	154
21	155
30	155
22	156
24	156
17	157
30	157
73	158
74	158
49	159
55	159
56	160
59	160
72	161
75	161
76	162
77	162
56	163
74	163
59	164
73	164
10	165
16	165
22	166
24	166
64	167
69	167
64	168
67	168
9	169
21	169
72	170
74	170
58	171
86	171
45	172
72	172
46	173
80	173
66	174
87	174
30	175
36	175
74	176
76	176
71	177
78	177
76	178
78	178
64	179
65	179
24	180
64	180
18	181
23	181
19	182
22	182
36	183
40	183
54	184
72	184
76	185
87	185
13	186
45	186
49	187
65	187
59	188
82	188
45	189
84	189
78	190
79	190
16	191
87	191
77	192
82	192
17	193
18	193
43	194
77	194
20	195
78	195
49	196
55	196
26	197
38	198
86	198
18	199
20	199
49	200
52	200
84	201
86	201
72	202
74	202
26	203
68	204
73	204
20	205
55	205
70	206
73	206
72	207
74	207
72	208
77	208
43	209
78	209
67	210
74	210
19	211
22	211
50	212
87	212
11	213
49	213
47	214
88	214
72	215
82	215
50	216
51	216
68	217
74	217
12	218
14	218
77	219
78	219
57	220
59	220
81	221
83	221
58	222
64	222
82	223
84	223
20	224
25	224
82	225
83	225
19	226
22	226
20	227
72	227
55	228
88	228
14	229
83	229
25	230
74	230
51	231
88	231
69	232
70	232
75	233
78	233
83	234
85	234
78	235
87	235
70	236
87	236
43	237
88	237
24	238
54	238
47	239
78	239
82	240
84	240
50	241
74	241
76	242
78	242
12	243
74	243
77	244
78	244
54	245
70	245
56	246
75	246
49	247
50	247
52	248
88	248
19	249
74	249
26	250
81	251
82	251
25	252
84	252
55	253
74	253
83	254
84	254
59	255
81	255
20	256
87	256
64	257
65	257
72	258
73	258
12	259
32	259
75	260
81	260
19	261
72	261
25	262
31	262
49	263
52	263
72	264
80	264
16	265
55	265
49	266
84	266
49	267
70	267
57	268
59	268
73	269
74	269
77	270
81	270
14	271
82	271
74	272
77	272
70	273
88	273
55	274
88	274
69	275
70	275
15	276
25	276
49	277
52	277
47	278
50	278
44	279
47	279
25	280
17	281
52	281
73	282
74	282
78	283
79	283
49	284
74	284
77	285
78	285
47	286
67	286
82	287
83	287
64	288
87	288
78	289
81	289
47	290
49	290
26	291
74	291
73	292
88	292
24	293
37	293
82	294
84	294
17	295
21	295
49	296
55	296
38	297
43	297
49	298
84	298
79	299
81	299
14	300
73	300
19	301
72	301
31	302
70	302
17	303
29	303
69	304
70	304
25	305
74	305
30	338
49	338
64	339
65	339
82	340
84	340
82	341
84	341
15	342
21	342
79	343
84	343
73	344
74	344
47	345
50	345
11	346
23	346
74	347
88	347
72	348
74	348
11	349
20	349
17	350
88	350
15	351
74	351
40	352
48	352
43	353
47	353
65	354
72	354
49	355
50	355
32	356
74	356
17	357
69	357
52	358
74	358
16	359
86	359
17	360
55	360
15	361
20	361
14	362
20	362
49	363
88	363
37	364
40	364
24	365
25	365
50	366
74	366
16	367
21	367
77	368
79	368
54	369
78	369
84	370
85	370
25	371
72	371
49	372
78	372
57	373
80	373
43	374
76	374
70	375
88	375
65	376
67	376
58	377
72	377
78	378
81	378
72	379
74	379
26	380
73	380
26	381
31	381
75	382
80	382
22	383
52	383
77	384
84	384
72	385
50	386
55	386
18	387
50	387
81	388
84	388
76	389
78	389
25	390
26	390
83	391
84	391
64	392
70	392
47	393
59	393
17	394
74	394
52	395
88	395
43	396
77	396
22	397
24	397
57	398
58	398
17	399
23	399
77	400
80	400
12	401
58	401
47	402
54	402
73	403
86	403
54	404
55	404
72	405
73	405
81	406
84	406
15	407
52	407
73	408
75	408
65	409
72	409
59	410
81	410
14	411
26	411
65	412
67	412
21	413
55	413
25	414
32	414
49	415
54	415
17	416
49	416
23	417
35	417
52	418
88	418
81	419
83	419
72	420
79	420
21	421
24	421
20	422
26	422
16	423
26	423
45	424
69	424
14	425
74	425
54	426
69	426
26	427
72	427
54	428
55	428
14	429
84	429
77	430
78	430
82	431
84	431
76	432
77	432
43	433
74	433
26	434
74	434
45	435
46	435
83	436
87	436
41	437
74	437
56	438
59	438
69	439
72	439
22	440
45	440
21	441
88	441
24	442
64	442
69	443
87	443
16	444
20	444
45	445
68	445
32	446
45	446
14	447
69	447
28	448
50	448
72	449
74	449
54	450
55	450
66	451
69	451
12	452
69	452
55	453
88	453
57	454
81	454
26	455
57	455
78	456
79	456
45	457
64	457
57	458
65	458
74	459
88	459
50	460
84	460
21	461
24	461
46	462
47	462
26	463
74	463
18	464
20	464
23	465
56	465
58	466
59	466
54	467
88	467
20	468
23	468
16	469
69	469
74	470
88	470
26	471
72	471
55	472
88	472
59	473
88	473
26	474
74	474
49	475
88	475
26	476
72	476
20	477
21	477
25	478
52	478
43	479
76	479
68	480
88	480
12	481
87	481
72	482
74	482
64	483
72	483
19	484
64	484
49	485
51	485
56	486
59	486
82	487
83	487
30	520
49	520
25	521
32	521
44	522
88	522
13	523
18	523
54	524
77	524
31	525
64	525
26	526
74	526
41	527
72	527
32	528
72	528
65	529
70	529
50	530
74	530
21	531
54	531
52	532
55	532
76	533
78	533
26	534
56	534
22	535
72	535
78	536
79	536
55	537
88	537
65	538
72	538
49	539
72	539
26	540
57	540
25	541
32	541
45	542
52	542
37	543
83	543
72	544
76	544
26	545
49	545
39	546
77	546
16	547
24	547
56	548
83	548
64	549
85	549
84	550
85	550
72	551
74	551
16	552
72	552
24	553
25	553
37	554
74	554
83	555
85	555
76	556
78	556
55	557
88	557
50	558
52	558
77	559
78	559
21	560
49	560
57	561
58	561
25	562
31	562
17	563
49	563
55	564
74	564
16	565
49	565
32	566
37	566
54	567
55	567
32	568
72	568
26	569
49	569
14	570
72	570
57	571
59	571
37	572
74	572
43	573
76	573
32	606
72	606
14	607
74	607
15	608
74	608
69	609
74	609
57	610
74	610
78	611
88	611
17	612
45	612
24	613
74	613
21	614
55	614
26	615
74	615
41	616
72	616
25	617
68	617
74	618
77	618
25	619
74	619
16	620
74	620
20	621
25	621
37	622
68	622
21	623
74	623
25	624
54	624
22	625
23	625
74	626
88	626
22	627
69	627
54	628
72	628
57	629
69	629
20	630
26	630
41	631
74	631
82	632
84	632
17	633
88	633
74	634
79	634
83	635
84	635
16	636
18	636
12	637
26	637
15	638
26	638
76	639
78	639
14	640
83	640
17	641
55	641
72	642
74	642
82	643
83	643
64	644
75	644
49	645
64	645
26	646
74	646
17	647
49	647
54	648
88	648
15	649
32	649
17	650
50	650
56	651
58	651
69	652
77	652
47	653
77	653
12	654
14	654
64	655
67	655
41	656
78	656
65	657
67	657
42	658
55	658
37	659
47	659
47	660
69	660
55	661
83	661
65	662
70	662
64	663
82	663
37	664
41	664
18	665
23	665
49	666
78	666
22	667
49	667
58	668
72	668
72	669
81	669
80	670
84	670
16	671
74	671
73	672
74	672
68	673
72	673
12	674
81	674
14	675
20	675
14	676
26	676
64	677
67	677
72	709
73	709
49	710
72	710
69	711
72	711
26	712
65	712
55	713
77	713
17	714
52	714
74	715
86	715
49	716
78	716
72	717
74	717
37	718
39	718
47	719
55	719
49	749
50	749
41	750
45	750
49	751
78	751
14	752
72	752
57	753
59	753
16	754
20	754
73	755
87	755
77	782
87	782
17	783
19	783
14	784
21	784
77	785
78	785
17	786
26	786
57	787
74	787
58	788
81	788
12	789
16	789
65	790
75	790
54	791
55	791
14	792
72	792
72	824
85	824
26	825
74	825
56	826
57	826
55	827
65	827
42	857
47	857
18	858
45	858
24	859
26	859
57	890
87	890
82	891
84	891
22	892
23	892
26	893
55	893
75	894
80	894
15	895
17	895
26	896
78	896
49	897
52	897
67	898
72	898
21	899
32	899
64	900
70	900
18	901
52	901
55	902
88	902
45	903
54	903
54	904
68	904
59	905
79	905
64	906
65	906
32	907
74	907
26	908
73	908
21	909
24	909
43	910
55	910
14	911
87	911
41	912
88	912
72	913
77	913
57	914
81	914
78	915
79	915
14	916
49	916
26	944
68	944
17	945
50	945
17	946
20	946
14	947
85	947
56	948
58	948
23	949
57	949
18	950
21	950
54	951
78	951
32	952
82	952
21	953
28	953
46	954
47	954
81	955
82	955
37	956
40	956
81	957
82	957
69	958
87	958
42	959
43	959
74	960
78	960
17	961
18	961
14	962
80	962
59	963
85	963
26	964
72	964
26	965
85	965
77	966
78	966
82	967
83	967
21	968
78	968
26	969
74	969
26	970
86	970
17	971
74	971
26	972
52	972
21	973
74	973
37	974
55	974
21	1006
22	1006
18	1007
74	1007
14	1008
74	1008
55	1009
88	1009
45	1010
54	1010
16	1011
22	1011
69	1012
70	1012
68	1013
86	1013
74	1014
87	1014
32	1015
72	1015
14	1016
41	1016
67	1017
69	1017
57	1018
59	1018
18	1019
74	1019
77	1020
78	1020
21	1021
26	1021
19	1022
22	1022
14	1023
15	1023
17	1024
50	1024
43	1025
54	1025
57	1026
58	1026
55	1027
69	1027
56	1059
81	1059
76	1060
81	1060
41	1061
45	1061
57	1062
64	1062
76	1063
78	1063
55	1064
69	1064
82	1065
84	1065
73	1066
74	1066
25	1067
74	1067
49	1068
72	1068
14	1069
32	1069
82	1070
85	1070
72	1071
74	1071
72	1072
74	1072
21	1073
24	1073
76	1074
77	1074
55	1075
72	1075
72	1076
73	1076
14	1077
15	1077
13	1078
49	1078
67	1079
87	1079
82	1080
83	1080
56	1081
87	1081
73	1082
74	1082
67	1083
75	1083
76	1084
78	1084
26	1085
72	1085
73	1086
74	1086
12	1087
14	1087
24	1088
74	1088
45	1089
54	1089
74	1090
77	1090
49	1091
74	1091
59	1092
81	1092
82	1093
85	1093
22	1094
24	1094
19	1095
24	1095
14	1096
22	1096
19	1097
20	1097
18	1098
21	1098
21	1099
78	1099
64	1100
70	1100
38	1101
45	1101
82	1102
83	1102
64	1103
87	1103
25	1104
32	1104
14	1105
25	1105
64	1106
67	1106
83	1107
87	1107
40	1108
77	1108
77	1109
78	1109
57	1110
74	1110
15	1111
19	1111
64	1112
81	1112
71	1113
87	1113
78	1114
79	1114
21	1115
49	1115
15	1116
26	1116
15	1117
49	1117
82	1118
84	1118
14	1119
26	1119
17	1120
49	1120
54	1121
76	1121
80	1122
84	1122
22	1123
49	1123
64	1124
67	1124
21	1125
69	1125
81	1126
83	1126
25	1127
47	1127
76	1128
77	1128
64	1129
79	1129
55	1130
88	1130
18	1162
21	1162
82	1163
84	1163
12	1164
82	1164
57	1165
72	1165
76	1166
80	1166
82	1167
84	1167
64	1168
67	1168
50	1169
54	1169
12	1170
15	1170
18	1171
21	1171
78	1172
79	1172
54	1173
72	1173
25	1174
37	1174
11	1175
18	1175
26	1176
72	1176
54	1177
55	1177
20	1178
21	1178
32	1179
72	1179
69	1180
74	1180
47	1181
85	1181
59	1182
78	1182
50	1183
52	1183
25	1184
26	1184
41	1185
57	1185
37	1186
55	1186
49	1187
69	1187
25	1188
68	1188
69	1189
78	1189
54	1190
55	1190
26	1191
88	1191
21	1192
25	1192
15	1193
25	1193
68	1194
88	1194
73	1195
78	1195
47	1196
78	1196
26	1197
72	1197
25	1198
74	1198
72	1199
88	1199
76	1200
77	1200
19	1201
20	1201
55	1202
74	1202
12	1203
25	1203
82	1204
83	1204
21	1205
49	1205
57	1206
59	1206
18	1207
49	1207
16	1208
74	1208
11	1209
18	1209
69	1210
70	1210
57	1211
85	1211
19	1212
22	1212
55	1213
88	1213
22	1214
49	1214
49	1215
50	1215
64	1216
75	1216
76	1217
78	1217
25	1218
88	1218
64	1219
87	1219
83	1220
85	1220
37	1221
88	1221
18	1222
49	1222
65	1223
70	1223
73	1224
84	1224
31	1225
88	1225
83	1226
85	1226
16	1228
20	1228
22	1229
26	1229
25	1230
26	1230
79	1231
85	1231
25	1232
57	1232
72	1233
74	1233
80	1234
83	1234
14	1235
84	1235
52	1236
88	1236
67	1237
72	1237
26	1238
49	1238
57	1239
59	1239
57	1240
85	1240
82	1241
83	1241
64	1242
67	1242
76	1243
79	1243
41	1244
55	1244
72	1245
73	1245
64	1246
80	1246
26	1247
68	1247
72	1248
73	1248
57	1249
78	1249
19	1250
22	1250
17	1251
18	1251
49	1252
54	1252
18	1253
24	1253
16	1254
74	1254
54	1255
55	1255
26	1256
65	1256
16	1257
49	1257
26	1258
65	1258
20	1259
21	1259
77	1260
79	1260
78	1261
79	1261
39	1262
78	1262
76	1263
81	1263
69	1264
70	1264
82	1265
84	1265
26	1266
74	1266
55	1267
73	1267
77	1268
78	1268
21	1269
74	1269
82	1270
84	1270
19	1271
21	1271
46	1272
47	1272
67	1273
69	1273
77	1274
79	1274
14	1275
84	1275
26	1276
74	1276
76	1305
77	1305
17	1306
18	1306
26	1307
78	1307
67	1308
88	1308
43	1309
46	1309
71	1310
80	1310
32	1311
73	1311
11	1312
18	1312
68	1313
74	1313
64	1314
80	1314
41	1315
88	1315
49	1316
52	1316
52	1317
64	1317
75	1318
87	1318
64	1319
67	1319
64	1320
80	1320
19	1321
22	1321
76	1322
77	1322
76	1323
77	1323
69	1324
70	1324
82	1325
84	1325
83	1326
84	1326
83	1327
84	1327
77	1328
79	1328
26	1329
32	1329
21	1330
67	1330
83	1331
84	1331
72	1332
74	1332
80	1333
81	1333
77	1334
78	1334
57	1335
59	1335
45	1336
67	1336
32	1337
74	1337
73	1338
74	1338
26	1339
52	1339
57	1340
59	1340
23	1341
24	1341
18	1342
20	1342
57	1343
59	1343
72	1344
73	1344
26	1345
32	1345
18	1346
52	1346
25	1347
73	1347
26	1348
52	1348
77	1349
79	1349
71	1350
84	1350
64	1351
69	1351
57	1352
81	1352
22	1353
81	1353
72	1354
74	1354
32	1355
72	1355
16	1356
19	1356
14	1357
82	1357
58	1358
74	1358
16	1359
20	1359
83	1360
84	1360
65	1388
67	1388
79	1389
81	1389
67	1390
77	1390
72	1391
73	1391
59	1392
81	1392
54	1393
88	1393
12	1394
85	1394
74	1395
75	1395
41	1396
43	1396
47	1397
88	1397
24	1398
47	1398
17	1399
19	1399
16	1400
21	1400
52	1401
54	1401
72	1402
74	1402
26	1403
74	1403
84	1404
85	1404
16	1405
21	1405
18	1406
21	1406
25	1407
26	1407
64	1408
70	1408
77	1409
78	1409
21	1410
70	1410
59	1411
81	1411
68	1412
84	1412
73	1413
74	1413
54	1414
88	1414
25	1415
72	1415
55	1416
68	1416
50	1417
88	1417
54	1418
88	1418
26	1419
32	1419
67	1420
70	1420
64	1421
69	1421
80	1422
88	1422
20	1423
23	1423
45	1424
46	1424
71	1425
74	1425
76	1426
77	1426
52	1427
54	1427
72	1428
87	1428
64	1429
65	1429
32	1430
70	1430
21	1431
24	1431
31	1432
47	1432
57	1433
69	1433
15	1434
84	1434
69	1435
76	1435
12	1436
84	1436
64	1437
73	1437
49	1438
51	1438
24	1439
26	1439
83	1440
84	1440
47	1441
54	1441
77	1442
79	1442
40	1443
74	1443
75	1444
87	1444
31	1445
32	1445
67	1446
70	1446
16	1447
19	1447
72	1448
74	1448
72	1449
73	1449
14	1450
49	1450
72	1451
74	1451
47	1452
54	1452
69	1453
75	1453
54	1454
88	1454
49	1455
74	1455
73	1456
74	1456
47	1457
52	1457
26	1458
32	1458
45	1459
70	1459
14	1460
50	1460
70	1461
88	1461
73	1462
74	1462
21	1463
88	1463
75	1464
80	1464
83	1465
84	1465
17	1466
28	1466
31	1467
72	1467
26	1468
31	1468
64	1470
67	1470
52	1471
54	1471
72	1469
78	1469
31	1472
72	1472
49	1473
50	1473
80	1474
83	1474
58	1475
59	1475
12	1476
14	1476
73	1477
74	1477
67	1478
69	1478
64	1479
67	1479
56	1480
59	1480
57	1481
79	1481
17	1482
55	1482
25	1483
26	1483
65	1484
70	1484
81	1485
83	1485
68	1486
74	1486
26	1487
72	1487
26	1488
67	1488
77	1489
81	1489
76	1490
77	1490
55	1491
88	1491
77	1492
79	1492
21	1493
30	1493
22	1494
24	1494
19	1495
22	1495
41	1496
42	1496
26	1497
72	1497
24	1498
84	1498
15	1499
25	1499
55	1500
88	1500
72	1501
74	1501
54	1502
88	1502
80	1503
87	1503
76	1504
79	1504
79	1505
81	1505
78	1533
79	1533
18	1534
21	1534
54	1566
72	1566
80	1567
84	1567
56	1568
59	1568
69	1569
88	1569
79	1570
81	1570
82	1571
84	1571
39	1572
55	1572
56	1573
57	1573
22	1574
88	1574
14	1575
85	1575
14	1576
21	1576
69	1577
74	1577
56	1578
59	1578
69	1579
70	1579
47	1580
55	1580
71	1581
86	1581
54	1582
77	1582
52	1583
55	1583
20	1584
21	1584
31	1585
32	1585
14	1586
15	1586
54	1587
55	1587
41	1588
45	1588
72	1589
73	1589
26	1590
72	1590
46	1591
54	1591
57	1592
59	1592
76	1593
78	1593
25	1594
32	1594
52	1595
54	1595
21	1596
74	1596
49	1597
83	1597
55	1598
88	1598
72	1599
74	1599
32	1600
74	1600
21	1601
43	1601
49	1602
74	1602
26	1603
72	1603
67	1604
68	1604
77	1605
78	1605
50	1606
74	1606
17	1607
37	1607
50	1608
74	1608
14	1609
84	1609
17	1610
23	1610
25	1611
74	1611
43	1612
47	1612
16	1613
20	1613
84	1614
88	1614
82	1615
84	1615
32	1616
74	1616
54	1617
72	1617
12	1618
72	1618
14	1619
16	1619
22	1620
23	1620
72	1621
74	1621
55	1622
78	1622
25	1623
26	1623
26	1624
31	1624
14	1625
64	1625
83	1626
84	1626
32	1627
74	1627
72	1628
84	1628
26	1629
32	1629
73	1630
88	1630
69	1631
88	1631
17	1632
18	1632
49	1633
50	1633
82	1634
84	1634
54	1635
55	1635
82	1636
84	1636
14	1637
49	1637
18	1638
84	1638
54	1661
55	1661
40	1662
45	1662
26	1663
72	1663
50	1664
74	1664
72	1666
74	1666
49	1665
72	1665
32	1667
74	1667
72	1668
73	1668
72	1669
74	1669
55	1670
88	1670
82	1671
83	1671
76	1672
77	1672
49	1673
50	1673
65	1674
67	1674
72	1675
73	1675
72	1676
80	1676
73	1677
84	1677
82	1678
83	1678
41	1679
70	1679
72	1680
74	1680
26	1681
74	1681
25	1682
26	1682
74	1683
80	1683
64	1684
80	1684
79	1685
80	1685
12	1686
15	1686
64	1687
69	1687
19	1688
24	1688
21	1689
74	1689
79	1690
81	1690
14	1691
26	1691
21	1692
22	1692
55	1693
80	1693
69	1694
72	1694
52	1695
72	1695
76	1696
77	1696
26	1697
55	1697
69	1698
81	1698
25	1699
72	1699
76	1700
78	1700
82	1701
84	1701
43	1702
80	1702
74	1703
80	1703
41	1704
42	1704
47	1705
54	1705
18	1706
72	1706
16	1707
19	1707
55	1708
88	1708
26	1709
87	1709
26	1710
32	1710
16	1711
78	1711
84	1712
85	1712
65	1713
70	1713
37	1714
54	1714
24	1715
72	1715
49	1716
78	1716
50	1717
52	1717
26	1718
74	1718
26	1719
88	1719
64	1720
80	1720
85	1721
86	1721
72	1722
73	1722
72	1723
74	1723
32	1724
78	1724
47	1725
70	1725
77	1726
78	1726
64	1727
67	1727
58	1728
65	1728
21	1729
56	1729
26	1730
72	1730
18	1731
54	1731
14	1732
84	1732
26	1733
69	1733
43	1734
77	1734
55	1736
69	1736
25	1735
32	1735
26	1737
32	1737
78	1738
88	1738
82	1739
83	1739
21	1740
87	1740
78	1741
88	1741
16	1742
18	1742
12	1743
72	1743
77	1744
80	1744
77	1745
79	1745
49	1746
55	1746
77	1747
78	1747
65	1748
83	1748
67	1749
87	1749
14	1750
74	1750
16	1751
35	1751
26	1752
72	1752
17	1753
21	1753
16	1754
74	1754
73	1755
74	1755
76	1756
78	1756
64	1757
84	1757
55	1758
69	1758
21	1759
52	1759
56	1760
57	1760
16	1761
17	1761
31	1762
72	1762
15	1763
26	1763
17	1764
20	1764
74	1765
82	1765
21	1766
28	1766
74	1767
84	1767
72	1768
74	1768
43	1769
46	1769
72	1770
79	1770
26	1771
72	1771
64	1772
75	1772
32	1773
49	1773
21	1774
22	1774
77	1775
78	1775
24	1776
55	1776
72	1777
74	1777
74	1778
88	1778
54	1779
74	1779
72	1780
74	1780
16	1781
21	1781
56	1808
81	1808
77	1809
79	1809
16	1841
54	1841
59	1842
70	1842
70	1843
88	1843
14	1844
65	1844
78	1845
79	1845
64	1846
70	1846
26	1847
72	1847
21	1848
24	1848
24	1849
74	1849
73	1850
74	1850
56	1851
64	1851
14	1852
35	1852
79	1853
81	1853
17	1854
32	1854
17	1855
88	1855
25	1856
31	1856
68	1888
72	1888
18	1889
20	1889
76	1890
84	1890
82	1891
84	1891
64	1892
75	1892
72	1893
74	1893
79	1894
81	1894
14	1895
73	1895
82	1896
87	1896
82	1897
83	1897
52	1898
55	1898
70	1899
79	1899
73	1900
74	1900
64	1901
75	1901
79	1902
82	1902
11	1903
16	1903
11	1906
16	1906
16	1907
17	1907
40	1908
48	1908
57	1909
81	1909
64	1910
65	1910
46	1911
51	1911
14	1912
58	1912
30	1913
69	1913
72	1914
74	1914
20	1915
22	1915
9	1916
20	1916
40	1917
68	1917
11	1918
52	1918
71	1919
73	1919
21	1920
65	1920
52	1921
82	1921
17	1922
51	1922
45	1923
74	1923
37	1924
90	1924
28	1925
58	1925
26	1926
49	1926
50	1927
52	1927
71	1928
86	1928
25	1929
30	1929
77	1930
79	1930
50	1931
74	1931
23	1932
87	1932
17	1933
48	1933
71	1934
86	1934
35	1935
67	1935
9	1936
13	1936
28	1937
58	1937
26	1938
73	1938
81	1939
83	1939
49	1940
90	1940
12	1941
46	1941
17	1942
26	1942
64	1943
77	1943
20	1944
50	1944
86	1945
87	1945
17	1946
29	1946
25	1947
37	1947
32	1948
37	1948
17	1949
22	1949
25	1950
48	1950
13	1951
58	1951
30	1952
38	1952
50	1953
58	1953
12	1954
25	1954
65	1955
87	1955
67	1956
68	1956
31	1957
74	1957
67	1958
68	1958
12	1959
37	1959
58	1960
72	1960
41	1961
48	1961
67	1962
68	1962
12	1963
15	1963
11	1964
17	1964
26	1965
31	1965
69	1966
71	1966
11	1967
26	1967
14	1968
30	1968
25	1969
65	1969
26	1970
73	1970
21	1971
64	1971
25	1972
68	1972
11	1973
17	1973
45	1974
50	1974
18	1975
20	1975
13	1976
65	1976
64	1977
68	1977
15	1978
73	1978
40	1979
45	1979
11	1980
21	1980
9	1981
85	1981
17	1982
87	1982
72	1985
77	1985
20	1988
56	1988
9	1991
31	1991
69	1994
86	1994
77	1996
83	1996
26	1999
73	1999
20	1983
50	1983
64	1986
90	1986
25	1989
72	1989
19	1992
20	1992
40	1995
76	1995
76	1997
81	1997
26	2000
72	2000
21	1984
87	1984
52	1987
54	1987
11	1990
20	1990
11	1993
15	1993
26	1998
72	1998
17	2001
31	2001
30	2002
56	2002
50	2003
52	2003
74	2004
87	2004
9	2005
30	2005
17	2006
73	2006
21	2007
72	2007
56	2008
64	2008
9	2009
49	2009
22	2010
23	2010
56	2011
87	2011
25	2012
26	2012
30	2013
32	2013
57	2014
65	2014
37	2015
71	2015
22	2016
54	2016
22	2017
28	2017
83	2018
84	2018
12	2019
93	2019
9	2020
73	2020
65	2021
82	2021
9	2022
25	2022
12	2023
26	2023
\.


--
-- Data for Name: SurveyPrimaryCareers; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."SurveyPrimaryCareers" ("PrimaryCareersId", "SurveyId") FROM stdin;
10	4
16	4
19	4
13	5
18	5
19	5
9	6
10	6
11	6
9	7
10	7
20	7
12	8
25	8
30	9
41	9
78	9
51	10
75	10
86	10
12	11
47	11
78	11
9	12
34	12
51	12
56	13
81	13
82	13
51	14
58	14
69	14
21	15
35	15
67	15
15	16
25	16
54	16
26	17
51	17
88	17
51	18
67	18
74	18
25	19
26	19
68	19
35	20
41	20
52	20
31	21
72	21
73	21
9	22
50	22
52	22
13	23
45	23
54	23
67	24
70	24
88	24
25	25
68	25
72	25
51	26
71	26
74	26
23	27
51	27
73	27
15	28
24	28
68	28
16	29
32	29
54	29
12	30
50	30
72	30
12	31
17	31
21	31
9	32
12	32
75	32
25	33
26	33
50	33
14	34
21	34
71	34
23	35
73	35
74	35
15	36
24	36
44	36
22	37
23	37
56	37
52	38
73	38
74	38
25	39
72	39
73	39
13	40
75	40
80	40
14	41
32	41
80	41
14	42
52	42
73	42
16	43
19	43
51	43
25	44
32	44
51	44
25	45
26	45
73	45
12	46
15	46
74	46
68	47
72	47
76	47
44	48
56	48
75	48
11	49
19	49
20	49
14	50
54	50
68	50
56	51
57	51
58	51
45	52
54	52
67	52
18	53
68	53
74	53
15	56
81	56
84	56
32	57
56	57
79	57
25	58
68	58
73	58
25	59
26	59
31	59
25	60
32	60
73	60
25	61
72	61
73	61
9	62
76	62
78	62
44	63
77	63
78	63
24	64
68	64
72	64
26	65
51	65
73	65
25	66
73	66
87	66
25	67
26	67
72	67
47	68
73	68
78	68
15	69
24	69
50	69
45	70
51	70
78	70
43	71
44	71
54	71
44	72
59	72
84	72
25	73
32	73
73	73
18	74
20	74
58	74
18	75
20	75
52	75
16	76
26	76
72	76
14	77
80	77
82	77
25	78
26	78
72	78
12	79
68	79
73	79
17	80
25	80
26	80
17	81
67	81
73	81
9	82
54	82
87	82
12	83
25	83
73	83
12	84
51	84
73	84
22	85
68	85
87	85
41	86
44	86
47	86
25	87
32	87
73	87
41	88
47	88
78	88
17	89
50	89
52	89
31	90
44	90
73	90
32	91
57	91
81	91
9	92
50	92
71	92
43	93
44	93
54	93
41	94
44	94
47	94
80	95
81	95
82	95
51	96
65	96
88	96
9	97
45	97
46	97
14	98
23	98
68	98
16	99
49	99
58	99
15	100
18	100
21	100
12	101
15	101
51	101
19	102
25	102
73	102
15	103
50	103
51	103
9	104
47	104
52	104
11	105
23	105
58	105
13	106
25	106
58	106
47	107
52	107
54	107
15	108
67	108
87	108
9	109
12	109
52	109
23	110
50	110
56	110
43	111
54	111
77	111
50	112
52	112
56	112
30	113
35	113
44	113
51	114
54	114
78	114
67	115
69	115
84	115
24	116
45	116
54	116
12	117
25	117
73	117
17	118
26	118
73	118
21	119
25	119
51	119
12	120
15	120
20	120
32	121
51	121
72	121
9	122
42	122
76	122
14	123
83	123
84	123
45	124
54	124
68	124
51	125
72	125
73	125
23	126
26	126
52	126
19	127
24	127
78	127
12	128
25	128
52	128
64	129
71	129
87	129
12	130
56	130
82	130
23	131
51	131
87	131
11	132
21	132
23	132
25	133
32	133
68	133
12	134
41	134
72	134
25	135
56	135
58	135
32	136
41	136
45	136
12	137
17	137
51	137
56	138
59	138
79	138
51	139
76	139
87	139
15	140
17	140
73	140
30	141
56	141
78	141
21	142
25	142
72	142
14	143
25	143
87	143
25	144
73	144
87	144
25	145
51	145
88	145
25	146
50	146
73	146
56	147
64	147
81	147
45	148
64	148
88	148
14	149
49	149
87	149
26	150
51	150
72	150
20	151
71	151
72	151
9	152
21	152
26	152
41	153
54	153
77	153
22	154
32	154
55	154
15	155
23	155
35	155
16	156
19	156
50	156
20	157
35	157
52	157
25	158
51	158
72	158
9	159
13	159
54	159
20	160
58	160
81	160
25	161
80	161
87	161
44	162
73	162
78	162
32	163
72	163
81	163
17	164
19	164
54	164
20	165
31	165
32	165
13	166
19	166
23	166
16	167
37	167
68	167
45	168
51	168
87	168
12	169
70	169
87	169
9	170
51	170
73	170
45	171
51	171
73	171
44	172
51	172
88	172
13	173
44	173
87	173
54	174
64	174
75	174
9	175
35	175
37	175
43	176
51	176
77	176
58	177
72	177
81	177
13	178
43	178
77	178
9	179
50	179
68	179
19	180
69	180
80	180
11	181
20	181
74	181
16	182
24	182
72	182
14	183
83	183
84	183
44	184
73	184
74	184
18	185
24	185
25	185
54	186
55	186
78	186
18	187
20	187
50	187
58	188
73	188
83	188
9	189
12	189
88	189
44	190
76	190
77	190
12	191
15	191
19	191
58	192
59	192
79	192
9	193
11	193
21	193
44	194
76	194
78	194
11	195
25	195
52	195
50	196
54	196
68	196
25	197
64	197
71	197
21	198
51	198
88	198
15	199
17	199
21	199
9	200
12	200
25	200
14	201
25	201
73	201
20	202
51	202
56	202
25	203
51	203
68	203
25	204
26	204
72	204
17	205
35	205
54	205
45	206
65	206
88	206
16	207
68	207
73	207
25	208
74	208
78	208
44	209
46	209
76	209
25	210
52	210
69	210
9	211
21	211
24	211
15	212
51	212
73	212
18	213
20	213
50	213
41	214
45	214
46	214
11	215
73	215
84	215
9	216
23	216
72	216
17	217
51	217
73	217
31	218
68	218
71	218
9	219
12	219
76	219
56	220
58	220
81	220
58	221
80	221
82	221
17	222
51	222
68	222
51	223
73	223
83	223
18	224
26	224
54	224
81	225
84	225
88	225
11	226
24	226
50	226
18	227
23	227
74	227
41	228
47	228
54	228
12	229
25	229
84	229
16	230
72	230
73	230
25	231
72	231
73	231
30	232
51	232
67	232
19	233
76	233
77	233
81	234
82	234
84	234
20	235
65	235
71	235
32	236
67	236
80	236
15	237
46	237
54	237
16	238
19	238
55	238
41	239
44	239
77	239
32	240
71	240
83	240
23	241
49	241
51	241
77	242
79	242
88	242
15	243
52	243
72	243
56	244
79	244
81	244
21	245
72	245
88	245
58	246
80	246
81	246
47	247
52	247
72	247
11	248
22	248
23	248
18	249
24	249
58	249
18	250
23	250
25	250
25	251
51	251
84	251
14	252
26	252
73	252
25	253
72	253
73	253
80	254
82	254
85	254
14	255
58	255
71	255
16	256
21	256
75	256
23	257
67	257
69	257
15	258
44	258
74	258
14	259
31	259
72	259
25	260
56	260
58	260
20	261
24	261
74	261
14	262
26	262
32	262
9	263
51	263
88	263
44	264
73	264
87	264
19	265
24	265
68	265
12	266
15	266
50	266
12	267
50	267
67	267
56	268
58	268
81	268
23	269
50	269
72	269
47	270
51	270
78	270
81	271
83	271
85	271
18	272
43	272
72	272
25	273
51	273
58	273
11	274
17	274
52	274
41	275
47	275
67	275
32	276
72	276
73	276
17	277
50	277
73	277
25	278
49	278
73	278
25	279
38	279
41	279
26	280
72	280
73	280
19	281
21	281
24	281
14	282
16	282
72	282
44	283
76	283
77	283
18	284
50	284
72	284
44	285
73	285
76	285
20	286
41	286
68	286
56	287
81	287
85	287
51	288
67	288
88	288
18	289
56	289
72	289
24	290
35	290
50	290
25	291
72	291
73	291
25	292
26	292
52	292
12	293
15	293
18	293
71	294
73	294
83	294
35	295
52	295
54	295
35	296
50	296
54	296
42	297
44	297
46	297
12	298
26	298
50	298
23	299
72	299
78	299
12	300
71	300
83	300
24	301
51	301
73	301
32	302
67	302
73	302
18	303
52	303
78	303
25	304
67	304
88	304
26	305
51	305
72	305
12	338
15	338
35	338
67	339
69	339
73	339
14	340
26	340
83	340
12	341
14	341
83	341
14	342
18	342
71	342
21	343
25	343
71	343
23	344
51	344
72	344
17	345
18	345
52	345
9	346
20	346
73	346
14	347
71	347
73	347
31	348
68	348
73	348
19	349
21	349
24	349
9	350
44	350
52	350
11	351
18	351
24	351
38	352
46	352
78	352
38	353
42	353
44	353
37	354
68	354
74	354
21	355
72	355
88	355
15	356
31	356
72	356
52	357
67	357
68	357
18	358
21	358
54	358
21	359
51	359
71	359
18	360
21	360
54	360
17	361
18	361
21	361
11	362
15	362
78	362
18	363
50	363
51	363
32	364
81	364
88	364
9	365
23	365
70	365
11	366
25	366
73	366
23	367
68	367
74	367
25	368
30	368
35	368
11	369
45	369
79	369
80	370
82	370
83	370
21	371
26	371
68	371
50	372
73	372
76	372
56	373
68	373
87	373
44	374
46	374
77	374
43	375
45	375
46	375
24	376
25	376
64	376
20	377
26	377
87	377
12	378
32	378
57	378
21	379
50	379
73	379
20	380
23	380
25	380
25	381
32	381
51	381
22	382
58	382
87	382
17	383
24	383
54	383
20	384
75	384
80	384
25	385
26	385
32	385
49	386
54	386
88	386
16	387
17	387
49	387
56	388
82	388
83	388
44	389
55	389
77	389
32	390
51	390
73	390
12	391
15	391
81	391
65	392
67	392
73	392
41	393
45	393
58	393
9	394
18	394
54	394
15	395
17	395
18	395
46	396
76	396
78	396
12	397
19	397
56	397
26	398
56	398
81	398
18	399
21	399
54	399
23	400
75	400
78	400
56	401
57	401
81	401
41	402
44	402
45	402
25	403
45	403
87	403
68	404
78	404
79	404
25	405
26	405
74	405
80	406
82	406
83	406
12	407
17	407
73	407
25	408
44	408
80	408
51	409
68	409
73	409
26	410
54	410
58	410
80	411
81	411
83	411
64	412
69	412
87	412
20	413
32	413
54	413
51	414
72	414
73	414
45	415
50	415
51	415
50	416
52	416
73	416
20	417
30	417
73	417
9	418
11	418
17	418
14	419
26	419
56	419
51	420
74	420
78	420
16	421
19	421
22	421
17	422
23	422
25	422
32	423
68	423
78	423
41	424
47	424
78	424
71	425
72	425
73	425
19	426
55	426
78	426
17	427
25	427
73	427
41	428
47	428
78	428
12	429
73	429
74	429
43	430
44	430
47	430
71	431
80	431
83	431
32	432
68	432
78	432
42	433
46	433
72	433
14	434
72	434
73	434
9	435
41	435
47	435
56	436
75	436
80	436
11	437
47	437
54	437
18	438
23	438
58	438
25	439
45	439
51	439
24	440
47	440
88	440
18	441
20	441
45	441
19	442
23	442
87	442
58	443
68	443
80	443
21	444
50	444
71	444
25	445
44	445
46	445
67	446
73	446
74	446
71	447
77	447
78	447
15	448
18	448
21	448
15	449
73	449
78	449
68	450
70	450
78	450
64	451
65	451
87	451
14	452
70	452
84	452
41	453
44	453
47	453
56	454
58	454
59	454
18	455
58	455
69	455
15	456
56	456
68	456
42	457
46	457
87	457
54	458
69	458
78	458
9	459
51	459
54	459
12	460
49	460
73	460
18	461
22	461
50	461
41	462
42	462
45	462
25	463
72	463
73	463
22	464
23	464
50	464
21	465
58	465
59	465
56	466
79	466
81	466
9	467
20	467
52	467
11	468
16	468
22	468
24	469
32	469
68	469
15	470
51	470
52	470
25	471
73	471
74	471
67	472
69	472
78	472
17	473
52	473
58	473
25	474
32	474
72	474
50	475
52	475
74	475
15	476
25	476
73	476
11	477
22	477
23	477
11	478
17	478
20	478
44	479
46	479
77	479
25	480
26	480
51	480
15	481
68	481
80	481
25	482
37	482
51	482
43	483
76	483
87	483
22	484
68	484
87	484
11	485
26	485
50	485
25	486
51	486
58	486
50	487
80	487
84	487
35	520
50	520
52	520
31	521
51	521
73	521
41	522
45	522
47	522
15	523
17	523
31	523
55	524
76	524
78	524
32	525
51	525
67	525
25	526
72	526
73	526
12	527
47	527
73	527
25	528
26	528
31	528
64	529
67	529
68	529
26	530
49	530
55	530
19	531
24	531
87	531
18	532
38	532
54	532
44	533
75	533
77	533
25	534
80	534
81	534
16	535
19	535
24	535
44	536
76	536
77	536
44	537
47	537
54	537
21	538
64	538
74	538
9	539
50	539
51	539
14	540
25	540
56	540
26	541
51	541
88	541
35	542
54	542
88	542
13	543
14	543
78	543
25	544
74	544
77	544
20	545
25	545
50	545
44	546
46	546
78	546
19	547
22	547
23	547
25	548
81	548
82	548
75	549
80	549
87	549
25	550
82	550
83	550
25	551
26	551
51	551
17	552
26	552
74	552
22	553
26	553
81	553
13	554
15	554
19	554
14	555
65	555
82	555
43	556
44	556
77	556
44	557
54	557
76	557
17	558
49	558
73	558
56	559
76	559
79	559
18	560
20	560
50	560
56	561
59	561
81	561
32	562
72	562
73	562
50	563
52	563
73	563
20	564
45	564
54	564
23	565
25	565
50	565
30	566
31	566
68	566
12	567
75	567
88	567
37	568
73	568
87	568
17	569
25	569
50	569
12	570
73	570
79	570
25	571
58	571
73	571
16	572
20	572
72	572
44	573
46	573
77	573
11	606
25	606
74	606
25	607
72	607
73	607
9	608
21	608
87	608
26	609
68	609
72	609
56	610
58	610
73	610
25	611
45	611
76	611
44	612
52	612
70	612
18	613
22	613
23	613
18	614
54	614
57	614
25	615
72	615
73	615
44	616
45	616
73	616
26	617
51	617
74	617
72	618
76	618
78	618
14	619
26	619
72	619
11	620
22	620
23	620
12	621
15	621
88	621
41	622
54	622
56	622
11	623
22	623
24	623
26	624
68	624
73	624
11	625
16	625
20	625
25	626
51	626
72	626
23	627
58	627
68	627
26	628
32	628
73	628
65	629
70	629
74	629
11	630
67	630
69	630
47	631
72	631
73	631
20	632
58	632
83	632
15	633
26	633
52	633
54	634
78	634
88	634
14	635
16	635
26	635
21	636
22	636
23	636
15	637
16	637
73	637
12	638
14	638
25	638
12	639
77	639
81	639
12	640
15	640
84	640
20	641
54	641
68	641
25	642
32	642
73	642
75	643
80	643
84	643
65	644
78	644
87	644
35	645
50	645
87	645
25	646
51	646
72	646
38	647
50	647
52	647
9	648
17	648
52	648
12	649
14	649
84	649
49	650
52	650
73	650
57	651
59	651
81	651
68	652
78	652
88	652
41	653
44	653
78	653
80	654
81	654
83	654
25	655
50	655
70	655
42	656
44	656
76	656
69	657
70	657
74	657
44	658
45	658
54	658
13	659
41	659
54	659
41	660
45	660
68	660
14	661
54	661
71	661
9	662
64	662
67	662
32	663
68	663
80	663
13	664
44	664
76	664
21	665
73	665
87	665
50	666
76	666
88	666
15	667
24	667
50	667
20	668
59	668
74	668
32	669
56	669
73	669
57	670
82	670
83	670
18	671
20	671
23	671
26	672
68	672
72	672
51	673
54	673
74	673
14	674
51	674
56	674
12	675
24	675
88	675
25	676
51	676
84	676
65	677
68	677
73	677
44	709
54	709
87	709
50	710
74	710
88	710
25	711
26	711
68	711
31	712
32	712
64	712
41	713
54	713
78	713
15	714
18	714
20	714
51	715
71	715
72	715
46	716
50	716
77	716
25	717
26	717
73	717
64	718
74	718
88	718
41	719
46	719
54	719
25	749
72	749
73	749
25	750
54	750
88	750
9	751
50	751
76	751
15	752
51	752
73	752
56	753
58	753
81	753
11	754
56	754
58	754
23	755
51	755
74	755
75	782
78	782
80	782
22	783
52	783
73	783
12	784
23	784
44	784
12	785
41	785
76	785
18	786
25	786
52	786
56	787
58	787
81	787
64	790
80	790
87	790
11	791
35	791
37	791
23	788
56	788
79	788
11	789
14	789
65	789
15	792
73	792
74	792
69	824
74	824
82	824
31	825
32	825
72	825
58	826
59	826
81	826
45	827
54	827
67	827
38	857
41	857
44	857
17	858
47	858
52	858
22	859
31	859
32	859
58	890
80	890
81	890
50	891
77	891
83	891
19	892
20	892
24	892
25	893
49	893
54	893
58	894
76	894
87	894
9	895
12	895
52	895
38	896
76	896
77	896
17	897
31	897
50	897
69	898
73	898
74	898
25	899
31	899
73	899
9	900
44	900
68	900
17	901
20	901
21	901
45	902
52	902
54	902
18	903
35	903
52	903
9	904
13	904
51	904
56	905
57	905
81	905
37	906
55	906
68	906
20	907
25	907
59	907
19	908
25	908
72	908
17	909
20	909
23	909
25	910
44	910
88	910
12	911
17	911
75	911
45	912
46	912
47	912
73	913
75	913
76	913
31	914
32	914
56	914
56	915
58	915
81	915
9	916
12	916
50	916
25	944
45	944
51	944
11	945
20	945
49	945
18	946
25	946
52	946
12	947
80	947
82	947
32	948
59	948
79	948
22	949
24	949
58	949
17	950
25	950
54	950
20	951
44	951
77	951
31	952
81	952
83	952
18	953
23	953
35	953
41	954
44	954
68	954
17	955
57	955
71	955
43	956
77	956
78	956
52	957
56	957
57	957
58	958
68	958
80	958
41	959
44	959
47	959
26	960
72	960
79	960
52	961
68	961
73	961
59	962
71	962
87	962
58	963
81	963
82	963
31	964
32	964
74	964
31	965
52	965
82	965
9	966
47	966
76	966
58	967
80	967
81	967
16	968
49	968
68	968
25	969
72	969
73	969
25	970
58	970
71	970
9	971
52	971
72	971
17	972
22	972
73	972
25	973
26	973
72	973
11	974
20	974
54	974
24	1006
80	1006
87	1006
17	1007
51	1007
72	1007
12	1008
73	1008
84	1008
54	1009
64	1009
74	1009
11	1010
19	1010
20	1010
19	1011
24	1011
68	1011
26	1012
67	1012
78	1012
51	1013
73	1013
88	1013
11	1014
18	1014
20	1014
20	1015
25	1015
74	1015
12	1016
18	1016
47	1016
31	1017
70	1017
87	1017
56	1018
58	1018
81	1018
21	1019
51	1019
72	1019
47	1020
73	1020
76	1020
17	1021
23	1021
68	1021
18	1022
21	1022
24	1022
11	1023
12	1023
24	1023
11	1024
16	1024
52	1024
15	1025
45	1025
47	1025
56	1026
59	1026
81	1026
24	1027
37	1027
68	1027
30	1059
57	1059
78	1059
18	1060
77	1060
78	1060
47	1061
54	1061
68	1061
9	1062
75	1062
87	1062
77	1063
80	1063
83	1063
20	1064
54	1064
78	1064
14	1065
74	1065
83	1065
12	1066
51	1066
71	1066
14	1067
26	1067
72	1067
17	1068
50	1068
74	1068
12	1069
72	1069
73	1069
80	1070
83	1070
84	1070
25	1071
26	1071
32	1071
17	1072
23	1072
58	1072
11	1073
22	1073
23	1073
75	1074
79	1074
80	1074
71	1075
73	1075
78	1075
11	1076
23	1076
74	1076
20	1077
23	1077
71	1077
9	1078
50	1078
81	1078
14	1079
72	1079
73	1079
30	1080
57	1080
81	1080
58	1081
80	1081
81	1081
14	1082
16	1082
72	1082
70	1083
80	1083
87	1083
42	1084
44	1084
77	1084
11	1085
25	1085
74	1085
25	1086
26	1086
72	1086
15	1087
17	1087
81	1087
17	1088
19	1088
72	1088
41	1089
46	1089
47	1089
15	1090
72	1090
78	1090
20	1091
50	1091
54	1091
11	1092
32	1092
58	1092
14	1093
83	1093
84	1093
19	1094
21	1094
51	1094
18	1095
22	1095
58	1095
12	1096
18	1096
52	1096
9	1097
22	1097
23	1097
17	1098
52	1098
68	1098
23	1099
51	1099
58	1099
51	1100
67	1100
69	1100
42	1101
44	1101
54	1101
44	1102
51	1102
84	1102
68	1103
76	1103
80	1103
19	1104
26	1104
68	1104
32	1105
65	1105
71	1105
65	1106
69	1106
71	1106
14	1107
64	1107
80	1107
41	1108
47	1108
78	1108
41	1109
44	1109
68	1109
72	1110
81	1110
87	1110
12	1111
16	1111
68	1111
56	1112
75	1112
80	1112
51	1113
72	1113
73	1113
31	1114
57	1114
73	1114
18	1115
20	1115
50	1115
12	1116
21	1116
25	1116
20	1117
25	1117
81	1117
71	1118
75	1118
83	1118
31	1119
32	1119
84	1119
9	1120
50	1120
52	1120
44	1121
77	1121
78	1121
25	1122
58	1122
83	1122
24	1123
44	1123
50	1123
9	1124
18	1124
87	1124
20	1125
65	1125
68	1125
20	1126
22	1126
82	1126
26	1127
41	1127
46	1127
9	1128
42	1128
78	1128
68	1129
75	1129
80	1129
15	1130
45	1130
51	1130
15	1162
17	1162
52	1162
51	1163
73	1163
83	1163
14	1164
83	1164
84	1164
51	1165
58	1165
73	1165
75	1166
77	1166
81	1166
37	1167
79	1167
83	1167
45	1168
51	1168
88	1168
12	1169
49	1169
52	1169
14	1170
21	1170
22	1170
11	1171
17	1171
52	1171
30	1172
76	1172
77	1172
50	1173
52	1173
74	1173
26	1174
51	1174
64	1174
9	1175
17	1175
21	1175
12	1176
15	1176
73	1176
35	1177
74	1177
88	1177
9	1178
18	1178
50	1178
25	1179
26	1179
31	1179
14	1180
68	1180
73	1180
41	1181
58	1181
82	1181
9	1182
58	1182
77	1182
12	1183
17	1183
68	1183
11	1184
15	1184
38	1184
38	1185
56	1185
81	1185
9	1186
13	1186
25	1186
9	1187
67	1187
78	1187
51	1188
67	1188
70	1188
45	1189
68	1189
88	1189
35	1190
50	1190
52	1190
25	1191
32	1191
51	1191
15	1192
18	1192
20	1192
16	1193
32	1193
51	1193
16	1194
51	1194
73	1194
70	1195
71	1195
77	1195
41	1196
45	1196
46	1196
25	1197
73	1197
81	1197
26	1198
32	1198
72	1198
25	1199
51	1199
74	1199
41	1200
43	1200
44	1200
11	1201
18	1201
24	1201
16	1202
54	1202
87	1202
14	1203
26	1203
51	1203
58	1204
73	1204
84	1204
11	1205
50	1205
74	1205
12	1206
22	1206
58	1206
9	1207
17	1207
50	1207
19	1208
20	1208
22	1208
17	1209
20	1209
52	1209
31	1210
38	1210
67	1210
26	1211
37	1211
82	1211
9	1212
23	1212
24	1212
13	1213
37	1213
70	1213
24	1214
50	1214
51	1214
17	1215
51	1215
52	1215
80	1216
83	1216
87	1216
42	1217
45	1217
77	1217
9	1218
26	1218
51	1218
14	1219
37	1219
65	1219
80	1220
82	1220
84	1220
64	1221
65	1221
69	1221
17	1222
50	1222
54	1222
64	1223
67	1223
87	1223
23	1224
25	1224
71	1224
32	1225
44	1225
70	1225
12	1226
51	1226
73	1226
18	1228
21	1228
23	1228
18	1229
24	1229
25	1229
16	1230
72	1230
74	1230
56	1231
81	1231
82	1231
26	1232
50	1232
58	1232
11	1233
25	1233
73	1233
56	1234
58	1234
82	1234
12	1235
73	1235
83	1235
13	1236
54	1236
55	1236
58	1237
69	1237
74	1237
20	1238
25	1238
50	1238
18	1239
24	1239
58	1239
81	1240
82	1240
84	1240
64	1241
80	1241
87	1241
70	1242
72	1242
88	1242
19	1243
77	1243
78	1243
26	1244
44	1244
54	1244
37	1245
51	1245
74	1245
51	1246
74	1246
87	1246
25	1247
72	1247
73	1247
24	1248
32	1248
51	1248
58	1249
76	1249
77	1249
17	1250
18	1250
24	1250
23	1251
52	1251
74	1251
44	1252
50	1252
88	1252
15	1253
22	1253
23	1253
14	1254
25	1254
72	1254
24	1255
41	1255
47	1255
64	1256
72	1256
73	1256
17	1257
50	1257
52	1257
25	1258
51	1258
88	1258
18	1259
22	1259
23	1259
44	1260
52	1260
78	1260
30	1261
57	1261
74	1261
46	1262
76	1262
77	1262
24	1263
56	1263
74	1263
38	1264
64	1264
67	1264
32	1265
73	1265
83	1265
25	1266
72	1266
73	1266
25	1267
46	1267
72	1267
50	1268
76	1268
88	1268
22	1269
23	1269
72	1269
14	1270
57	1270
83	1270
11	1271
22	1271
24	1271
41	1272
43	1272
45	1272
18	1273
26	1273
70	1273
44	1274
45	1274
78	1274
12	1275
15	1275
68	1275
25	1276
72	1276
73	1276
18	1305
19	1305
56	1305
9	1306
15	1306
16	1306
9	1307
23	1307
25	1307
26	1308
45	1308
51	1308
38	1309
41	1309
47	1309
14	1310
32	1310
87	1310
25	1311
31	1311
72	1311
17	1312
50	1312
52	1312
9	1313
45	1313
88	1313
41	1314
45	1314
87	1314
45	1315
51	1315
54	1315
25	1316
32	1316
50	1316
17	1317
50	1317
87	1317
54	1318
56	1318
80	1318
51	1319
65	1319
88	1319
9	1320
18	1320
75	1320
9	1321
11	1321
24	1321
43	1322
44	1322
46	1322
24	1323
44	1323
78	1323
41	1324
44	1324
67	1324
54	1325
80	1325
83	1325
14	1326
65	1326
71	1326
14	1327
15	1327
52	1327
24	1328
54	1328
78	1328
31	1329
78	1329
79	1329
23	1330
51	1330
88	1330
12	1331
24	1331
26	1331
26	1332
50	1332
73	1332
31	1333
56	1333
83	1333
9	1334
68	1334
76	1334
17	1335
18	1335
58	1335
15	1336
19	1336
88	1336
26	1337
72	1337
73	1337
26	1338
51	1338
72	1338
21	1339
51	1339
88	1339
56	1340
81	1340
82	1340
9	1341
19	1341
22	1341
17	1342
35	1342
54	1342
25	1343
56	1343
81	1343
44	1344
51	1344
74	1344
25	1345
68	1345
73	1345
17	1346
45	1346
54	1346
16	1347
26	1347
72	1347
17	1348
25	1348
73	1348
54	1349
55	1349
78	1349
14	1350
15	1350
42	1350
20	1351
67	1351
70	1351
56	1352
58	1352
59	1352
24	1353
50	1353
58	1353
12	1354
31	1354
73	1354
23	1355
25	1355
26	1355
21	1356
22	1356
24	1356
58	1357
80	1357
83	1357
56	1358
79	1358
81	1358
9	1359
72	1359
73	1359
14	1360
26	1360
82	1360
20	1388
52	1388
70	1388
56	1389
76	1389
77	1389
9	1390
70	1390
76	1390
69	1391
71	1391
74	1391
56	1392
58	1392
73	1392
17	1393
18	1393
52	1393
14	1394
71	1394
82	1394
32	1395
73	1395
87	1395
9	1396
38	1396
47	1396
41	1397
43	1397
45	1397
22	1398
41	1398
45	1398
18	1399
24	1399
50	1399
17	1400
18	1400
64	1400
17	1401
45	1401
88	1401
31	1402
32	1402
73	1402
32	1403
72	1403
73	1403
14	1404
20	1404
82	1404
15	1405
17	1405
18	1405
11	1406
17	1406
52	1406
14	1407
15	1407
84	1407
51	1408
67	1408
73	1408
9	1409
43	1409
76	1409
20	1410
23	1410
67	1410
22	1411
56	1411
58	1411
14	1412
46	1412
73	1412
14	1413
26	1413
72	1413
25	1414
51	1414
72	1414
51	1415
56	1415
74	1415
35	1416
54	1416
74	1416
17	1417
52	1417
74	1417
25	1418
44	1418
45	1418
30	1419
31	1419
35	1419
51	1420
72	1420
73	1420
45	1421
67	1421
70	1421
20	1422
54	1422
87	1422
9	1423
11	1423
43	1423
9	1424
44	1424
50	1424
17	1425
21	1425
51	1425
47	1426
52	1426
78	1426
25	1427
51	1427
68	1427
54	1428
68	1428
73	1428
12	1429
44	1429
68	1429
23	1430
31	1430
67	1430
22	1431
23	1431
58	1431
20	1432
24	1432
32	1432
56	1433
58	1433
81	1433
12	1434
21	1434
32	1434
75	1435
77	1435
78	1435
14	1436
71	1436
72	1436
31	1437
65	1437
71	1437
21	1438
50	1438
88	1438
19	1439
21	1439
23	1439
71	1440
82	1440
88	1440
42	1441
45	1441
72	1441
13	1442
75	1442
80	1442
45	1443
72	1443
73	1443
31	1444
49	1444
84	1444
25	1445
26	1445
51	1445
44	1446
68	1446
88	1446
21	1447
23	1447
24	1447
51	1448
54	1448
87	1448
50	1449
51	1449
74	1449
18	1450
50	1450
84	1450
32	1451
50	1451
73	1451
41	1452
72	1452
75	1452
64	1453
80	1453
87	1453
49	1454
50	1454
52	1454
50	1455
52	1455
72	1455
14	1456
16	1456
20	1456
41	1457
45	1457
88	1457
23	1458
25	1458
31	1458
51	1459
54	1459
88	1459
20	1460
43	1460
71	1460
12	1461
45	1461
50	1461
11	1462
21	1462
72	1462
16	1463
18	1463
52	1463
22	1464
64	1464
87	1464
20	1465
71	1465
82	1465
18	1466
52	1466
74	1466
25	1467
32	1467
73	1467
25	1468
32	1468
73	1468
73	1469
77	1469
79	1469
65	1470
69	1470
73	1470
23	1471
41	1471
44	1471
32	1472
58	1472
73	1472
16	1473
54	1473
55	1473
81	1474
82	1474
84	1474
57	1475
67	1475
71	1475
56	1476
81	1476
83	1476
25	1477
51	1477
72	1477
57	1478
58	1478
59	1478
25	1479
65	1479
73	1479
14	1480
31	1480
58	1480
56	1481
59	1481
81	1481
52	1482
54	1482
73	1482
9	1483
23	1483
32	1483
50	1484
67	1484
78	1484
20	1485
54	1485
82	1485
25	1486
26	1486
72	1486
25	1487
32	1487
73	1487
14	1488
25	1488
70	1488
51	1489
56	1489
76	1489
38	1490
58	1490
72	1490
41	1491
47	1491
54	1491
17	1492
24	1492
78	1492
11	1493
23	1493
35	1493
19	1494
51	1494
78	1494
11	1495
18	1495
24	1495
38	1496
46	1496
47	1496
25	1497
74	1497
88	1497
12	1498
18	1498
19	1498
26	1499
31	1499
32	1499
32	1500
44	1500
54	1500
21	1501
51	1501
73	1501
15	1502
23	1502
52	1502
23	1503
45	1503
75	1503
37	1504
77	1504
78	1504
20	1505
82	1505
83	1505
25	1533
75	1533
77	1533
17	1534
24	1534
68	1534
25	1566
35	1566
47	1566
71	1567
82	1567
83	1567
22	1568
23	1568
58	1568
14	1569
51	1569
65	1569
18	1570
56	1570
68	1570
12	1571
15	1571
26	1571
9	1572
43	1572
46	1572
25	1573
64	1573
81	1573
11	1574
24	1574
52	1574
80	1575
82	1575
83	1575
12	1576
18	1576
23	1576
54	1577
55	1577
73	1577
9	1578
51	1578
58	1578
14	1579
67	1579
78	1579
26	1580
41	1580
72	1580
25	1581
51	1581
88	1581
45	1582
78	1582
88	1582
15	1583
17	1583
78	1583
11	1584
12	1584
23	1584
24	1585
25	1585
74	1585
12	1586
17	1586
18	1586
35	1587
41	1587
72	1587
44	1588
46	1588
47	1588
12	1589
26	1589
51	1589
25	1590
51	1590
74	1590
38	1591
43	1591
44	1591
56	1592
58	1592
74	1592
41	1593
54	1593
77	1593
18	1594
26	1594
78	1594
15	1595
17	1595
18	1595
17	1596
25	1596
72	1596
50	1597
82	1597
84	1597
15	1598
42	1598
44	1598
16	1599
25	1599
51	1599
25	1600
72	1600
73	1600
18	1601
41	1601
72	1601
15	1602
50	1602
72	1602
25	1603
32	1603
73	1603
51	1604
58	1604
88	1604
45	1605
54	1605
76	1605
16	1606
49	1606
72	1606
52	1607
65	1607
71	1607
16	1608
49	1608
72	1608
15	1609
83	1609
85	1609
19	1610
21	1610
87	1610
26	1611
30	1611
72	1611
9	1612
41	1612
46	1612
11	1613
17	1613
18	1613
12	1614
22	1614
52	1614
12	1615
15	1615
51	1615
31	1616
72	1616
87	1616
41	1617
47	1617
73	1617
15	1618
73	1618
74	1618
12	1619
73	1619
74	1619
16	1620
19	1620
24	1620
17	1621
52	1621
73	1621
54	1622
76	1622
77	1622
32	1623
72	1623
73	1623
25	1624
32	1624
73	1624
15	1625
73	1625
87	1625
12	1626
14	1626
58	1626
25	1627
51	1627
72	1627
12	1628
38	1628
73	1628
9	1629
30	1629
35	1629
15	1630
52	1630
72	1630
32	1631
47	1631
78	1631
15	1632
52	1632
72	1632
19	1633
20	1633
25	1633
23	1634
80	1634
83	1634
47	1635
52	1635
73	1635
12	1636
14	1636
38	1636
9	1637
12	1637
50	1637
15	1638
17	1638
52	1638
49	1661
50	1661
68	1661
15	1662
35	1662
38	1662
25	1663
73	1663
88	1663
25	1665
26	1665
50	1665
25	1667
51	1667
72	1667
49	1664
54	1664
72	1664
11	1666
16	1666
35	1666
15	1668
16	1668
74	1668
20	1669
50	1669
58	1669
51	1670
52	1670
54	1670
12	1671
49	1671
84	1671
13	1672
78	1672
79	1672
13	1673
16	1673
54	1673
16	1674
49	1674
70	1674
14	1675
25	1675
46	1675
21	1676
26	1676
87	1676
12	1677
18	1677
52	1677
25	1678
68	1678
80	1678
44	1679
47	1679
67	1679
44	1680
51	1680
56	1680
16	1681
25	1681
72	1681
12	1682
72	1682
73	1682
68	1683
72	1683
87	1683
17	1684
50	1684
75	1684
56	1685
57	1685
81	1685
38	1686
72	1686
73	1686
37	1687
55	1687
68	1687
16	1688
72	1688
74	1688
11	1689
72	1689
73	1689
13	1690
56	1690
80	1690
15	1691
72	1691
73	1691
19	1692
24	1692
54	1692
23	1693
54	1693
75	1693
64	1694
65	1694
74	1694
17	1695
51	1695
73	1695
41	1696
47	1696
78	1696
25	1697
47	1697
54	1697
37	1698
68	1698
78	1698
26	1699
51	1699
74	1699
25	1700
44	1700
77	1700
58	1701
73	1701
83	1701
30	1702
46	1702
75	1702
72	1703
73	1703
75	1703
44	1704
47	1704
73	1704
9	1705
41	1705
44	1705
15	1706
51	1706
73	1706
22	1707
23	1707
24	1707
45	1708
46	1708
54	1708
17	1709
25	1709
80	1709
25	1710
71	1710
73	1710
23	1711
26	1711
77	1711
81	1712
82	1712
83	1712
45	1713
67	1713
88	1713
9	1714
13	1714
76	1714
16	1715
19	1715
73	1715
50	1716
54	1716
77	1716
17	1717
49	1717
55	1717
17	1718
25	1718
72	1718
25	1719
51	1719
56	1719
35	1720
45	1720
87	1720
71	1721
73	1721
82	1721
12	1722
49	1722
50	1722
49	1723
51	1723
73	1723
25	1724
69	1724
73	1724
41	1725
43	1725
68	1725
44	1726
54	1726
76	1726
65	1727
69	1727
73	1727
72	1728
87	1728
88	1728
20	1729
58	1729
74	1729
25	1730
54	1730
73	1730
17	1731
50	1731
52	1731
12	1732
15	1732
73	1732
32	1733
51	1733
68	1733
38	1734
44	1734
76	1734
51	1735
72	1735
37	1736
54	1736
68	1736
79	1735
31	1737
52	1737
79	1737
23	1738
67	1738
68	1738
14	1739
71	1739
85	1739
17	1740
20	1740
75	1740
67	1741
69	1741
70	1741
15	1742
54	1742
70	1742
14	1743
51	1743
74	1743
44	1744
64	1744
76	1744
45	1745
76	1745
78	1745
45	1746
50	1746
54	1746
45	1747
54	1747
76	1747
14	1748
71	1748
77	1748
9	1749
70	1749
75	1749
12	1750
72	1750
73	1750
25	1751
54	1751
55	1751
25	1752
73	1752
74	1752
18	1753
19	1753
20	1753
11	1754
23	1754
24	1754
25	1755
32	1755
72	1755
41	1756
49	1756
77	1756
12	1757
51	1757
80	1757
50	1758
54	1758
58	1758
17	1759
18	1759
54	1759
32	1760
79	1760
81	1760
20	1761
51	1761
79	1761
26	1762
32	1762
74	1762
25	1763
50	1763
76	1763
18	1764
21	1764
74	1764
51	1765
72	1765
83	1765
24	1766
58	1766
59	1766
12	1767
35	1767
72	1767
15	1768
50	1768
51	1768
45	1769
51	1769
88	1769
23	1770
31	1770
73	1770
25	1771
73	1771
74	1771
25	1772
80	1772
87	1772
20	1773
25	1773
50	1773
18	1774
24	1774
58	1774
76	1775
87	1775
88	1775
19	1776
23	1776
54	1776
50	1777
51	1777
73	1777
20	1778
45	1778
51	1778
16	1779
17	1779
52	1779
51	1780
73	1780
88	1780
17	1781
23	1781
52	1781
50	1808
58	1808
59	1808
44	1809
73	1809
76	1809
22	1841
51	1841
88	1841
58	1842
67	1842
71	1842
25	1843
72	1843
73	1843
15	1844
20	1844
71	1844
32	1845
56	1845
81	1845
25	1846
51	1846
67	1846
25	1847
51	1847
73	1847
19	1848
37	1848
74	1848
19	1849
54	1849
72	1849
26	1850
56	1850
72	1850
20	1851
65	1851
81	1851
12	1852
30	1852
37	1852
58	1853
59	1853
83	1853
31	1854
44	1854
52	1854
45	1855
52	1855
73	1855
14	1856
26	1856
32	1856
11	1888
19	1888
24	1888
21	1889
23	1889
74	1889
12	1890
77	1890
81	1890
12	1891
14	1891
73	1891
80	1892
81	1892
87	1892
18	1893
20	1893
26	1893
30	1894
57	1894
78	1894
12	1895
15	1895
25	1895
20	1896
21	1896
23	1896
14	1897
25	1897
26	1897
11	1898
18	1898
21	1898
58	1899
67	1899
78	1899
12	1900
15	1900
72	1900
80	1901
83	1901
87	1901
22	1902
30	1902
31	1902
9	1903
10	1903
13	1903
9	1906
10	1906
13	1906
9	1907
10	1907
13	1907
41	1908
68	1908
73	1908
21	1909
38	1909
44	1909
80	1910
81	1910
83	1910
26	1911
32	1911
73	1911
9	1912
17	1912
35	1912
11	1913
17	1913
68	1913
48	1914
51	1914
73	1914
12	1915
17	1915
25	1915
12	1916
50	1916
68	1916
38	1917
48	1917
69	1917
17	1918
21	1918
26	1918
20	1919
72	1919
74	1919
17	1920
18	1920
20	1920
25	1921
74	1921
77	1921
20	1922
21	1922
65	1922
9	1923
41	1923
48	1923
25	1924
55	1924
69	1924
20	1925
50	1925
86	1925
37	1926
71	1926
73	1926
18	1927
20	1927
41	1927
25	1928
26	1928
31	1928
65	1929
72	1929
78	1929
22	1930
24	1930
28	1930
18	1931
58	1931
59	1931
11	1932
22	1932
76	1932
52	1933
64	1933
69	1933
65	1934
83	1934
85	1934
20	1935
25	1935
69	1935
76	1936
86	1936
87	1936
9	1937
13	1937
20	1937
25	1938
68	1938
90	1938
15	1939
25	1939
48	1939
25	1940
68	1940
72	1940
25	1941
40	1941
69	1941
20	1942
25	1942
73	1942
38	1943
54	1943
55	1943
18	1944
51	1944
81	1944
11	1945
18	1945
20	1945
50	1946
54	1946
78	1946
50	1947
68	1947
72	1947
25	1948
68	1948
73	1948
48	1949
52	1949
54	1949
17	1950
28	1950
29	1950
18	1951
21	1951
52	1951
17	1952
18	1952
20	1952
18	1953
22	1953
24	1953
15	1954
26	1954
86	1954
17	1955
69	1955
71	1955
14	1956
35	1956
71	1956
25	1957
72	1957
73	1957
17	1958
20	1958
64	1958
25	1959
72	1959
73	1959
20	1960
21	1960
28	1960
38	1961
40	1961
44	1961
14	1962
64	1962
65	1962
11	1963
18	1963
21	1963
35	1964
40	1964
44	1964
81	1965
82	1965
83	1965
18	1966
30	1966
74	1966
20	1967
25	1967
68	1967
68	1968
73	1968
90	1968
14	1969
69	1969
93	1969
11	1970
25	1970
68	1970
9	1971
58	1971
59	1971
11	1972
20	1972
30	1972
45	1973
73	1973
88	1973
54	1974
68	1974
73	1974
25	1975
28	1975
40	1975
9	1976
12	1976
40	1976
11	1977
19	1977
20	1977
9	1978
47	1978
48	1978
9	1979
76	1979
85	1979
18	1980
20	1980
28	1980
80	1981
82	1981
83	1981
20	1984
69	1984
74	1984
11	1987
35	1987
73	1987
17	1990
18	1990
50	1990
72	1993
73	1993
74	1993
20	1998
32	1998
88	1998
44	2001
55	2001
68	2001
25	1982
49	1982
50	1982
12	1985
31	1985
56	1985
32	1988
57	1988
68	1988
13	1991
20	1991
32	1991
81	1994
82	1994
83	1994
25	1996
37	1996
72	1996
54	1999
55	1999
72	1999
17	1983
52	1983
54	1983
58	1986
65	1986
69	1986
26	1989
30	1989
73	1989
17	1992
39	1992
76	1992
20	1995
46	1995
77	1995
20	1997
41	1997
64	1997
25	2000
81	2000
85	2000
38	2002
40	2002
47	2002
18	2003
20	2003
29	2003
37	2004
38	2004
65	2004
20	2005
22	2005
52	2005
11	2006
25	2006
72	2006
20	2007
32	2007
73	2007
76	2008
77	2008
86	2008
35	2009
74	2009
87	2009
17	2010
20	2010
86	2010
64	2011
72	2011
86	2011
9	2012
11	2012
43	2012
14	2013
25	2013
26	2013
39	2014
77	2014
86	2014
32	2015
52	2015
90	2015
9	2016
11	2016
23	2016
46	2017
71	2017
81	2017
9	2018
12	2018
79	2018
14	2019
25	2019
26	2019
21	2020
32	2020
56	2020
81	2021
83	2021
85	2021
18	2022
20	2022
22	2022
65	2023
71	2023
93	2023
\.


--
-- Data for Name: Surveys; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."Surveys" ("Id", "StudentId", "CreatedAt") FROM stdin;
4	2956	-infinity
5	3620	-infinity
6	3941	-infinity
7	3942	-infinity
8	3943	-infinity
9	2670	-infinity
10	2662	-infinity
11	2959	-infinity
12	2664	-infinity
13	3267	-infinity
14	3268	-infinity
15	3269	-infinity
16	2957	-infinity
17	2958	-infinity
18	3621	-infinity
19	3270	-infinity
20	2960	-infinity
21	3271	-infinity
22	2665	-infinity
23	2666	-infinity
24	2961	-infinity
25	3272	-infinity
26	3622	-infinity
27	2962	-infinity
28	2667	-infinity
29	3623	-infinity
30	3273	-infinity
31	3274	-infinity
32	2668	-infinity
33	2963	-infinity
34	2964	-infinity
35	3624	-infinity
36	3275	-infinity
37	3276	-infinity
38	2965	-infinity
39	3625	-infinity
40	3277	-infinity
41	3626	-infinity
42	2669	-infinity
43	3627	-infinity
44	3628	-infinity
45	3278	-infinity
46	3629	-infinity
47	2966	-infinity
48	2967	-infinity
49	2671	-infinity
50	3279	-infinity
51	2968	-infinity
52	3630	-infinity
53	2672	-infinity
56	3280	-infinity
57	2969	-infinity
58	3281	-infinity
59	3631	-infinity
60	3632	-infinity
61	2970	-infinity
62	3282	-infinity
63	2971	-infinity
64	3633	-infinity
65	2673	-infinity
66	3634	-infinity
67	2674	-infinity
68	3635	-infinity
69	2972	-infinity
70	3283	-infinity
71	3636	-infinity
72	2675	-infinity
73	2973	-infinity
74	2974	-infinity
75	3284	-infinity
76	3285	-infinity
77	3637	-infinity
78	3286	-infinity
79	2676	-infinity
80	3638	-infinity
81	3639	-infinity
82	3287	-infinity
83	3288	-infinity
84	2677	-infinity
85	3640	-infinity
86	3641	-infinity
87	2678	-infinity
88	2977	-infinity
89	2679	-infinity
90	2680	-infinity
91	2978	-infinity
92	2681	-infinity
93	3642	-infinity
94	2682	-infinity
95	3290	-infinity
96	3291	-infinity
97	2979	-infinity
98	3643	-infinity
99	2980	-infinity
100	3292	-infinity
101	2683	-infinity
102	3644	-infinity
103	2981	-infinity
104	3293	-infinity
105	2684	-infinity
106	3645	-infinity
107	2685	-infinity
108	3294	-infinity
109	2982	-infinity
110	2983	-infinity
111	3296	-infinity
112	2984	-infinity
113	3297	-infinity
114	3646	-infinity
115	3298	-infinity
116	3647	-infinity
117	3299	-infinity
118	3648	-infinity
119	2985	-infinity
120	2986	-infinity
121	3649	-infinity
122	3300	-infinity
123	3650	-infinity
124	2686	-infinity
125	2987	-infinity
126	3301	-infinity
127	2988	-infinity
128	2687	-infinity
129	2688	-infinity
130	3302	-infinity
131	3651	-infinity
132	2689	-infinity
133	2690	-infinity
134	2691	-infinity
135	2989	-infinity
136	3303	-infinity
137	2692	-infinity
138	2990	-infinity
139	3304	-infinity
140	3652	-infinity
141	3653	-infinity
142	3305	-infinity
143	2693	-infinity
144	3654	-infinity
145	2991	-infinity
146	2992	-infinity
147	2993	-infinity
148	2694	-infinity
149	3655	-infinity
150	3306	-infinity
151	3656	-infinity
152	2695	-infinity
153	3266	-infinity
154	3265	-infinity
155	2955	-infinity
156	3619	-infinity
157	3618	-infinity
158	3617	-infinity
159	2954	-infinity
160	2953	-infinity
161	3940	-infinity
162	2952	-infinity
163	3939	-infinity
164	3196	-infinity
165	3529	-infinity
166	3657	-infinity
167	2994	-infinity
168	3658	-infinity
169	2879	-infinity
170	3307	-infinity
171	3197	-infinity
172	3308	-infinity
173	3309	-infinity
174	2880	-infinity
175	3660	-infinity
176	2696	-infinity
177	3874	-infinity
178	3661	-infinity
179	3662	-infinity
180	2697	-infinity
181	3310	-infinity
182	3663	-infinity
183	2881	-infinity
184	3311	-infinity
185	3875	-infinity
186	2995	-infinity
187	2882	-infinity
188	3312	-infinity
189	2997	-infinity
190	3313	-infinity
191	3530	-infinity
192	2998	-infinity
193	3314	-infinity
194	2999	-infinity
195	3531	-infinity
196	3664	-infinity
197	3315	-infinity
198	3532	-infinity
199	3316	-infinity
200	2883	-infinity
201	3533	-infinity
202	2698	-infinity
203	3317	-infinity
204	3198	-infinity
205	2699	-infinity
206	3199	-infinity
207	3665	-infinity
208	3000	-infinity
209	3534	-infinity
210	3666	-infinity
211	3667	-infinity
212	3200	-infinity
213	2700	-infinity
214	3535	-infinity
215	2701	-infinity
216	3318	-infinity
217	3876	-infinity
218	3319	-infinity
219	3001	-infinity
220	2702	-infinity
221	3002	-infinity
222	3003	-infinity
223	2703	-infinity
224	3004	-infinity
225	3320	-infinity
226	2704	-infinity
227	3321	-infinity
228	3536	-infinity
229	2705	-infinity
230	3668	-infinity
231	2884	-infinity
232	2706	-infinity
233	3322	-infinity
234	3201	-infinity
235	3537	-infinity
236	3538	-infinity
237	3202	-infinity
238	2975	-infinity
239	3877	-infinity
240	3289	-infinity
241	2885	-infinity
242	3295	-infinity
243	3203	-infinity
244	3659	-infinity
245	3204	-infinity
246	2976	-infinity
247	2886	-infinity
248	3878	-infinity
249	3879	-infinity
250	2707	-infinity
251	2708	-infinity
252	3539	-infinity
253	3323	-infinity
254	3880	-infinity
255	2709	-infinity
256	3205	-infinity
257	3324	-infinity
258	2710	-infinity
259	3206	-infinity
260	3005	-infinity
261	2887	-infinity
262	3325	-infinity
263	2888	-infinity
264	3540	-infinity
265	3881	-infinity
266	2889	-infinity
267	3541	-infinity
268	2891	-infinity
269	3326	-infinity
270	3327	-infinity
271	3882	-infinity
272	2711	-infinity
273	3542	-infinity
274	2712	-infinity
275	3328	-infinity
276	3883	-infinity
277	3006	-infinity
278	3543	-infinity
279	3329	-infinity
280	3669	-infinity
281	3207	-infinity
282	3007	-infinity
283	3670	-infinity
284	3885	-infinity
285	3008	-infinity
286	2713	-infinity
287	2892	-infinity
288	3671	-infinity
289	3330	-infinity
290	2893	-infinity
291	3672	-infinity
292	3331	-infinity
293	3544	-infinity
294	3009	-infinity
295	2714	-infinity
296	3545	-infinity
297	2715	-infinity
298	3010	-infinity
299	3673	-infinity
300	3886	-infinity
301	3011	-infinity
302	3332	-infinity
303	3887	-infinity
304	3333	-infinity
305	3675	-infinity
338	3012	-infinity
339	3334	-infinity
340	2716	-infinity
341	3676	-infinity
342	3546	-infinity
343	3677	-infinity
344	3678	-infinity
345	3884	-infinity
346	3013	-infinity
347	2894	-infinity
348	3014	-infinity
349	3208	-infinity
350	2717	-infinity
351	3547	-infinity
352	3548	-infinity
353	3015	-infinity
354	3679	-infinity
355	3549	-infinity
356	3680	-infinity
357	3550	-infinity
358	3335	-infinity
359	3551	-infinity
360	2718	-infinity
361	3888	-infinity
362	3016	-infinity
363	3209	-infinity
364	3210	-infinity
365	3211	-infinity
366	2895	-infinity
367	3889	-infinity
368	3681	-infinity
369	2896	-infinity
370	3682	-infinity
371	3336	-infinity
372	3890	-infinity
373	3552	-infinity
374	3017	-infinity
375	3553	-infinity
376	2719	-infinity
377	3891	-infinity
378	3018	-infinity
379	3337	-infinity
380	3338	-infinity
381	2720	-infinity
382	3683	-infinity
383	2721	-infinity
384	3684	-infinity
385	3019	-infinity
386	3685	-infinity
387	3686	-infinity
388	3339	-infinity
389	3020	-infinity
390	3340	-infinity
391	2722	-infinity
392	3021	-infinity
393	3554	-infinity
394	3022	-infinity
395	3212	-infinity
396	3687	-infinity
397	3688	-infinity
398	3892	-infinity
399	3023	-infinity
400	3024	-infinity
401	3555	-infinity
402	3025	-infinity
403	3026	-infinity
404	3556	-infinity
405	3689	-infinity
406	3027	-infinity
407	2897	-infinity
408	2723	-infinity
409	3341	-infinity
410	3690	-infinity
411	3557	-infinity
412	2724	-infinity
413	2898	-infinity
414	3342	-infinity
415	2725	-infinity
416	3558	-infinity
417	3343	-infinity
418	3213	-infinity
419	3214	-infinity
420	3691	-infinity
421	3029	-infinity
422	3344	-infinity
423	3559	-infinity
424	3894	-infinity
425	3030	-infinity
426	3217	-infinity
427	3692	-infinity
428	3560	-infinity
429	3345	-infinity
430	2900	-infinity
431	3031	-infinity
432	3346	-infinity
433	2726	-infinity
434	2901	-infinity
435	3693	-infinity
436	3561	-infinity
437	3347	-infinity
438	3032	-infinity
439	2902	-infinity
440	3694	-infinity
441	2727	-infinity
442	2903	-infinity
443	2904	-infinity
444	3218	-infinity
445	3562	-infinity
446	2905	-infinity
447	2906	-infinity
448	3564	-infinity
449	3565	-infinity
450	3219	-infinity
451	2907	-infinity
452	3220	-infinity
453	2908	-infinity
454	3566	-infinity
455	3221	-infinity
456	3033	-infinity
457	3222	-infinity
458	3695	-infinity
459	2728	-infinity
460	3348	-infinity
461	3034	-infinity
462	3349	-infinity
463	3350	-infinity
464	3351	-infinity
465	3035	-infinity
466	3696	-infinity
467	2729	-infinity
468	3352	-infinity
469	2890	-infinity
470	2730	-infinity
471	3697	-infinity
472	3563	-infinity
473	2731	-infinity
474	2899	-infinity
475	3353	-infinity
476	2732	-infinity
477	3698	-infinity
478	3216	-infinity
479	2733	-infinity
480	3215	-infinity
481	2734	-infinity
482	3036	-infinity
483	3893	-infinity
484	3699	-infinity
485	3700	-infinity
486	2735	-infinity
487	3354	-infinity
520	3037	-infinity
521	3701	-infinity
522	3355	-infinity
523	3038	-infinity
524	3702	-infinity
525	3356	-infinity
526	3357	-infinity
527	2736	-infinity
528	3039	-infinity
529	2737	-infinity
530	3703	-infinity
531	3223	-infinity
532	3358	-infinity
533	2738	-infinity
534	3567	-infinity
535	3704	-infinity
536	2739	-infinity
537	2909	-infinity
538	3705	-infinity
539	3359	-infinity
540	3895	-infinity
541	3706	-infinity
542	3040	-infinity
543	3224	-infinity
544	3360	-infinity
545	3707	-infinity
546	3896	-infinity
547	3568	-infinity
548	3361	-infinity
549	3569	-infinity
550	3041	-infinity
551	3708	-infinity
552	3897	-infinity
553	3709	-infinity
554	3225	-infinity
555	2910	-infinity
556	3710	-infinity
557	3898	-infinity
558	2740	-infinity
559	3362	-infinity
560	3899	-infinity
561	2911	-infinity
562	3363	-infinity
563	3570	-infinity
564	3364	-infinity
565	3226	-infinity
566	2741	-infinity
567	3571	-infinity
568	3365	-infinity
569	3711	-infinity
570	2912	-infinity
571	3712	-infinity
572	3227	-infinity
573	3366	-infinity
606	3572	-infinity
607	3573	-infinity
608	3228	-infinity
609	3574	-infinity
610	3575	-infinity
611	3576	-infinity
612	3229	-infinity
613	3577	-infinity
614	2913	-infinity
615	3578	-infinity
616	3579	-infinity
617	3230	-infinity
618	2914	-infinity
619	3900	-infinity
620	3901	-infinity
621	2915	-infinity
622	3902	-infinity
623	2916	-infinity
624	3580	-infinity
625	3231	-infinity
626	3903	-infinity
627	2917	-infinity
628	3581	-infinity
629	3582	-infinity
630	2918	-infinity
631	3713	-infinity
632	3714	-infinity
633	2742	-infinity
634	3715	-infinity
635	3716	-infinity
636	3042	-infinity
637	3043	-infinity
638	3717	-infinity
639	3507	-infinity
640	3044	-infinity
641	2743	-infinity
642	3718	-infinity
643	3369	-infinity
644	3370	-infinity
645	2744	-infinity
646	3045	-infinity
647	3371	-infinity
648	3046	-infinity
649	2919	-infinity
650	3372	-infinity
651	3373	-infinity
652	3583	-infinity
653	2745	-infinity
654	3584	-infinity
655	2746	-infinity
656	2920	-infinity
657	3374	-infinity
658	3719	-infinity
659	3904	-infinity
660	2747	-infinity
661	3905	-infinity
662	3047	-infinity
663	3048	-infinity
664	3232	-infinity
665	3375	-infinity
666	3906	-infinity
667	3049	-infinity
668	3907	-infinity
669	3376	-infinity
670	2748	-infinity
671	3908	-infinity
672	2749	-infinity
673	3909	-infinity
674	3377	-infinity
675	3720	-infinity
676	2921	-infinity
677	2750	-infinity
709	3050	-infinity
710	3051	-infinity
711	3585	-infinity
712	3721	-infinity
713	2923	-infinity
714	3052	-infinity
715	3233	-infinity
716	2924	-infinity
717	3053	-infinity
718	3586	-infinity
719	3378	-infinity
749	2925	-infinity
750	3054	-infinity
751	3587	-infinity
752	3379	-infinity
753	3380	-infinity
754	3910	-infinity
755	2751	-infinity
782	2926	-infinity
783	2752	-infinity
784	2927	-infinity
785	3722	-infinity
786	2753	-infinity
787	3234	-infinity
788	3381	-infinity
789	3235	-infinity
790	3382	-infinity
791	2928	-infinity
792	3055	-infinity
824	3588	-infinity
825	3723	-infinity
826	3236	-infinity
827	3724	-infinity
857	3056	-infinity
858	3057	-infinity
859	3725	-infinity
890	2929	-infinity
891	3726	-infinity
892	3383	-infinity
893	3590	-infinity
894	3058	-infinity
895	3059	-infinity
896	3912	-infinity
897	3727	-infinity
898	3384	-infinity
899	2930	-infinity
900	3385	-infinity
901	3386	-infinity
902	2754	-infinity
903	3728	-infinity
904	3237	-infinity
905	3060	-infinity
906	3387	-infinity
907	3913	-infinity
908	3062	-infinity
909	3914	-infinity
910	3729	-infinity
911	3238	-infinity
912	3388	-infinity
913	3591	-infinity
914	3730	-infinity
915	3915	-infinity
916	3063	-infinity
944	3239	-infinity
945	3592	-infinity
946	2755	-infinity
947	3240	-infinity
948	3731	-infinity
949	2931	-infinity
950	3732	-infinity
951	3594	-infinity
952	2756	-infinity
953	3916	-infinity
954	3389	-infinity
955	3390	-infinity
956	3917	-infinity
957	3064	-infinity
958	2932	-infinity
959	2757	-infinity
960	3241	-infinity
961	3391	-infinity
962	3734	-infinity
963	3242	-infinity
964	3735	-infinity
965	3243	-infinity
966	3736	-infinity
967	3065	-infinity
968	3918	-infinity
969	3737	-infinity
970	2933	-infinity
971	3392	-infinity
972	3244	-infinity
973	2934	-infinity
974	3595	-infinity
1006	3245	-infinity
1007	2935	-infinity
1008	3596	-infinity
1009	3066	-infinity
1010	3911	-infinity
1011	3738	-infinity
1012	2758	-infinity
1013	3589	-infinity
1014	3593	-infinity
1015	3067	-infinity
1016	2759	-infinity
1017	3733	-infinity
1018	3739	-infinity
1019	3393	-infinity
1020	3068	-infinity
1021	3740	-infinity
1022	3069	-infinity
1023	2760	-infinity
1024	3246	-infinity
1025	2761	-infinity
1026	3070	-infinity
1027	3247	-infinity
1059	3761	-infinity
1060	3396	-infinity
1061	3742	-infinity
1062	3597	-infinity
1063	3743	-infinity
1064	2936	-infinity
1065	2762	-infinity
1066	3071	-infinity
1067	3598	-infinity
1068	3397	-infinity
1069	3919	-infinity
1070	3744	-infinity
1071	3072	-infinity
1072	3248	-infinity
1073	3745	-infinity
1074	3073	-infinity
1075	2937	-infinity
1076	3398	-infinity
1077	3400	-infinity
1078	2938	-infinity
1079	2763	-infinity
1080	3746	-infinity
1081	2939	-infinity
1082	3074	-infinity
1083	3075	-infinity
1084	3920	-infinity
1085	3401	-infinity
1086	3076	-infinity
1087	3922	-infinity
1088	2764	-infinity
1089	3402	-infinity
1090	3921	-infinity
1091	3747	-infinity
1092	3748	-infinity
1093	3749	-infinity
1094	2765	-infinity
1095	3750	-infinity
1096	2766	-infinity
1097	3078	-infinity
1098	3079	-infinity
1099	2922	-infinity
1100	2767	-infinity
1101	3751	-infinity
1102	2768	-infinity
1103	2940	-infinity
1104	3403	-infinity
1105	3599	-infinity
1106	3752	-infinity
1107	3923	-infinity
1108	3600	-infinity
1109	3601	-infinity
1110	3249	-infinity
1111	3250	-infinity
1112	2770	-infinity
1113	2941	-infinity
1114	3753	-infinity
1115	2771	-infinity
1116	3251	-infinity
1117	2772	-infinity
1118	3754	-infinity
1119	3924	-infinity
1120	2773	-infinity
1121	3755	-infinity
1122	2774	-infinity
1123	3080	-infinity
1124	3081	-infinity
1125	2942	-infinity
1126	3756	-infinity
1127	3925	-infinity
1128	3404	-infinity
1129	3405	-infinity
1130	3253	-infinity
1162	3757	-infinity
1163	3082	-infinity
1164	2775	-infinity
1165	3602	-infinity
1166	3083	-infinity
1167	2776	-infinity
1168	2777	-infinity
1169	3406	-infinity
1170	3758	-infinity
1171	3407	-infinity
1172	3254	-infinity
1173	3408	-infinity
1174	3926	-infinity
1175	3759	-infinity
1176	3084	-infinity
1177	3927	-infinity
1178	3603	-infinity
1179	3928	-infinity
1180	2943	-infinity
1181	2944	-infinity
1182	3929	-infinity
1183	2945	-infinity
1184	3604	-infinity
1185	3255	-infinity
1186	3256	-infinity
1187	3930	-infinity
1188	3931	-infinity
1189	3605	-infinity
1190	3932	-infinity
1191	2947	-infinity
1192	3933	-infinity
1193	3934	-infinity
1194	3257	-infinity
1195	3258	-infinity
1196	3606	-infinity
1197	3252	-infinity
1198	2946	-infinity
1199	2948	-infinity
1200	3935	-infinity
1201	3259	-infinity
1202	3260	-infinity
1203	3760	-infinity
1204	3085	-infinity
1205	3607	-infinity
1206	2778	-infinity
1207	3409	-infinity
1208	3608	-infinity
1209	2779	-infinity
1210	3410	-infinity
1211	3261	-infinity
1212	3086	-infinity
1213	3936	-infinity
1214	3087	-infinity
1215	2949	-infinity
1216	3762	-infinity
1217	3411	-infinity
1218	3937	-infinity
1219	2780	-infinity
1220	3763	-infinity
1221	2950	-infinity
1222	3764	-infinity
1223	2781	-infinity
1224	3412	-infinity
1225	3262	-infinity
1226	2782	-infinity
1228	2783	-infinity
1229	3413	-infinity
1230	3765	-infinity
1231	3414	-infinity
1232	3938	-infinity
1233	3088	-infinity
1234	3415	-infinity
1235	3609	-infinity
1236	2784	-infinity
1237	2785	-infinity
1238	3610	-infinity
1239	3089	-infinity
1240	2951	-infinity
1241	2786	-infinity
1242	3416	-infinity
1243	3417	-infinity
1244	3611	-infinity
1245	3766	-infinity
1246	3090	-infinity
1247	3612	-infinity
1248	2787	-infinity
1249	3613	-infinity
1250	3418	-infinity
1251	3091	-infinity
1252	3614	-infinity
1253	3767	-infinity
1254	3615	-infinity
1255	2788	-infinity
1256	3419	-infinity
1257	3263	-infinity
1258	3768	-infinity
1259	3616	-infinity
1260	3420	-infinity
1261	3092	-infinity
1262	3264	-infinity
1263	3093	-infinity
1264	3421	-infinity
1265	3094	-infinity
1266	3422	-infinity
1267	3095	-infinity
1268	3769	-infinity
1269	3770	-infinity
1270	2789	-infinity
1271	3096	-infinity
1272	3423	-infinity
1273	3097	-infinity
1274	3424	-infinity
1275	3425	-infinity
1276	3771	-infinity
1305	2790	-infinity
1306	2791	-infinity
1307	3129	-infinity
1308	3098	-infinity
1309	3772	-infinity
1310	2792	-infinity
1311	3099	-infinity
1312	3100	-infinity
1313	3773	-infinity
1314	3774	-infinity
1315	3775	-infinity
1316	3426	-infinity
1317	3427	-infinity
1318	3428	-infinity
1319	3429	-infinity
1320	3101	-infinity
1321	3776	-infinity
1322	2793	-infinity
1323	2794	-infinity
1324	2795	-infinity
1325	3777	-infinity
1326	3102	-infinity
1327	3778	-infinity
1328	3103	-infinity
1329	3430	-infinity
1330	3104	-infinity
1331	2796	-infinity
1332	3105	-infinity
1333	3431	-infinity
1334	3106	-infinity
1335	2797	-infinity
1336	3107	-infinity
1337	3108	-infinity
1338	3779	-infinity
1339	3432	-infinity
1340	3780	-infinity
1341	3433	-infinity
1342	2798	-infinity
1343	3781	-infinity
1344	2799	-infinity
1345	2800	-infinity
1346	3109	-infinity
1347	3110	-infinity
1348	2801	-infinity
1349	3782	-infinity
1350	3434	-infinity
1351	2802	-infinity
1352	3435	-infinity
1353	3111	-infinity
1354	3112	-infinity
1355	3783	-infinity
1356	2803	-infinity
1357	2849	-infinity
1358	3784	-infinity
1359	3157	-infinity
1360	3436	-infinity
1388	3785	-infinity
1389	3437	-infinity
1390	3113	-infinity
1391	3786	-infinity
1392	3787	-infinity
1393	3438	-infinity
1394	2850	-infinity
1395	3788	-infinity
1396	3439	-infinity
1397	3831	-infinity
1398	2851	-infinity
1399	2804	-infinity
1400	3114	-infinity
1401	3832	-infinity
1402	2805	-infinity
1403	3789	-infinity
1404	3158	-infinity
1405	3440	-infinity
1406	2806	-infinity
1407	3159	-infinity
1408	3790	-infinity
1409	3833	-infinity
1410	2807	-infinity
1411	3791	-infinity
1412	3834	-infinity
1413	3792	-infinity
1414	2852	-infinity
1415	3835	-infinity
1416	3115	-infinity
1417	3492	-infinity
1418	3116	-infinity
1419	3793	-infinity
1420	3493	-infinity
1421	3441	-infinity
1422	3494	-infinity
1423	3794	-infinity
1424	3442	-infinity
1425	3495	-infinity
1426	2808	-infinity
1427	3496	-infinity
1428	2809	-infinity
1429	3443	-infinity
1430	3160	-infinity
1431	3117	-infinity
1432	3118	-infinity
1433	3497	-infinity
1434	2810	-infinity
1435	3498	-infinity
1436	3444	-infinity
1437	2811	-infinity
1438	3119	-infinity
1439	3161	-infinity
1440	3795	-infinity
1441	3445	-infinity
1442	3446	-infinity
1443	3162	-infinity
1444	3447	-infinity
1445	3448	-infinity
1446	2812	-infinity
1447	2813	-infinity
1448	2814	-infinity
1449	3120	-infinity
1450	2853	-infinity
1451	3121	-infinity
1452	2854	-infinity
1453	3499	-infinity
1454	2815	-infinity
1455	2855	-infinity
1456	3796	-infinity
1457	3449	-infinity
1458	3500	-infinity
1459	3450	-infinity
1460	3501	-infinity
1461	2816	-infinity
1462	3122	-infinity
1463	3451	-infinity
1464	3836	-infinity
1465	2817	-infinity
1466	3837	-infinity
1467	3123	-infinity
1468	3797	-infinity
1469	3163	-infinity
1470	3798	-infinity
1471	3839	-infinity
1472	2818	-infinity
1473	3838	-infinity
1474	2819	-infinity
1475	3124	-infinity
1476	2856	-infinity
1477	2820	-infinity
1478	3840	-infinity
1479	3799	-infinity
1480	2821	-infinity
1481	3502	-infinity
1482	3125	-infinity
1483	3453	-infinity
1484	3454	-infinity
1485	2822	-infinity
1486	2857	-infinity
1487	3455	-infinity
1488	3456	-infinity
1489	3457	-infinity
1490	3126	-infinity
1491	2858	-infinity
1492	3800	-infinity
1493	2823	-infinity
1494	3127	-infinity
1495	3458	-infinity
1496	3459	-infinity
1497	3801	-infinity
1498	3460	-infinity
1499	3461	-infinity
1500	2824	-infinity
1501	2825	-infinity
1502	3128	-infinity
1503	3802	-infinity
1504	3462	-infinity
1505	2826	-infinity
1533	3164	-infinity
1534	3463	-infinity
1566	3503	-infinity
1567	3130	-infinity
1568	3803	-infinity
1569	3165	-infinity
1570	2827	-infinity
1571	3804	-infinity
1572	3841	-infinity
1573	3132	-infinity
1574	3805	-infinity
1575	3842	-infinity
1576	2828	-infinity
1577	3806	-infinity
1578	3133	-infinity
1579	3166	-infinity
1580	3504	-infinity
1581	3167	-infinity
1582	3843	-infinity
1583	3168	-infinity
1584	2859	-infinity
1585	3169	-infinity
1586	3134	-infinity
1587	3844	-infinity
1588	3135	-infinity
1589	3505	-infinity
1590	3464	-infinity
1591	3170	-infinity
1592	2829	-infinity
1593	3845	-infinity
1594	3807	-infinity
1595	2860	-infinity
1596	3137	-infinity
1597	3465	-infinity
1598	3171	-infinity
1599	3138	-infinity
1600	3808	-infinity
1601	3172	-infinity
1602	2861	-infinity
1603	2830	-infinity
1604	3506	-infinity
1605	3466	-infinity
1606	3467	-infinity
1607	2862	-infinity
1608	3468	-infinity
1609	3846	-infinity
1610	3809	-infinity
1611	3847	-infinity
1612	3469	-infinity
1613	3173	-infinity
1614	2831	-infinity
1615	3470	-infinity
1616	2863	-infinity
1617	3810	-infinity
1618	3471	-infinity
1619	3508	-infinity
1620	3811	-infinity
1621	3848	-infinity
1622	3509	-infinity
1623	3812	-infinity
1624	3510	-infinity
1625	3139	-infinity
1626	2864	-infinity
1627	3140	-infinity
1628	3174	-infinity
1629	2833	-infinity
1630	3813	-infinity
1631	3175	-infinity
1632	3814	-infinity
1633	3176	-infinity
1634	3141	-infinity
1635	3849	-infinity
1636	2834	-infinity
1637	2835	-infinity
1638	3815	-infinity
1661	3850	-infinity
1662	3511	-infinity
1663	3142	-infinity
1664	3143	-infinity
1665	3144	-infinity
1666	2836	-infinity
1667	3816	-infinity
1668	2837	-infinity
1669	3145	-infinity
1670	3146	-infinity
1671	3147	-infinity
1672	3817	-infinity
1673	3472	-infinity
1674	3473	-infinity
1675	3474	-infinity
1676	2838	-infinity
1677	3818	-infinity
1678	2839	-infinity
1679	3475	-infinity
1680	3148	-infinity
1681	3819	-infinity
1682	3820	-infinity
1683	3476	-infinity
1684	3149	-infinity
1685	3478	-infinity
1686	2840	-infinity
1687	3150	-infinity
1688	3821	-infinity
1689	2841	-infinity
1690	3479	-infinity
1691	2842	-infinity
1692	3480	-infinity
1693	3822	-infinity
1694	3151	-infinity
1695	3823	-infinity
1696	2843	-infinity
1697	3481	-infinity
1698	3824	-infinity
1699	3152	-infinity
1700	3825	-infinity
1701	3482	-infinity
1702	3826	-infinity
1703	2844	-infinity
1704	3483	-infinity
1705	3851	-infinity
1706	3177	-infinity
1707	3178	-infinity
1708	3512	-infinity
1709	2865	-infinity
1710	3513	-infinity
1711	3514	-infinity
1712	3484	-infinity
1713	3485	-infinity
1714	2866	-infinity
1715	3827	-infinity
1716	2867	-infinity
1717	2845	-infinity
1718	3153	-infinity
1719	3179	-infinity
1720	3154	-infinity
1721	3515	-infinity
1722	3155	-infinity
1723	3486	-infinity
1724	3516	-infinity
1725	3828	-infinity
1726	3517	-infinity
1727	3487	-infinity
1728	3852	-infinity
1729	3488	-infinity
1730	2846	-infinity
1731	2847	-infinity
1732	3829	-infinity
1733	3853	-infinity
1734	3489	-infinity
1735	3180	-infinity
1736	3830	-infinity
1737	3490	-infinity
1738	3181	-infinity
1739	3182	-infinity
1740	3854	-infinity
1741	3183	-infinity
1742	3184	-infinity
1743	2868	-infinity
1744	3156	-infinity
1745	2848	-infinity
1746	3855	-infinity
1747	3491	-infinity
1748	3518	-infinity
1749	3186	-infinity
1750	3187	-infinity
1751	3519	-infinity
1752	3188	-infinity
1753	3521	-infinity
1754	3185	-infinity
1755	3522	-infinity
1756	3523	-infinity
1757	2871	-infinity
1758	3856	-infinity
1759	3864	-infinity
1760	2869	-infinity
1761	3865	-infinity
1762	3866	-infinity
1763	3857	-infinity
1764	3867	-infinity
1765	2872	-infinity
1766	2870	-infinity
1767	3524	-infinity
1768	3189	-infinity
1769	3525	-infinity
1770	3858	-infinity
1771	3868	-infinity
1772	3526	-infinity
1773	3859	-infinity
1774	3869	-infinity
1775	2873	-infinity
1776	3860	-infinity
1777	3190	-infinity
1778	3527	-infinity
1779	3861	-infinity
1780	2874	-infinity
1781	3862	-infinity
1808	2875	-infinity
1809	2876	-infinity
1841	3863	-infinity
1842	3528	-infinity
1843	3520	-infinity
1844	3191	-infinity
1845	3870	-infinity
1846	2877	-infinity
1847	3871	-infinity
1848	3872	-infinity
1849	3192	-infinity
1850	3193	-infinity
1851	3194	-infinity
1852	3873	-infinity
1853	3195	-infinity
1854	2878	-infinity
1855	2996	-infinity
1856	3674	-infinity
1888	3028	-infinity
1889	3367	-infinity
1890	3368	-infinity
1891	3061	-infinity
1892	3394	-infinity
1893	3395	-infinity
1894	3741	-infinity
1895	3077	-infinity
1896	2769	-infinity
1897	3452	-infinity
1898	3131	-infinity
1899	3136	-infinity
1900	2832	-infinity
1901	3477	-infinity
1902	3399	-infinity
1903	3945	-infinity
1906	3944	2024-10-20 00:52:50.509615+00
1907	3949	2024-10-22 05:44:58.444236+00
1908	8488	2024-10-22 16:13:17.423992+00
1909	7958	2024-10-22 16:13:45.239662+00
1910	8116	2024-10-22 16:14:08.272011+00
1911	8295	2024-10-22 16:14:20.490604+00
1912	8223	2024-10-22 16:14:29.810264+00
1913	8250	2024-10-22 16:14:41.858304+00
1914	8138	2024-10-22 16:15:26.667295+00
1915	8514	2024-10-22 16:15:54.138139+00
1916	8229	2024-10-22 16:16:14.132029+00
1917	8486	2024-10-22 16:16:18.211368+00
1918	7989	2024-10-22 16:16:23.81095+00
1919	8528	2024-10-22 16:16:49.661262+00
1920	8127	2024-10-22 16:17:13.28214+00
1921	8517	2024-10-22 16:17:22.878795+00
1922	8203	2024-10-22 16:17:23.83139+00
1923	8281	2024-10-22 16:17:24.064622+00
1924	8430	2024-10-22 16:17:36.374681+00
1925	8326	2024-10-22 16:17:45.91375+00
1926	8469	2024-10-22 16:17:47.881529+00
1927	8070	2024-10-22 16:17:56.167294+00
1928	8260	2024-10-22 16:18:49.117535+00
1929	8113	2024-10-22 16:19:18.457577+00
1930	8091	2024-10-22 16:19:34.448505+00
1931	8022	2024-10-22 16:19:41.476303+00
1932	7969	2024-10-22 16:20:21.326189+00
1933	8092	2024-10-22 16:20:40.287687+00
1934	8082	2024-10-22 16:20:41.923765+00
1935	8242	2024-10-22 16:20:45.463869+00
1936	8140	2024-10-22 16:20:46.299394+00
1937	8273	2024-10-22 16:21:12.880114+00
1938	8502	2024-10-22 16:21:37.921174+00
1939	8165	2024-10-22 16:21:37.999746+00
1940	8412	2024-10-22 16:21:41.586534+00
1941	8360	2024-10-22 16:21:43.913133+00
1942	8156	2024-10-22 16:22:14.705774+00
1943	8350	2024-10-22 16:22:39.231171+00
1944	7996	2024-10-22 16:32:45.798312+00
1945	8174	2024-10-22 16:38:37.65983+00
1946	8088	2024-10-22 16:38:41.178892+00
1947	8011	2024-10-22 16:44:18.171946+00
1948	8512	2024-10-22 17:03:42.323959+00
1949	8424	2024-10-22 17:04:11.303221+00
1950	8058	2024-10-22 17:04:17.771189+00
1951	8119	2024-10-22 17:04:18.74177+00
1952	8455	2024-10-22 17:04:24.41365+00
1953	8005	2024-10-22 17:05:04.940245+00
1954	8276	2024-10-22 17:05:33.433685+00
1955	8062	2024-10-22 17:06:20.250308+00
1956	8341	2024-10-22 17:07:33.465552+00
1957	8202	2024-10-22 17:10:49.235175+00
1958	8153	2024-10-22 17:11:15.516978+00
1959	8337	2024-10-22 17:12:06.86414+00
1960	7987	2024-10-22 17:12:35.007781+00
1961	8114	2024-10-22 17:13:19.802503+00
1962	8470	2024-10-22 17:13:38.885192+00
1963	8099	2024-10-22 17:14:42.803966+00
1964	8263	2024-10-22 17:15:39.69956+00
1965	8036	2024-10-22 17:17:55.055457+00
1966	8406	2024-10-22 17:19:13.425896+00
1967	8124	2024-10-22 17:19:50.28496+00
1968	8211	2024-10-22 17:20:32.217364+00
1969	8141	2024-10-22 17:21:29.401829+00
1970	8187	2024-10-22 17:21:38.035719+00
1971	8472	2024-10-22 17:21:45.906328+00
1972	8155	2024-10-22 17:22:02.81407+00
1973	8294	2024-10-22 17:22:22.31961+00
1974	8454	2024-10-22 17:23:45.813629+00
1975	8446	2024-10-22 17:40:58.953506+00
1976	8268	2024-10-22 19:33:34.808516+00
1977	8162	2024-10-22 21:06:32.173455+00
1978	8330	2024-10-22 21:06:54.962832+00
1979	8170	2024-10-22 21:07:05.84769+00
1980	8308	2024-10-22 21:07:15.111604+00
1981	8232	2024-10-22 21:07:18.747175+00
1982	8178	2024-10-22 21:07:44.794708+00
1983	8059	2024-10-22 21:07:50.920922+00
1984	8292	2024-10-22 21:07:55.967038+00
1985	8297	2024-10-22 21:07:59.535985+00
1986	8504	2024-10-22 21:08:07.657524+00
1987	8475	2024-10-22 21:08:09.097733+00
1988	8338	2024-10-22 21:08:13.035181+00
1989	8180	2024-10-22 21:08:13.58903+00
1990	8148	2024-10-22 21:08:28.287856+00
1991	8941	2024-10-22 21:08:29.177818+00
1992	8509	2024-10-22 21:08:53.011058+00
1993	8388	2024-10-22 21:08:58.529209+00
1994	8073	2024-10-22 21:08:59.189784+00
1995	8300	2024-10-22 21:09:05.349977+00
1996	8236	2024-10-22 21:09:15.132944+00
1997	8319	2024-10-22 21:09:17.415997+00
1998	8474	2024-10-22 21:09:49.630102+00
1999	8117	2024-10-22 21:09:56.563943+00
2000	8311	2024-10-22 21:10:09.07741+00
2001	8510	2024-10-22 21:10:12.013472+00
2002	9497	2024-10-22 22:46:18.044571+00
2003	8108	2024-10-22 23:39:23.224069+00
2004	8530	2024-10-23 01:08:14.484002+00
2005	8093	2024-10-23 01:24:19.071536+00
2006	7971	2024-10-23 18:49:40.458584+00
2007	7972	2024-10-23 18:50:24.239007+00
2008	8120	2024-10-23 18:51:16.080179+00
2009	8813	2024-10-23 18:53:33.405467+00
2010	8161	2024-10-23 18:55:02.03457+00
2011	8079	2024-10-23 18:55:55.929729+00
2012	8049	2024-10-23 18:56:44.454228+00
2013	8172	2024-10-23 18:57:56.387203+00
2014	8184	2024-10-23 18:58:22.312003+00
2015	8030	2024-10-23 18:58:56.882125+00
2016	9073	2024-10-23 18:59:08.855402+00
2017	7998	2024-10-23 20:29:00.362251+00
2018	8275	2024-10-23 20:29:49.785936+00
2019	8490	2024-10-23 20:30:32.948572+00
2020	8045	2024-10-23 20:30:43.317647+00
2021	8200	2024-10-23 20:31:01.063132+00
2022	8376	2024-10-23 20:32:06.306763+00
2023	8301	2024-10-24 15:38:25.199558+00
\.


--
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: careerday
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20240716203822_PostgresInitial	8.0.7
20240805030935_PublicIdAdded	8.0.7
20240805233740_UpdatingCareer	8.0.7
20240813135053_CasadeDeleteSpeakerAddress	8.0.7
20240813140750_CasadeDeleteSpeakerAddress2	8.0.7
20240814011529_UpdatingSchools	8.0.7
20240816001019_UpdatingCareers	8.0.7
20240816034717_UpdatingCareers2	8.0.7
20240823200029_updatingEvents	8.0.7
20240830004058_addCareersToEventRelationship	8.0.7
20240830062333_addingCareerSets	8.0.7
20240830221231_addingCareerSets2	8.0.7
20240830222035_addingCareerSets3	8.0.7
20240906210507_updatingStudents	8.0.7
20240910214421_addingGuidToEvent	8.0.7
20240915221318_addingSurvey	8.0.7
20240915221605_addingSurvey2	8.0.7
20240915234001_addingSurvey3	8.0.7
20240916003054_addingSurvey4	8.0.7
20240916005504_addingSurvey5	8.0.7
20240916015805_addingSurvey6	8.0.7
20240916223419_addingQRCode	8.0.7
20240917021734_removingNameDescRequired	8.0.7
20240919233354_updatingClassroom	8.0.7
20240924000836_addSchoolToSpeaker	8.0.7
20240927211019_updateSessionWithEventId	8.0.7
20241008012603_updatingToAlternateCareer	8.0.7
20241011230741_uniqueClassroomConstraint	8.0.7
20241019010712_addTimestampToSurvey	8.0.7
20241022160408_schoolUserRole	8.0.7
\.


--
-- Name: AspNetRoleClaims_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: careerday
--

SELECT pg_catalog.setval('public."AspNetRoleClaims_Id_seq"', 1, false);


--
-- Name: AspNetUserClaims_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: careerday
--

SELECT pg_catalog.setval('public."AspNetUserClaims_Id_seq"', 1, false);


--
-- Name: CareerSets_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: careerday
--

SELECT pg_catalog.setval('public."CareerSets_Id_seq"', 4, true);


--
-- Name: Careers_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: careerday
--

SELECT pg_catalog.setval('public."Careers_Id_seq"', 93, true);


--
-- Name: Classrooms_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: careerday
--

SELECT pg_catalog.setval('public."Classrooms_Id_seq"', 6, true);


--
-- Name: EventPhases_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: careerday
--

SELECT pg_catalog.setval('public."EventPhases_Id_seq"', 9, true);


--
-- Name: Events_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: careerday
--

SELECT pg_catalog.setval('public."Events_Id_seq"', 21, true);


--
-- Name: Schools_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: careerday
--

SELECT pg_catalog.setval('public."Schools_Id_seq"', 8, true);


--
-- Name: Sessions_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: careerday
--

SELECT pg_catalog.setval('public."Sessions_Id_seq"', 1, false);


--
-- Name: Speakers_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: careerday
--

SELECT pg_catalog.setval('public."Speakers_Id_seq"', 9, true);


--
-- Name: Students_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: careerday
--

SELECT pg_catalog.setval('public."Students_Id_seq"', 10183, true);


--
-- Name: Surveys_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: careerday
--

SELECT pg_catalog.setval('public."Surveys_Id_seq"', 2023, true);


--
-- Name: AspNetRoleClaims PK_AspNetRoleClaims; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."AspNetRoleClaims"
    ADD CONSTRAINT "PK_AspNetRoleClaims" PRIMARY KEY ("Id");


--
-- Name: AspNetRoles PK_AspNetRoles; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."AspNetRoles"
    ADD CONSTRAINT "PK_AspNetRoles" PRIMARY KEY ("Id");


--
-- Name: AspNetUserClaims PK_AspNetUserClaims; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."AspNetUserClaims"
    ADD CONSTRAINT "PK_AspNetUserClaims" PRIMARY KEY ("Id");


--
-- Name: AspNetUserLogins PK_AspNetUserLogins; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."AspNetUserLogins"
    ADD CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY ("LoginProvider", "ProviderKey");


--
-- Name: AspNetUserRoles PK_AspNetUserRoles; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY ("UserId", "RoleId");


--
-- Name: AspNetUserTokens PK_AspNetUserTokens; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."AspNetUserTokens"
    ADD CONSTRAINT "PK_AspNetUserTokens" PRIMARY KEY ("UserId", "LoginProvider", "Name");


--
-- Name: AspNetUsers PK_AspNetUsers; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."AspNetUsers"
    ADD CONSTRAINT "PK_AspNetUsers" PRIMARY KEY ("Id");


--
-- Name: CareerCareerSet PK_CareerCareerSet; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."CareerCareerSet"
    ADD CONSTRAINT "PK_CareerCareerSet" PRIMARY KEY ("CareerSetId", "CareersId");


--
-- Name: CareerEvent PK_CareerEvent; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."CareerEvent"
    ADD CONSTRAINT "PK_CareerEvent" PRIMARY KEY ("CareersId", "EventId");


--
-- Name: CareerSets PK_CareerSets; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."CareerSets"
    ADD CONSTRAINT "PK_CareerSets" PRIMARY KEY ("Id");


--
-- Name: CareerSpeaker PK_CareerSpeaker; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."CareerSpeaker"
    ADD CONSTRAINT "PK_CareerSpeaker" PRIMARY KEY ("CareersId", "SpeakerId");


--
-- Name: Careers PK_Careers; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Careers"
    ADD CONSTRAINT "PK_Careers" PRIMARY KEY ("Id");


--
-- Name: Classrooms PK_Classrooms; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Classrooms"
    ADD CONSTRAINT "PK_Classrooms" PRIMARY KEY ("Id");


--
-- Name: EventPhases PK_EventPhases; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."EventPhases"
    ADD CONSTRAINT "PK_EventPhases" PRIMARY KEY ("Id");


--
-- Name: EventSpeaker PK_EventSpeaker; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."EventSpeaker"
    ADD CONSTRAINT "PK_EventSpeaker" PRIMARY KEY ("EventId", "SpeakersId");


--
-- Name: Events PK_Events; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Events"
    ADD CONSTRAINT "PK_Events" PRIMARY KEY ("Id");


--
-- Name: Schools PK_Schools; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Schools"
    ADD CONSTRAINT "PK_Schools" PRIMARY KEY ("Id");


--
-- Name: Sessions PK_Sessions; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Sessions"
    ADD CONSTRAINT "PK_Sessions" PRIMARY KEY ("Id");


--
-- Name: SpeakerAddress PK_SpeakerAddress; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."SpeakerAddress"
    ADD CONSTRAINT "PK_SpeakerAddress" PRIMARY KEY ("Id");


--
-- Name: Speakers PK_Speakers; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Speakers"
    ADD CONSTRAINT "PK_Speakers" PRIMARY KEY ("Id");


--
-- Name: Students PK_Students; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "PK_Students" PRIMARY KEY ("Id");


--
-- Name: SurveyAlternateCareers PK_SurveyAlternateCareers; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."SurveyAlternateCareers"
    ADD CONSTRAINT "PK_SurveyAlternateCareers" PRIMARY KEY ("AlternateCareersId", "Survey1Id");


--
-- Name: SurveyPrimaryCareers PK_SurveyPrimaryCareers; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."SurveyPrimaryCareers"
    ADD CONSTRAINT "PK_SurveyPrimaryCareers" PRIMARY KEY ("PrimaryCareersId", "SurveyId");


--
-- Name: Surveys PK_Surveys; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Surveys"
    ADD CONSTRAINT "PK_Surveys" PRIMARY KEY ("Id");


--
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- Name: EmailIndex; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "EmailIndex" ON public."AspNetUsers" USING btree ("NormalizedEmail");


--
-- Name: IX_AspNetRoleClaims_RoleId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_AspNetRoleClaims_RoleId" ON public."AspNetRoleClaims" USING btree ("RoleId");


--
-- Name: IX_AspNetUserClaims_UserId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_AspNetUserClaims_UserId" ON public."AspNetUserClaims" USING btree ("UserId");


--
-- Name: IX_AspNetUserLogins_UserId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_AspNetUserLogins_UserId" ON public."AspNetUserLogins" USING btree ("UserId");


--
-- Name: IX_AspNetUserRoles_RoleId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_AspNetUserRoles_RoleId" ON public."AspNetUserRoles" USING btree ("RoleId");


--
-- Name: IX_AspNetUsers_EventId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_AspNetUsers_EventId" ON public."AspNetUsers" USING btree ("EventId");


--
-- Name: IX_CareerCareerSet_CareersId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_CareerCareerSet_CareersId" ON public."CareerCareerSet" USING btree ("CareersId");


--
-- Name: IX_CareerEvent_EventId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_CareerEvent_EventId" ON public."CareerEvent" USING btree ("EventId");


--
-- Name: IX_CareerSpeaker_SpeakerId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_CareerSpeaker_SpeakerId" ON public."CareerSpeaker" USING btree ("SpeakerId");


--
-- Name: IX_Careers_CourseId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE UNIQUE INDEX "IX_Careers_CourseId" ON public."Careers" USING btree ("CourseId");


--
-- Name: IX_Careers_Name; Type: INDEX; Schema: public; Owner: careerday
--

CREATE UNIQUE INDEX "IX_Careers_Name" ON public."Careers" USING btree ("Name");


--
-- Name: IX_Classrooms_SchoolId_Building_RoomNumber; Type: INDEX; Schema: public; Owner: careerday
--

CREATE UNIQUE INDEX "IX_Classrooms_SchoolId_Building_RoomNumber" ON public."Classrooms" USING btree ("SchoolId", "Building", "RoomNumber");


--
-- Name: IX_EventSpeaker_SpeakersId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_EventSpeaker_SpeakersId" ON public."EventSpeaker" USING btree ("SpeakersId");


--
-- Name: IX_Events_EventPhaseId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_Events_EventPhaseId" ON public."Events" USING btree ("EventPhaseId");


--
-- Name: IX_Events_SchoolId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_Events_SchoolId" ON public."Events" USING btree ("SchoolId");


--
-- Name: IX_Sessions_ClassroomId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_Sessions_ClassroomId" ON public."Sessions" USING btree ("ClassroomId");


--
-- Name: IX_Sessions_SubjectId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_Sessions_SubjectId" ON public."Sessions" USING btree ("SubjectId");


--
-- Name: IX_Speakers_SchoolLastSpokeAtId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_Speakers_SchoolLastSpokeAtId" ON public."Speakers" USING btree ("SchoolLastSpokeAtId");


--
-- Name: IX_Speakers_SessionId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_Speakers_SessionId" ON public."Speakers" USING btree ("SessionId");


--
-- Name: IX_Students_EventId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_Students_EventId" ON public."Students" USING btree ("EventId");


--
-- Name: IX_Students_SchoolId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_Students_SchoolId" ON public."Students" USING btree ("SchoolId");


--
-- Name: IX_Students_SessionId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_Students_SessionId" ON public."Students" USING btree ("SessionId");


--
-- Name: IX_Students_StudentNumber_EventId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE UNIQUE INDEX "IX_Students_StudentNumber_EventId" ON public."Students" USING btree ("StudentNumber", "EventId");


--
-- Name: IX_SurveyAlternateCareers_Survey1Id; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_SurveyAlternateCareers_Survey1Id" ON public."SurveyAlternateCareers" USING btree ("Survey1Id");


--
-- Name: IX_SurveyPrimaryCareers_SurveyId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE INDEX "IX_SurveyPrimaryCareers_SurveyId" ON public."SurveyPrimaryCareers" USING btree ("SurveyId");


--
-- Name: IX_Surveys_StudentId; Type: INDEX; Schema: public; Owner: careerday
--

CREATE UNIQUE INDEX "IX_Surveys_StudentId" ON public."Surveys" USING btree ("StudentId");


--
-- Name: RoleNameIndex; Type: INDEX; Schema: public; Owner: careerday
--

CREATE UNIQUE INDEX "RoleNameIndex" ON public."AspNetRoles" USING btree ("NormalizedName");


--
-- Name: UserNameIndex; Type: INDEX; Schema: public; Owner: careerday
--

CREATE UNIQUE INDEX "UserNameIndex" ON public."AspNetUsers" USING btree ("NormalizedUserName");


--
-- Name: AspNetRoleClaims FK_AspNetRoleClaims_AspNetRoles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."AspNetRoleClaims"
    ADD CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."AspNetRoles"("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserClaims FK_AspNetUserClaims_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."AspNetUserClaims"
    ADD CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserLogins FK_AspNetUserLogins_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."AspNetUserLogins"
    ADD CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserRoles FK_AspNetUserRoles_AspNetRoles_RoleId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId" FOREIGN KEY ("RoleId") REFERENCES public."AspNetRoles"("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserRoles FK_AspNetUserRoles_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."AspNetUserRoles"
    ADD CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE CASCADE;


--
-- Name: AspNetUserTokens FK_AspNetUserTokens_AspNetUsers_UserId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."AspNetUserTokens"
    ADD CONSTRAINT "FK_AspNetUserTokens_AspNetUsers_UserId" FOREIGN KEY ("UserId") REFERENCES public."AspNetUsers"("Id") ON DELETE CASCADE;


--
-- Name: AspNetUsers FK_AspNetUsers_Events_EventId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."AspNetUsers"
    ADD CONSTRAINT "FK_AspNetUsers_Events_EventId" FOREIGN KEY ("EventId") REFERENCES public."Events"("Id");


--
-- Name: CareerCareerSet FK_CareerCareerSet_CareerSets_CareerSetId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."CareerCareerSet"
    ADD CONSTRAINT "FK_CareerCareerSet_CareerSets_CareerSetId" FOREIGN KEY ("CareerSetId") REFERENCES public."CareerSets"("Id") ON DELETE CASCADE;


--
-- Name: CareerCareerSet FK_CareerCareerSet_Careers_CareersId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."CareerCareerSet"
    ADD CONSTRAINT "FK_CareerCareerSet_Careers_CareersId" FOREIGN KEY ("CareersId") REFERENCES public."Careers"("Id") ON DELETE CASCADE;


--
-- Name: CareerEvent FK_CareerEvent_Careers_CareersId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."CareerEvent"
    ADD CONSTRAINT "FK_CareerEvent_Careers_CareersId" FOREIGN KEY ("CareersId") REFERENCES public."Careers"("Id") ON DELETE CASCADE;


--
-- Name: CareerEvent FK_CareerEvent_Events_EventId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."CareerEvent"
    ADD CONSTRAINT "FK_CareerEvent_Events_EventId" FOREIGN KEY ("EventId") REFERENCES public."Events"("Id") ON DELETE CASCADE;


--
-- Name: CareerSpeaker FK_CareerSpeaker_Careers_CareersId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."CareerSpeaker"
    ADD CONSTRAINT "FK_CareerSpeaker_Careers_CareersId" FOREIGN KEY ("CareersId") REFERENCES public."Careers"("Id") ON DELETE CASCADE;


--
-- Name: CareerSpeaker FK_CareerSpeaker_Speakers_SpeakerId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."CareerSpeaker"
    ADD CONSTRAINT "FK_CareerSpeaker_Speakers_SpeakerId" FOREIGN KEY ("SpeakerId") REFERENCES public."Speakers"("Id") ON DELETE CASCADE;


--
-- Name: Classrooms FK_Classrooms_Schools_SchoolId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Classrooms"
    ADD CONSTRAINT "FK_Classrooms_Schools_SchoolId" FOREIGN KEY ("SchoolId") REFERENCES public."Schools"("Id") ON DELETE CASCADE;


--
-- Name: EventSpeaker FK_EventSpeaker_Events_EventId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."EventSpeaker"
    ADD CONSTRAINT "FK_EventSpeaker_Events_EventId" FOREIGN KEY ("EventId") REFERENCES public."Events"("Id") ON DELETE CASCADE;


--
-- Name: EventSpeaker FK_EventSpeaker_Speakers_SpeakersId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."EventSpeaker"
    ADD CONSTRAINT "FK_EventSpeaker_Speakers_SpeakersId" FOREIGN KEY ("SpeakersId") REFERENCES public."Speakers"("Id") ON DELETE CASCADE;


--
-- Name: Events FK_Events_EventPhases_EventPhaseId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Events"
    ADD CONSTRAINT "FK_Events_EventPhases_EventPhaseId" FOREIGN KEY ("EventPhaseId") REFERENCES public."EventPhases"("Id") ON DELETE CASCADE;


--
-- Name: Events FK_Events_Schools_SchoolId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Events"
    ADD CONSTRAINT "FK_Events_Schools_SchoolId" FOREIGN KEY ("SchoolId") REFERENCES public."Schools"("Id") ON DELETE CASCADE;


--
-- Name: Sessions FK_Sessions_Careers_SubjectId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Sessions"
    ADD CONSTRAINT "FK_Sessions_Careers_SubjectId" FOREIGN KEY ("SubjectId") REFERENCES public."Careers"("Id");


--
-- Name: Sessions FK_Sessions_Classrooms_ClassroomId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Sessions"
    ADD CONSTRAINT "FK_Sessions_Classrooms_ClassroomId" FOREIGN KEY ("ClassroomId") REFERENCES public."Classrooms"("Id");


--
-- Name: SpeakerAddress FK_SpeakerAddress_Speakers_Id; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."SpeakerAddress"
    ADD CONSTRAINT "FK_SpeakerAddress_Speakers_Id" FOREIGN KEY ("Id") REFERENCES public."Speakers"("Id") ON DELETE CASCADE;


--
-- Name: Speakers FK_Speakers_Schools_SchoolLastSpokeAtId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Speakers"
    ADD CONSTRAINT "FK_Speakers_Schools_SchoolLastSpokeAtId" FOREIGN KEY ("SchoolLastSpokeAtId") REFERENCES public."Schools"("Id");


--
-- Name: Speakers FK_Speakers_Sessions_SessionId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Speakers"
    ADD CONSTRAINT "FK_Speakers_Sessions_SessionId" FOREIGN KEY ("SessionId") REFERENCES public."Sessions"("Id");


--
-- Name: Students FK_Students_Events_EventId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "FK_Students_Events_EventId" FOREIGN KEY ("EventId") REFERENCES public."Events"("Id") ON DELETE CASCADE;


--
-- Name: Students FK_Students_Schools_SchoolId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "FK_Students_Schools_SchoolId" FOREIGN KEY ("SchoolId") REFERENCES public."Schools"("Id");


--
-- Name: Students FK_Students_Sessions_SessionId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Students"
    ADD CONSTRAINT "FK_Students_Sessions_SessionId" FOREIGN KEY ("SessionId") REFERENCES public."Sessions"("Id");


--
-- Name: SurveyAlternateCareers FK_SurveyAlternateCareers_Careers_AlternateCareersId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."SurveyAlternateCareers"
    ADD CONSTRAINT "FK_SurveyAlternateCareers_Careers_AlternateCareersId" FOREIGN KEY ("AlternateCareersId") REFERENCES public."Careers"("Id") ON DELETE CASCADE;


--
-- Name: SurveyAlternateCareers FK_SurveyAlternateCareers_Surveys_Survey1Id; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."SurveyAlternateCareers"
    ADD CONSTRAINT "FK_SurveyAlternateCareers_Surveys_Survey1Id" FOREIGN KEY ("Survey1Id") REFERENCES public."Surveys"("Id") ON DELETE CASCADE;


--
-- Name: SurveyPrimaryCareers FK_SurveyPrimaryCareers_Careers_PrimaryCareersId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."SurveyPrimaryCareers"
    ADD CONSTRAINT "FK_SurveyPrimaryCareers_Careers_PrimaryCareersId" FOREIGN KEY ("PrimaryCareersId") REFERENCES public."Careers"("Id") ON DELETE CASCADE;


--
-- Name: SurveyPrimaryCareers FK_SurveyPrimaryCareers_Surveys_SurveyId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."SurveyPrimaryCareers"
    ADD CONSTRAINT "FK_SurveyPrimaryCareers_Surveys_SurveyId" FOREIGN KEY ("SurveyId") REFERENCES public."Surveys"("Id") ON DELETE CASCADE;


--
-- Name: Surveys FK_Surveys_Students_StudentId; Type: FK CONSTRAINT; Schema: public; Owner: careerday
--

ALTER TABLE ONLY public."Surveys"
    ADD CONSTRAINT "FK_Surveys_Students_StudentId" FOREIGN KEY ("StudentId") REFERENCES public."Students"("Id") ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "careerday_db" dump
--

