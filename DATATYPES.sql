USE test_db

--EXACT NUMERIC DATATYPES TABLE:
CREATE TABLE NumericTable (
  bigint_col BIGINT,
  numeric_col NUMERIC(10,2),
  bit_col BIT,
  smallint_col SMALLINT,
  decimal_col DECIMAL(10,2),
  smallmoney_col SMALLMONEY,
  int_col INT,
  tinyint_col TINYINT,
  money_col MONEY
)

INSERT INTO NumericTable VALUES 
(9223372036854775807, 1234.56, 1, 32767, 9876.54, 123.45, 2147483647, 255, 123456.78),
(-9223372036854775808, -1234.56, 0, -32768, -9876.54, -123.45, -2147483648, 0, -123456.78)

--BELOW VALUES DIDN'T INSERTED
--ERROR:	Arithmetic overflow error converting numeric to data type numeric.

INSERT INTO NumericTable VALUES 
(1234567890123456789, 9999999999.99, 1, 12345, 9876543210.98, 123456.78, 2147483647, 255, 123456.78)

INSERT INTO NumericTable VALUES
(-1234567890123456789, -9999999999.99, 0, -12345, -9876543210.98, -123456.78, -2147483648, 0, -123456.78)

INSERT INTO NumericTable VALUES
(123456789012345678, 99999999.99, 1, 1234, 987654321.98, 12345.67, 214748364, 25, 12345.67)

--APPROXIMATE NUMERICS DATATYPES TABLE:
CREATE TABLE ApproxNumericTable (
  float_col FLOAT(24),
  real_col REAL
)

INSERT INTO ApproxNumericTable VALUES 
(1234.567, 987.654),
(-1234.567, -987.654),
(123456789.1234567, 987654321.7654321),
(-123456789.1234567, -987654321.7654321),
(123.456789, 98.7654321)

--DATE AND TIME DATATYPES TABLE:
CREATE TABLE DateTimeTable (
  date_col DATE,
  datetimeoffset_col DATETIMEOFFSET,
  datetime2_col DATETIME2(7),
  smalldatetime_col SMALLDATETIME,
  datetime_col DATETIME,
  time_col TIME(7)
)

INSERT INTO DateTimeTable VALUES 
('2023-04-04', '2023-04-04 10:15:30 +05:30', '2023-04-04 10:15:30.1234567', '2023-04-04 10:15:00', '2023-04-04 10:15:30', '10:15:30.1234567'),
('2023-03-20', '2023-03-20 18:30:15 -05:00', '2023-03-20 18:30:15.9876543', '2023-03-20 18:30:00', '2023-03-20 18:30:15', '18:30:15.9876543'),
('2023-01-01', '2023-01-01 00:00:00 +00:00', '2023-01-01 00:00:00.0000000', '2023-01-01 00:00:00', '2023-01-01 00:00:00', '00:00:00.0000000'),
('2022-12-25', '2022-12-25 12:00:00 -07:00', '2022-12-25 12:00:00.7654321', '2022-12-25 12:00:00', '2022-12-25 12:00:00', '12:00:00.7654321'),
('2022-10-31', '2022-10-31 23:59:59 +02:00', '2022-10-31 23:59:59.9999999', '2022-10-31 23:59:00', '2022-10-31 23:59:59', '23:59:59.9999999')

--CHARACTER STRING DATATYPES TABLE:
CREATE TABLE CharStringTable (
  char_col CHAR(10),
  varchar_col VARCHAR(50),
  text_col TEXT
)

INSERT INTO CharStringTable VALUES 
('apple', 'This is a varchar string.', 'This is a text string.'),
('banana', 'This is another varchar string.', 'This is another text string.'),
('orange', 'This is a third varchar string.', 'This is a third text string.'),
('pear', 'This is a fourth varchar string.', 'This is a fourth text string.'),
('grape', 'This is a fifth varchar string.', 'This is a fifth text string.')

--UNICODE CHARACTER STRINGS DATATYPES TABLE:
CREATE TABLE UnicodeStringTable (
  nchar_col NCHAR(10),
  nvarchar_col NVARCHAR(50),
  ntext_col NTEXT
)

INSERT INTO UnicodeStringTable VALUES 
(N'こんにちは', N'This is a nvarchar string.', N'This is a ntext string.'),
(N'안녕하세요', N'This is another nvarchar string.', N'This is another ntext string.'),
(N'नमस्ते', N'This is a third nvarchar string.', N'This is a third ntext string.'),
(N'مرحبا', N'This is a fourth nvarchar string.', N'This is a fourth ntext string.'),
(N'שלום', N'This is a fifth nvarchar string.', N'This is a fifth ntext string.')

--BINARY STRING DATATYPES TABLE:
CREATE TABLE BinaryStringTable (
  binary_col BINARY(10),
  varbinary_col VARBINARY(50),
  image_col IMAGE
)

INSERT INTO BinaryStringTable VALUES 
(0x0102030405, 0x0102030405, 0x0102030405),
(0x0504030201, 0x0504030201, 0x0504030201),
(0x0A0B0C0D0E, 0x0A0B0C0D0E, 0x0A0B0C0D0E),
(0x0E0D0C0B0A, 0x0E0D0C0B0A, 0x0E0D0C0B0A),
(0x0101010101, 0x0101010101, 0x0101010101)

--OTHER DATATYPES TABLE:
	--CREATING CURSOR
	DECLARE my_cursor CURSOR FOR 
	SELECT * FROM NumericTable

	--Not WOrking From Here
	--FETCHING ROWS
	DECLARE @col1 VARCHAR(50), @col2 IN

	FETCH NEXT FROM my_cursor INTO @col1, @col2;
	
	--CLOSING CURSOR
	CLOSE my_cursor
	DEALLOCATE my_cursor

--SET OPPERATORS:
CREATE TABLE MyTable (
  rollno INT,
  name VARCHAR(50)
)

INSERT INTO MyTable (rollno, name)
VALUES (1, 'Alice'),
       (2, 'Bob'),
       (3, 'Charlie'),
       (4, 'David'),
       (5, 'Eve'),
       (6, 'Frank')


CREATE TABLE MyTable2 (
  rollno INT,
  name VARCHAR(50)
)

INSERT INTO MyTable2 (rollno, name)
VALUES (3, 'Charlie'),
       (7, 'Roshan'),
       (8, 'Roshni'),
       (9, 'Abhay'),
       (10, 'Amit'),
       (6, 'Frank')

-- UNION to combine the rows from both tables, removing any duplicates
SELECT rollno, name
FROM MyTable
UNION
SELECT rollno, name
FROM MyTable2

-- UNION ALL to combine the rows from both tables, including any duplicates
SELECT rollno, name
FROM MyTable
UNION ALL
SELECT rollno, name
FROM MyTable2


-- EXCEPT to find the rows in MyTable that are not in MyTable2
SELECT rollno, name
FROM MyTable
EXCEPT
SELECT rollno, name
FROM MyTable2

-- INTERSECT to find the rows that are common to both MyTable and MyTable2
SELECT rollno, name
FROM MyTable
INTERSECT
SELECT rollno, name
FROM MyTable2
