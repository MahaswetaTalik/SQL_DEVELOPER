# Using the existing database
USE StudentManagementSystem;

# Creating and populating the StudentScores table 
CREATE TABLE StudentScores(
StudentID INT,
TotalScore INT,
MathScore INT,
ScienceScore INT
);

# Inserting data into the table
INSERT INTO StudentScores (StudentID, TotalScore, MathScore, ScienceScore)
VALUES
(1, 95, 45, 50),
(2, 85, 35, 60),
(3, 75, 40, 30),
(4, 65, 25, 20);

# Task-1. Assign Grades Based on Total Scores
# CASE statements can categorize students' total scores into grade brackets, e.g.:
#		■ >= 90: A
#		■ >= 80: B
#		■ >= 70: C
#		■ < 70: D (Fail)

SELECT StudentID ,TotalScore,
	CASE TotalScore
		WHEN(TotalScore >= 90) THEN "A"
        WHEN(TotalScore >= 80) THEN "B"
        WHEN(TotalScore >= 70) THEN	"C"
        WHEN(TotalScore < 70) THEN "D(Fail)"
	END AS TotalScore_Of_Students
FROM  StudentScores;

# Task-2. Identify Pass/Fail Status in Specific Subjects
# Use a CASE statement to evaluate individual subject scores:
#		■ Example: Pass if score ≥ 40, Fail otherwise.

SELECT StudentID, MathScore ,ScienceScore,TotalScore,  
    CASE   
        WHEN TotalScore >= 40 THEN 'PASS'  
        ELSE 'FAIL'  
    END AS TotalScore_Status  
FROM StudentScores;

