USE DBJOINS

--1. Create Student table- Add Student id, student name, roll number, Class, division
CREATE TABLE Student (
  Student_ID INT PRIMARY KEY,
  Student_Name VARCHAR(50),
  Roll_Number INT,
  Class_ID INT,
  Division_ID INT,
  FOREIGN KEY (Class_ID) REFERENCES Class(Class_ID),
  FOREIGN KEY (Division_ID) REFERENCES Division(Division_ID)
)

--Add 15 students’ records.
INSERT INTO Student (Student_ID, Student_Name, Roll_Number, Class_ID, Division_ID) 
VALUES 
(1, 'John Doe', 101, 1, 1),
(2, 'Jane Smith', 102, 1, 2),
(3, 'Bob Johnson', 103, 2, 1),
(4, 'Sara Lee', 104, 2, 2),
(5, 'Tom White', 105, 3, 3),
(6, 'Mary Brown', 106, 3, 1),
(7, 'David Kim', 107, 4, 2),
(8, 'Emily Jones', 108, 4, 3),
(9, 'George Park', 109, 5, 4),
(10, 'Anna Lee', 110, 5, 2),
(11, 'Mark Davis', 111, 6, 1),
(12, 'Lisa Chen', 112, 6, 3),
(13, 'Chris Lee', 113, 7, 1),
(14, 'Jessica Huang', 114, 7, 2),
(15, 'Peter Chang', 115, 8, 4)

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
SELECT Roll_Number, Student_Name, Class_Name
FROM Student
INNER JOIN Class ON Student.Class_ID = Class.Class_ID

--5. Write a query to select roll number, student name, and division: Without Join
SELECT Roll_Number, Student_Name, Division_Name
FROM Student
INNER JOIN Division ON Student.Division_ID = Division.Division_ID

--5. Write a query to select roll number, student name, and division: With Join
SELECT Roll_Number, Student_Name, Division_Name
FROM STUDENT
INNER JOIN Division ON Division.Division_ID = STUDENT.Student_ID

--6. Writing a query to select students who are not enrolled in any class:
SELECT Student_Name
FROM Student
WHERE Class_ID IS NULL

--7. Writing a query to select students who are not enrolled in any division:
SELECT Student_Name
FROM Student
WHERE Division_ID IS NULL

--8. Writing a query to select all students and all classes:
SELECT Student_Name, Class_Name
FROM Student
FULL JOIN Class ON Student.Class_ID = Class.Class_ID

--9. Write query to select all students and all divisions.
SELECT Student_Name, Division_Name
FROM Student
FULL JOIN Division ON Student.Division_ID = Division.Division_ID
