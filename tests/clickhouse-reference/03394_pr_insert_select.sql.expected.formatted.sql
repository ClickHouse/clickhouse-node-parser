SET enable_analyzer = 1; -- parallel distributed insert select for replicated tables works only with analyzer

SET parallel_distributed_insert_select = 2;

CREATE TABLE t_mt_source
(
    k UInt64,
    v String
)
ENGINE = MergeTree()
ORDER BY k;

CREATE TABLE t_rmt_target
(
    k UInt64,
    v String
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{database}/t_rmt_target', 'r1')
ORDER BY tuple();

SELECT
    'mt source table count()',
    count()
FROM t_mt_source;

SET enable_parallel_replicas = 1, cluster_for_parallel_replicas = 'test_cluster_one_shard_three_replicas_localhost', max_parallel_replicas = 3;

SELECT '-- check result without local pipeline';

SELECT count()
FROM `system`.query_log
WHERE ((current_database = currentDatabase()
    OR has(databases, currentDatabase())))
    AND type = 'QueryFinish'
    AND query_kind = 'Insert'
    AND log_comment = 'cb01f13a-410c-4985-b233-35289776b58f'
    AND event_date >= yesterday();

SELECT count()
FROM t_rmt_target;

SELECT *
FROM t_rmt_target
ORDER BY k ASC
EXCEPT
SELECT *
FROM t_mt_source
ORDER BY k ASC;