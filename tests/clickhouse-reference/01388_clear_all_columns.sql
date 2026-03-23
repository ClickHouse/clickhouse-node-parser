DROP TABLE IF EXISTS test;
CREATE TABLE test (x UInt8) ENGINE = MergeTree ORDER BY tuple();
INSERT INTO test (x) VALUES (1), (2), (3);
DROP TABLE test;
CREATE TABLE test (x UInt8, y UInt8) ENGINE = MergeTree ORDER BY tuple();
INSERT INTO test (x, y) VALUES (1, 1), (2, 2), (3, 3);
INSERT INTO test (x, y, z) VALUES (1, 1, 'a'), (2, 2, 'b'), (3, 3, 'c');
SELECT * FROM test ORDER BY y;
