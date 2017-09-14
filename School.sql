CREATE TABLE student (
  id            SERIAL PRIMARY KEY,
  created_at    TIMESTAMP DEFAULT now(),
  first_name    TEXT NOT NULL,
  last_name     TEXT NOT NULL,
  student_id    TEXT NOT NULL UNIQUE,
  social_num    TEXT NOT NULL UNIQUE,
  enroll_date   TIMESTAMP NOT NULL
);

CREATE TABLE year (
  id            SERIAL PRIMARY KEY,
  created_at    TIMESTAMP DEFAULT now(),
  year          INTEGER NOT NULL UNIQUE
);

CREATE TABLE semester (
  id            SERIAL PRIMARY KEY,
  created_at    TIMESTAMP DEFAULT now(),
  semester_name TEXT NOT NULL
);

CREATE TABLE professor (
  id            SERIAL PRIMARY KEY,
  created_at    TIMESTAMP PRIMARY KEY,
  first_name    TEXT NOT NULL,
  last_name     TEXT NOT NULL,
  teacher_id    TEXT NOT NULL UNIQUE,
  started_teaching_at TIMESTAMP NOT NULL
);

CREATE TABLE course (
  id            SERIAL PRIMARY KEY,
  created_at    TIMESTAMP DEFAULT now(),
  course_number TEXT NOT NULL UNIQUE,
  course_name   TEXT NOT NULL UNIQUE
);

CREATE TABLE professor_course_map (
  id            SERIAL PRIMARY KEY,
  created_at    TIMESTAMP PRIMARY KEY,
  professor_id  INTEGER NOT NULL REFERENCES professor (id) ON DELETE CASCADE ON UPDATE CASCADE,
  course_id     INTEGER NOT NULL REFERENCES course (id) ON DELETE CASCADE ON UPDATE CASCADE,
  year_id       INTEGER NOT NULL REFERENCES year (id) ON DELETE CASCADE ON UPDATE CASCADE,
  semester_id   INTEGER NOT NULL REFERENCES semester (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE course_change_map (
  id            SERIAL PRIMARY KEY,
  created_at    TIMESTAMP DEFAULT now(),
  original_course_id  INTEGER NOT NULL REFERENCES course(id) ON DELETE CASCADE ON UPDATE CASCADE,
  new_course_id INTEGER NOT NULL REFERENCES course(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE student_enrolled_course_map (
  id            SERIAL PRIMARY KEY,
  created_at    TIMESTAMP DEFAULT now(),
  student_id    INTEGER NOT NULL REFERENCES student(id) ON DELETE CASCADE ON UPDATE CASCADE,
  professor_course_map_id INTEGER NOT NULL REFERENCES professor_course_map (id) ON DELETE CASCADE ON UPDATE CASCADE,
  gpa           TEXT NOT NULL DEFAULT 'NC'
);