-- Tags: zookeeper, no-encrypted-storage
-- https://github.com/ClickHouse/ClickHouse/issues/72887
SYSTEM DROP  TABLE IF EXISTS t0;

CREATE TABLE t0
(
    c0 Int
)
ENGINE = Memory();