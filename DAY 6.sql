USE StudentManagementSystem;

# Task - 1 Modify Table Structure
#	Add and Populate New Columns
# 	Action: Use the ALTER TABLE statement to introduce new columns.
# 	Example Columns:
# 		LastUpdated (DATE) – To record when the row was last modified.
# 		Status (VARCHAR) – To denote active or inactive records.
# 	Populate New Columns:
# 		Use the UPDATE statement to set initial values or use default values for the new columns.
# 	Example: Set Status to "Active" for all existing records.

ALTER TABLE Students ADD COLUMN LastUpdated DATE;
ALTER TABLE Students ADD COLUMN Status VARCHAR(10) DEFAULT 'Active';

UPDATE Students SET LastUpdated = CURRENT_DATE;
UPDATE Students SET Status = 'Active';

# Task - 2 Delete Records Based on Conditions
#	Task: Remove Records Based on Criteria
# 	Action: Use the DELETE statement to remove records from the table.
# 	Example Conditions:
# 		Delete records where Status = "Inactive".
# 		Remove records older than a specific date in the LastUpdated column.
# 	Confirm Deletions:
# 		Query the table to ensure that only the intended records were deleted.
#		Optionally, use a SELECT statement with the same condition before deletion to review records.

DELETE FROM Students WHERE Status = 'Inactive';
DELETE FROM Students WHERE LastUpdated < '2023-01-01';

SELECT * FROM Students WHERE Status = 'Inactive';
SELECT * FROM Students WHERE LastUpdated < '2023-01-01';
