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

--------------------========STRING FUNCTION=========-------------------------

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


--CONCAT_WS Function
CREATE TABLE Employee (
	Employee_ID INT PRIMARY KEY,
	First_Name	VARCHAR(50),
	Last_Name	VARCHAR(50),
	Email	VARCHAR(50)
)

INSERT INTO Employee VALUES
(1, 'Krishna', 'Chaudhary', 'krishna@gmail.com'),
(2, 'Akshay', 'Patel', 'Akshay@gmail.com'),
(3, 'Nisarg', 'Patel', 'Nisarg@gmail.com')

SELECT CONCAT_WS(' ', First_Name, Last_Name, Email) AS Detail_Employee
FROM Employee


--REPLACE Function
UPDATE Employee
SET Email = REPLACE(Email, 'krishna@gmail.com', 'krishna.chaudhary@mail.com')
WHERE Email = 'krishna@gmail.com'

UPDATE Employee		--Replacing multiple values of single column with in single update statement
SET First_Name = REPLACE(REPLACE(First_Name, 'Nisarg', 'Darshan'), 'Patel', 'Joshi')
WHERE First_Name = 'Nisarg'

UPDATE Employee		--Replace values in multiple column with single update statement
SET First_Name = REPLACE(First_Name, 'Darshan', 'Nisarg'),
	Last_Name = REPLACE(Last_Name, 'Patel', 'Joshi')
WHERE Employee_ID = 3

SELECT *FROM Employee


--REVERSE
CREATE TABLE Product (
	product_name VARCHAR(20)
)

INSERT INTO Product
VALUES
('APPLE'),
('BANANA'),
('CHICKOO'),
('DRAGON FRUIT')

SELECT REVERSE(product_name)
FROM Product


--LEFT and RIGHT Function
SELECT LEFT(First_Name, 4) AS First_Name, RIGHT(Last_Name, 5) AS Right_Name
FROM Employee

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

--------------------========DATE & TIME FUNCTION=========-------------------------

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

--GETDATE() Function
SELECT GETDATE()

--DATEADD(datepart, number, date)
SELECT DATEADD(DAY, 8, '2023-04-29')

SELECT DATEADD()
--Error: The dateadd function requires 3 argument(s).

SELECT DATEDIFF(DAY, '2023', '2024') AS Days_between_2023_to_2024
SELECT DATEDIFF(WEEK, '2023', '2024') AS Weeks_between_2023_to_2024
SELECT DATEDIFF(WEEKDAY, '2023', '2024') AS Weekdays_between_2023_to_2024

--DATEDIFF_BIG Function
SELECT DATEDIFF_BIG(day, '1900-01-01', '2023-04-27')
		--Suppose you want to find the number of days between two dates that are more
		--than 68 years apart. The DATEDIFF() function would not work for this calculation
		--because it returns an error if the result is too large.

--TODATETIMEOFFSET Function
SELECT TODATETIMEOFFSET('2022-05-01 12:30:00.0000000', '-07:00') AS datetime_offset;

--DATENAME Function
SELECT DATENAME(DAY, '2023-04-26')
SELECT DATENAME(MONTH, '2023-04-26')
SELECT DATENAME(YEAR, '2023-04-26')

--SWITHCOFFSET Function
SELECT SWITCHOFFSET('2023-04-27 02:53:32.023 -08:00', '-05:00')
SELECT SWITCHOFFSET('2022-05-01 12:00:00', '-07:00')

--SYSDATETIME Function
SELECT SYSDATETIME() AS CurrentDateTime		--Works like GETDATE() but with higher precision.

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

--GROUPING Function

--GROUPING Function (the collection of related items of content so that they can be displayed or linked to.)
	--Grouping(Column) indicates whether the column in a GROUP BY list is aggregated or not.
	--Grouping returns 1 for aggregated or 0 fr not aggregated in the result set.
	--is the data have been aggregated across specified column or not.

	--NOTE: You will get 1 only on that column on which GROUPING is applied on the remaining 0.

--region | product  | is_aggregated | total_sales
-----------------------------------------------
--North  | Widget A | 1             | 1000
--North  | Widget B | 1             | 2000
--North  | NULL     | 0             | 3000
--South  | Widget A | 1             | 1500
--South  | Widget B | 1             | 2500
--South  | NULL     | 0             | 4000
--NULL   | NULL     | 0             | 7000

--Understand: aggregation means grouping thing or making related things cluster.
--	North  | Widget A | 1             | 1000
--	North  | Widget B | 1             | 2000
		--Here this is a group so it will return 1 means true.

--	North  | NULL     | 0             | 3000
		--Here it merged them and calculated total sales so this not a group it will
		--return 0 means false.
	
CREATE TABLE sales (
	region VARCHAR(20),
	product VARCHAR(20),
	total_sales INT
)

INSERT INTO sales
OUTPUT inserted.region, inserted.product, inserted.total_sales
VALUES
('NORTH', 'Widget A', 1000),
('NORTH', 'Widget B', 2000),
('SOUTH', 'Widget A', 1500),
('SOUTH', 'Widget B', 2500)

SELECT region, product, GROUPING(total_sales) AS is_aggregated,
 SUM(total_sales) as TotalSales
FROM sales
GROUP BY ROLLUP (region, product)
--Argument 1 of the GROUPING function does not match any of the expressions in the GROUP BY clause.

SELECT region, product, GROUPING(product) AS is_aggregated,
 SUM(total_sales) as TotalSales
FROM sales
GROUP BY ROLLUP (region, product)

--STDDEV() Function
CREATE TABLE score (
	id INT,
	score INT
)

INSERT INTO score
OUTPUT inserted.id, inserted.score
VALUES
(1, 80),
(2, 75),
(3, 90),
(4, 85),
(5, 95)

SELECT STDEV(score) AS score_std_dev
FROM score
--It calculates standard deviation

--STDDEVP Function
SELECT STDEVP(score) AS score_std_devp
FROM score

--------------------========SYSTEM FUNCTION=========-------------------------

--ISNULL Function
INSERT INTO Employee (Employee_ID, First_Name, Last_Name)
VALUES
(4, 'Sahil', 'Gaurani')

SELECT ISNULL(Email, 'No Email Found') FROM Employee


--ISNUMERIC Function
SELECT total_sales, ISNUMERIC(total_sales) AS is_score_numeric
FROM sales

--@@IDENTITY Function
INSERT INTO Employee
VALUES
(8, 'Prasad', 'Jawalge', 'Prasad@mail.com'),
(9, 'Parth', 'Sharma', 'parth@mail.com')
SELECT @@IDENTITY AS Last_Inserted_Value FROM Employee

--@@ROWCOUNT Function
UPDATE score SET score = score * 1.1 WHERE ID = 1
SELECT @@ROWCOUNT as rows_updated

--CHECKSUM Function
SELECT CHECKSUM(region, product) as sales_checksum FROM sales

--------------------========MATHEMATICAL FUNCTION=========-------------------------
--ABS Function
SELECT ABS(-10) AS abs_value

--DEGREE Function
SELECT DEGREES(PI()) AS degrees_value

--EXP Function
SELECT EXP(2) AS exp_value

--LOG Function
SELECT LOG(3) AS log_value

--LOG BASE10 Function
SELECT LOG10(3) AS log_value

--RADIANS Function
SELECT RADIANS(180) AS radians_value

--ROUND Function
SELECT ROUND(3.1415926535, 2) AS round_value

--SQUARE Function
SELECT SQUARE(5) AS square_value

--------------------========WINDOW FUNCTION=========-------------------------

--ROW_NUMBER Function
SELECT *, ROW_NUMBER() OVER(ORDER BY total_sales DESC) AS row_num
FROM sales

--RANK Function
SELECT *, RANK() OVER(ORDER BY total_sales DESC) AS rank
FROM sales

--DENSE_RANK Function
SELECT *, DENSE_RANK() OVER(ORDER BY total_sales DESC) AS dense_rank
FROM sales

--OVER Function
SELECT *, NTILE(2) OVER(ORDER BY total_sales DESC) AS ntile
FROM sales

--LEAD Function
SELECT *, LEAD(total_sales, 1, 0) OVER(ORDER BY total_sales DESC) AS next_sales
FROM sales

--LAG Function
SELECT *, LAG(total_sales, 1, 0) OVER(ORDER BY total_sales DESC) AS previous_sales
FROM sales

--FIRST_VALUE Function
SELECT *, FIRST_VALUE(total_sales) OVER(ORDER BY total_sales DESC) AS first_sales
FROM sales

--LAST_VALUE  Function
SELECT *, LAST_VALUE(total_sales) OVER(ORDER BY total_sales DESC ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_sales
FROM sales

--SUM Function
SELECT *, SUM(total_sales) OVER(ORDER BY total_sales DESC) AS running_total
FROM sales

--AVG Function
SELECT *, AVG(total_sales) OVER(ORDER BY total_sales DESC) AS running_avg
FROM sales

--------------------========CONVERSION FUNCTION=========-------------------------

--CAST Function
SELECT CAST('123' AS INT) AS Result

SELECT region, product, CAST(total_sales AS DECIMAL(10,2)) AS total_sales_decimal
FROM sales

--CONVERT Function
SELECT CONVERT(VARCHAR, GETDATE(), 101) AS Result

SELECT region, product, CONVERT(DECIMAL(10,2), total_sales) AS total_sales_decimal
FROM sales

--PARSE Function
SELECT PARSE('12/31/2022' AS DATE) AS Result

SELECT region, product, PARSE('2022-04-29' AS DATE) AS sale_date
FROM sales

--TRY_CAST Function
SELECT TRY_CAST('ABC' AS INT) AS Result

SELECT region, product, TRY_CAST(total_sales AS INT) AS total_sales_int
FROM sales

--TRY_CONVERT Function
SELECT TRY_CONVERT(VARCHAR, '123.45abc') AS Result

SELECT region, product, TRY_CONVERT(INT, total_sales) AS total_sales_int
FROM sales

--TRY_PARSE Function
SELECT TRY_PARSE('abc' AS DATE) AS Result

SELECT region, product, TRY_PARSE(total_sales AS DATE) AS sale_date
FROM sales
--Error: Argument data type int is invalid for argument 1 of parse function.

SELECT region, product, TRY_PARSE(CONVERT(NVARCHAR, total_sales) AS DATE) AS sale_date
FROM sales
