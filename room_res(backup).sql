--
-- PostgreSQL database dump
--

\restrict SLHhYi9VSYYoMrYyxbDCwd9eEHmannsEwFxetnQlHLFmKjHYji6iEl9N6FqUsNW

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

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
-- Name: building; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.building (
    building_id character(1) NOT NULL,
    year_constr integer
);


ALTER TABLE public.building OWNER TO postgres;

--
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    dep_id integer NOT NULL,
    depname character varying(100),
    manager_id integer
);


ALTER TABLE public.department OWNER TO postgres;

--
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    emp_id integer NOT NULL,
    name character varying(100),
    function character varying(100),
    office_no integer,
    office_building character(1),
    dep_id integer,
    mentor_id integer,
    CONSTRAINT no_self_mentor CHECK ((mentor_id IS DISTINCT FROM emp_id))
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- Name: employee_has_skill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee_has_skill (
    emp_id integer NOT NULL,
    skill character varying(100) NOT NULL
);


ALTER TABLE public.employee_has_skill OWNER TO postgres;

--
-- Name: meeting_room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.meeting_room (
    building_id character(1) NOT NULL,
    room_id integer NOT NULL,
    capacity integer,
    catering boolean,
    combines_with_room_id integer,
    combines_with_building_id character(1)
);


ALTER TABLE public.meeting_room OWNER TO postgres;

--
-- Name: office; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.office (
    building_id character(1) NOT NULL,
    room_id integer NOT NULL,
    desk_no integer,
    locker_no integer
);


ALTER TABLE public.office OWNER TO postgres;

--
-- Name: parking_space; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.parking_space (
    park_id integer NOT NULL,
    licence_no character varying(50),
    employee_id integer
);


ALTER TABLE public.parking_space OWNER TO postgres;

--
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservation (
    building_id character(1) NOT NULL,
    room_id integer NOT NULL,
    timeslot timestamp without time zone NOT NULL,
    employee_id integer,
    occasion character varying(100),
    no_guests integer
);


ALTER TABLE public.reservation OWNER TO postgres;

--
-- Name: room; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.room (
    building_id character(1) NOT NULL,
    room_id integer NOT NULL,
    size integer
);


ALTER TABLE public.room OWNER TO postgres;

--
-- Name: skill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skill (
    skill character varying(100) NOT NULL,
    description character varying(200)
);


ALTER TABLE public.skill OWNER TO postgres;

--
-- Name: building building_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.building
    ADD CONSTRAINT building_pkey PRIMARY KEY (building_id);


--
-- Name: department department_manager_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_manager_id_key UNIQUE (manager_id);


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (dep_id);


--
-- Name: employee_has_skill employee_has_skill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_has_skill
    ADD CONSTRAINT employee_has_skill_pkey PRIMARY KEY (emp_id, skill);


--
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (emp_id);


--
-- Name: meeting_room meeting_room_combines_with_building_id_combines_with_room_i_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meeting_room
    ADD CONSTRAINT meeting_room_combines_with_building_id_combines_with_room_i_key UNIQUE (combines_with_building_id, combines_with_room_id);


--
-- Name: meeting_room meeting_room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meeting_room
    ADD CONSTRAINT meeting_room_pkey PRIMARY KEY (building_id, room_id);


--
-- Name: office office_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office
    ADD CONSTRAINT office_pkey PRIMARY KEY (building_id, room_id);


--
-- Name: parking_space parking_space_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parking_space
    ADD CONSTRAINT parking_space_pkey PRIMARY KEY (park_id);


--
-- Name: reservation reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (building_id, room_id, timeslot);


--
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (building_id, room_id);


--
-- Name: skill skill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill
    ADD CONSTRAINT skill_pkey PRIMARY KEY (skill);


--
-- Name: employee employee_dep_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_dep_id_fkey FOREIGN KEY (dep_id) REFERENCES public.department(dep_id) ON DELETE SET NULL;


--
-- Name: employee_has_skill employee_has_skill_emp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_has_skill
    ADD CONSTRAINT employee_has_skill_emp_id_fkey FOREIGN KEY (emp_id) REFERENCES public.employee(emp_id) ON DELETE CASCADE;


--
-- Name: employee_has_skill employee_has_skill_skill_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee_has_skill
    ADD CONSTRAINT employee_has_skill_skill_fkey FOREIGN KEY (skill) REFERENCES public.skill(skill) ON DELETE CASCADE;


--
-- Name: employee employee_mentor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_mentor_id_fkey FOREIGN KEY (mentor_id) REFERENCES public.employee(emp_id) ON DELETE SET NULL;


--
-- Name: employee employee_office_building_office_no_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_office_building_office_no_fkey FOREIGN KEY (office_building, office_no) REFERENCES public.office(building_id, room_id) ON DELETE SET NULL;


--
-- Name: department fk_dept_manager; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT fk_dept_manager FOREIGN KEY (manager_id) REFERENCES public.employee(emp_id) ON DELETE SET NULL;


--
-- Name: meeting_room meeting_room_building_id_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meeting_room
    ADD CONSTRAINT meeting_room_building_id_room_id_fkey FOREIGN KEY (building_id, room_id) REFERENCES public.room(building_id, room_id) ON DELETE CASCADE;


--
-- Name: meeting_room meeting_room_combines_with_building_id_combines_with_room__fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.meeting_room
    ADD CONSTRAINT meeting_room_combines_with_building_id_combines_with_room__fkey FOREIGN KEY (combines_with_building_id, combines_with_room_id) REFERENCES public.meeting_room(building_id, room_id) ON DELETE SET NULL;


--
-- Name: office office_building_id_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office
    ADD CONSTRAINT office_building_id_room_id_fkey FOREIGN KEY (building_id, room_id) REFERENCES public.room(building_id, room_id) ON DELETE CASCADE;


--
-- Name: parking_space parking_space_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.parking_space
    ADD CONSTRAINT parking_space_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(emp_id) ON DELETE SET NULL;


--
-- Name: reservation reservation_building_id_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_building_id_room_id_fkey FOREIGN KEY (building_id, room_id) REFERENCES public.meeting_room(building_id, room_id) ON DELETE CASCADE;


--
-- Name: reservation reservation_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservation
    ADD CONSTRAINT reservation_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(emp_id) ON DELETE SET NULL;


--
-- Name: room room_building_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_building_id_fkey FOREIGN KEY (building_id) REFERENCES public.building(building_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict SLHhYi9VSYYoMrYyxbDCwd9eEHmannsEwFxetnQlHLFmKjHYji6iEl9N6FqUsNW

