-- https://github.com/ClickHouse/ClickHouse/issues/7520
SET enable_analyzer = 1;

CREATE TABLE test
(
    a UInt32,
    b UInt32
)
ENGINE = Memory;