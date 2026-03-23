CREATE TABLE Customers
(    
    FirstName Nullable(String),
    LastName String, 
    Occupation String,
    Education String,
    Age Nullable(UInt8)
) ENGINE = Memory;
INSERT INTO Customers VALUES ('Theodore','Diaz','Skilled Manual','Bachelors',28), ('Stephanie','Cox','Management','Bachelors',33), ('Peter','Nara','Skilled Manual','Graduate Degree',26), ('Latoya','Shen','Professional','Graduate Degree',25), ('Joshua','Lee','Professional','Partial College',26), ('Edward','Hernandez','Skilled Manual','High School',36), ('Dalton','Wood','Professional','Partial College',42), ('Christine','Nara','Skilled Manual','Partial College',33), ('Cameron','Rodriguez','Professional','Partial College',28), ('Angel','Stewart','Professional','Partial College',46);
set allow_experimental_kusto_dialect=1;
set dialect='kusto';
SET max_query_size = 55;
SET max_query_size=262144;
