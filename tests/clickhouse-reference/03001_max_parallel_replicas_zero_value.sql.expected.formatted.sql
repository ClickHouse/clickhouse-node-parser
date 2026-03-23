SYSTEM drop  table if exists test_d;

CREATE TABLE test_d
ENGINE = Distributed(test_cluster_two_shard_three_replicas_localhost, `system`, numbers);

SYSTEM drop  table test_d;