USE IT_FIRM

SP_RENAME 'PROJECT', 'Project'	--RENAME THE COLUMN

---- INSERTING VALUES IN EMPLOYEE TABLE

INSERT INTO Employee (Employee_Name, Employee_Email, Employee_Phone_no, Employee_Address, Employee_Designation)
VALUES
('John Smith', 'john.smith@email.com', 1234567890, '123 Main Street', 'Manager')

INSERT INTO Employee (
	Employee_Name, Employee_Email, Employee_Phone_no, 
	Employee_Address, Employee_Designation
)
VALUES 
('John Doe', 'johndoe@email.com', '1234567890', '123 Main St', 'Manager'),
('Jane Smith', 'janesmith@email.com', '2345678901', '456 Elm St', 'Assistant Manager'),
('Bob Johnson', 'bjohnson@email.com', '3456789012', '789 Oak St', 'Sales Representative'),
('Alice Lee', 'alicelee@email.com', '4567890123', '321 Pine St', 'Sales Representative'),
('Charlie Brown', 'charliebrown@email.com', '5678901234', '654 Cedar St', 'Accountant'),
('Diana Ross', 'dianaross@email.com', '6789012345', '987 Birch St', 'Human Resources Manager'),
('Elvis Presley', 'elvispresley@email.com', '7890123456', '2468 Sunshine Blvd', 'Marketing Manager'),
('Fiona Johnson', 'fionajohnson@email.com', '8901234567', '1357 Moonlight Dr', 'Marketing Coordinator'),
('George Washington', 'georgewashington@email.com', '9012345678', '1234 Independence Ave', 'CEO'),
('Helen Keller', 'helenkeller@email.com', '0123456789', '5678 Miracle Dr', 'CFO')

	SELECT * FROM Employee

---- INSERTING VALUES IN SKILLS TABLE

INSERT INTO Skills (
	Skill_Name
)
VALUES
('LINUX'),
('HTML'),
('CSS'),
('JAVASCRIPT'),
('NODEJS'),
('REACTJS'),
('.NET'),
('PYTHON'),
('JAVA'),
('DSA'),
('EXCEL')

	SELECT * FROM Skills

---- INSERTING VALUES IN EMPLOYEE_SKILLS TABLE

INSERT INTO Employee_Skills (
	Employee_ID, Skill_ID
)
VALUES
(12, 1),
(13, 2),
(14,3),
(15,4),
(16,5),
(17,6),
(18,7),
(19,8),
(20,9),
(21,10),
(22,11),
(13, 1),
(13, 2),
(13,3),
(13,4),
(14,5),
(14,6),
(15,5),
(15,6),
(17,7),
(17,8),
(17,9),
(17,11),
(18,5)

	SELECT * FROM Employee_Skills

-- INSERTING VALUES IN EMPLOYEE_SKILLS
INSERT INTO Employee_Salaries (Employee_ID, Employee_Salary)
VALUES 
	(12, 105000),
	(13, 110000),
	(14, 115000),
	(15, 120000),
	(16, 125000),
	(17, 130000),
	(18, 135000),
	(19, 140000),
	(20, 145000),
	(21, 190000),
	(22, 150000)

	SELECT * FROM Employee_Salaries

-- INSERTING VALUES IN DEPARTMENT TABLE
INSERT INTO Department (Department_Name)
VALUES 
	('Sales'),
	('Marketing'),
	('Human Resources'),
	('Finance'),
	('IT'),
	('Customer Service'),
	('Operations'),
	('Research and Development'),
	('Legal'),
	('Administration')

	SELECT * FROM Department

-- INSERTING VALUES IN DEPARTMENT_MANAGER
INSERT INTO Department_Manager (Department_ID, Department_Manager_ID, Department_Manager_Name)
VALUES 
	(1, 12, 'John Smith'),
	(5, 16, 'Alice Lee'),
	(6, 17, 'Charlie Brown'),
	(9, 20, 'Fiona Johnson'),
	(10, 21, 'Helen Keller')

	SELECT * FROM Department_Manager

-- INSERT VALUES IN TASK TABLE
INSERT INTO Task (Task_Name, Task_Description, Task_End_Date)
VALUES 
	('Write report', 'Write a report on market research findings', '2023-04-15'),
	('Create presentation', 'Create a presentation for the executive team', '2023-04-22'),
	('Conduct interviews', 'Conduct interviews with potential candidates', '2023-04-05'),
	('Analyze data', 'Analyze sales data to identify trends', '2023-04-10'),
	('Develop website', 'Develop a website for a new product launch', '2023-05-01'),
	('Plan event', 'Plan a company event for employees', '2023-05-10'),
	('Train employees', 'Train new employees on company policies', '2023-04-08'),
	('Write code', 'Write code for a new software application', '2023-04-30'),
	('Review contracts', 'Review contracts with vendors and suppliers', '2023-04-20'),
	('Meet with clients', 'Meet with clients to discuss project progress', '2023-04-12')

	SELECT * FROM Task

-- INSERT VALUES IN PROJECT TABLE
INSERT INTO Project (Project_Name, Project_End_Date)
VALUES 
	('New product launch', '2023-06-30'),
	('Marketing campaign', '2023-07-15'),
	('Office renovation', '2023-05-31'),
	('Employee training', '2023-06-10'),
	('Website redesign', '2023-08-31'),
	('Inventory management system', '2023-09-30'),
	('Customer service improvement', '2023-07-31'),
	('New hire orientation', '2023-06-15'),
	('Vendor selection process', '2023-07-31'),
	('IT infrastructure upgrade', '2023-08-15')

	SELECT * FROM Project

-- INSERT VALUES IN CLIENT
INSERT INTO Client (Client_Name, Client_Email, Client_Phone_no, Client_Address)
VALUES 
	('ABC Corporation', 'abc@example.com', 1234567890, '123 Main St, Anytown, USA'),
	('XYZ Industries', 'xyz@example.com', 2345678901, '456 Elm St, Anytown, USA'),
	('Acme Inc.', 'acme@example.com', 3456789012, '789 Oak St, Anytown, USA'),
	('Big Co.', 'bigco@example.com', 4567890123, '456 Pine St, Anytown, USA'),
	('Small Co.', 'smallco@example.com', 5678901234, '789 Maple St, Anytown, USA'),
	('Global Corp.', 'globalcorp@example.com', 6789012345, '123 Cedar St, Anytown, USA'),
	('National LLC', 'national@example.com', 7890123456, '456 Walnut St, Anytown, USA'),
	('Regional Enterprises', 'regional@example.com', 8901234567, '789 Cherry St, Anytown, USA'),
	('Local Biz', 'localbiz@example.com', 9012345678, '123 Birch St, Anytown, USA'),
	('Mom-and-Pop Shop', 'momandpop@example.com', 1234567890, '456 Pine St, Anytown, USA')
	
	SELECT * FROM Client

--INSERT VALUES IN INVOICE
INSERT INTO Invoice (Project_ID, Client_ID) VALUES
(1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 9),
(5, 10)

	SELECT * FROM Invoice

-- INSERT VALUES IN PAYMENTS
INSERT INTO Payments (Invoice_ID, Amount_Paid) VALUES
(1, 1000),
(2, 500),
(3, 1200),
(4, 1500),
(5, 800),
(6, 2000),
(7, 600),
(8, 900),
(9, 100),
(10, 300)

SELECT * FROM Payments
	