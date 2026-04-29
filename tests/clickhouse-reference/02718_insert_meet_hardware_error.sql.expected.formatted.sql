-- Tags: zookeeper, no-parallel
DROP TABLE IF EXISTS t_hardware_error;

CREATE TABLE t_hardware_error
(
    KeyID UInt32
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{shard}/{database}/t_async_insert_dedup', '{replica}')
ORDER BY (KeyID);

INSERT INTO t_hardware_error;

SYSTEM enable failpoint replicated_merge_tree_commit_zk_fail_after_op;

INSERT INTO t_hardware_error;

SELECT count()
FROM t_hardware_error;

SYSTEM disable failpoint replicated_commit_zk_fail_after_op;

DROP TABLE t_hardware_error;