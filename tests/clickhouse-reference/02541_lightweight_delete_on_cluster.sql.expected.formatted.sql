-- Tags: distributed, no-replicated-database
-- Tag no-replicated-database: ON CLUSTER is not allowed
SET distributed_ddl_output_mode = 'throw';

CREATE TABLE t1_local ON CLUSTER test_shard_localhost
(
    partition_col_1 String,
    tc1 int,
    tc2 int
)
ENGINE = MergeTree()
ORDER BY tc1
PARTITION BY partition_col_1;

INSERT INTO t1_local;

INSERT INTO t1_local;

INSERT INTO t1_local;

INSERT INTO t1_local;

-- { echoOn }
SELECT *
FROM t1_local
ORDER BY
    tc1 ASC,
    tc2 ASC;