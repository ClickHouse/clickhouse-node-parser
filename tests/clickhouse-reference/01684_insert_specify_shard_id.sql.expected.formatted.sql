-- Tags: shard
SYSTEM DROP  TABLE IF EXISTS x;

SYSTEM DROP  TABLE IF EXISTS x_dist;

SYSTEM DROP  TABLE IF EXISTS y;

SYSTEM DROP  TABLE IF EXISTS y_dist;

CREATE TABLE x AS `system`.numbers
ENGINE = MergeTree
ORDER BY number;

CREATE TABLE y AS `system`.numbers
ENGINE = MergeTree
ORDER BY number;

CREATE TABLE x_dist AS x
ENGINE = Distributed('test_cluster_two_shards', currentDatabase(), x);

CREATE TABLE y_dist AS y
ENGINE = Distributed('test_cluster_two_shards_localhost', currentDatabase(), y);

-- insert into first shard
INSERT INTO x_dist SELECT *
FROM numbers(10)
SETTINGS insert_shard_id = 1;

INSERT INTO y_dist SELECT *
FROM numbers(10)
SETTINGS insert_shard_id = 1;

SELECT *
FROM x_dist
ORDER BY number ASC;

SELECT *
FROM y_dist
ORDER BY number ASC;

-- insert into second shard
INSERT INTO x_dist SELECT *
FROM numbers(10, 10)
SETTINGS insert_shard_id = 2;

INSERT INTO y_dist SELECT *
FROM numbers(10, 10)
SETTINGS insert_shard_id = 2;

-- no sharding key
INSERT INTO x_dist SELECT *
FROM numbers(10); -- { serverError STORAGE_REQUIRES_PARAMETER }

INSERT INTO y_dist SELECT *
FROM numbers(10); -- { serverError STORAGE_REQUIRES_PARAMETER }

-- invalid shard id
INSERT INTO x_dist SELECT *
FROM numbers(10)
SETTINGS insert_shard_id = 3; -- { serverError INVALID_SHARD_ID }

INSERT INTO y_dist SELECT *
FROM numbers(10)
SETTINGS insert_shard_id = 3; -- { serverError INVALID_SHARD_ID }

SYSTEM DROP  TABLE x;

SYSTEM DROP  TABLE x_dist;

SYSTEM DROP  TABLE y;

SYSTEM DROP  TABLE y_dist;