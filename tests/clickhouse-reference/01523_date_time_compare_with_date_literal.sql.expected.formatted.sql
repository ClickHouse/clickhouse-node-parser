CREATE TABLE test
(
    timestamp DateTime
)
ENGINE = MergeTree
ORDER BY timestamp;

INSERT INTO test;

INSERT INTO test;

INSERT INTO test;

SELECT *
FROM test
WHERE timestamp != '2020-10-15'
ORDER BY timestamp ASC;

SELECT *
FROM test
WHERE timestamp == '2020-10-15'
ORDER BY timestamp ASC;

SELECT *
FROM test
WHERE timestamp > '2020-10-15'
ORDER BY timestamp ASC;

SELECT *
FROM test
WHERE timestamp >= '2020-10-15'
ORDER BY timestamp ASC;

SELECT *
FROM test
WHERE timestamp < '2020-10-16'
ORDER BY timestamp ASC;

SELECT *
FROM test
WHERE timestamp <= '2020-10-16'
ORDER BY timestamp ASC;

SELECT *
FROM test
WHERE '2020-10-15' != timestamp
ORDER BY timestamp ASC;

SELECT *
FROM test
WHERE '2020-10-15' == timestamp
ORDER BY timestamp ASC;

SELECT *
FROM test
WHERE '2020-10-15' < timestamp
ORDER BY timestamp ASC;

SELECT *
FROM test
WHERE '2020-10-15' <= timestamp
ORDER BY timestamp ASC;

SELECT *
FROM test
WHERE '2020-10-16' > timestamp
ORDER BY timestamp ASC;

SELECT *
FROM test
WHERE '2020-10-16' >= timestamp
ORDER BY timestamp ASC;

CREATE TABLE test
(
    timestamp DateTime64
)
ENGINE = MergeTree
ORDER BY timestamp;