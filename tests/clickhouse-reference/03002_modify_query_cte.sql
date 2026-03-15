CREATE TABLE table_03002 (ts DateTime, event_type String) ENGINE = MergeTree ORDER BY (event_type, ts);
CREATE MATERIALIZED VIEW mv_03002 TO table_03002 AS SELECT ts FROM table_03002;
