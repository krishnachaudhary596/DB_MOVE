-- TRUNCATE VS DELETE VS DROP --
                        |   Truncate     |      Drop              |   Delete
Speed                   |  [Fast]        |    Slow                | Slowest
Rolback possibility     |   No           |     No                 |  [Yes]
Specifiable conditions  |   No           |     No                 |  [Yes]
Scope                   |   All records  |     All record+Headers |  Some records/All records
                        |                |     =whole table		  |	
Cascading effects       |   No*          |     No*                | [Yes]**
Functionality			|				 |						  |

---=======	  INSERT TYPES	=======-----

CREATE TABLE Employee (
	Emp_id INT,
	Emp_Name VARCHAR (30),
	Emp_Salary INT,
	Emp_HireDate DATE
)

ALTER TABLE Employee
ALTER COLUMN Emp_Name VARCHAR (30)

--TYPE 1--
INSERT INTO Employee (Emp_id, Emp_Name, Emp_Salary, Emp_HireDate)
VALUES
(3, 'Krishna', 7500, '2023-04-06')
INSERT INTO Employee (Emp_id, Emp_Name, Emp_Salary, Emp_HireDate)
VALUES
(1, 'Ankita', 8000, '2022-06-05'),
(2, 'Vandana', 9000, '2023-02-05')

--CHECKING VALUES IN TABLE 1 (EMPLOYEE)
SELECT * FROM Employee

-- TYPE 2--
-- TO DO THIS WE NEED TO CREATE ANOTHER TABLE WITH SAME STRUCTURE

--CREATING NEW TABLE (EMPLOYEE_2) (WITH COLUMN NAME CHANGE)
CREATE TABLE Employee_2 (
	Employee_id INT,
	Employee_Name VARCHAR (30),
	Employee_Salary INT,
	Employee_HireDate DATE
)

INSERT INTO Employee_2 SELECT * FROM Employee

--CHECKING VALUES IN TABLE 2 (EMPLOYEE_2)
SELECT *FROM Employee_2

--The above method works even after changing column
-- TYPE 3--

--CREATING NEW TABLE (EMPLOYEE_3) (NO COLUMN NAME CHANGE)
CREATE TABLE Employee_3 (
	Emp_id INT,
	Emp_Name VARCHAR (30),
	Emp_Salary INT,
	Emp_HireDate DATE
)

INSERT INTO Employee_3(Emp_id, Emp_Name, Emp_Salary, Emp_HireDate)
SELECT Employee_id, Employee_Name, Employee_Salary, Employee_HireDate FROM Employee_2

--CHECKING VALUES IN TABLE 3 (EMPLOYEE_3)
SELECT *FROM Employee_3

-- TYPE 4--
--COPYING EMPLOYEE TABLE DATA INTO EMPLOYEE_4 TABLE WITH WHERE CONDITION
CREATE TABLE Employee_4 (
	Emp_id INT,
	Emp_Name VARCHAR (30),
	Emp_Salary INT,
	Emp_HireDate DATE
)

INSERT INTO Employee_4 SELECT * FROM Employee WHERE Emp_id = 1
--CHECKING VALUES IN TABLE 4 (EMPLOYEE_4)
SELECT *FROM Employee_4

---=======	UPDATE	=======---
UPDATE Employee_4
SET Emp_Salary = 10000
WHERE Emp_id = 1

--CHECKING VALUES IN TABLE 4 (EMPLOYEE_4)
SELECT * FROM Employee_4

---=======	DELETE	=======---
DELETE FROM Employee
WHERE Emp_id = 3

SELECT * FROM Employee

-- TYPE 5--
-- WITH THIS TYPE IT WILL AUTOMATICALLY CREATE NEW TABLE USING THE PREVIOUS TABLE.
SELECT * INTO Employee_5 from Employee--CHECKING VALUES IN TABLE 5 (EMPLOYEE_5)SELECT * FROM Employee_5