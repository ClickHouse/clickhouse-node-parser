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

SELECT *
FROM x_dist
ORDER BY number ASC;

SELECT *
FROM y_dist
ORDER BY number ASC;