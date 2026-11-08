--
-- PostgreSQL database dump
--

\restrict Ms9lxXH6VMrwhc0rILUg8DMD5qGWie7EJuTvOGIczy3rvWbvXVxvlezJFlKRZjG

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-08 18:02:54

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 223 (class 1259 OID 26548)
-- Name: area; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.area (
    area character(10) NOT NULL,
    description character varying(200),
    manager character varying(30) NOT NULL
);


ALTER TABLE public.area OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 26562)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    course_id integer NOT NULL,
    course_name character varying(50) NOT NULL,
    targetgroup character(3) NOT NULL,
    area character(10),
    trainer character varying(30)
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 26508)
-- Name: device; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device (
    device_id integer NOT NULL,
    description character varying(100) NOT NULL
);


ALTER TABLE public.device OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 26585)
-- Name: enrollment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollment (
    memname character varying(30) NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public.enrollment OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 26521)
-- Name: member; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.member (
    memname character varying(30) NOT NULL,
    is_trainer boolean DEFAULT false NOT NULL,
    email character varying(100),
    postalcode integer,
    birthday date,
    gender character(1),
    entry_date date,
    parent character varying(30),
    CONSTRAINT member_gender_check CHECK ((gender = ANY (ARRAY['m'::bpchar, 'f'::bpchar])))
);


ALTER TABLE public.member OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 26602)
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
    memname character varying(30) NOT NULL,
    timeslot timestamp without time zone NOT NULL,
    device_id integer NOT NULL
);


ALTER TABLE public.reservation OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 26515)
-- Name: targetgroup; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.targetgroup (
    targetgroup character(3) NOT NULL,
    description character varying(100)
);


ALTER TABLE public.targetgroup OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 26535)
-- Name: trainer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trainer (
    t_name character varying(30) NOT NULL,
    license boolean DEFAULT false NOT NULL,
    start_date date
);


ALTER TABLE public.trainer OWNER TO postgres;

--
-- TOC entry 5065 (class 0 OID 26548)
-- Dependencies: 223
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.area (area, description, manager) FROM stdin;
athletics 	High jump, long jump, decathlon, penthalon, sprint distances and the like	nelly
watersport	All sports that have to do with water	lazy
fitness   	Comprises all courses that encrease healthy lifestyle and fitness	coach
martialArt	Wresting, Judo and the like	klopp
\.


--
-- TOC entry 5066 (class 0 OID 26562)
-- Dependencies: 224
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (course_id, course_name, targetgroup, area, trainer) FROM stdin;
2	waterball	men	watersport	klopp
5	fitnessKids	kid	fitness   	klopp
14	fitness5	all	fitness   	klopp
13	fitness4	all	fitness   	\N
1	wrestling	men	martialArt	klopp
6	high jump	all	athletics 	lena
8	swimming	all	watersport	lena
7	obstacle race	all	athletics 	nelly
4	jogging	fam	fitness   	lena
11	fitness2	fam	fitness   	\N
12	fitness3	fam	fitness   	\N
15	gymnastics water	fam	watersport	lena
9	free style	kid	watersport	lazy
3	running	men	\N	lazy
10	aerobics	all	\N	lena
\.


--
-- TOC entry 5061 (class 0 OID 26508)
-- Dependencies: 219
-- Data for Name: device; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device (device_id, description) FROM stdin;
1	treadmill
2	rowing machine
3	bicycle
\.


--
-- TOC entry 5067 (class 0 OID 26585)
-- Dependencies: 225
-- Data for Name: enrollment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enrollment (memname, course_id) FROM stdin;
lion	5
lion	6
lion	7
lion	10
lisa	6
lisa	9
nelly	1
nelly	4
nelly	5
nelly	6
nelly	7
nelly	10
robin	5
robin	6
robin	7
robin	10
rose	4
rose	5
rose	6
rose	7
rose	10
val	1
val	4
val	5
val	6
valerie	1
valerie	4
valerie	5
valerie	6
valerie	7
valerie	10
figaro	1
hope	1
hope	5
hope	6
hope	7
hope	10
lion	4
coach	1
robin	1
coach	4
\.


--
-- TOC entry 5063 (class 0 OID 26521)
-- Dependencies: 221
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) FROM stdin;
lazy	t	lazy@xx.ge	4600	1996-11-25	m	\N	\N
hope	f	hope@xx.ge	4565	1965-09-14	f	2016-03-01	\N
luke	f	luke@xxx.ge	4565	1998-11-22	m	\N	hope
klopp	t	klopp@xx.ge	4600	1980-12-24	m	2018-01-01	\N
figaro	f	figaro@xx.ge	3674	1980-12-24	m	\N	\N
coach	t	coach@xx.ge	4600	1988-12-01	m	\N	\N
nelly	t	nelly@xx.ge	4000	1990-04-21	f	\N	\N
lion	t	lion@xxx.ge	108	1990-10-10	m	\N	\N
valerie	f	val@xx.ge	4600	1970-03-20	f	\N	\N
ana	t	ana@cc.ee	4006	2000-12-15	f	\N	\N
lena	t	lena@xx.ge	105	1980-12-24	f	\N	\N
isabel	t	isabel@new.xx	4007	2005-03-01	f	\N	\N
Tati	t	tati@new.xx	4600	2001-01-01	f	\N	\N
Giorgi	t	giorgi@new.xx	4600	1999-09-12	m	\N	\N
robin	f	nelly@xx.ge	4600	2012-09-16	m	2017-01-01	nelly
rose	f	lion@xx.ge	107	2015-02-10	f	\N	lion
val	f	val@xx.ge	103	2013-07-12	m	2020-05-01	figaro
lisa	f	figaro@xx.ge	4600	2015-11-19	f	\N	figaro
aron	f	klopp@xx.ge	4600	2013-11-06	m	2020-01-01	klopp
\.


--
-- TOC entry 5068 (class 0 OID 26602)
-- Dependencies: 226
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservation (memname, timeslot, device_id) FROM stdin;
klopp	2024-10-14 14:53:15.562498	2
figaro	2024-10-14 14:53:15.562498	1
hope	2024-10-13 21:14:42.426565	1
\.


--
-- TOC entry 5062 (class 0 OID 26515)
-- Dependencies: 220
-- Data for Name: targetgroup; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.targetgroup (targetgroup, description) FROM stdin;
all	everybody
kid	kinds up to 10
jun	young people 10 - 20
sen	seniors
men	courses for men
wom	courses for women
fam	for families
\.


--
-- TOC entry 5064 (class 0 OID 26535)
-- Dependencies: 222
-- Data for Name: trainer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trainer (t_name, license, start_date) FROM stdin;
coach	t	2021-10-01
lazy	t	\N
lena	f	\N
nelly	f	\N
klopp	t	2019-01-01
ana	f	\N
isabel	f	\N
Tati	f	\N
Giorgi	f	\N
\.


--
-- TOC entry 4895 (class 2606 OID 26556)
-- Name: area area_manager_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT area_manager_key UNIQUE (manager);


--
-- TOC entry 4897 (class 2606 OID 26554)
-- Name: area area_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT area_pkey PRIMARY KEY (area);


--
-- TOC entry 4899 (class 2606 OID 26569)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);


--
-- TOC entry 4887 (class 2606 OID 26514)
-- Name: device device_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device
    ADD CONSTRAINT device_pkey PRIMARY KEY (device_id);


--
-- TOC entry 4901 (class 2606 OID 26591)
-- Name: enrollment enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_pkey PRIMARY KEY (memname, course_id);


--
-- TOC entry 4891 (class 2606 OID 26529)
-- Name: member member_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_pkey PRIMARY KEY (memname);


--
-- TOC entry 4903 (class 2606 OID 26609)
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (device_id, timeslot);


--
-- TOC entry 4889 (class 2606 OID 26520)
-- Name: targetgroup targetgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.targetgroup
    ADD CONSTRAINT targetgroup_pkey PRIMARY KEY (targetgroup);


--
-- TOC entry 4893 (class 2606 OID 26542)
-- Name: trainer trainer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainer
    ADD CONSTRAINT trainer_pkey PRIMARY KEY (t_name);


--
-- TOC entry 4906 (class 2606 OID 26557)
-- Name: area area_manager_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.area
    ADD CONSTRAINT area_manager_fkey FOREIGN KEY (manager) REFERENCES public.trainer(t_name);


--
-- TOC entry 4907 (class 2606 OID 26575)
-- Name: course course_area_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_area_fkey FOREIGN KEY (area) REFERENCES public.area(area);


--
-- TOC entry 4908 (class 2606 OID 26570)
-- Name: course course_targetgroup_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_targetgroup_fkey FOREIGN KEY (targetgroup) REFERENCES public.targetgroup(targetgroup);


--
-- TOC entry 4909 (class 2606 OID 26580)
-- Name: course course_trainer_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_trainer_fkey FOREIGN KEY (trainer) REFERENCES public.trainer(t_name);


--
-- TOC entry 4910 (class 2606 OID 26597)
-- Name: enrollment enrollment_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_course_id_fkey FOREIGN KEY (course_id) REFERENCES public.course(course_id);


--
-- TOC entry 4911 (class 2606 OID 26592)
-- Name: enrollment enrollment_memname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_memname_fkey FOREIGN KEY (memname) REFERENCES public.member(memname);


--
-- TOC entry 4904 (class 2606 OID 26530)
-- Name: member member_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.member
    ADD CONSTRAINT member_parent_fkey FOREIGN KEY (parent) REFERENCES public.member(memname);


--
-- TOC entry 4912 (class 2606 OID 26615)
-- Name: reservation reservation_device_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_device_id_fkey FOREIGN KEY (device_id) REFERENCES public.device(device_id);


--
-- TOC entry 4913 (class 2606 OID 26610)
-- Name: reservation reservation_memname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_memname_fkey FOREIGN KEY (memname) REFERENCES public.member(memname);


--
-- TOC entry 4905 (class 2606 OID 26543)
-- Name: trainer trainer_t_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trainer
    ADD CONSTRAINT trainer_t_name_fkey FOREIGN KEY (t_name) REFERENCES public.member(memname);


-- Completed on 2026-11-08 18:02:54

--
-- PostgreSQL database dump complete
--

\unrestrict Ms9lxXH6VMrwhc0rILUg8DMD5qGWie7EJuTvOGIczy3rvWbvXVxvlezJFlKRZjG

