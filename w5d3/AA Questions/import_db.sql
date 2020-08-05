DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS questions_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS students;

PRAGMA foreign_keys = ON;


CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    fname TEXT NOT NULL,
    lname TEXT NOT NULL
);

INSERT INTO 
    students (fname, lname) 
VALUES
    ("Ellis","Pae"), ("Aaron","Lewis");


CREATE TABLE questions (
    id INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    author_id INTEGER NOT NULL,

    FOREIGN KEY (author_id) REFERENCES students(id)
);


INSERT INTO 
    questions(title,body,author_id) 
SELECT
    "Where is my partner?","I don't know",students.id
FROM
    students
WHERE
    students.lname = 'Pae';

INSERT INTO 
    questions(title,body,author_id) 
SELECT
    "Where is my lunch?","I am hungry", students.id
FROM
    students
WHERE
    students.lname = 'Lewis';





CREATE TABLE questions_follows (
    id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,

    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
    questions_follows (student_id, question_id) 
VALUES
    ((SELECT id FROM students WHERE fname = 'Ellis'),
    (SELECT id FROM questions WHERE title = 'Where is my partner?')
);



CREATE TABLE replies (
    id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    body TEXT NOT NULL,
    parent_id INTEGER,

    FOREIGN KEY (parent_id) REFERENCES replies(id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
    replies (student_id, question_id, body, parent_id) 
VALUES
    ((SELECT id FROM students WHERE fname = 'Ellis'),
    (SELECT id FROM questions WHERE title = 'Where is my partner?'),
    "still have not found him", 
    NULL
);


INSERT INTO 
    replies (student_id, question_id, body, parent_id) 
VALUES
    ((SELECT id FROM students WHERE fname = 'Aaron'),
    (SELECT id FROM questions WHERE questions.title = 'Where is my partner?'),
    "I am here", 
    (SELECT id FROM replies WHERE replies.body = 'still have not found him')
);

INSERT INTO 
    replies (student_id, question_id, body, parent_id) 
VALUES
    ((SELECT id FROM students WHERE fname = 'Ellis'),
    (SELECT id FROM questions WHERE title = 'Where is my lunch?'),
    "You left your lunch at home", 
    NULL
);
    

CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    student_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO 
    question_likes (student_id, question_id) 
VALUES
    ((SELECT id FROM students WHERE fname = 'Ellis'),
    (SELECT id FROM questions WHERE title = 'Where is my lunch?')
);












