# creating and use database

USE StudentManagement;

# Create table for students
CREATE TABLE students3 (
    student_id INT PRIMARY KEY,
    name VARCHAR(100)
);

# Create table for scores
CREATE TABLE scores (
    student_id INT,
    subject VARCHAR(100),
    score INT,
    FOREIGN KEY (student_id) REFERENCES students3(student_id)
);


# Insert data into students table
INSERT INTO students3 (student_id, name) VALUES
(1, 'Alice'),(2, 'Bob'),(3, 'Charlie'),(4, 'Daisy'),(5, 'Ethan'),
(6, 'Fiona'),(7, 'George'),(8, 'Hannah'),(9, 'Ian'),(10, 'Jane');

# Insert data into scores table
INSERT INTO scores (student_id, subject, score) VALUES
(1, 'Math', 45),(1, 'Science', 50),(2, 'Math', 35),(2, 'Science', 42),(3, 'Math', 40),
(3, 'Science', 41),(4, 'Math', 39),(4, 'Science', 47),(5, 'Math', 60),(5, 'Science', 55),
(6, 'Math', 50),(6, 'Science', 70),(7, 'Math', 30),(7, 'Science', 20),(8, 'Math', 50),
(8, 'Science', 60),(9, 'Math', 49),(9, 'Science', 40),(10, 'Math', 45),(10, 'Science', 30);

# TASKS TO PERFORM
# Create a View for Student Scores
#		Objective: Store student names and scores for easier access.

CREATE VIEW student_scores AS
SELECT students3.student_id, students3.name, scores.subject, scores.score
FROM students3 
JOIN scores  ON students3.student_id = scores.student_id;
SELECT * FROM student_scores;

# Create a View for Students Who Passed All Subjects
#		Objective: Show students who passed all subjects (e.g., passing score ≥ 40).
CREATE VIEW passed_students AS
SELECT student_id, name
FROM students3
WHERE student_id NOT IN (
SELECT student_id FROM scores WHERE score < 40
);
