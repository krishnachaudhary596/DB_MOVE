USE joins

--1. Create Student table- Add Student id, student name, roll number, Class, division
CREATE TABLE STUDENT (
	Student_ID INT PRIMARY KEY,
	Student_Name VARCHAR(30),
	Roll_Number INT,
	Class VARCHAR(30),
	Division CHAR(1)
)

--Add 15 students’ records.
INSERT INTO Student (Student_ID, Student_Name, Roll_Number, Class, Division)
VALUES
(1, 'John', 101, 8, 'A'),
(2, 'Jane', 102, 8, 'B'),
(3, 'Tom', 103, 7, 'A'),
(4, 'Sara', 104, 7, 'B'),
(5, 'Bob', 105, 6, 'C'),
(6, 'Lisa', 106, 6, 'D'),
(7, 'Mike', 107, 5, 'A'),
(8, 'Rachel', 108, 5, 'B'),
(9, 'Chris', 109, 4, 'C'),
(10, 'Kelly', 110, 4, 'D'),
(11, 'Mark', 111, 3, 'A'),
(12, 'Emily', 112, 3, 'B'),
(13, 'Jack', 113, 2, 'C'),
(14, 'Lena', 114, 2, 'D'),
(15, 'Eric', 115, 1, 'A')

--2. Create Class table- Add class id , class name
CREATE TABLE Class (
	Class_ID INT PRIMARY KEY,
	Class_Name VARCHAR(13)
)

 --Add records class 1 to 8
INSERT INTO Class (Class_ID, Class_Name)
VALUES
(1, 'Class 1'),
(2, 'Class 2'),
(3, 'Class 3'),
(4, 'Class 4'),
(5, 'Class 5'),
(6, 'Class 6'),
(7, 'Class 7'),
(8, 'Class 8')

--3. Create Division table - add division id, division name
CREATE TABLE Division (
  Division_ID INT PRIMARY KEY,
  Division_Name CHAR(1)
)

--Add records Division A,B,C,D
INSERT INTO Division (Division_ID, Division_Name)
VALUES
(1, 'A'),
(2, 'B'),
(3, 'C'),
(4, 'D')

--4. Write a query to select roll number, student name, and class: Without Join
SELECT Roll_Number, Student_Name, Class
FROM STUDENT

--4. Write a query to select roll number, student name, and class: With Join
SELECT Roll_Number, Student_Name, Class_Name
FROM Student
INNER JOIN Class ON Student.Class = Class.Class_ID

--5. Write a query to select roll number, student name, and division: Without Join
SELECT Roll_Number, Student_Name, Division
FROM STUDENT

--5. Write a query to select roll number, student name, and division: With Join
SELECT Roll_Number, Student_Name, Division
FROM STUDENT
INNER JOIN Division ON Division.Division_ID = STUDENT.Student_ID

