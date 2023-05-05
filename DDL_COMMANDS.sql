USE DDL_Command

--USES OF CREATE COMMAND--
	--1. CREATE DATABASE
		--FOREG:
			CREATE DATABASE DDL_COMMANDS
	--2. CREATE NEW TABLE
		--FOREG:
			CREATE TABLE Employee(
				Emp_ID INT,
				Emp_Name VARCHAR (30),
				Emp_Address VARCHAR (30)
			)
	--3. CREATE NEW VIEW
		--FOREG:
			CREATE VIEW Customer_Details AS
			SELECT Emp_ID, Emp_Name, Emp_Address
			FROM Employee

		--Checking View
			SELECT *FROM Customer_Details

	--4. CREATE NEW INDEX
	--5. CREATE NEW STORED PROCEDURE
	--6. CREATE NEW TRIGGER

--USES OF CREATE COMMAND--
	--1. Add or drop columns from a table
		--FOREG:
			ALTER TABLE Employee
			ADD Emp_Email VARCHAR (30)
	--2. Change the data type or size of existing columns
		--FOREG:
			ALTER TABLE Employee
			ADD Emp_Salary DECIMAL(10,2)
	--3. Rename a table or a column
		--FOREG:
			ALTER TABLE Employee	--NOT WORKING
			sp_rename 'Employee.Emp_Name','Staff_Name'

	--4. Add or remove constraints such as primary key, foreign key, or check constraints
		--FOREG:
			ALTER TABLE Employee	--NOT WORKING
			COLUMN Emp_ID INT NOT NULL

	--5. Modify the default value of a column
		--FOREG:
			-- FIRST ADDING A DEFAULT COLUMN
			ALTER TABLE Employee
			ADD Emp_HireDate DATE NOT NULL DEFAULT GETDATE()

			-- MODIFING DEFAULT COLUMN
			ALTER TABLE Employee	--NOT WORKING
			ALTER COLUMN Emp_HireDate DATE NOT NULL SET DEFAULT CURRENT_TIMESTAMP

	--6. Add or drop indexes on a table
	--7. Change the collation of a column or a database

--USES OF DROP COMMAND--
	--1. Removing tables: You can use the DROP TABLE command to remove a table and all of its associated objects, such as indexes, triggers, and constraints.

	--2. Removing indexes: You can use the DROP INDEX command to remove an index from a table.

	--3. Removing views: You can use the DROP VIEW command to remove a view from the database.

	--4. Removing stored procedures: You can use the DROP PROCEDURE command to remove a stored procedure from the database.

	--5. Removing user-defined functions: You can use the DROP FUNCTION command to remove a user-defined function from the database.

	--6. Removing triggers: You can use the DROP TRIGGER command to remove a trigger from a table.

	--7. Removing schemas: You can use the DROP SCHEMA command to remove a schema from the database.
CREATE TABLE Customers (	--Parent Table
    CustID INT PRIMARY KEY,
    CustName VARCHAR(50) NOT NULL,
    CustEmail VARCHAR(50) UNIQUE NOT NULL,
    CustPhone VARCHAR(20),
    CustAddress VARCHAR(100)
)

CREATE TABLE Orders (		--Child Table
    OrderID INT PRIMARY KEY,
    OrderDate DATE NOT NULL,
    OrderAmount DECIMAL(10, 2) NOT NULL,
    CustID INT NOT NULL,
    CONSTRAINT FK_Orders_Customers
        FOREIGN KEY (CustID)
        REFERENCES Customers(CustID)
)

--Q. Can we drop parent table if its foreign key in another table?

DROP TABLE Customers	---We cannot Drop Parent Table

--Q. Can we drop child table if it has a foreign key of parent table?

DROP TABLE Orders		-- We can drop Child Table

--Now we can Drop Parent table too

DROP TABLE Customers	-- Droped

--ANSI IS TURNED OFF
ISNULL = NULL
--Msg 102, Level 15, State 1, Line 103
--Incorrect syntax near '='.

NULL = ISNULL
--Msg 156, Level 15, State 1, Line 108
--Incorrect syntax near the keyword 'NULL'.

NULL = NULL
--Msg 156, Level 15, State 1, Line 112
--Incorrect syntax near the keyword 'NULL'.

ISNULL = ISNULL
--Msg 102, Level 15, State 1, Line 116
--Incorrect syntax near '='.

--ANSI IS TURNED ON
ISNULL = NULL
--Msg 102, Level 15, State 1, Line 125
--Incorrect syntax near '='.

NULL = ISNULL
--Msg 156, Level 15, State 1, Line 129
--Incorrect syntax near the keyword 'NULL'.

NULL = NULL
--Msg 156, Level 15, State 1, Line 129
--Incorrect syntax near the keyword 'NULL'.

ISNULL = ISNULL
--Msg 102, Level 15, State 1, Line 133
--Incorrect syntax near '='.