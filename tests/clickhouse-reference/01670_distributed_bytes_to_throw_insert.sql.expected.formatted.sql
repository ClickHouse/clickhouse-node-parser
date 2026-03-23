CREATE TABLE data_01670
(
    key Int
)
ENGINE = Null();

CREATE TABLE dist_01670
(
    key Int
)
ENGINE = Distributed(test_shard_localhost, currentDatabase(), data_01670)
SETTINGS bytes_to_throw_insert = 1;

-- first batch is always OK, since there is no pending bytes yet
INSERT INTO dist_01670 SELECT *
FROM numbers(1)
SETTINGS prefer_localhost_replica = 0;