CREATE TABLE flat_school_model1 (
  id                          SERIAL PRIMARY KEY,
  major                       TEXT NOT NULL,
  enrollment_date             TIMESTAMP NOT NULL,
  student_first_name          TEXT NOT NULL,
  student_last_name           TEXT NOT NULL,
  class_1_subject             TEXT,
  class_1_teacher_first_name  TEXT,
  class_2_subject             TEXT,
  class_2_teacher_first_name  TEXT,
  class_3_subject             TEXT,
  class_3_teacher_first_name  TEXT,
  class_4_subject             TEXT,
  class_4_teacher_first_name  TEXT
);

-- What if a student took than 4 classes?
-- What if the student is part-time and takes less than 4 classes?

CREATE TABLE flat_school_model2 (
  id                          SERIAL PRIMARY KEY,
  major                       TEXT NOT NULL,
  enrollment_date             TIMESTAMP NOT NULL,
  student_first_name          TEXT NOT NULL,
  student_last_name           TEXT NOT NULL,
  class_1_subject             TEXT,
  class_1_teacher_first_name  TEXT,
  class_2_subject             TEXT,
  class_2_teacher_first_name  TEXT,
  class_3_subject             TEXT,
  class_3_teacher_first_name  TEXT,
  class_4_subject             TEXT,
  class_4_teacher_first_name  TEXT,
  class_5_subject             TEXT,
  class_5_teacher_first_name  TEXT,
  part_time                   BOOLEAN NOT NULL
);


-- No way to dedupe data (names are repeated over and over, potentially within the same row)
-- No way to ensure teacher name spelling accuracy because names are inserted at student row insert
-- No way store the student's class schedule for multiple semesters / years

CREATE TABLE flat_school_model3 (
  id                          SERIAL PRIMARY KEY,
  major                       TEXT NOT NULL,
  enrollment_date             TIMESTAMP NOT NULL,
  student_first_name          TEXT NOT NULL,
  student_last_name           TEXT NOT NULL,
  class_1_subject             TEXT,
  class_1_teacher_first_name  TEXT,
  class_2_subject             TEXT,
  class_2_teacher_first_name  TEXT,
  class_3_subject             TEXT,
  class_3_teacher_first_name  TEXT,
  class_4_subject             TEXT,
  class_4_teacher_first_name  TEXT,
  class_5_subject             TEXT,
  class_5_teacher_first_name  TEXT,
  part_time                   BOOLEAN NOT NULL,
  semester                    TEXT,
  year                        INTEGER
);

-- Should the semester be TEXT (e.g. Fall, Spring, Summer) or INTEGER (e.g. 1st, 2nd, 3rd semester)
-- Should the year be the actual year (2017? or the ordinal year of that students career (e.g. First/Freshman, Second/Sophomore, etc.)
-- What if the student drops and/or adds  courses midway through the semester?  Do we simply change the information and lose that information?
--  Or do we add a new row and then not be able to tell which came first other than the primary key

-- How do we reflect sibling relationships?  Or student relationship to an alumni?

CREATE TABLE flat_school_model4 (
  id                          SERIAL PRIMARY KEY,
  major                       TEXT NOT NULL,
  enrollment_date             TIMESTAMP NOT NULL,
  student_first_name          TEXT NOT NULL,
  student_last_name           TEXT NOT NULL,
  class_1_subject             TEXT,
  class_1_teacher_first_name  TEXT,
  class_2_subject             TEXT,
  class_2_teacher_first_name  TEXT,
  class_3_subject             TEXT,
  class_3_teacher_first_name  TEXT,
  class_4_subject             TEXT,
  class_4_teacher_first_name  TEXT,
  class_5_subject             TEXT,
  class_5_teacher_first_name  TEXT,
  part_time                   BOOLEAN NOT NULL,
  semester                    TEXT,
  year                        INTEGER,
  sibling_first_name          TEXT,
  sibling_last_name           TEXT,
  alumni_first_name           TEXT,
  alumni_last_name            TEXT
);

-- How do we get information on the sibling (e.g. class schedule)?
-- How do we get information on the alumni (e.g. Have they made any large donations to the school lately???)
-- What if the student changes majors without changing the courses mid-semester? Do we change the major and lose the
-- understanding of when the major was changed?  Or add another row and then be confused between the two?
-- What if we change the name of a course?  How will that be reflected for all students who took that course in previous semesters?

