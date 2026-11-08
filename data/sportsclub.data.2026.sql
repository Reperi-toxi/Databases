--
-- PostgreSQL database dump
--

INSERT INTO public.device (device_id, description) VALUES (1, 'treadmill');
INSERT INTO public.device (device_id, description) VALUES (2, 'rowing machine');
INSERT INTO public.device (device_id, description) VALUES (3, 'bicycle');

INSERT INTO public.targetgroup (targetgroup, description) VALUES ('all', 'everybody');
INSERT INTO public.targetgroup (targetgroup, description) VALUES ('kid', 'kinds up to 10');
INSERT INTO public.targetgroup (targetgroup, description) VALUES ('jun', 'young people 10 - 20');
INSERT INTO public.targetgroup (targetgroup, description) VALUES ('sen', 'seniors');
INSERT INTO public.targetgroup (targetgroup, description) VALUES ('men', 'courses for men');
INSERT INTO public.targetgroup (targetgroup, description) VALUES ('wom', 'courses for women');
INSERT INTO public.targetgroup (targetgroup, description) VALUES ('fam', 'for families');

INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('lazy', true, 'lazy@xx.ge', 4600, '1996-11-25', 'm', NULL, NULL);
INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('hope', false, 'hope@xx.ge', 4565, '1965-09-14', 'f', '2016-03-01', NULL);
INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('luke', false, 'luke@xxx.ge', 4565, '1998-11-22', 'm', NULL, 'hope');
INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('klopp', true, 'klopp@xx.ge', 4600, '1980-12-24', 'm', '2018-01-01', NULL);
INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('figaro', false, 'figaro@xx.ge', 3674, '1980-12-24', 'm', NULL, NULL);
INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('coach', true, 'coach@xx.ge', 4600, '1988-12-01', 'm', NULL, NULL);
INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('nelly', true, 'nelly@xx.ge', 4000, '1990-04-21', 'f', NULL, NULL);
INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('lion', true, 'lion@xxx.ge', 108, '1990-10-10', 'm', NULL, NULL);
INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('valerie', false, 'val@xx.ge', 4600, '1970-03-20', 'f', NULL, NULL);
INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('ana', true, 'ana@cc.ee', 4006, '2000-12-15', 'f', NULL, NULL);
INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('lena', true, 'lena@xx.ge', 105, '1980-12-24', 'f', NULL, NULL);
INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('isabel', true, 'isabel@new.xx', 4007, '2005-03-01', 'f', NULL, NULL);
INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('Tati', true, 'tati@new.xx', 4600, '2001-01-01', 'f', NULL, NULL);
INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('Giorgi', true, 'giorgi@new.xx', 4600, '1999-09-12', 'm', NULL, NULL);
INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('robin', false, 'nelly@xx.ge', 4600, '2012-09-16', 'm', '2017-01-01', 'nelly');
INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('rose', false, 'lion@xx.ge', 107, '2015-02-10', 'f', NULL, 'lion');
INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('val', false, 'val@xx.ge', 103, '2013-07-12', 'm', '2020-05-01', 'figaro');
INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('lisa', false, 'figaro@xx.ge', 4600, '2015-11-19', 'f', NULL, 'figaro');
INSERT INTO public.member (memname, is_trainer, email, postalcode, birthday, gender, entry_date, parent) VALUES ('aron', false, 'klopp@xx.ge', 4600, '2013-11-06', 'm', '2020-01-01', 'klopp');


INSERT INTO public.trainer (t_name, license, start_date) VALUES ('coach', true, '2021-10-01');
INSERT INTO public.trainer (t_name, license, start_date) VALUES ('lazy', true, NULL);
INSERT INTO public.trainer (t_name, license, start_date) VALUES ('lena', false, NULL);
INSERT INTO public.trainer (t_name, license, start_date) VALUES ('nelly', false, NULL);
INSERT INTO public.trainer (t_name, license, start_date) VALUES ('klopp', true, '2019-01-01');
INSERT INTO public.trainer (t_name, license, start_date) VALUES ('ana', false, NULL);
INSERT INTO public.trainer (t_name, license, start_date) VALUES ('isabel', false, NULL);
INSERT INTO public.trainer (t_name, license, start_date) VALUES ('Tati', false, NULL);
INSERT INTO public.trainer (t_name, license, start_date) VALUES ('Giorgi', false, NULL);



INSERT INTO public.area (area, description, manager) VALUES ('athletics ', 'High jump, long jump, decathlon, penthalon, sprint distances and the like', 'nelly');
INSERT INTO public.area (area, description, manager) VALUES ('watersport', 'All sports that have to do with water', 'lazy');
INSERT INTO public.area (area, description, manager) VALUES ('fitness   ', 'Comprises all courses that encrease healthy lifestyle and fitness', 'coach');
INSERT INTO public.area (area, description, manager) VALUES ('martialArt', 'Wresting, Judo and the like', 'klopp');


INSERT INTO public.course (course_id, course_name, targetgroup, area, trainer) VALUES (2, 'waterball', 'men', 'watersport', 'klopp');
INSERT INTO public.course (course_id, course_name, targetgroup, area, trainer) VALUES (5, 'fitnessKids', 'kid', 'fitness   ', 'klopp');
INSERT INTO public.course (course_id, course_name, targetgroup, area, trainer) VALUES (14, 'fitness5', 'all', 'fitness   ', 'klopp');
INSERT INTO public.course (course_id, course_name, targetgroup, area, trainer) VALUES (13, 'fitness4', 'all', 'fitness   ', NULL);
INSERT INTO public.course (course_id, course_name, targetgroup, area, trainer) VALUES (1, 'wrestling', 'men', 'martialArt', 'klopp');
INSERT INTO public.course (course_id, course_name, targetgroup, area, trainer) VALUES (6, 'high jump', 'all', 'athletics ', 'lena');
INSERT INTO public.course (course_id, course_name, targetgroup, area, trainer) VALUES (8, 'swimming', 'all', 'watersport', 'lena');
INSERT INTO public.course (course_id, course_name, targetgroup, area, trainer) VALUES (7, 'obstacle race', 'all', 'athletics ', 'nelly');
INSERT INTO public.course (course_id, course_name, targetgroup, area, trainer) VALUES (4, 'jogging', 'fam', 'fitness   ', 'lena');
INSERT INTO public.course (course_id, course_name, targetgroup, area, trainer) VALUES (11, 'fitness2', 'fam', 'fitness   ', NULL);
INSERT INTO public.course (course_id, course_name, targetgroup, area, trainer) VALUES (12, 'fitness3', 'fam', 'fitness   ', NULL);
INSERT INTO public.course (course_id, course_name, targetgroup, area, trainer) VALUES (15, 'gymnastics water', 'fam', 'watersport', 'lena');
INSERT INTO public.course (course_id, course_name, targetgroup, area, trainer) VALUES (9, 'free style', 'kid', 'watersport', 'lazy');
INSERT INTO public.course (course_id, course_name, targetgroup, area, trainer) VALUES (3, 'running', 'men', NULL, 'lazy');
INSERT INTO public.course (course_id, course_name, targetgroup, area, trainer) VALUES (10, 'aerobics', 'all', NULL, 'lena');

INSERT INTO public.enrollment (memname, course_id) VALUES ('lion', 5);
INSERT INTO public.enrollment (memname, course_id) VALUES ('lion', 6);
INSERT INTO public.enrollment (memname, course_id) VALUES ('lion', 7);
INSERT INTO public.enrollment (memname, course_id) VALUES ('lion', 10);
INSERT INTO public.enrollment (memname, course_id) VALUES ('lisa', 6);
INSERT INTO public.enrollment (memname, course_id) VALUES ('lisa', 9);
INSERT INTO public.enrollment (memname, course_id) VALUES ('nelly', 1);
INSERT INTO public.enrollment (memname, course_id) VALUES ('nelly', 4);
INSERT INTO public.enrollment (memname, course_id) VALUES ('nelly', 5);
INSERT INTO public.enrollment (memname, course_id) VALUES ('nelly', 6);
INSERT INTO public.enrollment (memname, course_id) VALUES ('nelly', 7);
INSERT INTO public.enrollment (memname, course_id) VALUES ('nelly', 10);
INSERT INTO public.enrollment (memname, course_id) VALUES ('robin', 5);
INSERT INTO public.enrollment (memname, course_id) VALUES ('robin', 6);
INSERT INTO public.enrollment (memname, course_id) VALUES ('robin', 7);
INSERT INTO public.enrollment (memname, course_id) VALUES ('robin', 10);
INSERT INTO public.enrollment (memname, course_id) VALUES ('rose', 4);
INSERT INTO public.enrollment (memname, course_id) VALUES ('rose', 5);
INSERT INTO public.enrollment (memname, course_id) VALUES ('rose', 6);
INSERT INTO public.enrollment (memname, course_id) VALUES ('rose', 7);
INSERT INTO public.enrollment (memname, course_id) VALUES ('rose', 10);
INSERT INTO public.enrollment (memname, course_id) VALUES ('val', 1);
INSERT INTO public.enrollment (memname, course_id) VALUES ('val', 4);
INSERT INTO public.enrollment (memname, course_id) VALUES ('val', 5);
INSERT INTO public.enrollment (memname, course_id) VALUES ('val', 6);
INSERT INTO public.enrollment (memname, course_id) VALUES ('valerie', 1);
INSERT INTO public.enrollment (memname, course_id) VALUES ('valerie', 4);
INSERT INTO public.enrollment (memname, course_id) VALUES ('valerie', 5);
INSERT INTO public.enrollment (memname, course_id) VALUES ('valerie', 6);
INSERT INTO public.enrollment (memname, course_id) VALUES ('valerie', 7);
INSERT INTO public.enrollment (memname, course_id) VALUES ('valerie', 10);
INSERT INTO public.enrollment (memname, course_id) VALUES ('figaro', 1);
INSERT INTO public.enrollment (memname, course_id) VALUES ('hope', 1);
INSERT INTO public.enrollment (memname, course_id) VALUES ('hope', 5);
INSERT INTO public.enrollment (memname, course_id) VALUES ('hope', 6);
INSERT INTO public.enrollment (memname, course_id) VALUES ('hope', 7);
INSERT INTO public.enrollment (memname, course_id) VALUES ('hope', 10);
INSERT INTO public.enrollment (memname, course_id) VALUES ('lion', 4);
INSERT INTO public.enrollment (memname, course_id) VALUES ('coach', 1);
INSERT INTO public.enrollment (memname, course_id) VALUES ('robin', 1);
INSERT INTO public.enrollment (memname, course_id) VALUES ('coach', 4);




INSERT INTO public.reservation (memname, timeslot, device_id) VALUES ('klopp', '2024-10-14 14:53:15.562498', 2);
INSERT INTO public.reservation (memname, timeslot, device_id) VALUES ('figaro', '2024-10-14 14:53:15.562498', 1);
INSERT INTO public.reservation (memname, timeslot, device_id) VALUES ('hope', '2024-10-13 21:14:42.426565', 1);


