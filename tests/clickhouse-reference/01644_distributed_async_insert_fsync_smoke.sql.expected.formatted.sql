CREATE TABLE data_01643
(
    key Int
)
ENGINE = Memory();

CREATE TABLE dist_01643 AS data_01643
ENGINE = Distributed(test_cluster_two_shards, currentDatabase(), data_01643, key);

SELECT sum(*)
FROM dist_01643;

CREATE TABLE dist_01643 AS data_01643
ENGINE = Distributed(test_cluster_two_shards, currentDatabase(), data_01643, key)
SETTINGS fsync_after_insert = 1, fsync_directories = 1;