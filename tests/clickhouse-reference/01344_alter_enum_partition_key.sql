DROP TABLE IF EXISTS test;
CREATE TABLE test (x Enum('hello' = 1, 'world' = 2), y String) ENGINE = MergeTree PARTITION BY x ORDER BY y;
INSERT INTO test VALUES ('hello', 'test');
SELECT * FROM test;
SELECT name, partition, partition_id FROM system.parts WHERE database = currentDatabase() AND table = 'test' AND active ORDER BY partition;
INSERT INTO test VALUES ('goodbye', 'test');
SELECT * FROM test ORDER BY x;
INSERT INTO test VALUES (111, 'abc');
DROP TABLE test;
