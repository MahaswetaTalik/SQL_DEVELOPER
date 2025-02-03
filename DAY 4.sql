# Creating new table
CREATE TABLE Students2(
	StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    MathScore INT,
    ScienceScore INT,
    EnglishScore INT 
);

#	Task 1: Rank Students Based on Total Scores
#		Query Objective: Use the RANK() function to assign ranks to students based on their TotalScore.
#		Query Explanation:
#		-> Use RANK() OVER (ORDER BY TotalScore DESC) to rank students in descending order of their total scores.
#		-> If two students have the same score, they receive the same rank, and the next rank is skipped.

SELECT StudentID, Name, MathScore,ScienceScore,EnglishScore,  
    (MathScore + ScienceScore + EnglishScore) AS TotalScore,  
    RANK() OVER (ORDER BY (MathScore + ScienceScore + EnglishScore) DESC) AS RankOfStudents  
FROM Students2;

#	Task 2: Calculate Running Totals for Math Scores
#		Query Objective: Use the SUM() function with OVER() to calculate running totals of MathScore ordered by StudentID.
#		Query Explanation:
#		-> Use SUM(MathScore) OVER (ORDER BY StudentID) to compute a cumulative total.
#		-> This provides the total Math score up to each student in the order specified

SELECT StudentID,Name,MathScore,  
    SUM(MathScore) OVER (ORDER BY StudentID) AS RunningTotal  
FROM  Students2;
