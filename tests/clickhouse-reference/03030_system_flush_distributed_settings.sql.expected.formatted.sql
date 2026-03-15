CREATE TABLE ephemeral
(
    key Int,
    value Int
)
ENGINE = Null();

CREATE TABLE dist_in AS ephemeral
ENGINE = Distributed(test_shard_localhost, currentDatabase(), ephemeral, key)
SETTINGS background_insert_batch = 1;

CREATE TABLE data
(
    key Int,
    uniq_values Int
)
ENGINE = TinyLog();

CREATE MATERIALIZED VIEW mv
TO data
AS
SELECT
    key,
    uniqExact(value::String) AS uniq_values
FROM ephemeral
GROUP BY key;

CREATE TABLE dist_out AS data
ENGINE = Distributed(test_shard_localhost, currentDatabase(), data);

SET prefer_localhost_replica = 0;

SET optimize_trivial_insert_select = 1;

SELECT count()
FROM dist_out;