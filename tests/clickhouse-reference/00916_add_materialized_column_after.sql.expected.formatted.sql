DROP TABLE IF EXISTS add_materialized_column_after;

CREATE TABLE add_materialized_column_after
(
    x UInt32,
    z UInt64
)
ENGINE = MergeTree
ORDER BY x;

ALTER TABLE add_materialized_column_after ADD COLUMN y String MATERIALIZED toString(x) AFTER x;

DROP TABLE add_materialized_column_after;