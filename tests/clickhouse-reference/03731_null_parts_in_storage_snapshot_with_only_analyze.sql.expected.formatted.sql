CREATE TABLE t0
(
    key Int
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS auto_statistics_types = '';

CREATE TABLE t1
(
    key Int
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS auto_statistics_types = '';