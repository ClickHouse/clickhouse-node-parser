-- Tags: long, no-parallel, no-object-storage, no-msan, no-tsan
SET enable_analyzer = 1; -- parallel distributed insert select for replicated tables works only with analyzer

SET parallel_distributed_insert_select = 2;

CREATE TABLE t_mt_source
(
    k UInt64,
    v String
)
ENGINE = MergeTree()
ORDER BY k
SETTINGS index_granularity = 10;

CREATE TABLE t_rmt_target
(
    k UInt64,
    v String
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/t_rmt_target', 'r1')
ORDER BY tuple();

SELECT count()
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_mt_source';

SET cluster_for_parallel_replicas = 'test_cluster_one_shard_three_replicas_localhost', max_parallel_replicas = 3, parallel_replicas_for_non_replicated_merge_tree = 1, parallel_replicas_mark_segment_size = 128;

-- we do not want concurrency control to limit the number of threads
SET use_concurrency_control = 0;

SELECT
    if(is_initial_query, 'inital', 'secondary'),
    if(toUInt64OrZero(`Settings`['parallel_replicas_insert_select_local_pipeline']) == 0
    AND is_initial_query, 1, 8) AS threads_limit,
    least(peak_threads_usage, threads_limit),
    format('local_pipeline={}', `Settings`['parallel_replicas_insert_select_local_pipeline'])
FROM `system`.query_log
WHERE ((current_database = currentDatabase()
    OR has(databases, currentDatabase())))
    AND type = 'QueryFinish'
    AND `Settings`['allow_experimental_parallel_reading_from_replicas'] = '1'
    AND query_kind = 'Insert'
    AND has(tables, concat(currentDatabase(), '.t_rmt_target'))
ORDER BY event_time_microseconds ASC
SETTINGS allow_experimental_parallel_reading_from_replicas = 0;