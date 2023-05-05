USE IT_FIRM

-- USE GETDATE FUNCTION TO UPDATE DATA(MODIFIED_DATE)
UPDATE dbo.Client SET Client_Name = 'NEW_ABC_CORPORATION',
Modified_Date = GETDATE() WHERE Client_ID = 1.

-- INNER JOIN
SELECT Employee_NAME, Department_ID 
FROM Employee INNER JOIN 
Department ON Employee_ID = Department_ID

-- LEFT JOIN
SELECT *
FROM Client LEFT JOIN									--CLIENT IS THE LEFT TABLE AND DEPARTMENT IS THE RIGHT TABLE
Department ON Client_ID = Department_ID

SELECT * FROM Department_Manager
SELECT * FROM Client

SELECT *
FROM Client LEFT JOIN
Department_Manager ON Client_ID = Department_ID

--RIGHT JOIN
SELECT *
FROM Client RIGHT JOIN
Department_Manager ON Client_ID = Department_ID

--FULL JOIN
SELECT *
FROM Client FULL JOIN
Department_Manager ON Client_ID = Department_ID

--SELF JOIN
SELECT c1.Client_Name, c2.Client_Name
FROM Client c1 JOIN
Client c2 on c1.Client_ID = c2.Client_ID

select *from Customers
select *from Orders

--CROSS JOIN
SELECT *FROM Customers
CROSS JOIN Orders