--
-- PostgreSQL database dump
--

\restrict cKvWUqzR20bGTOTZkEvKBaSjowQCp3jpda0ugSlzYkZnWPq4c0ZlI9pd2HKK3cS

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-08 16:57:23

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
-- TOC entry 864 (class 1247 OID 17051)
-- Name: w_quality; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.w_quality AS ENUM (
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
);


ALTER TYPE public.w_quality OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 229 (class 1259 OID 17145)
-- Name: finances; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.finances (
    org_id integer NOT NULL,
    p_id integer NOT NULL,
    amount integer
);


ALTER TABLE public.finances OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17106)
-- Name: organization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organization (
    org_id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.organization OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 17105)
-- Name: organization_org_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.organization_org_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.organization_org_id_seq OWNER TO postgres;

--
-- TOC entry 5091 (class 0 OID 0)
-- Dependencies: 225
-- Name: organization_org_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.organization_org_id_seq OWNED BY public.organization.org_id;


--
-- TOC entry 224 (class 1259 OID 17097)
-- Name: project; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.project (
    p_id integer NOT NULL,
    p_title character varying(150) NOT NULL,
    t_cost numeric(12,2),
    startdate date,
    enddate date
);


ALTER TABLE public.project OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17096)
-- Name: project_p_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.project_p_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.project_p_id_seq OWNER TO postgres;

--
-- TOC entry 5092 (class 0 OID 0)
-- Dependencies: 223
-- Name: project_p_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.project_p_id_seq OWNED BY public.project.p_id;


--
-- TOC entry 220 (class 1259 OID 17072)
-- Name: r_water; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.r_water (
    rw_id integer NOT NULL,
    rw_name character varying(50) NOT NULL,
    rw_quality public.w_quality NOT NULL,
    length integer,
    mileage_point integer,
    flows_into integer
);


ALTER TABLE public.r_water OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17071)
-- Name: r_water_rw_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.r_water_rw_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.r_water_rw_id_seq OWNER TO postgres;

--
-- TOC entry 5093 (class 0 OID 0)
-- Dependencies: 219
-- Name: r_water_rw_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.r_water_rw_id_seq OWNED BY public.r_water.rw_id;


--
-- TOC entry 227 (class 1259 OID 17114)
-- Name: researcher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.researcher (
    r_email character varying(80) NOT NULL,
    r_name character varying(80) NOT NULL,
    org_id integer NOT NULL
);


ALTER TABLE public.researcher OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17162)
-- Name: rw_research; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rw_research (
    p_id integer NOT NULL,
    rw_id integer NOT NULL
);


ALTER TABLE public.rw_research OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17087)
-- Name: s_water; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s_water (
    sw_id integer NOT NULL,
    sw_name character varying(50) NOT NULL,
    sw_quality public.w_quality NOT NULL,
    surface integer
);


ALTER TABLE public.s_water OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17086)
-- Name: s_water_sw_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.s_water_sw_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.s_water_sw_id_seq OWNER TO postgres;

--
-- TOC entry 5094 (class 0 OID 0)
-- Dependencies: 221
-- Name: s_water_sw_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.s_water_sw_id_seq OWNED BY public.s_water.sw_id;


--
-- TOC entry 231 (class 1259 OID 17179)
-- Name: sw_research; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sw_research (
    p_id integer NOT NULL,
    sw_id integer NOT NULL
);


ALTER TABLE public.sw_research OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17127)
-- Name: works_on; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.works_on (
    p_id integer NOT NULL,
    r_email character varying(80) NOT NULL,
    function character varying(100) NOT NULL,
    weekly_hours integer
);


ALTER TABLE public.works_on OWNER TO postgres;

--
-- TOC entry 4897 (class 2604 OID 17109)
-- Name: organization org_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization ALTER COLUMN org_id SET DEFAULT nextval('public.organization_org_id_seq'::regclass);


--
-- TOC entry 4896 (class 2604 OID 17100)
-- Name: project p_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project ALTER COLUMN p_id SET DEFAULT nextval('public.project_p_id_seq'::regclass);


--
-- TOC entry 4894 (class 2604 OID 17075)
-- Name: r_water rw_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_water ALTER COLUMN rw_id SET DEFAULT nextval('public.r_water_rw_id_seq'::regclass);


--
-- TOC entry 4895 (class 2604 OID 17090)
-- Name: s_water sw_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.s_water ALTER COLUMN sw_id SET DEFAULT nextval('public.s_water_sw_id_seq'::regclass);


--
-- TOC entry 5083 (class 0 OID 17145)
-- Dependencies: 229
-- Data for Name: finances; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.finances (org_id, p_id, amount) FROM stdin;
\.


--
-- TOC entry 5080 (class 0 OID 17106)
-- Dependencies: 226
-- Data for Name: organization; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.organization (org_id, name) FROM stdin;
\.


--
-- TOC entry 5078 (class 0 OID 17097)
-- Dependencies: 224
-- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.project (p_id, p_title, t_cost, startdate, enddate) FROM stdin;
\.


--
-- TOC entry 5074 (class 0 OID 17072)
-- Dependencies: 220
-- Data for Name: r_water; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.r_water (rw_id, rw_name, rw_quality, length, mileage_point, flows_into) FROM stdin;
\.


--
-- TOC entry 5081 (class 0 OID 17114)
-- Dependencies: 227
-- Data for Name: researcher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.researcher (r_email, r_name, org_id) FROM stdin;
\.


--
-- TOC entry 5084 (class 0 OID 17162)
-- Dependencies: 230
-- Data for Name: rw_research; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rw_research (p_id, rw_id) FROM stdin;
\.


--
-- TOC entry 5076 (class 0 OID 17087)
-- Dependencies: 222
-- Data for Name: s_water; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.s_water (sw_id, sw_name, sw_quality, surface) FROM stdin;
\.


--
-- TOC entry 5085 (class 0 OID 17179)
-- Dependencies: 231
-- Data for Name: sw_research; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sw_research (p_id, sw_id) FROM stdin;
\.


--
-- TOC entry 5082 (class 0 OID 17127)
-- Dependencies: 228
-- Data for Name: works_on; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.works_on (p_id, r_email, function, weekly_hours) FROM stdin;
\.


--
-- TOC entry 5095 (class 0 OID 0)
-- Dependencies: 225
-- Name: organization_org_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.organization_org_id_seq', 1, false);


--
-- TOC entry 5096 (class 0 OID 0)
-- Dependencies: 223
-- Name: project_p_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.project_p_id_seq', 1, false);


--
-- TOC entry 5097 (class 0 OID 0)
-- Dependencies: 219
-- Name: r_water_rw_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.r_water_rw_id_seq', 1, false);


--
-- TOC entry 5098 (class 0 OID 0)
-- Dependencies: 221
-- Name: s_water_sw_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.s_water_sw_id_seq', 1, false);


--
-- TOC entry 4911 (class 2606 OID 17151)
-- Name: finances finances_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finances
    ADD CONSTRAINT finances_pkey PRIMARY KEY (org_id, p_id);


--
-- TOC entry 4905 (class 2606 OID 17113)
-- Name: organization organization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organization
    ADD CONSTRAINT organization_pkey PRIMARY KEY (org_id);


--
-- TOC entry 4903 (class 2606 OID 17104)
-- Name: project project_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (p_id);


--
-- TOC entry 4899 (class 2606 OID 17080)
-- Name: r_water r_water_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_water
    ADD CONSTRAINT r_water_pkey PRIMARY KEY (rw_id);


--
-- TOC entry 4907 (class 2606 OID 17121)
-- Name: researcher researcher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.researcher
    ADD CONSTRAINT researcher_pkey PRIMARY KEY (r_email);


--
-- TOC entry 4913 (class 2606 OID 17168)
-- Name: rw_research rw_research_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rw_research
    ADD CONSTRAINT rw_research_pkey PRIMARY KEY (p_id, rw_id);


--
-- TOC entry 4901 (class 2606 OID 17095)
-- Name: s_water s_water_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.s_water
    ADD CONSTRAINT s_water_pkey PRIMARY KEY (sw_id);


--
-- TOC entry 4915 (class 2606 OID 17185)
-- Name: sw_research sw_research_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sw_research
    ADD CONSTRAINT sw_research_pkey PRIMARY KEY (p_id, sw_id);


--
-- TOC entry 4909 (class 2606 OID 17134)
-- Name: works_on works_on_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.works_on
    ADD CONSTRAINT works_on_pkey PRIMARY KEY (p_id, r_email);


--
-- TOC entry 4920 (class 2606 OID 17152)
-- Name: finances finances_org_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finances
    ADD CONSTRAINT finances_org_id_fkey FOREIGN KEY (org_id) REFERENCES public.organization(org_id);


--
-- TOC entry 4921 (class 2606 OID 17157)
-- Name: finances finances_p_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.finances
    ADD CONSTRAINT finances_p_id_fkey FOREIGN KEY (p_id) REFERENCES public.project(p_id);


--
-- TOC entry 4916 (class 2606 OID 17081)
-- Name: r_water r_water_flows_into_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.r_water
    ADD CONSTRAINT r_water_flows_into_fkey FOREIGN KEY (flows_into) REFERENCES public.r_water(rw_id);


--
-- TOC entry 4917 (class 2606 OID 17122)
-- Name: researcher researcher_org_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.researcher
    ADD CONSTRAINT researcher_org_id_fkey FOREIGN KEY (org_id) REFERENCES public.organization(org_id);


--
-- TOC entry 4922 (class 2606 OID 17169)
-- Name: rw_research rw_research_p_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rw_research
    ADD CONSTRAINT rw_research_p_id_fkey FOREIGN KEY (p_id) REFERENCES public.project(p_id);


--
-- TOC entry 4923 (class 2606 OID 17174)
-- Name: rw_research rw_research_rw_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rw_research
    ADD CONSTRAINT rw_research_rw_id_fkey FOREIGN KEY (rw_id) REFERENCES public.r_water(rw_id);


--
-- TOC entry 4924 (class 2606 OID 17186)
-- Name: sw_research sw_research_p_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sw_research
    ADD CONSTRAINT sw_research_p_id_fkey FOREIGN KEY (p_id) REFERENCES public.project(p_id);


--
-- TOC entry 4925 (class 2606 OID 17191)
-- Name: sw_research sw_research_sw_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sw_research
    ADD CONSTRAINT sw_research_sw_id_fkey FOREIGN KEY (sw_id) REFERENCES public.s_water(sw_id);


--
-- TOC entry 4918 (class 2606 OID 17135)
-- Name: works_on works_on_p_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.works_on
    ADD CONSTRAINT works_on_p_id_fkey FOREIGN KEY (p_id) REFERENCES public.project(p_id);


--
-- TOC entry 4919 (class 2606 OID 17140)
-- Name: works_on works_on_r_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.works_on
    ADD CONSTRAINT works_on_r_email_fkey FOREIGN KEY (r_email) REFERENCES public.researcher(r_email);


-- Completed on 2026-11-08 16:57:24

--
-- PostgreSQL database dump complete
--

\unrestrict cKvWUqzR20bGTOTZkEvKBaSjowQCp3jpda0ugSlzYkZnWPq4c0ZlI9pd2HKK3cS

