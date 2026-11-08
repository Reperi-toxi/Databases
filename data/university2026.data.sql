-- Data only (no schema), ordered so every foreign key is satisfied

INSERT INTO public.professor VALUES (2125, 'Sokrates', 'C4');
INSERT INTO public.professor VALUES (2126, 'Russel', 'C4');
INSERT INTO public.professor VALUES (2127, 'Kopernikus', 'C3');
INSERT INTO public.professor VALUES (2133, 'Popper', 'C3');
INSERT INTO public.professor VALUES (2134, 'Augustinus', 'C3');
INSERT INTO public.professor VALUES (2136, 'Curie', 'C4');
INSERT INTO public.professor VALUES (2137, 'Kant', 'C4');

INSERT INTO public.student VALUES (24002, 'Xenokrates', 18, NULL);
INSERT INTO public.student VALUES (24100, 'Jonas', NULL, 'Jonas@kiu.edu.ge');
INSERT INTO public.student VALUES (24101, 'Jonas', NULL, 'Jonas1@kiu.edu.ge');
INSERT INTO public.student VALUES (24102, 'Jonas', NULL, 'Jonas2@kiu.edu.ge');
INSERT INTO public.student VALUES (25403, 'Jonas', 12, NULL);
INSERT INTO public.student VALUES (26120, 'Fichte', 10, NULL);
INSERT INTO public.student VALUES (26830, 'Aristoxenos', NULL, NULL);
INSERT INTO public.student VALUES (27550, 'Schopenhauer', 0, NULL);
INSERT INTO public.student VALUES (28106, 'Carnap', NULL, NULL);
INSERT INTO public.student VALUES (29120, 'Theophrastos', 0, NULL);
INSERT INTO public.student VALUES (29555, 'Feuerbach', NULL, NULL);
INSERT INTO public.student VALUES (29990, 'Hegel', 0, 'Hegel@kiu.edu.ge');
INSERT INTO public.student VALUES (29991, 'Hegel', 0, 'Hegel1@kiu.edu.ge');
INSERT INTO public.student VALUES (29992, 'Hegel', 0, 'Hegel2@kiu.edu.ge');

INSERT INTO public.course VALUES (4052, 'Logic', 4, 2125);
INSERT INTO public.course VALUES (4630, 'Three Critics', 4, 2137);
INSERT INTO public.course VALUES (5001, 'Foundation', 4, 2137);
INSERT INTO public.course VALUES (5022, 'Science and Faith', 2, 2134);
INSERT INTO public.course VALUES (5041, 'Ethics', 4, 2125);
INSERT INTO public.course VALUES (5043, 'Cognition Theory', 3, 2126);
INSERT INTO public.course VALUES (5049, 'maieutics', 2, 2125);
INSERT INTO public.course VALUES (5052, 'philosophy of science', 3, 2126);
INSERT INTO public.course VALUES (5216, 'Bioethics', 2, 2126);
INSERT INTO public.course VALUES (5259, 'Vienna Circle', 2, 2133);

INSERT INTO public.assistant VALUES (3002, 'Platon', 'Ideology', 2125);
INSERT INTO public.assistant VALUES (3003, 'Aristoteles', 'Logic', 2125);
INSERT INTO public.assistant VALUES (3004, 'Wittgenstein', 'Speech Theorie', 2126);
INSERT INTO public.assistant VALUES (3005, 'Rhetikus', 'Movement of Planets', 2127);
INSERT INTO public.assistant VALUES (3006, 'Newton', 'Kepler''s laws', 2127);
INSERT INTO public.assistant VALUES (3007, 'Spinoza', 'God and Nature', 2134);

INSERT INTO public.enrollment VALUES (25403, 5022);
INSERT INTO public.enrollment VALUES (26120, 5001);
INSERT INTO public.enrollment VALUES (27550, 4052);
INSERT INTO public.enrollment VALUES (27550, 5001);
INSERT INTO public.enrollment VALUES (28106, 5041);
INSERT INTO public.enrollment VALUES (28106, 5052);
INSERT INTO public.enrollment VALUES (28106, 5216);
INSERT INTO public.enrollment VALUES (28106, 5259);
INSERT INTO public.enrollment VALUES (29120, 4052);
INSERT INTO public.enrollment VALUES (29120, 4630);
INSERT INTO public.enrollment VALUES (29120, 5001);
INSERT INTO public.enrollment VALUES (29120, 5041);
INSERT INTO public.enrollment VALUES (29120, 5049);
INSERT INTO public.enrollment VALUES (29555, 5001);
INSERT INTO public.enrollment VALUES (29555, 5022);

INSERT INTO public.examination VALUES (25403, 5001, 2126, 'B', 85);
INSERT INTO public.examination VALUES (25403, 5041, 2125, 'B', 81);
INSERT INTO public.examination VALUES (26120, 5001, 2126, 'B', 88);
INSERT INTO public.examination VALUES (26830, 5001, 2126, 'C', 75);
INSERT INTO public.examination VALUES (27550, 4630, 2137, 'E', 51);
INSERT INTO public.examination VALUES (27550, 5001, 2126, 'C', 74);
INSERT INTO public.examination VALUES (28106, 5001, 2126, 'A', 95);
INSERT INTO public.examination VALUES (29555, 5001, 2126, 'E', 40);

INSERT INTO public.requirement VALUES (5041, 4630);
INSERT INTO public.requirement VALUES (4052, 5049);
INSERT INTO public.requirement VALUES (5041, 5049);
INSERT INTO public.requirement VALUES (5259, 5052);
INSERT INTO public.requirement VALUES (4630, 5259);
