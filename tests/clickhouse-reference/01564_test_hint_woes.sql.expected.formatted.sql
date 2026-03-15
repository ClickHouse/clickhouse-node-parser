-- { echo }
CREATE TABLE values_01564
(
    a int,
    CONSTRAINT c1 CHECK a < 10
)
ENGINE = Memory;

SELECT 1;

SELECT nonexistent AS column; -- { serverError UNKNOWN_IDENTIFIER }

-- a failing insert and then a normal insert (#https://github.com/ClickHouse/ClickHouse/issues/19353)
CREATE TABLE t0
(
    c0 String,
    c1 Int32
)
ENGINE = Memory();