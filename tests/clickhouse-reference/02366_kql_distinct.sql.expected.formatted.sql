CREATE TABLE Customers
(
    FirstName Nullable(String),
    LastName String,
    Occupation String,
    Education String,
    Age Nullable(UInt8)
)
ENGINE = Memory;

SET allow_experimental_kusto_dialect = 1;

SET dialect = 'kusto';