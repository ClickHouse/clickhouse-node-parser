CREATE TABLE test (`\xFF\0привет���` UInt8) ENGINE = MergeTree ORDER BY `\xFF\0привет���` COMMENT '\0';
SELECT * FROM test;
