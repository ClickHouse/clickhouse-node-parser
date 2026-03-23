CREATE TABLE Customers
(
    FirstName Nullable(String),
    LastName String,
    Occupation String,
    Education String,
    Age Nullable(UInt8)
)
ENGINE = Memory;

INSERT INTO Customers;

SELECT '-- test create table --';

SELECT LastName
FROM kql_table1
LIMIT 1;

CREATE TABLE kql_table2
(
    FirstName Nullable(String),
    LastName String,
    Age Nullable(UInt8)
)
ENGINE = Memory;

SELECT *
FROM kql_table2
LIMIT 1;