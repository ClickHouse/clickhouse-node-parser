-- Tags: long, zookeeper, no-replicated-database, no-polymorphic-parts, no-random-merge-tree-settings, no-shared-merge-tree, no-async-insert
-- Tag no-replicated-database: Fails due to additional replicas or shards
-- no-shared-merge-tree: depends on structure in zookeeper of replicated merge tree
-- no-async-insert: Test expects new part for each insert
SET insert_keeper_fault_injection_probability = 0; -- disable fault injection; part ids are non-deterministic in case of insert retries

-- cleanup code will perform extra Exists
-- (so the .reference will not match)
CREATE TABLE rmt
(
    n int
)
ENGINE = ReplicatedMergeTree('/test/01158/{database}/rmt', '1')
ORDER BY n
SETTINGS cleanup_delay_period = 86400, max_cleanup_delay_period = 86400, replicated_can_become_leader = 0;

INSERT INTO rmt;

SELECT
    address,
    type,
    has_watch,
    op_num,
    path,
    is_ephemeral,
    is_sequential,
    version,
    requests_size,
    request_idx,
    error,
    watch_type,
    watch_state,
    path_created,
    stat_version,
    stat_cversion,
    stat_dataLength,
    stat_numChildren
FROM `system`.zookeeper_log
WHERE like(path, concat('/test/01158/', currentDatabase(), '/rmt/log%'))
    AND op_num NOT IN (3, 4, 12, 500)
ORDER BY
    xid ASC,
    type ASC,
    request_idx ASC;

SELECT count() > 0
FROM `system`.zookeeper_log
WHERE like(path, concat('/test/01158/', currentDatabase(), '/rmt%'))
    AND duration_microseconds > 0;

SELECT
    sum(errors[0]) > 0,
    sum(average_latency) > 0
FROM `system`.aggregated_zookeeper_log
WHERE parent_path = concat('/test/01158/', currentDatabase(), '/rmt')
    AND operation = 'Create';