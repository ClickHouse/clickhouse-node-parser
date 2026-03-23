-- Tags: no-object-storage
-- no-object-storage since the output of the pipeline depends on the read method
SET enable_analyzer = 1;

SET max_threads = 4;

SYSTEM DROP  TABLE IF EXISTS trivial_count;

CREATE TABLE trivial_count
ENGINE = MergeTree()
ORDER BY number AS
SELECT *
FROM numbers(10);