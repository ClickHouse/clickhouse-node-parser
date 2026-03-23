-- Tags: no-fasttest
SYSTEM DROP  TABLE IF EXISTS Customers;

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

-- datatable (Version:string) [
--     '1.2.3.4',
--     '1.2',
--     '1.2.3',
--     '1'
-- ]
SYSTEM DROP  TABLE IF EXISTS Versions;

CREATE TABLE Versions
(
    Version String
)
ENGINE = Memory;

INSERT INTO Versions;

SET allow_experimental_kusto_dialect = 1;

SET dialect = 'kusto';