CREATE DATABASE Functions

USE Functions

CREATE TABLE System_DB (
	ID INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(20) NOT NULL,
	AGE INT NOT NULL,
	DATE_CREATED DATE NOT NULL DEFAULT GETDATE()
)

INSERT INTO System_DB (Name, AGE)
OUTPUT inserted.ID, inserted.Name, inserted.AGE, inserted.DATE_CREATED
VALUES
('Krishna', 24),
('Akshay', 29),
('Darshan', 23)

ALTER TABLE System_DB	--Adding new column
ADD Mobile_No INT

--Updating Mobile_No values
UPDATE System_Db
SET Mobile_No = 848484
OUTPUT inserted.ID, inserted.Name, inserted.AGE, inserted.DATE_CREATED, inserted.Mobile_No
WHERE ID = 1

UPDATE System_Db
SET Mobile_No = 858585
OUTPUT inserted.ID, inserted.Name, inserted.AGE, inserted.DATE_CREATED, inserted.Mobile_No
WHERE ID = 2

UPDATE System_Db
SET Mobile_No = 868686
OUTPUT inserted.ID, inserted.Name, inserted.AGE, inserted.DATE_CREATED, inserted.Mobile_No
WHERE ID = 3

--LEN function
SELECT LEN(Name) AS name_length
FROM System_DB

SELECT LEN(Name, Mobile_No) AS nam_mobile_length
FROM System_DB
--Error:The len function requires 1 argument(s).

SELECT LEN(Mobile_No) AS mobile_length
FROM System_DB

--CONCAT function
SELECT CONCAT(Name, ' is ', AGE, ' Years  old')
FROM System_DB

SELECT CONCAT(Name, ' is ', AGE, ' years old ', ' and his mobile no is ', Mobile_No) AS Description
FROM System_DB

--Adding more columns and updating there values for furture use
sp_rename 'System_DB.Name', 'First_Name'	--Renaming Name to First Name

ALTER TABLE System_DB		--Adding Last Name Column
ADD Last_Name VARCHAR(20)

--Updating Last Name values
UPDATE System_Db
SET Last_Name = 'Chaudhary'
OUTPUT inserted.ID, inserted.First_Name,inserted.Last_Name, inserted.AGE, inserted.DATE_CREATED, inserted.Mobile_No
WHERE ID = 1

UPDATE System_Db
SET Last_Name = 'Patel'
OUTPUT inserted.ID, inserted.First_Name,inserted.Last_Name, inserted.AGE, inserted.DATE_CREATED, inserted.Mobile_No
WHERE ID = 2

UPDATE System_Db
SET Last_Name = 'Joshi'
OUTPUT inserted.ID, inserted.First_Name,inserted.Last_Name, inserted.AGE, inserted.DATE_CREATED, inserted.Mobile_No
WHERE ID = 3

--UPPER function
SELECT UPPER(First_Name, Last_Name) AS Name_UpperCase
FROM System_DB
--Error: The upper function requires 1 argument(s).

SELECT UPPER(First_Name) AS First_Name_UpperCase
FROM System_DB

SELECT UPPER(First_Name) AS First_Name_UpperCase, UPPER(Last_Name) AS Last_Name_UpperCase
FROM System_DB
--We can use Multiple Upper function seprated by ','

SELECT UPPER(First_Name) AS First_Name_UpperCase AND UPPER(Last_Name) AS Last_Name_UpperCase
FROM System_DB

SELECT UPPER(First_Name) AS First_Name_UpperCase OR UPPER(Last_Name) AS Last_Name_UpperCase
FROM System_DB
--Error: Incorrect syntax near the keyword 'AND'.
-- Cannot use operators like AND, OR

--LOWER Function
SELECT LOWER(First_Name) AS First_Name_UpperCase
FROM System_DB

SELECT LOWER(First_Name) AS First_Name_UpperCase, LOWER(Last_Name) AS Last_Name_UpperCase
FROM System_DB

--DATEPART Function
SELECT DATEPART(YEAR, DATE_CREATED) AS Year_Extract
FROM System_DB

SELECT DATEPART(YEAR, DATE_CREATED) AS Year_Extract
FROM System_DB
WHERE ID = 1

SELECT DATEPART(DAY, DATE_CREATED) AS Day_Extract
FROM System_DB

SELECT DATEPART(MONTH, DATE_CREATED) AS Month_Extract
FROM System_DB

SELECT DATEPART(DAYOFYEAR, DATE_CREATED) AS DayOfYear_Extract
FROM System_DB

SELECT DATEPART(WEEKDAY, DATE_CREATED) AS WeekDay_Extract
FROM System_DB

SELECT DATEPART(DAYOFYEAR, DATE_CREATED) AS DayOfYear_Extract
FROM System_DB

--------------------========AGGREGATE FUNCTION=========-------------------------

--SUM function
ALTER TABLE System_DB
ADD Salary INT
--ALTER TABLE only allows columns to be added that can contain nulls, or have a DEFAULT definition specified, or the column being added is an identity or timestamp column, or alternatively if none of the previous conditions are satisfied the table must be empty to allow addition of this column. Column 'Salary' cannot be added to non-empty table 'System_DB' because it does not satisfy these conditions.

UPDATE System_Db
SET Salary = 10000
OUTPUT inserted.ID, inserted.First_Name,inserted.Last_Name,  inserted.AGE, inserted.DATE_CREATED, inserted.Mobile_No, inserted.Salary
WHERE ID = 1

UPDATE System_Db
SET Salary = 10000
OUTPUT inserted.ID, inserted.First_Name,inserted.Last_Name,  inserted.AGE, inserted.DATE_CREATED, inserted.Mobile_No, inserted.Salary
WHERE ID = 2

UPDATE System_Db
SET Salary = 10000
OUTPUT inserted.ID, inserted.First_Name,inserted.Last_Name,  inserted.AGE, inserted.DATE_CREATED, inserted.Mobile_No, inserted.Salary
WHERE ID = 3

SELECT SUM(AGE) AS total_age
FROM System_DB

SELECT SUM(AGE, Salary) AS Total_Age_Salary
FROM System_DB
--Error: The SUM function requires 1 argument(s).

SELECT SUM(Salary) AS Total_Salary
FROM System_DB

--AVG Function
SELECT AVG(Salary) AS Avg_Salary
FROM System_DB

SELECT AVG(AGE) AS Avg_Age
FROM System_DB

--COUNT Function
SELECT COUNT(*) AS num_of_entries 
FROM System_DB		--Counted no of rows

--MIN Function
SELECT MIN(AGE) AS Min_Age
FROM System_DB

SELECT MIN(Salary) AS Min_Salary
FROM System_DB

--MAX Function
SELECT MAX(AGE) AS Max_Age
FROM System_DB

SELECT MAX(Salary) AS Max_Salary
FROM System_DB

INSERT INTO System_DB (First_Name, Age, Mobile_No, Last_Name, Salary)
VALUES
('Nisarg', 23, 81181, 'Patel', 10000)

--GROUPING Function (the collection of related items of content so that they can be displayed or linked to.)
	--Grouping(Column) indicates whether the column in a GROUP BY list is aggregated or not.
	--Grouping returns 1 for aggregated or 0 fr not aggregated in the result set.
	--is the data have been aggregated across specified column or not.

region | product  | is_aggregated | total_sales
-----------------------------------------------
North  | Widget A | 1             | 1000
North  | Widget B | 1             | 2000
North  | NULL     | 0             | 3000
South  | Widget A | 1             | 1500
South  | Widget B | 1             | 2500
South  | NULL     | 0             | 4000
NULL   | NULL     | 0             | 7000

--Understand: aggregation means grouping thing or making related things cluster.
--	North  | Widget A | 1             | 1000
--	North  | Widget B | 1             | 2000
		--Here this is a group so it will return 1 means true.

--	North  | NULL     | 0             | 3000
		--Here it merged them and calculated total sales so this not a group it will
		--return 0 means false.
	