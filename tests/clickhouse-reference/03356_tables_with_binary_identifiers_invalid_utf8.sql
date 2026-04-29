-- Tags: no-random-merge-tree-settings
DROP TABLE IF EXISTS test;
CREATE TABLE test (`\xFF\0привет���` UInt8) ENGINE = MergeTree ORDER BY `\xFF\0привет���` COMMENT '\0';
INSERT INTO test VALUES (123);
SELECT * FROM test;
DETACH TABLE test;
ATTACH TABLE test;
DROP TABLE test;
