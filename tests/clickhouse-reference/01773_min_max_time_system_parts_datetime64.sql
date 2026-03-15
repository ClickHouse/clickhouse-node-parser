CREATE TABLE test (time DateTime64(3)) ENGINE = MergeTree ORDER BY tuple() PARTITION BY toStartOfInterval(time, INTERVAL 2 YEAR);
SELECT min_time, max_time FROM system.parts WHERE table = 'test' AND database = currentDatabase();
SELECT min_time, max_time FROM system.parts_columns WHERE table = 'test' AND database = currentDatabase();
