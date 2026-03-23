CREATE TABLE t
(
    a UInt64
)
ENGINE = Null;

CREATE MATERIALIZED VIEW t_mv
ENGINE = Null
AS
SELECT
    now() AS ts,
    max(a)
FROM t
GROUP BY ts;

INSERT INTO t SELECT *
FROM numbers_mt(10e6)
SETTINGS
    max_threads = 10,
    max_insert_threads = 10,
    max_block_size = 100000,
    parallel_view_processing = 1,
    use_concurrency_control = 0;

SELECT peak_threads_usage >= 10
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND startsWith(query, 'insert');