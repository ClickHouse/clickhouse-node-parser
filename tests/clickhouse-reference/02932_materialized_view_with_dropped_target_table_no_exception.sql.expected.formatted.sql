SET ignore_materialized_views_with_dropped_target_table = 1;

SET send_logs_level = 'error';

SYSTEM drop  table if exists from_table;

SYSTEM drop  table if exists to_table;

SYSTEM drop  table if exists mv;

CREATE TABLE from_table
(
    x UInt32
)
ENGINE = MergeTree
ORDER BY x;

CREATE TABLE to_table
(
    x UInt32
)
ENGINE = MergeTree
ORDER BY x;

CREATE MATERIALIZED VIEW mv
TO to_table
AS
SELECT *
FROM from_table;

INSERT INTO from_table SELECT 42;

SELECT *
FROM from_table;

SELECT *
FROM to_table;

SYSTEM drop  table to_table;

SYSTEM drop  table from_table;

SYSTEM drop  view mv;