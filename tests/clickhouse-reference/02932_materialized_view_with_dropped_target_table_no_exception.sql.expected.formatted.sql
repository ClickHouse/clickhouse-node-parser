SET ignore_materialized_views_with_dropped_target_table = 1;

SET send_logs_level = 'error';

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