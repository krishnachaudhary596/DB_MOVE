USE IT_FIRM

--CREATING EMPLOYEE TABLE

CREATE TABLE Employee (
	Employee_ID SMALLINT IDENTITY(1,1) PRIMARY KEY,
	Employee_Name VARCHAR(30) NOT NULL,
	Employee_Email VARCHAR(40) NOT NULL,
	Employee_Phone_no VARCHAR(10) CHECK(LEN(Employee_Phone_no) = 10) NOT NULL,
	Employee_Address VARCHAR(50) NOT NULL,
	Employee_Designation VARCHAR(50) NOT NULL,
	Created_Date VARCHAR(20) NOT NULL DEFAULT CONVERT(VARCHAR(19), GETDATE(), 121),
	Created_By VARCHAR(20) NOT NULL DEFAULT SYSTEM_USER,
	Modified_Date DATETIME,
	Modified_By VARCHAR(20),
	Deleted_By VARCHAR(20),
)

--DROP TABLE Employee

---==================================---

--CREATING SKILLS TABLE

CREATE TABLE Skills (
	Skill_ID SMALLINT IDENTITY(1,1) PRIMARY KEY,
	Skill_Name VARCHAR(30) NOT NULL,
	Created_Date VARCHAR(20) NOT NULL DEFAULT CONVERT(VARCHAR(19), GETDATE(), 121),
	Created_By VARCHAR(20) NOT NULL DEFAULT SYSTEM_USER,
	Modified_Date DATETIME,
	Modified_By VARCHAR(20),
)

--DROP TABLE Skills

---==================================---

--CREATING TABLE EMPLOYEE_SKILLS

CREATE TABLE Employee_Skills (
    Employee_ID SMALLINT REFERENCES Employee (Employee_ID),
    Skill_ID SMALLINT REFERENCES Skills (Skill_ID) 
)

--DROP TABLE Employee_Skills

---==================================---

--CREATING TABLE EMPLOYEE_SALARIES

CREATE TABLE Employee_Salaries (
	Employee_ID SMALLINT REFERENCES Employee (Employee_ID),
	Employee_Salary SMALLMONEY NOT NULL
)

--DROP TABLE Employee_Skills

---==================================---

--CREATING DEPARTMENT TABLE

CREATE TABLE Department (
	Department_ID SMALLINT IDENTITY(1,1) PRIMARY KEY,
	Department_Name VARCHAR(30) NOT NULL,
	Created_Date VARCHAR(20) NOT NULL DEFAULT CONVERT(VARCHAR(19), GETDATE(), 121),
	Created_By VARCHAR(20) NOT NULL DEFAULT SYSTEM_USER,
)

--DROP TABLE Department

---==================================---

--CREATE TABLE DEPARTMENT_MANAGER

CREATE TABLE Department_Manager (
	Department_ID SMALLINT REFERENCES Department (Department_ID),
	Department_Manager_ID SMALLINT REFERENCES Employee (Employee_ID),
	Department_Manager_Name VARCHAR(30) NOT NULL
)

--DROP TABLE Department_Manager

---==================================---

--CREATING TASK TABLE

CREATE TABLE Task (
	Task_ID SMALLINT IDENTITY(1,1) PRIMARY KEY,
	Task_Name VARCHAR(30) NOT NULL,
	Task_Description VARCHAR(50) NOT NULL,
	Task_Start_Date VARCHAR(20) NOT NULL DEFAULT CONVERT(VARCHAR(19), GETDATE(), 121),
	Task_End_Date DATETIME NOT NULL,
	Created_Date VARCHAR(20) NOT NULL DEFAULT CONVERT(VARCHAR(19), GETDATE(), 121),
	Created_By VARCHAR(20) NOT NULL DEFAULT SYSTEM_USER,
	Modified_Date DATETIME,
	Modified_By VARCHAR(20),
)

--DROP TABLE Task

---==================================---

--CREATING PROJECT TABLE

CREATE TABLE Project (
	Project_ID SMALLINT IDENTITY(1,1) PRIMARY KEY,
	Project_Name VARCHAR(30) NOT  NULL,
	Project_Start_Date VARCHAR(20) NOT NULL DEFAULT CONVERT(VARCHAR(19), GETDATE(), 121),
	Project_End_Date DATETIME NOT NULL,
	Created_Date VARCHAR(20) NOT NULL DEFAULT CONVERT(VARCHAR(19), GETDATE(), 121),
	Created_By VARCHAR(20) NOT NULL DEFAULT SYSTEM_USER,
	Modified_Date DATETIME,
	Modified_By VARCHAR(20),
)

--DROP TABLE Project

---==================================---

--CREATING CLIENT TABLE

CREATE TABLE Client (
	Client_ID SMALLINT IDENTITY(1,1) PRIMARY KEY,
	Client_Name VARCHAR(30) NOT NULL,
	Client_Email VARCHAR(35) NOT NULL,
	Client_Phone_no BIGINT CHECK(LEN(Client_Phone_no) = 10) NOT NULL,
	Client_Address VARCHAR(50),
	Created_Date VARCHAR(20) NOT NULL DEFAULT CONVERT(VARCHAR(19), GETDATE(), 121),
	Created_By VARCHAR(20) NOT NULL DEFAULT SYSTEM_USER,
	Modified_Date DATETIME,
	Modified_By VARCHAR(20),
)

--DROP TABLE Client

---==================================---

--CREATING TABLE INVOICE

CREATE TABLE Invoice (
	Invoice_ID SMALLINT IDENTITY(1,1) PRIMARY KEY,
	Project_ID SMALLINT REFERENCES Project (Project_ID),
	Client_ID SMALLINT REFERENCES Client (Client_ID),
	Created_Date VARCHAR(20) NOT NULL DEFAULT CONVERT(VARCHAR(19), GETDATE(), 121),
	Created_By VARCHAR(20) NOT NULL DEFAULT SYSTEM_USER,
	Modified_Date DATETIME,
	Modified_By VARCHAR(20),
)

--DROP TABLE Invoice

---==================================---

--CREATING TABLE PAYMENTS

CREATE TABLE Payments (
	Payment_ID SMALLINT IDENTITY(1,1) PRIMARY KEY,
	Invoice_ID SMALLINT REFERENCES Invoice (Invoice_ID),
	Payment_Date VARCHAR(20) NOT NULL DEFAULT CONVERT(VARCHAR(19), GETDATE(), 121),
	Amount_Paid SMALLMONEY NOT NULL,
	Created_Date VARCHAR(20) NOT NULL DEFAULT CONVERT(VARCHAR(19), GETDATE(), 121),
	Created_By VARCHAR(20) NOT NULL DEFAULT SYSTEM_USER,
)

--DROP TABLE Payments

--Adding Unique contraint in phone number.
