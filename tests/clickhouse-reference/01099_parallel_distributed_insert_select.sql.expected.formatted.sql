-- Tags: distributed
-- <Warning> ConnectionPoolWithFailover: Connection failed at try №1 - is not a problem
SET send_logs_level = 'fatal';

SET prefer_localhost_replica = 1;

SET parallel_distributed_insert_select = 1;

CREATE TABLE local_01099_a
(
    number UInt64
)
ENGINE = Log;

CREATE TABLE local_01099_b
(
    number UInt64
)
ENGINE = Log;

CREATE TABLE distributed_01099_a AS local_01099_a
ENGINE = Distributed('test_shard_localhost', currentDatabase(), local_01099_a, rand());

CREATE TABLE distributed_01099_b AS local_01099_b
ENGINE = Distributed('test_shard_localhost', currentDatabase(), local_01099_b, rand());

SELECT *
FROM distributed_01099_b;

CREATE TABLE distributed_01099_a AS local_01099_a
ENGINE = Distributed('test_cluster_two_shards_localhost', currentDatabase(), local_01099_a, rand());

CREATE TABLE distributed_01099_b AS local_01099_b
ENGINE = Distributed('test_cluster_two_shards_localhost', currentDatabase(), local_01099_b, rand());

SELECT
    number,
    count(number)
FROM local_01099_b
GROUP BY number
ORDER BY number ASC;

CREATE TABLE distributed_01099_a AS local_01099_a
ENGINE = Distributed('test_cluster_two_shards', currentDatabase(), local_01099_a, rand());

CREATE TABLE distributed_01099_b AS local_01099_b
ENGINE = Distributed('test_cluster_two_shards', currentDatabase(), local_01099_b, rand());

SET prefer_localhost_replica = 0; -- to require distributed send for local replica too

SET prefer_localhost_replica = 1;

SELECT
    number,
    count(number)
FROM distributed_01099_b
GROUP BY number
ORDER BY number ASC;

CREATE TABLE local_01099_a
(
    number UInt64
)
ENGINE = MergeTree()
ORDER BY number;

CREATE TABLE local_01099_b
(
    number UInt64
)
ENGINE = MergeTree()
ORDER BY number;

CREATE TABLE distributed_01099_a AS local_01099_a
ENGINE = Distributed('test_cluster_1_shard_3_replicas_1_unavailable', currentDatabase(), local_01099_a, rand());

CREATE TABLE distributed_01099_b AS local_01099_b
ENGINE = Distributed('test_cluster_1_shard_3_replicas_1_unavailable', currentDatabase(), local_01099_b, rand());

SET send_logs_level = 'fatal';

SET send_logs_level = 'warning';

SET send_logs_level = 'error';

SET parallel_distributed_insert_select = 2;

--- https://github.com/ClickHouse/ClickHouse/issues/78464
CREATE TABLE local_01099_c
(
    n UInt64
)
ENGINE = Log;

CREATE TABLE distributed_01099_c AS local_01099_c
ENGINE = Distributed('test_shard_localhost', currentDatabase(), local_01099_c, rand());

SELECT *
FROM distributed_01099_c;