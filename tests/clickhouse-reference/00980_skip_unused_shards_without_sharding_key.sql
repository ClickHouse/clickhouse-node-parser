CREATE TABLE t_local (a Int) ENGINE = Memory;
CREATE TABLE t_distr (a Int) ENGINE = Distributed(test_shard_localhost, currentDatabase(), 't_local');
SET optimize_skip_unused_shards = 1;
SELECT * FROM t_distr WHERE a = 1;
