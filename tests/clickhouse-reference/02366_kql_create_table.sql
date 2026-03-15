CREATE TABLE Customers
(
    FirstName Nullable(String),
    LastName String,
    Occupation String,
    Education String,
    Age Nullable(UInt8)
) ENGINE = Memory;
Select '-- test create table --' ;
select LastName from kql_table1 limit 1;
CREATE TABLE kql_table2
(
    FirstName Nullable(String),
    LastName String,
    Age Nullable(UInt8)
) ENGINE = Memory;
select * from kql_table2 limit 1;
