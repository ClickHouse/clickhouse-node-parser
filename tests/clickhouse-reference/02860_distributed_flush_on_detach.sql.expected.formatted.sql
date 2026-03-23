SET prefer_localhost_replica = 0;

SYSTEM drop  table if exists data;

SYSTEM drop  table if exists dist;

-- { echoOn }
CREATE TABLE data
(
    key Int
)
ENGINE = Memory();

CREATE TABLE dist
(
    key Int
)
ENGINE = Distributed(test_shard_localhost, currentDatabase(), data);

-- check that FLUSH DISTRIBUTED does flushing anyway
INSERT INTO dist;

SELECT *
FROM data;

-- check flush_on_detach=0
SYSTEM drop  table dist;

CREATE TABLE dist
(
    key Int
)
ENGINE = Distributed(test_shard_localhost, currentDatabase(), data)
SETTINGS flush_on_detach = 0;