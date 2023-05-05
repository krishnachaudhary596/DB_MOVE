USE IT_FIRM

ALTER TABLE Employee ALTER COLUMN Employee_Phone_no VARCHAR(10)

ALTER TABLE Employee ADD CONSTRAINT Unique_Phone UNIQUE(Employee_Phone_no);