DROP TABLE IF EXISTS test_d;

CREATE TABLE test_d
ENGINE = Distributed(test_cluster_two_shard_three_replicas_localhost, `system`, numbers);

DROP TABLE test_d;