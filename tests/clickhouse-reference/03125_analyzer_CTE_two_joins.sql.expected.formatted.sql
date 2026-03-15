-- https://github.com/ClickHouse/ClickHouse/issues/29748
SET enable_analyzer = 1;

CREATE TABLE events
(
    distinct_id String
)
ENGINE = Memory;