-- Tags: no-parallel
SET allow_suspicious_ttl_expressions = 1;

CREATE TABLE ttl
(
    d Date,
    a Int
)
ENGINE = MergeTree
ORDER BY a
PARTITION BY toDayOfMonth(d);

SET materialize_ttl_after_modify = 0;

-- TTL should not be applied
SELECT *
FROM ttl
ORDER BY a ASC;

CREATE TABLE ttl
(
    i Int,
    s String
)
ENGINE = MergeTree
ORDER BY i;

SELECT *
FROM ttl
ORDER BY i ASC;

CREATE TABLE ttl
(
    d Date,
    i Int,
    s String
)
ENGINE = MergeTree
ORDER BY i;

SELECT
    i,
    s
FROM ttl
ORDER BY i ASC;