-- Tags: global, no-parallel
-- { echo }
CREATE DATABASE IF NOT EXISTS test_01824;

USE test_01824;

CREATE TABLE t1_shard
(
    id Int32
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE t2_shard
(
    id Int32
)
ENGINE = MergeTree
ORDER BY id;

CREATE TABLE t1_distr AS t1_shard
ENGINE = Distributed(test_cluster_two_shards_localhost, test_01824, t1_shard, id);

CREATE TABLE t2_distr AS t2_shard
ENGINE = Distributed(test_cluster_two_shards_localhost, test_01824, t2_shard, id);

INSERT INTO t1_shard;

INSERT INTO t2_shard;

SET prefer_global_in_and_join = 1;

SELECT d0.id
FROM
    t1_distr AS d0
INNER JOIN (
        SELECT d1.id
        FROM
            t1_distr AS d1
        INNER JOIN t2_distr AS d2
            ON d1.id = d2.id
        WHERE d1.id > 0
        ORDER BY d1.id ASC
    ) AS s0
    USING (id);

-- Force using local mode
SET distributed_product_mode = 'local';