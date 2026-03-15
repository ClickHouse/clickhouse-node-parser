CREATE DATABASE IF NOT EXISTS shard_0;
CREATE DATABASE IF NOT EXISTS shard_1;
CREATE TABLE shard_0.t_local (a Int) ENGINE = Memory;
CREATE TABLE shard_1.t_local (a Int) ENGINE = Memory;
CREATE TABLE t_distr (a Int) ENGINE = Distributed(test_cluster_two_shards_different_databases, '', 't_local', 1000);
SET distributed_foreground_insert=0;
SET distributed_foreground_insert=1;
SELECT * FROM t_distr ORDER BY a;
