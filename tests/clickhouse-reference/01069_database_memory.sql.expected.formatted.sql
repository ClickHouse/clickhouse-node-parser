CREATE DATABASE memory_01069
ENGINE = Memory;

CREATE TABLE memory_01069.mt
(
    n UInt8
)
ENGINE = MergeTree()
ORDER BY n;

CREATE TABLE memory_01069.file
(
    n UInt8
)
ENGINE = File(CSV);

SELECT *
FROM memory_01069.mt
ORDER BY n ASC;

SELECT *
FROM memory_01069.file
ORDER BY n ASC;