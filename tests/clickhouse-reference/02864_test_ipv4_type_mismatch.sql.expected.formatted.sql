DROP TABLE IF EXISTS test;

CREATE TABLE test
(
    ip IPv4 CODEC(ZSTD(6))
)
ENGINE = MergeTree()
ORDER BY ip;

INSERT INTO test;

INSERT INTO test;

SELECT *
FROM test
ORDER BY ip ASC;

SELECT ip IN (IPv4StringToNum('1.1.1.1'))
FROM test
ORDER BY ip ASC;

SELECT ip IN ('1.1.1.1')
FROM test
ORDER BY ip ASC;

SELECT ip IN (IPv4StringToNum('8.8.8.8'))
FROM test
ORDER BY ip ASC;