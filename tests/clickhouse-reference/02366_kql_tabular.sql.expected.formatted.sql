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

SET allow_experimental_kusto_dialect = 1;

SET dialect = 'kusto';

SET max_query_size = 55;

SET max_query_size = 262144;