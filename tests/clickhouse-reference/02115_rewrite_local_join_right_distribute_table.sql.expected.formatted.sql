-- Tags: global, no-parallel
CREATE DATABASE IF NOT EXISTS test_02115;

USE test_02115;

DROP TABLE IF EXISTS t1_local;

DROP TABLE IF EXISTS t2_local;

DROP TABLE IF EXISTS t1_all;

DROP TABLE IF EXISTS t2_all;

CREATE TABLE t1_local
(
    a Int32
)
ENGINE = MergeTree()
ORDER BY a;

CREATE TABLE t2_local AS t1_local;

CREATE TABLE t1_all AS t1_local
ENGINE = Distributed(test_cluster_two_shards_localhost, test_02115, t1_local, rand());

CREATE TABLE t2_all AS t2_local
ENGINE = Distributed(test_cluster_two_shards_localhost, test_02115, t2_local, rand());

INSERT INTO t1_local;

INSERT INTO t2_local;

SET distributed_product_mode = 'local';

SELECT *
FROM t1_all AS t1
WHERE t1.a IN (
        SELECT t2.a
        FROM t2_all AS t2
    );

SELECT t1.*
FROM
    t1_all AS t1
INNER JOIN t2_all AS t2
    ON t1.a = t2.a
ORDER BY t1.a ASC;

SET distributed_product_mode = 'global';

DROP TABLE t1_local;

DROP TABLE t2_local;

DROP TABLE t1_all;

DROP TABLE t2_all;

DROP DATABASE test_02115;