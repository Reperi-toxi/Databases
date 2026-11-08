

INSERT INTO public.building (building_id, year_constr) VALUES ('A', 2024);
INSERT INTO public.building (building_id, year_constr) VALUES ('K', 2020);
INSERT INTO public.building (building_id, year_constr) VALUES ('E', 2020);
INSERT INTO public.building (building_id, year_constr) VALUES ('F', 2020);
INSERT INTO public.building (building_id, year_constr) VALUES ('G', 2020);


--
-- TOC entry 5097 (class 0 OID 18075)
-- Dependencies: 220
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.department (dep_id, dep_name, manager) VALUES (2, 'IT', 12);
INSERT INTO public.department (dep_id, dep_name, manager) VALUES (3, 'CS', 13);
INSERT INTO public.department (dep_id, dep_name, manager) VALUES (1, 'HR', 1);


--
-- TOC entry 5098 (class 0 OID 18079)
-- Dependencies: 221
-- Data for Name: emp_skill; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.emp_skill (emp_id, skill) VALUES (11, 'HR');
INSERT INTO public.emp_skill (emp_id, skill) VALUES (12, 'Python');
INSERT INTO public.emp_skill (emp_id, skill) VALUES (12, 'SQL');
INSERT INTO public.emp_skill (emp_id, skill) VALUES (14, 'Python');
INSERT INTO public.emp_skill (emp_id, skill) VALUES (13, 'SQL');
INSERT INTO public.emp_skill (emp_id, skill) VALUES (15, 'AI');
INSERT INTO public.emp_skill (emp_id, skill) VALUES (13, 'Python');
INSERT INTO public.emp_skill (emp_id, skill) VALUES (1, 'HR');


--
-- TOC entry 5100 (class 0 OID 18089)
-- Dependencies: 223
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employee (emp_id, emp_name, function, dep_id, mentor_id) VALUES (14, 'Emma', 'IT Intern', 2, 13);
INSERT INTO public.employee (emp_id, emp_name, function, dep_id, mentor_id) VALUES (15, 'Frank', 'CS Intern', 2, 13);
INSERT INTO public.employee (emp_id, emp_name, function, dep_id, mentor_id) VALUES (11, 'Bob', 'HR Assistant', 1, NULL);
INSERT INTO public.employee (emp_id, emp_name, function, dep_id, mentor_id) VALUES (12, 'Carol', 'IT Specialist', 2, NULL);
INSERT INTO public.employee (emp_id, emp_name, function, dep_id, mentor_id) VALUES (13, 'David', 'DEAN', 3, NULL);
INSERT INTO public.employee (emp_id, emp_name, function, dep_id, mentor_id) VALUES (1, 'Alice', 'HR Manager', 1, NULL);


--
-- TOC entry 5101 (class 0 OID 18094)
-- Dependencies: 224
-- Data for Name: meeting_room; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.meeting_room (building_id, room_id, capacity, catering, combines_with_b, combines_with_r) VALUES ('A', 101, 120, true, NULL, NULL);
INSERT INTO public.meeting_room (building_id, room_id, capacity, catering, combines_with_b, combines_with_r) VALUES ('A', 102, 200, false, 'A', 103);
INSERT INTO public.meeting_room (building_id, room_id, capacity, catering, combines_with_b, combines_with_r) VALUES ('A', 103, 250, true, 'A', 102);
INSERT INTO public.meeting_room (building_id, room_id, capacity, catering, combines_with_b, combines_with_r) VALUES ('K', 319, 100, NULL, NULL, NULL);


--
-- TOC entry 5102 (class 0 OID 18099)
-- Dependencies: 225
-- Data for Name: office; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.office (building_id, room_id, desk_no, locker_no) VALUES ('A', 301, 4, 2);
INSERT INTO public.office (building_id, room_id, desk_no, locker_no) VALUES ('K', 201, 3, 1);
INSERT INTO public.office (building_id, room_id, desk_no, locker_no) VALUES ('E', 101, 5, 3);
INSERT INTO public.office (building_id, room_id, desk_no, locker_no) VALUES ('G', 101, 3, 3);
INSERT INTO public.office (building_id, room_id, desk_no, locker_no) VALUES ('G', 102, 4, 4);
INSERT INTO public.office (building_id, room_id, desk_no, locker_no) VALUES ('E', 102, 4, 4);


--
-- TOC entry 5103 (class 0 OID 18104)
-- Dependencies: 226
-- Data for Name: parking_space; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.parking_space (park_id, registration_number, emp_id) VALUES (2, 'M-BB-234', 12);
INSERT INTO public.parking_space (park_id, registration_number, emp_id) VALUES (3, 'M-CC-345', 13);
INSERT INTO public.parking_space (park_id, registration_number, emp_id) VALUES (4, 'M-DD-456', NULL);
INSERT INTO public.parking_space (park_id, registration_number, emp_id) VALUES (1, 'M-AA-123', 1);


--
-- TOC entry 5104 (class 0 OID 18108)
-- Dependencies: 227
-- Data for Name: reservation1; Type: TABLE DATA; Schema: public; Owner: postgres
--


-- TOC entry 5107 (class 0 OID 18126)
-- Dependencies: 230
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.room (building_id, room_id, size, type) VALUES ('A', 101, 200, 'M');
INSERT INTO public.room (building_id, room_id, size, type) VALUES ('A', 102, 250, 'M');
INSERT INTO public.room (building_id, room_id, size, type) VALUES ('A', 103, 300, 'M');
INSERT INTO public.room (building_id, room_id, size, type) VALUES ('E', 101, 30, 'O');
INSERT INTO public.room (building_id, room_id, size, type) VALUES ('A', 301, 45, 'O');
INSERT INTO public.room (building_id, room_id, size, type) VALUES ('K', 201, 35, 'O');
INSERT INTO public.room (building_id, room_id, size, type) VALUES ('K', 319, 120, 'M');
INSERT INTO public.room (building_id, room_id, size, type) VALUES ('G', 101, 100, 'O');
INSERT INTO public.room (building_id, room_id, size, type) VALUES ('G', 102, 50, 'O');
INSERT INTO public.room (building_id, room_id, size, type) VALUES ('E', 102, 100, 'O');


--
-- TOC entry 5108 (class 0 OID 18131)
-- Dependencies: 231
-- Data for Name: skill; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.skill (skill, description) VALUES ('SQL', 'Structured Query Language');
INSERT INTO public.skill (skill, description) VALUES ('HR', 'Human Resources management');
INSERT INTO public.skill (skill, description) VALUES ('Python', 'Programming in Python');
INSERT INTO public.skill (skill, description) VALUES ('AI', 'Machine learning concepts');



