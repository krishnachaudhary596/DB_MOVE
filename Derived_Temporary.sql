CREATE DATABASE Derived_Temporary_Demo

USE Derived_Temporary_Demo

CREATE TABLE Customers (
	ID INT PRIMARY KEY,
	[Name] VARCHAR(30),
	Email VARCHAR(30)
)

ALTER TABLE Customers				--Adding Check Constraint to Email for Valid
ADD CONSTRAINT Chk_Email CHECK (Email LIKE '%_@__%.__%')

INSERT INTO Customers
OUTPUT inserted.ID, inserted.[Name], inserted.Email
VALUES
(101, 'Krishna', 'nokia@mail.com'),
(102, 'Akshay', 'Laptop@mail.com')

UPDATE Customers
SET Email = 'krishna@gmail.com'
WHERE ID = 101

UPDATE Customers
SET Email = 'akshay@outlook.com'
WHERE ID = 102

UPDATE Customers					--Updating multiple values in a single update query	
SET Email = 
    CASE ID
        WHEN 101 THEN 'krishna.chaudhary@gmail.com'
        WHEN 102 THEN 'akshay.patel@outlook.com'
    END
WHERE ID IN (101, 102)

SELECT *FROM Customers

CREATE TABLE Orders (
	ID INT PRIMARY KEY,
	Customer_id INT,
	Product_Name VARCHAR(30),
	Price DECIMAL(10,2)
)

INSERT INTO Orders
OUTPUT inserted.ID, inserted.Customer_id, inserted.Product_Name, inserted.Price
VALUES
(101, 11, 'Mobile', 10000),
(102, 12, 'Laptop', 20000)

UPDATE Orders
SET Customer_id = 
		CASE ID
		WHEN 101 THEN 101
		WHEN 102 THEN 102
	END
WHERE ID IN (101, 102)

DELETE FROM Orders					--Deleting Multiple records in a single delete query.
WHERE Customer_id = 
		CASE ID
		WHEN 101 THEN 101
		WHEN 102 THEN 102
	END


SELECT *FROM Orders

ALTER TABLE orders
DROP CONSTRAINT FK_orders_customer_id

ALTER TABLE Orders
ADD CONSTRAINT FK_orders_customer_id
FOREIGN KEY (Customer_id)
REFERENCES customers(ID)
ON UPDATE CASCADE
ON DELETE CASCADE

SELECT *FROM Customers
SELECT *FROM Orders

UPDATE Customers
SET [Name] = 'Suraj Chaudhary'
WHERE ID = 101

--[----------------------------------Experiment----------------------------------]

CREATE TABLE customers1 (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
)

CREATE TABLE orders1 (
    order_id INT PRIMARY KEY,
    order_date DATE,
    total DECIMAL(10, 2),
    customer_id INT,
    CONSTRAINT FK_orders_customer_id1 FOREIGN KEY (customer_id) REFERENCES customers1 (customer_id)
)

INSERT INTO customers1 (customer_id, customer_name)
VALUES (1, 'John Smith'),
       (2, 'Jane Doe'),
       (3, 'Bob Johnson')

INSERT INTO orders1 (order_id, order_date, total, customer_id)
VALUES (101, '2023-04-30', 100.00, 1),
       (102, '2023-05-01', 200.00, 2),
       (103, '2023-05-02', 50.00, 3)


SELECT *FROM customers1
SELECT *FROM orders1


UPDATE customers1
SET customer_id = 4
OUTPUT inserted.customer_id, inserted.customer_name
WHERE customer_id = 1;

UPDATE orders1
SET customer_id = 4
WHERE order_id = 103


ALTER TABLE orders1
DROP CONSTRAINT FK_orders_customer_id1

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

		----DERIVED TABLES----
SELECT *
FROM (
	SELECT Customer_id, Product_Name, SUM(PRICE) AS Total_Price
	FROM Orders
	GROUP BY Customer_id
) AS Customer_Total
WHERE Total_Price > 1000

SELECT *
FROM (
  SELECT customer_id, SUM(Price) AS total_spent
  FROM orders
  GROUP BY customer_id
) AS customer_totals
WHERE total_spent > 1000
