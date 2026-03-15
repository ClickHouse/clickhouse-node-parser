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

SELECT peak_threads_usage >= 10
FROM `system`.query_log
WHERE event_date >= yesterday()
    AND current_database = currentDatabase()
    AND type = 'QueryFinish'
    AND startsWith(query, 'insert');