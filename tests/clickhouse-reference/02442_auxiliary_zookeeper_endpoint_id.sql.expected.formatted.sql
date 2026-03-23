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

-- insert data into one replica
INSERT INTO t1_r1 SELECT *
FROM generateRandom('x Int32')
LIMIT 10013;

SELECT count()
FROM t1_r2;