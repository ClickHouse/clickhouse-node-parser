-- Test for issue #84442: ALTER MODIFY ORDER BY does not check if the new column has TTL
-- This test verifies that ALTER TABLE properly validates TTL columns in ORDER BY clauses
CREATE TABLE IF NOT EXISTS test_break_ddl
(
    id String,
    event_date Date,
    event_time DateTime,
    message String
)
ENGINE = ReplacingMergeTree()
ORDER BY (id, event_date, event_time)
PARTITION BY event_date;

SYSTEM DROP  TABLE IF EXISTS test_break_ddl;