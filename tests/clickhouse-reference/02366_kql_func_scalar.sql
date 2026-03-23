DROP TABLE IF EXISTS Bin_at_test;
CREATE TABLE Bin_at_test
(    
    `Date` DateTime('UTC'),
    Num Nullable(UInt8)
) ENGINE = Memory;
INSERT INTO Bin_at_test VALUES ('2018-02-24T15:14:01',3), ('2018-02-23T16:14:01',4), ('2018-02-26T15:14:01',5);
set allow_experimental_kusto_dialect=1;
set dialect = 'kusto';
