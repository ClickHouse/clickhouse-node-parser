-- Tags: no-fasttest, no-shared-merge-tree
-- no-shared-merge-tree -- shared merge tree doesn't support aux zookeepers
SYSTEM drop  table if exists t1_r1 sync;

SYSTEM drop  table if exists t1_r2 sync;

SYSTEM drop  table if exists t2 sync;

CREATE TABLE t1_r1
(
    x Int32
)
ENGINE = ReplicatedMergeTree('/test/02442/{database}/t', 'r1')
ORDER BY x;

CREATE TABLE t1_r2
(
    x Int32
)
ENGINE = ReplicatedMergeTree('/test/02442/{database}/t', 'r2')
ORDER BY x;

-- create table with same replica_path as t1_r1
CREATE TABLE t2
(
    x Int32
)
ENGINE = ReplicatedMergeTree('zookeeper2:/test/02442/{database}/t', 'r1')
ORDER BY x;

SYSTEM drop  table t2 sync;

-- insert data into one replica
INSERT INTO t1_r1 SELECT *
FROM generateRandom('x Int32')
LIMIT 10013;

SELECT count()
FROM t1_r2;

SYSTEM drop  table t1_r1 sync;

SYSTEM drop  table t1_r2 sync;