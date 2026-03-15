CREATE TABLE Bin_at_test
(
    Date DateTime('UTC'),
    Num Nullable(UInt8)
)
ENGINE = Memory;

SET allow_experimental_kusto_dialect = 1;

SET dialect = 'kusto';