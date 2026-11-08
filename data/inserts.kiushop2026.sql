
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.customer (email, name, birthday, gender, score, lang_code, recruited_by, credit) VALUES ('diana@xx.ge', 'Diana', '1993-11-30', 'f', 190, 'FR', NULL, 0);
INSERT INTO public.customer (email, name, birthday, gender, score, lang_code, recruited_by, credit) VALUES ('ivan@xx.ge', 'Irakli', '1989-04-25', 'm', 110, 'EN', 'diana@xx.ge', 11);
INSERT INTO public.customer (email, name, birthday, gender, score, lang_code, recruited_by, credit) VALUES ('elene@xx.ge', 'Elene', '1998-06-05', 'f', 60, 'EN', 'bob@xx.ge', 1500);
INSERT INTO public.customer (email, name, birthday, gender, score, lang_code, recruited_by, credit) VALUES ('frank@xx.ge', 'Frank', '1991-09-30', 'm', 60, 'DE', NULL, 1);
INSERT INTO public.customer (email, name, birthday, gender, score, lang_code, recruited_by, credit) VALUES ('grace@xx.ge', 'Grace', '1993-06-12', 'f', 70, 'EN', NULL, 1);
INSERT INTO public.customer (email, name, birthday, gender, score, lang_code, recruited_by, credit) VALUES ('heidi@xx.ge', 'Heidi', '1994-12-01', 'f', 80, 'EN', NULL, 1);
INSERT INTO public.customer (email, name, birthday, gender, score, lang_code, recruited_by, credit) VALUES ('judy@xx.ge', 'Judy', '1997-08-08', 'f', 120, 'FR', NULL, 1);
INSERT INTO public.customer (email, name, birthday, gender, score, lang_code, recruited_by, credit) VALUES ('charlie@xx.ge', 'Charlie', '1988-01-15', 'm', 240, 'DE', 'alice@xx.ge', 0);
INSERT INTO public.customer (email, name, birthday, gender, score, lang_code, recruited_by, credit) VALUES ('bob@xx.ge', 'Bob', '1990-07-23', 'm', 230, 'EN', 'alice@xx.ge', 0);
INSERT INTO public.customer (email, name, birthday, gender, score, lang_code, recruited_by, credit) VALUES ('alice@xx.ge', 'Alice', '1995-04-12', 'f', 175, 'EN', NULL, 0);


--
-- TOC entry 5122 (class 0 OID 17067)
-- Dependencies: 223
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.item (order_id, item_id, product_id, unit_price, quantity) VALUES (1, 1, 1, 1499.99, 1);
INSERT INTO public.item (order_id, item_id, product_id, unit_price, quantity) VALUES (1, 2, 2, 29.99, 2);
INSERT INTO public.item (order_id, item_id, product_id, unit_price, quantity) VALUES (2, 1, 3, 89.99, 1);
INSERT INTO public.item (order_id, item_id, product_id, unit_price, quantity) VALUES (3, 1, 4, 249.99, 2);
INSERT INTO public.item (order_id, item_id, product_id, unit_price, quantity) VALUES (3, 2, 6, 139.99, 1);
INSERT INTO public.item (order_id, item_id, product_id, unit_price, quantity) VALUES (4, 1, 8, 199.99, 1);
INSERT INTO public.item (order_id, item_id, product_id, unit_price, quantity) VALUES (5, 1, 1, 1499.99, 1);


--
-- TOC entry 5123 (class 0 OID 17076)
-- Dependencies: 224
-- Data for Name: lang; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.lang (lang_code, description) VALUES ('EN', 'English');
INSERT INTO public.lang (lang_code, description) VALUES ('DE', 'German');
INSERT INTO public.lang (lang_code, description) VALUES ('FR', 'French');


--
-- TOC entry 5124 (class 0 OID 17080)
-- Dependencies: 225
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (order_id, o_date, d_date, g_total, city, station_id, status, cu_email) VALUES (1, '2026-03-01', NULL, NULL, 'Berlin', 1, 'started', 'alice@xx.ge');
INSERT INTO public.orders (order_id, o_date, d_date, g_total, city, station_id, status, cu_email) VALUES (2, '2026-03-05', NULL, NULL, 'Munich', 1, 'started', 'bob@xx.ge');
INSERT INTO public.orders (order_id, o_date, d_date, g_total, city, station_id, status, cu_email) VALUES (4, '2026-03-15', NULL, NULL, 'Berlin', 2, 'started', 'diana@xx.ge');
INSERT INTO public.orders (order_id, o_date, d_date, g_total, city, station_id, status, cu_email) VALUES (3, '2026-03-10', NULL, NULL, 'Tbilissi', 1, 'completed', 'elene@xx.ge');
INSERT INTO public.orders (order_id, o_date, d_date, g_total, city, station_id, status, cu_email) VALUES (5, '2026-03-25', '2026-04-02', NULL, 'Tbilissi', 2, 'started', 'elene@xx.ge');


--
-- TOC entry 5126 (class 0 OID 17089)
-- Dependencies: 227
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product (product_id, name, price, stock, promotion) VALUES (4, 'Monitor', 249.99, 10, false);
INSERT INTO public.product (product_id, name, price, stock, promotion) VALUES (1, 'Laptop', 1499.99, 0, false);
INSERT INTO public.product (product_id, name, price, stock, promotion) VALUES (7, 'Graphics Card', 599.99, 35, false);
INSERT INTO public.product (product_id, name, price, stock, promotion) VALUES (5, 'Docking Station', 119.99, 45, false);
INSERT INTO public.product (product_id, name, price, stock, promotion) VALUES (3, 'Mechanical Keyboard', 89.99, 44, false);
INSERT INTO public.product (product_id, name, price, stock, promotion) VALUES (2, 'Wireless Mouse', 29.99, 80, false);
INSERT INTO public.product (product_id, name, price, stock, promotion) VALUES (9, 'USB-C cable', 9.99, 100, false);
INSERT INTO public.product (product_id, name, price, stock, promotion) VALUES (8, 'Headphones', 199.99, 26, false);
INSERT INTO public.product (product_id, name, price, stock, promotion) VALUES (20, 'super-tablet', 220.00, 110, false);
INSERT INTO public.product (product_id, name, price, stock, promotion) VALUES (6, 'SSD 1TB', 139.99, 0, true);
INSERT INTO public.product (product_id, name, price, stock, promotion) VALUES (16, 'tablet', 200.00, 100, false);
INSERT INTO public.product (product_id, name, price, stock, promotion) VALUES (14, 'super-tablet', 200.00, 100, false);
INSERT INTO public.product (product_id, name, price, stock, promotion) VALUES (12, 'tablet', 200.00, 100, false);
INSERT INTO public.product (product_id, name, price, stock, promotion) VALUES (10, 'VeryBestTablet', 200.00, 40, false);


--
-- TOC entry 5127 (class 0 OID 17096)
-- Dependencies: 228
-- Data for Name: station; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.station (city, station_id, postalcode) VALUES ('Berlin', 1, 10115);
INSERT INTO public.station (city, station_id, postalcode) VALUES ('Berlin', 2, 10243);
INSERT INTO public.station (city, station_id, postalcode) VALUES ('Tbilissi', 1, 103);
INSERT INTO public.station (city, station_id, postalcode) VALUES ('Tbilissi', 2, 104);
INSERT INTO public.station (city, station_id, postalcode) VALUES ('Munich', 1, 80331);
INSERT INTO public.station (city, station_id, postalcode) VALUES ('Paris', 1, 75001);


