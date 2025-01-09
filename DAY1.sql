# creating and use database

CREATE DATABASE StudentManagement;
USE StudentManagement;

# creating table

CREATE TABLE Students(
	StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Gender VARCHAR(1),
    Age INT,
	Grade VARCHAR(10),
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT 
);

# inserting data into tables

INSERT INTO Students VALUES(1,"Rabi Sen","M",19,"A",90,30,29);
INSERT INTO Students VALUES(2,"Kalki Pa;","F",20,"C",60,70,49);
INSERT INTO Students VALUES(3,"Sutanu Kar","M",19,"B",78,67,79);
INSERT INTO Students VALUES(4,"Naincy Rath","F",19,"A",90,90,96);
INSERT INTO Students VALUES(5,"Pritha Rani Das","F",18,"A",80,100,98);
INSERT INTO Students VALUES(6,"Akhil Singh","M",19,"F",30,30,29);
INSERT INTO Students VALUES(7,"Anshika Kumari","F",20,"A",90,80,99);
INSERT INTO Students VALUES(8,"Shivansh Batra","M",18,"B",87,80,79);
INSERT INTO Students VALUES(9,"Harsh Raj","M",20,"D",45,50,69);
INSERT INTO Students VALUES(10,"Poulami Roy","F",20,"C",56,30,49);

# queries for analysis

# TASK-1 : Display all students and their details to get an overview of the data
SELECT * FROM Students;

# TASK-2 : Calculate the average scores for each subject to understand subject-wise performance
SELECT AVG(MathScore),AVG(ScienceScore),AVG(EnglishScore) FROM Students;

# TASK-3 : Find the student(s) with the highest total score across all subjects 
#		   to identify the top performer
SELECT Name,(MathScore + ScienceScore + EnglishScore ) AS TotalScore
FROM Students
ORDER BY TotalScore DESC
LIMIT 1;

# TASK-4 : Count the number of students in each grade to observe grade distribution
SELECT Grade,COUNT(*)
FROM Students
GROUP BY Grade;

# TASK-5 : Find the average score for male and female students to compare performance by gender
SELECT Gender,AVG(MathScore),AVG(ScienceScore),AVG(EnglishScore)
FROM Students
GROUP BY Gender;

# TASK-6 : Identify students whose Math score is above 80 to highlight high achievers in Math
SELECT Name, MathScore
FROM Students
WHERE MathScore > 80;

# TASK-7 : Update the grade of a student with a specific Student ID to reflect changes or corrections
UPDATE StudentID
SET Grade = 'O'
WHERE StudentId = 4;

# Verifying the update
SELECT *
FROM Students
WHERE StudentID = 4;













