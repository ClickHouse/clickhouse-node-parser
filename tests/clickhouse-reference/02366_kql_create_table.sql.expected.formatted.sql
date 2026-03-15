CREATE TABLE Customers
(
    FirstName Nullable(String),
    LastName String,
    Occupation String,
    Education String,
    Age Nullable(UInt8)
)
ENGINE = Memory;

SELECT '-- test create table --';

SELECT *
FROM kql('Customers|project FirstName')
LIMIT 1;

CREATE TABLE kql_table1
ENGINE = Memory AS
SELECT
    *,
    now() AS new_column
FROM kql('Customers | project LastName | filter LastName==''Diaz''');

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