-- Tags: no-shared-catalog, no-parallel-replicas
-- FIXME no-shared-catalog: STOP MERGES will only stop them on the current replica, the second one will continue to merge
-- no-parallel-replicas: profile events may differ with parallel replicas.
DROP TABLE IF EXISTS t_lightweight_mut_7;

SET apply_mutations_on_fly = 1;

SET max_streams_for_merge_tree_reading = 1;

CREATE TABLE t_lightweight_mut_7
(
    id UInt64,
    v UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/t_lightweight_mut_7', '1')
ORDER BY id;

INSERT INTO t_lightweight_mut_7 SELECT
    number,
    number
FROM numbers(100000);

SELECT count()
FROM t_lightweight_mut_7;

SELECT
    1,
    sum(v)
FROM t_lightweight_mut_7;

SELECT
    2,
    sum(v)
FROM t_lightweight_mut_7
SETTINGS apply_mutations_on_fly = 0;

SELECT
    3,
    sum(v)
FROM t_lightweight_mut_7;

SELECT
    query,
    ProfileEvents['ReadTasksWithAppliedMutationsOnFly'],
    ProfileEvents['MutationsAppliedOnFlyInAllReadTasks']
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND ilike(query, 'SELECT%FROM%t_lightweight_mut_7%')
    AND type = 'QueryFinish'
ORDER BY event_time_microseconds ASC;

DROP TABLE t_lightweight_mut_7;