-- Tags: no-replicated-database
-- https://github.com/ClickHouse/ClickHouse/issues/58500
SET enable_analyzer = 1;

DROP TABLE IF EXISTS t;

CREATE TABLE t
(
    ID UInt8
)
ENGINE = Memory();

INSERT INTO t;