USE ConstraintsPracticeDB

----------------------Primary Key----------------------

CREATE TABLE Employee (
	Employee_ID INT PRIMARY KEY,
	First_Name	VARCHAR(50),
	Last_Name	VARCHAR(50),
	Email	VARCHAR(50)
)

--In the above table Employee_ID is the Primary Key.
--which means the column Employee_ID must have a unique value
--in the Employee_ID column and cannot comtain null values.

INSERT INTO Employee VALUES
(1, 'Krishna', 'Chaudhary', 'krishna@gmail.com'),
(2, 'Akshay', 'Patel', 'Akshay@gmail.com'),
(3, 'Nisarg', 'Patel', 'Nisarg@gmail.com')

--Lets try to add some duplicate and null values in the
--Employee_ID column.

INSERT INTO Employee VALUES
(1, 'Krishna', 'Chaudhary', 'krishna@gmail.com')
--This resulted in violation error of primary key.

----------------------Composite Primary Key----------------------

CREATE TABLE Orders2 (
	Order_ID INT,
	Customer_ID INT,
	Order_Date DATE,
	PRIMARY KEY (Order_ID, Customer_ID)
)

INSERT INTO Orders2 
OUTPUT inserted.Order_ID, inserted.Customer_ID, inserted.Order_Date
VALUES
(1, 101, '2023-02-02'),
(2, 102, '2021-03-02')

--Lets try to add some duplicate and null values in the
--Order_ID and Customer_ID column.

INSERT INTO Orders2 
OUTPUT inserted.Order_ID, inserted.Customer_ID, inserted.Order_Date
VALUES
(1, 101, '2023-02-02'),
(3, 103, '2021-03-04'),
--This resulted in violation error of primary key.

INSERT INTO Orders2 
OUTPUT inserted.Order_ID, inserted.Customer_ID, inserted.Order_Date
VALUES
(4, NULL,'23-03-05')
--Cannot Insert Null values also.

----------------------Alter with Primary Key----------------------

--Method 1
CREATE TABLE Customer (
	CustomerID INT,
	FirstName VARCHAR(30),
	LastName VARCHAR(30),
	Email VARCHAR(30)
)

--Cannot make a column primary key if it is nullable so making it
--non nullable.
ALTER TABLE Customer
ALTER COLUMN CustomerID INT NOT NULL

ALTER TABLE Customer 
ADD  PRIMARY KEY (CustomerID)
--Added Successfully

--Method 2
CREATE TABLE Customer1 (
	CustomerID INT,
	FirstName VARCHAR(30),
	LastName VARCHAR(30),
	Email VARCHAR(30)
)

ALTER TABLE Customer1
ALTER COLUMN CustomerID INT NOT NULL

ALTER TABLE Customer1
ADD CONSTRAINT PK_CID PRIMARY KEY (CustomerID)
--Added Successfully

--Method 3
--If we use identity keyword in a column then we can directly
--assign primary key constraint.
CREATE TABLE Customer2 (
	CustomerID INT IDENTITY(1,1),
	FirstName VARCHAR(30),
	LastName VARCHAR(30),
	Email VARCHAR(30)
)

ALTER TABLE Customer2 
ADD PRIMARY KEY (CustomerID)
--Added Successfully

----------------------Update with Primary Key----------------------
CREATE TABLE Employee (
	Employee_ID INT PRIMARY KEY,
	First_Name	VARCHAR(50),
	Last_Name	VARCHAR(50),
	Email	VARCHAR(50)
)

ALTER TABLE Employee
ADD Salary INT

INSERT INTO Employee
OUTPUT inserted.Employee_ID, inserted.First_Name, inserted.Last_Name, inserted.Email, inserted.salary
VALUES
(4, 'Prasad', 'Jawalge', 'Prasad@gmail.com', 10000)

UPDATE Employee
SET Salary = 10000
WHERE Employee_ID = 1

UPDATE Employee
SET Salary = 15000
OUTPUT inserted.Employee_ID, inserted.First_Name, inserted.Last_Name, inserted.Email, inserted.Salary
WHERE Employee_ID = 2

UPDATE Employee
SET Salary = 15000
OUTPUT inserted.Employee_ID, inserted.First_Name, inserted.Last_Name, inserted.Email, inserted.Salary
WHERE Employee_ID = 3

SELECT *FROM Employee

----------------------Delete with Primary Key----------------------
 DELETE FROM Employee
 OUTPUT deleted.Employee_ID, deleted.First_Name, deleted.Last_Name, deleted.Email, deleted.Salary
 WHERE Employee_ID = 4

 --Droping Constraint
 ALTER TABLE Employee
 DROP CONSTRAINT PK__Employee__78113481BAA262B3
 
----------------------Foreign Key----------------------
--Create a Parent Table
CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY,
	FirstName VARCHAR(30),
	LastName VARCHAR(30),
	Email VARCHAR(30)
)

--Inserting Data in Parent Table
INSERT INTO Customers
OUTPUT inserted.CustomerID, inserted.FirstName, inserted.LastName, inserted.Email
VALUES
(1, 'Krishna', 'Chaudhary', 'krishna.chaudhary@gmail.com'),
(2, 'Akshay', 'Patel', 'akshay.patel@gmail.com'),
(3, 'Nisarg', 'Patel', 'nisarg.patel@gmail.com')

--Create a Child Table with Foreign Key
CREATE TABLE Orders_Details (
	Order_ID INT PRIMARY KEY,
	Order_Name VARCHAR(30),
	CustomerID INT,
	CONSTRAINT fk_customer_id FOREIGN KEY (CustomerID) REFERENCES Customers (CustomerID)
)

--Inserting Data in Child Table
INSERT INTO Orders_Details
OUTPUT inserted.Order_ID, inserted.Order_Name, inserted.CustomerID
VALUES
(101, 'Laptop', 1),
(102, 'Camera', 2),
(103, 'Mobile', 2),
(104, 'Computer', 3)

--Inserting a row in child table which doesn't exist in parent table.
INSERT INTO Orders_Details
VALUES (105, 'Glasses', 4)
--Foreign Key Violation Error

--Using Join on Parent and Child Table
SELECT *
FROM Customers
INNER JOIN
Orders_Details
ON Customers.CustomerID = Orders_Details.CustomerID

-------------------Unique Key----------------------------------
--Creating table with unique column
CREATE TABLE tbl_Unique (
	Student_ID INT UNIQUE,
	Student_Name VARCHAR(30)
)

--Inserting data in unique column
INSERT INTO tbl_Unique
OUTPUT inserted.Student_ID, inserted.Student_Name
VALUES
(1, 'Krishna'),
(2, 'Akshay'),
(3, 'Darshan')

--Inserting duplicate values
INSERT INTO tbl_Unique
VALUES (1, 'Krishna')
--Error: Violation of Unique Key

--Inserting null value
INSERT INTO tbl_Unique		--Inserted 1 null values successfully
VALUES (NULL, 'Nisarg')

INSERT INTO tbl_Unique		--Failed to Insert multiple null values
VALUES (NULL, NULL)

INSERT INTO tbl_Unique		--Accepted null value in non-unique column
VALUES (4, NULL)

INSERT INTO tbl_Unique		--Accepted null value in non-unique column
VALUES (5, '')

--------------------------Default Constraint-----------------------------
CREATE TABLE Order_Default (
	Order_ID INT PRIMARY KEY,
	Order_Date DATETIME DEFAULT GETDATE(),
	CustomerID INT
)

--Insert Data in Order_Default table
INSERT INTO Order_Default (Order_ID, CustomerID)
OUTPUT inserted.Order_ID, inserted.Order_Date, inserted.CustomerID
VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105)

CREATE TABLE Student (
	S_ID INT PRIMARY KEY,
	S_NAME VARCHAR(30),
	S_STATUS VARCHAR(15) DEFAULT 'ACTIVE'
)

INSERT INTO Student (S_ID, S_NAME)
OUTPUT inserted.S_ID, inserted.S_NAME, inserted.S_STATUS
VALUES
(101, 'Krishna'),
(102, 'Akshay'),
(103, 'Darshan')

UPDATE Student
SET S_STATUS = 'INACTIVE'
OUTPUT inserted.S_ID, inserted.S_NAME, inserted.S_STATUS
WHERE S_ID = 103

--Knowingly made a mistake in default column to see the working of it.
--Then added new column of default.
ALTER TABLE Student
ADD Fees_Status INT DEFAULT 'UN PAIN'

ALTER TABLE Student		--Droping Default Constraint
DROP CONSTRAINT DF__Student__Fees_St__4E88ABD4

ALTER TABLE Student		--Droping Fees_Status Column
DROP COLUMN Fees_Status

ALTER TABLE Student		--Adding Fees_Status with proper default column
ADD Fees_Status VARCHAR(15) DEFAULT 'UN PAID'

INSERT INTO Student (S_ID, S_NAME)	--Inserting values to check default is working or not
OUTPUT inserted.S_ID, inserted.S_NAME, inserted.S_STATUS, inserted.Fees_Status
VALUES
(104, 'Nisarg')			--Default is working successfully

UPDATE Student			--Updating Fees_Status with default value
SET Fees_Status = 'Paid'
OUTPUT inserted.S_ID, inserted.S_NAME, inserted.S_STATUS, inserted.Fees_Status
WHERE S_ID = 101

--------------------------Check Constraint-----------------------------

--Creating table with check constraint
CREATE TABLE Employee_Check (
	Employee_ID INT PRIMARY KEY,
	Employee_Name VARCHAR(20),
	Employee_Age INT CHECK(Employee_Age > 18) 
)

INSERT Employee_Check		--Inserting valid values
OUTPUT inserted.Employee_ID, inserted.Employee_Name, inserted.Employee_Age
VALUES
(101, 'Krishna', 24),
(102, 'Akshay', 29),
(103, 'Darshan', 23)

INSERT Employee_Check
OUTPUT inserted.Employee_ID, inserted.Employee_Name, inserted.Employee_Age
VALUES
(104, 'Nisarg', 17)
--Error: Violeted check constraint

ALTER TABLE Employee_Check		--Making Salary_Check column first
ADD Salary_Check INT

ALTER TABLE Employee_Check		--Adding check contraint in Salary_Check
ADD CONSTRAINT Salary_Check CHECK (Salary_Check > 0)

INSERT Employee_Check
OUTPUT inserted.Employee_ID, inserted.Employee_Name, inserted.Employee_Age, inserted.Salary_Check
VALUES
(104, 'Sahil', 25, 10000)

