-- datatable(FirstName:string, LastName:string, Occupation:string, Education:string, Age:int) [
--     'Theodore', 'Diaz', 'Skilled Manual', 'Bachelors', 28, 
--     'Stephanie', 'Cox', 'Management abcd defg', 'Bachelors', 33, 
--     'Peter', 'Nara', 'Skilled Manual', 'Graduate Degree', 26, 
--     'Latoya', 'Shen', 'Professional', 'Graduate Degree', 25, 
--     'Joshua', 'Lee', 'Professional', 'Partial College', 26, 
--     'Edward', 'Hernandez', 'Skilled Manual', 'High School', 36, 
--     'Dalton', 'Wood', 'Professional', 'Partial College', 42, 
--     'Christine', 'Nara', 'Skilled Manual', 'Partial College', 33, 
--     'Cameron', 'Rodriguez', 'Professional', 'Partial College', 28, 
--     'Angel', 'Stewart', 'Professional', 'Partial College', 46, 
--     'Apple', '', 'Skilled Manual', 'Bachelors', 28, 
--     dynamic(null), 'why', 'Professional', 'Partial College', 38
-- ]
DROP TABLE IF EXISTS Customers;

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

DROP TABLE IF EXISTS EventLog;

CREATE TABLE EventLog
(
    LogEntry String,
    Created Int64
)
ENGINE = Memory;

INSERT INTO EventLog;

DROP TABLE IF EXISTS Dates;

CREATE TABLE Dates
(
    EventTime DateTime
)
ENGINE = Memory;

INSERT INTO Dates;

SELECT '-- test summarize --';

SET allow_experimental_kusto_dialect = 1;

SET dialect = 'kusto';