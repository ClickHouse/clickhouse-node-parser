CREATE TABLE Customers
(
    FirstName Nullable(String),
    LastName String,
    Occupation String,
    Education String,
    Age Nullable(UInt8)
)
ENGINE = Memory;

CREATE TABLE EventLog
(
    LogEntry String,
    Created Int64
)
ENGINE = Memory;

CREATE TABLE Dates
(
    EventTime DateTime
)
ENGINE = Memory;

SELECT '-- test summarize --';

SET allow_experimental_kusto_dialect = 1;

SET dialect = 'kusto';