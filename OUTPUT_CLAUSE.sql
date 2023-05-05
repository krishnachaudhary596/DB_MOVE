CREATE DATABASE OUTPUT_CLAUSE

--======CREATING TABLE======--

CREATE TABLE SCHOOL (
	School_ID INT,
	School_Name VARCHAR(30),
	School_Address VARCHAR(50),
	School_Start_Year DATE
)

--=========== OUTPUT CLAUSE WITH INSERT COMMAND ===========--
INSERT INTO SCHOOL (School_ID, School_Name, School_Address, School_Start_Year)
OUTPUT inserted.School_ID, inserted.School_Name, inserted.School_Address, inserted.School_Start_Year
VALUES
(1001, 'SVP', 'VAPI', '2023-04-05'),
(1002, 'GSV', 'VALSAD', '2022-09-03'),
(1003, 'ISVP', 'BILLIMORA', '2020-01-03')

--=========== OUTPUT CLAUSE WITH UPDATE COMMAND ===========--
UPDATE SCHOOL
SET School_ID = 1004
OUTPUT deleted.School_ID, deleted.School_Name, deleted.School_Address, deleted.School_Start_Year
WHERE School_ID = 1001

--=========== OUTPUT CLAUSE WITH DELETE COMMAND ===========--
DELETE FROM SCHOOL
OUTPUT deleted.School_ID, deleted.School_Name, deleted.School_Address, deleted.School_Start_Year
WHERE School_ID = 1003

SELECT * FROM SCHOOL