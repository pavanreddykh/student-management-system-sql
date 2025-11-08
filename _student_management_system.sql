-- STUDENT MANAGEMENT SYSTEM DATABASE
-- Author: Pavan Reddy
-- Description: A beginner SQL project to manage student data, courses, and marks.

-- STEP 1: CREATE DATABASE
CREATE DATABASE student_management;
USE student_management;

-- STEP 2: CREATE TABLES
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    department VARCHAR(50)
);

CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(50),
    credits INT
);

CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    marks INT,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- STEP 3: INSERT SAMPLE DATA
INSERT INTO students (name, age, gender, department) VALUES
('Ravi Kumar', 21, 'Male', 'Computer Science'),
('Priya Sharma', 20, 'Female', 'Information Science'),
('Amit Verma', 22, 'Male', 'Electronics'),
('Kavya Iyer', 21, 'Female', 'Mechanical');

INSERT INTO courses (course_name, credits) VALUES
('Database Systems', 4),
('Operating Systems', 3),
('Data Structures', 4),
('Computer Networks', 3);

INSERT INTO enrollments (student_id, course_id, marks) VALUES
(1, 1, 88),
(1, 2, 92),
(2, 3, 85),
(3, 4, 75),
(4, 1, 89),
(2, 2, 91);

-- STEP 4: SAMPLE QUERIES

-- 1. List all students with their enrolled courses and marks
SELECT s.name AS student_name, c.course_name, e.marks
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
ORDER BY s.name;

-- 2. Average marks per course
SELECT c.course_name, AVG(e.marks) AS average_marks
FROM enrollments e
JOIN courses c ON e.course_id = c.course_id
GROUP BY c.course_name;

-- 3. Top-performing students (marks > 90)
SELECT s.name, c.course_name, e.marks
FROM enrollments e
JOIN students s ON e.student_id = s.student_id
JOIN courses c ON e.course_id = c.course_id
WHERE e.marks > 90;
