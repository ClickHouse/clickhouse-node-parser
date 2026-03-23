SYSTEM DROP  TABLE IF EXISTS Bin_at_test;

CREATE TABLE Bin_at_test
(
    Date DateTime('UTC'),
    Num Nullable(UInt8)
)
ENGINE = Memory;

INSERT INTO Bin_at_test;

SET allow_experimental_kusto_dialect = 1;

SET dialect = 'kusto';