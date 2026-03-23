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

CREATE TABLE EventLog
(
    LogEntry String,
    Created Int64
)
ENGINE = Memory;

INSERT INTO EventLog;

CREATE TABLE Dates
(
    EventTime DateTime
)
ENGINE = Memory;

INSERT INTO Dates;

SELECT '-- test summarize --';

SET allow_experimental_kusto_dialect = 1;

SET dialect = 'kusto';