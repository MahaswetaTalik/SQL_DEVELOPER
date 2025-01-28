# creating and use database

CREATE DATABASE StudentManagementSystem;
USE StudentManagementSystem;

# creating table

CREATE TABLE Students1(
	StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT ,
    Total_Score INT
);

ALTER TABLE Students1 DROP COLUMN Total_Score;

# inserting data into tables

INSERT INTO Students1 VALUES(1,"Rabi Sen",90,30,29);
INSERT INTO Students1 VALUES(2,"Kalki Pal",60,70,49);
INSERT INTO Students1 VALUES(3,"Sutanu Kar",78,67,75);
INSERT INTO Students1 VALUES(4,"Naincy Rath",90,90,96);
INSERT INTO Students1 VALUES(5,"Pritha Rani Das",80,100,98);
INSERT INTO Students1 VALUES(6,"Akhil Singh",60,70,29);
INSERT INTO Students1 VALUES(7,"Anshika Kumari",90,80,99);
INSERT INTO Students1 VALUES(8,"Shivansh Batra",87,80,84);
INSERT INTO Students1 VALUES(9,"Harsh Raj",45,50,69);
INSERT INTO Students1 VALUES(10,"Poulami Roy",56,30,49);

# Tasks to perform

# Task 1: Identify Top Students by Total Scores
# Use a subquery to calculate the total score (math_score + science_score +english_score) for each student.
# Use an ORDER BY clause to rank students by their total scores in descending order.
# Limit the results to show only the top students (e.g., top 5).

SELECT StudentID, Name, Total_Score  
FROM (  
    SELECT StudentID, Name, (MathScore + ScienceScore + EnglishScore) AS Total_Score  
    FROM Students1  
) AS Total_Score_Of_Students  
ORDER BY Total_Score DESC  
LIMIT 5;

# Task 2: Calculate Averages Based on Specific Conditions
# Use subqueries to filter and group data for average calculations:
# Example 1: Calculate the average score of students who scored above 70 in Math.
# Example 2: Calculate the average total score of students grouped by a specific condition, 
#            such as a score range (e.g., students scoring 200–250 in total).

SELECT AVG(MathScore) AS average_math_score  
FROM Students1  
WHERE MathScore > 70;

# Task 3: Find Second-Highest Math Scores
# Use a subquery to determine the highest Math score and exclude it in a second query to 
#      find the next highest value.
# Example:
# Use MAX(math_score) in a subquery to find the highest score.
# Use WHERE math_score < (SELECT MAX(math_score) FROM Students) to exclude the top score and then use MAX again to find the second highest score. 

SELECT AVG(Total_Score) AS average_total_score  
FROM (  
    SELECT (MathScore + ScienceScore + EnglishScore) AS total_score  
    FROM Students1  
) AS Total_Scores  
WHERE total_score BETWEEN 200 AND 250;








