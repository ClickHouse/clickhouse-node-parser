CREATE TABLE Customers
(    
    FirstName Nullable(String),
    LastName String, 
    Occupation String,
    Education String,
    Age Nullable(UInt8)
) ENGINE = Memory;
set allow_experimental_kusto_dialect=1;
set dialect='kusto';
SET max_query_size = 55;
SET max_query_size=262144;
