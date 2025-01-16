# Using the previous table in Task-1
USE StudentManagement;

# Creating another table Courses
CREATE TABLE Courses(
CourseId INT PRIMARY KEY NOT NULL,
CourseName VARCHAR(20),
CourseDescription VARCHAR(30)
);

# Creating anothe table Enrolments
CREATE TABLE Enrolments(
EnrolmentId INT PRIMARY KEY NOT NULL,
StudentId INT ,
CourseId INT,
EnrolmentDate DATE,
FOREIGN KEY (StudentId) REFERENCES Students(StudentID),
FOREIGN KEY (CourseId) REFERENCES Courses(CourseId)
);

# Insert data into Courses
INSERT INTO Courses 
VALUES (101,'Maths','4 credit'),
(102,'English','2 credit'),
(103,'Biology','3 credit'),
(104,'Chemistry','3 credit');

# Insert data into Enrolments
INSERT INTO Enrolments (EnrolmentId,StudentId,CourseId,EnrolmentDate)
VALUES 
(10,1,101,'2024-02-22'),
(20,2,102,'2024-02-23'),
(30,3,102,'2024-02-29'),
(40,4,104,'2024-02-28'),
(50,5,103,'2024-02-22');

# Task 1: List all students and the courses they are enrolled in.
#---------------------Use an INNER JOIN to combine Students, Courses, and Enrolments tables.
#---------------------Select the student name and course name for all enrolled students.

SELECT 
	Students.Name AS sName,
    Courses.CourseName AS cName
FROM Enrolments
JOIN Students ON Enrolments.StudentId = Students.StudentId
JOIN Courses ON Enrolments.CourseId = Courses.CourseId;

# Task 2: Find the number of students enrolled in each course
#-----------------------Use a LEFT JOIN between Courses and Enrolments.
#-----------------------Use GROUP BY to group results by course_id and course_name.
#-----------------------Use COUNT(student_id) to calculate the number of enrolled students.
#----------------------Ensure courses with no enrolments are included in the results.

SELECT 
	Courses.CourseName,Courses.CourseID,
    COUNT(Enrolments.EnrolmentID) AS no_of_students
FROM Courses
LEFT JOIN Enrolments ON Courses.CourseID = Enrolments.CourseID
GROUP BY Courses.CourseName,Courses.CourseID;

# Task 3: List students who have enrolled in more than one course
#-----------------------Use the Enrolments table.
#-----------------------Group data by student_id.
#-----------------------Use COUNT(course_id) to calculate the number of courses per student.
#-----------------------Use the HAVING clause to filter students with enrolments greater than 1.

SELECT 
	Students.Name,
	COUNT(Enrolments.CourseID) AS noOfCourses
FROM Enrolments
JOIN Students ON Enrolments.StudentID = Students.StudentID
GROUP BY Students.StudentID
HAVING noOfCourses > 1;

# Task 4: Find courses with no enrolled students
#-----------------------------Use a LEFT JOIN between Courses and Enrolments.
#-----------------------------Use WHERE enrolment_id IS NULL to filter courses with no enrolments.

SELECT 
    CourseName 
FROM Courses
LEFT JOIN Enrolments ON Courses.CourseID = Enrolments.CourseID
WHERE Enrolment.CourseID IS NULL;





