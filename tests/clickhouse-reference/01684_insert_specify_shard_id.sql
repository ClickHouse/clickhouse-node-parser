CREATE TABLE x AS system.numbers ENGINE = MergeTree ORDER BY number;
CREATE TABLE y AS system.numbers ENGINE = MergeTree ORDER BY number;
CREATE TABLE x_dist as x ENGINE = Distributed('test_cluster_two_shards', currentDatabase(), x);
CREATE TABLE y_dist as y ENGINE = Distributed('test_cluster_two_shards_localhost', currentDatabase(), y);
SELECT * FROM x_dist ORDER by number;
SELECT * FROM y_dist ORDER by number;
