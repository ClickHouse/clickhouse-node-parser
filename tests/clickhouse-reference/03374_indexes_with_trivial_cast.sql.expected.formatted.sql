-- Tags: no-random-settings, no-parallel-replicas
SET enable_analyzer = 1;

CREATE TABLE test
(
    x String,
    INDEX idx1 x TYPE bloom_filter GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 1;

CREATE TABLE test
(
    x String,
    INDEX idx1 x TYPE set(0) GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 1;

CREATE TABLE test
(
    x String,
    INDEX idx1 x TYPE tokenbf_v1(16000, 2, 0) GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 1;

CREATE TABLE test
(
    x String,
    INDEX idx1 x TYPE ngrambf_v1(4, 16000, 2, 0) GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 1;

CREATE TABLE test
(
    x String,
    INDEX idx1 x TYPE minmax GRANULARITY 1
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS index_granularity = 1;