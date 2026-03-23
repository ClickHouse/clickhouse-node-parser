-- Tags: no-parallel
SET prefer_localhost_replica = 1;

SYSTEM drop  table if exists null_01293;

SYSTEM drop  table if exists dist_01293;

CREATE TABLE null_01293
(
    key Int
)
ENGINE = Null();

CREATE TABLE dist_01293 AS null_01293
ENGINE = Distributed(test_cluster_two_shards, currentDatabase(), null_01293, key);

-- no rows, since no active monitor
SELECT *
FROM `system`.distribution_queue
WHERE database = currentDatabase();

INSERT INTO dist_01293 SELECT *
FROM numbers(10);

SELECT
    is_blocked,
    error_count,
    data_files,
    data_compressed_bytes > 100,
    broken_data_files,
    broken_data_compressed_bytes
FROM `system`.distribution_queue
WHERE database = currentDatabase();

SELECT
    is_blocked,
    error_count,
    data_files,
    data_compressed_bytes,
    broken_data_files,
    broken_data_compressed_bytes
FROM `system`.distribution_queue
WHERE database = currentDatabase();

SYSTEM drop  table null_01293;

SYSTEM drop  table dist_01293;