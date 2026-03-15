SET join_use_nulls = 1;

CREATE TABLE t0
(
    c0 Int
)
ENGINE = Memory();

CREATE TABLE t1
(
    c0 Int
)
ENGINE = Distributed('test_cluster_two_shards', currentDatabase(), t0);

SELECT t1._shard_num % t1._shard_num
FROM
    t1
FULL JOIN (
        SELECT 1 AS c0
    ) AS tx
    ON true;

SELECT t1._shard_num % shardNum()
FROM
    t1
FULL JOIN (
        SELECT 1 AS c0
    ) AS tx
    ON true;