
ALTER TABLE Customers				--Adding Check Constraint to Email for Valid
ADD CONSTRAINT Chk_Email CHECK (Email LIKE '%_@__%.__%')

--------========================================================

UPDATE Customers
SET Email = 'krishna@gmail.com'
WHERE ID = 101

--------========================================================

UPDATE Customers					--Updating multiple values in a single update query	
SET Email = 
    CASE ID
        WHEN 101 THEN 'krishna.chaudhary@gmail.com'
        WHEN 102 THEN 'akshay.patel@outlook.com'
    END
WHERE ID IN (101, 102)

--------========================================================

-- USE GETDATE FUNCTION TO UPDATE DATA(MODIFIED_DATE)
UPDATE dbo.Client SET Client_Name = 'NEW_ABC_CORPORATION',
Modified_Date = GETDATE() WHERE Client_ID = 1.

--------========================================================

DELETE FROM Orders					--Deleting Multiple records in a single delete query.
WHERE Customer_id = 
		CASE ID
		WHEN 101 THEN 101
		WHEN 102 THEN 102
	END

--------========================================================

ALTER TABLE Orders1
ADD CONSTRAINT FK_orders_customer_id1
FOREIGN KEY (customer_id)
REFERENCES customers1(customer_id)
ON UPDATE CASCADE
ON DELETE CASCADE

/*
The ON UPDATE CASCADE and ON DELETE CASCADE clauses specify
that when the referenced column is updated or deleted, the
changes are automatically cascaded to the referencing column
in the orders table. This means that if a customer is updated or
deleted from the customers table, all related orders in the orders
table will also be updated or deleted, respectively.
*/

--------========================================================

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

--CROSS JOIN
SELECT *FROM Customers
CROSS JOIN Orders