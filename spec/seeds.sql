TRUNCATE TABLE cohorts, students RESTART IDENTITY;

INSERT INTO cohorts (cohort_name, start_date) VALUES ('october', '01/10/2022');
INSERT INTO cohorts (cohort_name, start_date) VALUES ('november', '01/11/2022');
INSERT INTO cohorts (cohort_name, start_date) VALUES ('december', '01/12/2022');

INSERT INTO students (name, cohort_id) VALUES ('robin', 1);
INSERT INTO students (name, cohort_id) VALUES ('alastair', 1);
INSERT INTO students (name, cohort_id) VALUES ('jeff', 2);
INSERT INTO students (name, cohort_id) VALUES ('bill gates', 3);
INSERT INTO students (name, cohort_id) VALUES ('robin-resit', 3);

