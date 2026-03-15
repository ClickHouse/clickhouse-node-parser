CREATE TABLE data_01247 AS `system`.numbers
ENGINE = Memory();

CREATE TABLE dist_01247 AS data_01247
ENGINE = Distributed(test_cluster_two_shards, currentDatabase(), data_01247, number);

SET use_statistics = 1;