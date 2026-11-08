--
-- PostgreSQL database dump
--

\restrict pdlKN6W78f92kmAurA0cWYmzUHFGWWPIZrtiQhT1Ek2ysZA2lYlACx6XSC7dhKZ

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-11-08 17:36:12

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
-- TOC entry 219 (class 1259 OID 25689)
-- Name: city; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.city (
    name character varying(100) NOT NULL
);


ALTER TABLE public.city OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 25729)
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    email character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    birthday date,
    gender character varying(50),
    score integer DEFAULT 0,
    lang_code character varying(10) NOT NULL,
    recruited_by character varying(255),
    credit numeric(10,2) DEFAULT 0
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 25773)
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
    order_id integer NOT NULL,
    item_id integer NOT NULL,
    product_id integer NOT NULL,
    unit_price numeric(10,2) NOT NULL,
    quantity integer NOT NULL,
    total_price numeric(10,2),
    CONSTRAINT chk_quantity_non_negative CHECK ((quantity >= 0))
);


ALTER TABLE public.item OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 25695)
-- Name: lang; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lang (
    lang_code character varying(10) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.lang OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 25752)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    o_date date DEFAULT CURRENT_DATE NOT NULL,
    d_date date,
    g_total numeric(10,2),
    city character varying(100) NOT NULL,
    station_id integer NOT NULL,
    status character varying(50) DEFAULT 'started'::character varying,
    cu_email character varying(255) NOT NULL,
    CONSTRAINT chk_delivery_after_order CHECK ((d_date >= o_date))
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 25751)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 5076 (class 0 OID 0)
-- Dependencies: 225
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- TOC entry 222 (class 1259 OID 25705)
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_id integer NOT NULL,
    name character varying(255) NOT NULL,
    price numeric(10,2) NOT NULL,
    stock integer DEFAULT 0 NOT NULL,
    promotion boolean DEFAULT false,
    CONSTRAINT chk_stock_non_negative CHECK ((stock >= 0))
);


ALTER TABLE public.product OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 25704)
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_product_id_seq OWNER TO postgres;

--
-- TOC entry 5077 (class 0 OID 0)
-- Dependencies: 221
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;


--
-- TOC entry 223 (class 1259 OID 25717)
-- Name: station; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.station (
    city character varying(100) NOT NULL,
    station_id integer NOT NULL,
    postalcode integer
);


ALTER TABLE public.station OWNER TO postgres;

--
-- TOC entry 4886 (class 2604 OID 25755)
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- TOC entry 4881 (class 2604 OID 25708)
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- TOC entry 5062 (class 0 OID 25689)
-- Dependencies: 219
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.city (name) FROM stdin;
Berlin
Tbilissi
Munich
Paris
\.


--
-- TOC entry 5067 (class 0 OID 25729)
-- Dependencies: 224
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (email, name, birthday, gender, score, lang_code, recruited_by, credit) FROM stdin;
diana@xx.ge	Diana	1993-11-30	f	190	FR	\N	0.00
frank@xx.ge	Frank	1991-09-30	m	60	DE	\N	1.00
grace@xx.ge	Grace	1993-06-12	f	70	EN	\N	1.00
heidi@xx.ge	Heidi	1994-12-01	f	80	EN	\N	1.00
judy@xx.ge	Judy	1997-08-08	f	120	FR	\N	1.00
alice@xx.ge	Alice	1995-04-12	f	175	EN	\N	0.00
ivan@xx.ge	Irakli	1989-04-25	m	110	EN	diana@xx.ge	11.00
charlie@xx.ge	Charlie	1988-01-15	m	240	DE	alice@xx.ge	0.00
bob@xx.ge	Bob	1990-07-23	m	230	EN	alice@xx.ge	0.00
elene@xx.ge	Elene	1998-06-05	f	60	EN	bob@xx.ge	1500.00
\.


--
-- TOC entry 5070 (class 0 OID 25773)
-- Dependencies: 227
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item (order_id, item_id, product_id, unit_price, quantity, total_price) FROM stdin;
1	1	1	1499.99	1	\N
1	2	2	29.99	2	\N
2	1	3	89.99	1	\N
3	1	4	249.99	2	\N
3	2	6	139.99	1	\N
4	1	8	199.99	1	\N
5	1	1	1499.99	1	\N
\.


--
-- TOC entry 5063 (class 0 OID 25695)
-- Dependencies: 220
-- Data for Name: lang; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lang (lang_code, description) FROM stdin;
EN	English
DE	German
FR	French
\.


--
-- TOC entry 5069 (class 0 OID 25752)
-- Dependencies: 226
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, o_date, d_date, g_total, city, station_id, status, cu_email) FROM stdin;
1	2026-03-01	\N	\N	Berlin	1	started	alice@xx.ge
2	2026-03-05	\N	\N	Munich	1	started	bob@xx.ge
4	2026-03-15	\N	\N	Berlin	2	started	diana@xx.ge
3	2026-03-10	\N	\N	Tbilissi	1	completed	elene@xx.ge
5	2026-03-25	2026-04-02	\N	Tbilissi	2	started	elene@xx.ge
\.


--
-- TOC entry 5065 (class 0 OID 25705)
-- Dependencies: 222
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (product_id, name, price, stock, promotion) FROM stdin;
4	Monitor	249.99	10	f
1	Laptop	1499.99	0	f
7	Graphics Card	599.99	35	f
5	Docking Station	119.99	45	f
3	Mechanical Keyboard	89.99	44	f
2	Wireless Mouse	29.99	80	f
9	USB-C cable	9.99	100	f
8	Headphones	199.99	26	f
20	super-tablet	220.00	110	f
6	SSD 1TB	139.99	0	t
16	tablet	200.00	100	f
14	super-tablet	200.00	100	f
12	tablet	200.00	100	f
10	VeryBestTablet	200.00	40	f
\.


--
-- TOC entry 5066 (class 0 OID 25717)
-- Dependencies: 223
-- Data for Name: station; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.station (city, station_id, postalcode) FROM stdin;
Berlin	1	10115
Berlin	2	10243
Tbilissi	1	103
Tbilissi	2	104
Munich	1	80331
Paris	1	75001
\.


--
-- TOC entry 5078 (class 0 OID 0)
-- Dependencies: 225
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 1, false);


--
-- TOC entry 5079 (class 0 OID 0)
-- Dependencies: 221
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_product_id_seq', 1, false);


--
-- TOC entry 4893 (class 2606 OID 25694)
-- Name: city city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (name);


--
-- TOC entry 4901 (class 2606 OID 25740)
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (email);


--
-- TOC entry 4905 (class 2606 OID 25782)
-- Name: item item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (order_id, item_id);


--
-- TOC entry 4895 (class 2606 OID 25703)
-- Name: lang lang_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lang
    ADD CONSTRAINT lang_pkey PRIMARY KEY (lang_code);


--
-- TOC entry 4903 (class 2606 OID 25762)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 4897 (class 2606 OID 25716)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4899 (class 2606 OID 25723)
-- Name: station station_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station
    ADD CONSTRAINT station_pkey PRIMARY KEY (city, station_id);


--
-- TOC entry 4907 (class 2606 OID 25817)
-- Name: item unique_product_per_order; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT unique_product_per_order UNIQUE (order_id, product_id);


--
-- TOC entry 4909 (class 2606 OID 25741)
-- Name: customer customer_lang_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_lang_code_fkey FOREIGN KEY (lang_code) REFERENCES public.lang(lang_code);


--
-- TOC entry 4910 (class 2606 OID 25746)
-- Name: customer customer_recruited_by_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_recruited_by_fkey FOREIGN KEY (recruited_by) REFERENCES public.customer(email) ON DELETE SET NULL;


--
-- TOC entry 4913 (class 2606 OID 25783)
-- Name: item item_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE CASCADE;


--
-- TOC entry 4914 (class 2606 OID 25788)
-- Name: item item_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(product_id);


--
-- TOC entry 4911 (class 2606 OID 25768)
-- Name: orders orders_city_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_city_station_id_fkey FOREIGN KEY (city, station_id) REFERENCES public.station(city, station_id);


--
-- TOC entry 4912 (class 2606 OID 25763)
-- Name: orders orders_cu_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_cu_email_fkey FOREIGN KEY (cu_email) REFERENCES public.customer(email) ON DELETE CASCADE;


--
-- TOC entry 4908 (class 2606 OID 25724)
-- Name: station station_city_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.station
    ADD CONSTRAINT station_city_fkey FOREIGN KEY (city) REFERENCES public.city(name) ON DELETE CASCADE;


-- Completed on 2026-11-08 17:36:12

--
-- PostgreSQL database dump complete
--

\unrestrict pdlKN6W78f92kmAurA0cWYmzUHFGWWPIZrtiQhT1Ek2ysZA2lYlACx6XSC7dhKZ

