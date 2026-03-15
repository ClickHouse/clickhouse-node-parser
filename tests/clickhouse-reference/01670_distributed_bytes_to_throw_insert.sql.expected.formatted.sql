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