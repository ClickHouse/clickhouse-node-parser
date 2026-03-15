SET optimize_read_in_order = 1;

SET max_threads = 1;

CREATE TABLE t0
(
    c0 Nullable(Int64)
)
ENGINE = MergeTree()
ORDER BY c0
SETTINGS allow_nullable_key = 1;

SELECT '--- table asc, query desc, last';

SELECT *
FROM t0
ORDER BY c0 DESC;

SELECT *
FROM t0
ORDER BY c0 DESC;

SELECT *
FROM t0
ORDER BY c0 ASC;

SELECT *
FROM t0
ORDER BY c0 ASC;

CREATE TABLE t1
(
    c0 Nullable(Int64)
)
ENGINE = MergeTree()
ORDER BY c0 DESC
SETTINGS allow_nullable_key = 1, allow_experimental_reverse_key = 1;

SELECT *
FROM t1
ORDER BY c0 DESC;

SELECT *
FROM t1
ORDER BY c0 DESC;

SELECT *
FROM t1
ORDER BY c0 ASC;

SELECT *
FROM t1
ORDER BY c0 ASC;

CREATE TABLE f0
(
    c0 Float64
)
ENGINE = MergeTree()
ORDER BY c0;

SELECT *
FROM f0
ORDER BY c0 DESC;

SELECT *
FROM f0
ORDER BY c0 DESC;

SELECT *
FROM f0
ORDER BY c0 ASC;

SELECT *
FROM f0
ORDER BY c0 ASC;

CREATE TABLE f1
(
    c0 Float64
)
ENGINE = MergeTree()
ORDER BY c0 DESC
SETTINGS allow_experimental_reverse_key = 1;

SELECT *
FROM f1
ORDER BY c0 DESC;

SELECT *
FROM f1
ORDER BY c0 DESC;

SELECT *
FROM f1
ORDER BY c0 ASC;

SELECT *
FROM f1
ORDER BY c0 ASC;

SET allow_suspicious_low_cardinality_types = 1;

CREATE TABLE lct0
(
    c0 LowCardinality(Nullable(Int64))
)
ENGINE = MergeTree()
ORDER BY c0
SETTINGS allow_nullable_key = 1;

SELECT *
FROM lct0
ORDER BY c0 DESC;

SELECT *
FROM lct0
ORDER BY c0 DESC;

SELECT *
FROM lct0
ORDER BY c0 ASC;

SELECT *
FROM lct0
ORDER BY c0 ASC;