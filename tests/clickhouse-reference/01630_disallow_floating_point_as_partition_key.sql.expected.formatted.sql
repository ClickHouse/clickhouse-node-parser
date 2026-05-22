DROP TABLE IF EXISTS test;

CREATE TABLE test
(
    a Float32,
    b int
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY a; -- { serverError BAD_ARGUMENTS }

CREATE TABLE test
(
    a Float32,
    b int
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY a
SETTINGS allow_floating_point_partition_key = true;

CREATE TABLE test
(
    a Float32,
    b int,
    c String,
    d Float64
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY (b, c, d)
SETTINGS allow_floating_point_partition_key = false; -- { serverError BAD_ARGUMENTS }

CREATE TABLE test
(
    a Float32,
    b int,
    c String,
    d Float64
)
ENGINE = MergeTree()
ORDER BY tuple()
PARTITION BY (b, c, d)
SETTINGS allow_floating_point_partition_key = true;