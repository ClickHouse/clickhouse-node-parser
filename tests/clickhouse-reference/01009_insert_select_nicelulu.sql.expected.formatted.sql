CREATE TABLE test_insert_t1
(
    dt Date,
    uid String,
    name String,
    city String
)
ENGINE = MergeTree
ORDER BY name
PARTITION BY toYYYYMMDD(dt)
SETTINGS index_granularity = 8192;

CREATE TABLE test_insert_t2
(
    dt Date,
    uid String
)
ENGINE = MergeTree
ORDER BY uid
PARTITION BY toYYYYMMDD(dt)
SETTINGS index_granularity = 8192;

CREATE TABLE test_insert_t3
(
    dt Date,
    uid String,
    name String,
    city String
)
ENGINE = MergeTree
ORDER BY name
PARTITION BY toYYYYMMDD(dt)
SETTINGS index_granularity = 8192;

SELECT count(*)
FROM test_insert_t3;