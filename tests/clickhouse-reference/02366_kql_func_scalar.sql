CREATE TABLE Bin_at_test
(    
    `Date` DateTime('UTC'),
    Num Nullable(UInt8)
) ENGINE = Memory;
set allow_experimental_kusto_dialect=1;
set dialect = 'kusto';
