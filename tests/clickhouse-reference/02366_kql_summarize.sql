CREATE TABLE Customers
(    
    FirstName Nullable(String),
    LastName String, 
    Occupation String,
    Education String,
    Age Nullable(UInt8)
) ENGINE = Memory;
create table EventLog
(
    LogEntry String,
    Created Int64
) ENGINE = Memory;
create table Dates
(
    EventTime DateTime,
) ENGINE = Memory;
Select '-- test summarize --' ;
set allow_experimental_kusto_dialect=1;
set dialect='kusto';
