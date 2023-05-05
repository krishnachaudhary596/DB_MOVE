CREATE DATABASE Cross_Outer_Apply

USE Cross_Outer_Apply

CREATE TABLE Customers (
	customerid INT PRIMARY KEY,
	customername VARCHAR(30),
)

INSERT INTO Customers
OUTPUT inserted.customerid, inserted.customername
VALUES
(1, 'Krishna'),
(2, 'Akshay'),
(3, 'Nisarg')

CREATE TABLE Orders (
	ordersid INT PRIMARY KEY,
	customerid INT,
	ordername VARCHAR(30),
	orderquantity INT
	CONSTRAINT fk_customerid FOREIGN KEY (customerid) REFERENCES Customers(customerid)
)

INSERT INTO Orders
OUTPUT inserted.ordersid, inserted.customerid, inserted.ordername, inserted.orderquantity
VALUES
(1, 1, 'Mobile', 3),
(2, 1, 'Laptop', 3),
(3, 2, 'HDD', 5),
(4, 2, 'SSD', 3)

/*							
SELECT 
*FROM Orders
WHERE Customers.customerid = Orders.ordersid		--Error: This is not allowed.
*/

SELECT *
FROM Customers
CROSS APPLY (
SELECT 
*FROM Orders
WHERE Customers.customerid = Orders.ordersid
) AS ABC