--
-- PostgreSQL database dump
--

\restrict faSrz8fnnfCKaAXcJfeJznapBwlOFRcKN2EU5ZabdtNjrxn50nPX4EuM07w8CIC

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-08 17:39:43

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
-- TOC entry 219 (class 1259 OID 26397)
-- Name: assistant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.assistant (
    assistant_i_d bigint NOT NULL,
    name character varying(50) NOT NULL,
    research_area character varying(80),
    prof_i_d bigint
);


ALTER TABLE public.assistant OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 26402)
-- Name: assistant_assistant_i_d_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.assistant_assistant_i_d_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.assistant_assistant_i_d_seq OWNER TO postgres;

--
-- TOC entry 5073 (class 0 OID 0)
-- Dependencies: 220
-- Name: assistant_assistant_i_d_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.assistant_assistant_i_d_seq OWNED BY public.assistant.assistant_i_d;


--
-- TOC entry 221 (class 1259 OID 26403)
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    course_i_d bigint NOT NULL,
    title character varying(50) NOT NULL,
    contact_hours smallint NOT NULL,
    prof_i_d bigint
);


ALTER TABLE public.course OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 26409)
-- Name: enrollment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollment (
    stud_i_d bigint NOT NULL,
    course_i_d bigint NOT NULL
);


ALTER TABLE public.enrollment OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 26414)
-- Name: examination; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.examination (
    stud_i_d bigint NOT NULL,
    course_i_d bigint NOT NULL,
    prof_i_d bigint NOT NULL,
    grade character varying NOT NULL,
    points smallint
);


ALTER TABLE public.examination OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 26423)
-- Name: professor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professor (
    prof_i_d bigint NOT NULL,
    name character varying(50) NOT NULL,
    rank character(2)
);


ALTER TABLE public.professor OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 26428)
-- Name: requirement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.requirement (
    predecessor bigint NOT NULL,
    successor bigint NOT NULL
);


ALTER TABLE public.requirement OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 26433)
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    stud_i_d bigint NOT NULL,
    name character varying(50) NOT NULL,
    semester smallint,
    student_email character varying(60)
);


ALTER TABLE public.student OWNER TO postgres;

--
-- TOC entry 4880 (class 2604 OID 26438)
-- Name: assistant assistant_i_d; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant ALTER COLUMN assistant_i_d SET DEFAULT nextval('public.assistant_assistant_i_d_seq'::regclass);


--
-- TOC entry 5060 (class 0 OID 26397)
-- Dependencies: 219
-- Data for Name: assistant; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.assistant (assistant_i_d, name, research_area, prof_i_d) FROM stdin;
3002	Platon	Ideology	2125
3003	Aristoteles	Logic	2125
3004	Wittgenstein	Speech Theorie	2126
3005	Rhetikus	Movement of Planets	2127
3006	Newton	Kepler's laws	2127
3007	Spinoza	God and Nature	2134
\.


--
-- TOC entry 5062 (class 0 OID 26403)
-- Dependencies: 221
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (course_i_d, title, contact_hours, prof_i_d) FROM stdin;
4052	Logic	4	2125
4630	Three Critics	4	2137
5001	Foundation	4	2137
5022	Science and Faith	2	2134
5041	Ethics	4	2125
5043	Cognition Theory	3	2126
5049	maieutics	2	2125
5052	philosophy of science	3	2126
5216	Bioethics	2	2126
5259	Vienna Circle	2	2133
\.


--
-- TOC entry 5063 (class 0 OID 26409)
-- Dependencies: 222
-- Data for Name: enrollment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enrollment (stud_i_d, course_i_d) FROM stdin;
25403	5022
26120	5001
27550	4052
27550	5001
28106	5041
28106	5052
28106	5216
28106	5259
29120	4052
29120	4630
29120	5001
29120	5041
29120	5049
29555	5001
29555	5022
\.


--
-- TOC entry 5064 (class 0 OID 26414)
-- Dependencies: 223
-- Data for Name: examination; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.examination (stud_i_d, course_i_d, prof_i_d, grade, points) FROM stdin;
25403	5001	2126	B	85
25403	5041	2125	B	81
26120	5001	2126	B	88
26830	5001	2126	C	75
27550	4630	2137	E	51
27550	5001	2126	C	74
28106	5001	2126	A	95
29555	5001	2126	E	40
\.


--
-- TOC entry 5065 (class 0 OID 26423)
-- Dependencies: 224
-- Data for Name: professor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professor (prof_i_d, name, rank) FROM stdin;
2125	Sokrates	C4
2126	Russel	C4
2127	Kopernikus	C3
2133	Popper	C3
2134	Augustinus	C3
2136	Curie	C4
2137	Kant	C4
\.


--
-- TOC entry 5066 (class 0 OID 26428)
-- Dependencies: 225
-- Data for Name: requirement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.requirement (predecessor, successor) FROM stdin;
5041	4630
4052	5049
5041	5049
5259	5052
4630	5259
\.


--
-- TOC entry 5067 (class 0 OID 26433)
-- Dependencies: 226
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (stud_i_d, name, semester, student_email) FROM stdin;
24002	Xenokrates	18	\N
24100	Jonas	\N	Jonas@kiu.edu.ge
24101	Jonas	\N	Jonas1@kiu.edu.ge
24102	Jonas	\N	Jonas2@kiu.edu.ge
25403	Jonas	12	\N
26120	Fichte	10	\N
26830	Aristoxenos	\N	\N
27550	Schopenhauer	0	\N
28106	Carnap	\N	\N
29120	Theophrastos	0	\N
29555	Feuerbach	\N	\N
29990	Hegel	0	Hegel@kiu.edu.ge
29991	Hegel	0	Hegel1@kiu.edu.ge
29992	Hegel	0	Hegel2@kiu.edu.ge
\.


--
-- TOC entry 5074 (class 0 OID 0)
-- Dependencies: 220
-- Name: assistant_assistant_i_d_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.assistant_assistant_i_d_seq', 3007, true);


--
-- TOC entry 4884 (class 2606 OID 26440)
-- Name: assistant assistant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant
    ADD CONSTRAINT assistant_pkey PRIMARY KEY (assistant_i_d);


--
-- TOC entry 4887 (class 2606 OID 26442)
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_i_d);


--
-- TOC entry 4890 (class 2606 OID 26444)
-- Name: enrollment enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_pkey PRIMARY KEY (course_i_d, stud_i_d);


--
-- TOC entry 4894 (class 2606 OID 26446)
-- Name: examination examination_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.examination
    ADD CONSTRAINT examination_pkey PRIMARY KEY (stud_i_d, course_i_d);


--
-- TOC entry 4897 (class 2606 OID 26448)
-- Name: professor professor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_pkey PRIMARY KEY (prof_i_d);


--
-- TOC entry 4900 (class 2606 OID 26450)
-- Name: requirement requirement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requirement
    ADD CONSTRAINT requirement_pkey PRIMARY KEY (predecessor, successor);


--
-- TOC entry 4902 (class 2606 OID 26452)
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (stud_i_d);


--
-- TOC entry 4881 (class 2606 OID 26453)
-- Name: student student_semester_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.student
    ADD CONSTRAINT student_semester_check CHECK (((semester >= 1) AND (semester <= 12))) NOT VALID;


--
-- TOC entry 4882 (class 1259 OID 26454)
-- Name: assistant_f_k_prof_i_d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX assistant_f_k_prof_i_d ON public.assistant USING btree (prof_i_d);


--
-- TOC entry 4885 (class 1259 OID 26455)
-- Name: course_f_k_course_professor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX course_f_k_course_professor ON public.course USING btree (prof_i_d);


--
-- TOC entry 4888 (class 1259 OID 26456)
-- Name: enrollment_f_k_enrollment_student; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX enrollment_f_k_enrollment_student ON public.enrollment USING btree (stud_i_d);


--
-- TOC entry 4891 (class 1259 OID 26457)
-- Name: examination_f_k__course; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX examination_f_k__course ON public.examination USING btree (course_i_d);


--
-- TOC entry 4892 (class 1259 OID 26458)
-- Name: examination_f_k__professor; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX examination_f_k__professor ON public.examination USING btree (prof_i_d);


--
-- TOC entry 4895 (class 1259 OID 26459)
-- Name: professor_index_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX professor_index_name ON public.professor USING btree (name);


--
-- TOC entry 4898 (class 1259 OID 26460)
-- Name: requirement_f_k_requirement_course_2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX requirement_f_k_requirement_course_2 ON public.requirement USING btree (successor);


--
-- TOC entry 4903 (class 1259 OID 26461)
-- Name: student_student_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX student_student_name ON public.student USING btree (name);


--
-- TOC entry 4908 (class 2606 OID 26462)
-- Name: examination f_k__course; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.examination
    ADD CONSTRAINT f_k__course FOREIGN KEY (course_i_d) REFERENCES public.course(course_i_d);


--
-- TOC entry 4909 (class 2606 OID 26467)
-- Name: examination f_k__professor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.examination
    ADD CONSTRAINT f_k__professor FOREIGN KEY (prof_i_d) REFERENCES public.professor(prof_i_d);


--
-- TOC entry 4910 (class 2606 OID 26472)
-- Name: examination f_k__student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.examination
    ADD CONSTRAINT f_k__student FOREIGN KEY (stud_i_d) REFERENCES public.student(stud_i_d);


--
-- TOC entry 4904 (class 2606 OID 26477)
-- Name: assistant f_k_assistant_professor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.assistant
    ADD CONSTRAINT f_k_assistant_professor FOREIGN KEY (prof_i_d) REFERENCES public.professor(prof_i_d);


--
-- TOC entry 4905 (class 2606 OID 26482)
-- Name: course f_k_course_professor; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT f_k_course_professor FOREIGN KEY (prof_i_d) REFERENCES public.professor(prof_i_d);


--
-- TOC entry 4906 (class 2606 OID 26487)
-- Name: enrollment f_k_enrollment_course; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT f_k_enrollment_course FOREIGN KEY (course_i_d) REFERENCES public.course(course_i_d);


--
-- TOC entry 4907 (class 2606 OID 26492)
-- Name: enrollment f_k_enrollment_student; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT f_k_enrollment_student FOREIGN KEY (stud_i_d) REFERENCES public.student(stud_i_d);


--
-- TOC entry 4911 (class 2606 OID 26497)
-- Name: requirement f_k_requirement_course; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requirement
    ADD CONSTRAINT f_k_requirement_course FOREIGN KEY (predecessor) REFERENCES public.course(course_i_d);


--
-- TOC entry 4912 (class 2606 OID 26502)
-- Name: requirement f_k_requirement_course_2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.requirement
    ADD CONSTRAINT f_k_requirement_course_2 FOREIGN KEY (successor) REFERENCES public.course(course_i_d);


-- Completed on 2026-11-08 17:39:43

--
-- PostgreSQL database dump complete
--

\unrestrict faSrz8fnnfCKaAXcJfeJznapBwlOFRcKN2EU5ZabdtNjrxn50nPX4EuM07w8CIC

