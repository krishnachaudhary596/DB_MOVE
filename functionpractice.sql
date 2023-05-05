CREATE DATABASE FUNCTIONS_PRACTICE
USE FUNCTIONS_PRACTICE
GO

------------------------------------------

--Create a scalar function that takes integer parameters and returns their square.
CREATE FUNCTION Squares(@num INT)
RETURNS INT
AS
BEGIN
	RETURN @num * @num
END

SELECT dbo.Squares(5)

--Create a scalar function that takes a string parameter and returns the length of the string.
CREATE FUNCTION AddInteger(@num1 INT, @num2 INT)
RETURNS INT
AS
BEGIN
	RETURN @num1 + @num2
END

SELECT dbo.AddInteger(12, 2)

--Create a scalar function that takes a string parameter and returns the length of the string.
CREATE FUNCTION GetStringLength(@str VARCHAR(30))
RETURNS INT
AS
BEGIN
	RETURN LEN(@str)
END

SELECT dbo.GetStringLength('Krishna')

--Create a scalar function that takes an integer parameter and returns the square root of the integer.
CREATE FUNCTION SquareRoot(@num INT)
RETURNS FLOAT
AS
BEGIN
	RETURN SQRT(@num)
END

SELECT dbo.SquareRoot(32)

--Create a scalar function that takes a string parameter and returns the string in all uppercase letters.
CREATE FUNCTION StringUpperCase(@str VARCHAR(30))
RETURNS VARCHAR(30)
AS
BEGIN
	RETURN UPPER(@str)
END

SELECT dbo.StringUpperCase('krishna')

--Create a scalar function that takes a date parameter and returns the year of the date.
CREATE FUNCTION YearExtract(@year DATE)
RETURNS INT
AS
BEGIN
	RETURN YEAR(@year)
END

SELECT dbo.YearExtract('1999-11-22')

--------------------------------------------------------

--Create a table-valued function that takes an integer parameter and returns employees detail.
USE IT_FIRM

CREATE FUNCTION GetEmployeeDetails(@Emp_ID INT)
RETURNS TABLE
AS
RETURN
(
	SELECT *FROM Employee
	WHERE Employee_ID = @Emp_ID
)

SELECT *FROM dbo.GetEmployeeDetails(12)

--Create a table-valued function that takes a string parameter and returns all products with names that contain the string.
CREATE FUNCTION GetProductDetails(@str VARCHAR(30))
RETURNS TABLE
AS
RETURN
(
	SELECT *FROM tbl_Products
	WHERE NAME LIKE '%' + @str + '%'
)

SELECT *FROM dbo.GetProductDetails('tv')
SELECT *FROM dbo.GetProductDetails('laptop')

--Create a table-valued function that takes two date parameters and returns all product sales between the dates.
CREATE FUNCTION GetSalesByDateRange(@startdate DATE, @enddate DATE)
RETURNS TABLE
AS
RETURN
(
	SELECT *FROM tbl_Product_Sales
	WHERE Sale_Date BETWEEN @startdate AND @enddate
)

SELECT *FROM dbo.GetSalesByDateRange('2021-11-11', '2022-11-15')

--Create a table-valued function that takes a category ID parameter and the category name.
CREATE FUNCTION GetCategoryDetails(@num INT)
RETURNS TABLE
AS
RETURN
(
	SELECT *FROM CATEGORY
	WHERE CATEGORY_ID = @num
)

SELECT *FROM dbo.GetCategoryDetails(1)

--Create a table-valued function that takes a Employee ID parameter and returns all skills in the skills, along with the Employee name.
CREATE FUNCTION GetEmployeeSkills(@Emp_ID INT)
RETURNS TABLE
AS
RETURN
(
	SELECT e.Employee_Name, e.Employee_Email, e.Employee_Designation, s.Skill_Name
	FROM Employee e
	INNER JOIN	Employee_Skills es ON e.Employee_ID = es.Employee_ID
	INNER JOIN Skills s ON es.Skill_ID = s.Skill_ID
)


ALTER FUNCTION dbo.GetEmployeeSkills(@Emp_ID INT)		--Modifying Fuction
RETURNS TABLE
AS
RETURN
(
	SELECT e.Employee_Name, e.Employee_Email, e.Employee_Designation, s.Skill_Name
	FROM Employee e
	INNER JOIN	Employee_Skills es ON e.Employee_ID = es.Employee_ID
	INNER JOIN Skills s ON es.Skill_ID = s.Skill_ID
	WHERE e.Employee_ID = @Emp_ID						--Added Where Clause
)

SELECT *FROM dbo.GetEmployeeSkills(13)

--Create a table-valued function that takes a string parameter and returns all customers with names that contain the string, along with their orders.




SELECT *FROM Employee_Skills
SELECT *FROM Employee