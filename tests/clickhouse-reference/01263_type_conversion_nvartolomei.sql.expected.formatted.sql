CREATE TABLE m
(
    v UInt8
)
ENGINE = MergeTree()
ORDER BY v
PARTITION BY tuple();

CREATE TABLE d
(
    v UInt16
)
ENGINE = Distributed('test_cluster_two_shards', currentDatabase(), m, rand());

SELECT *
FROM d;

CREATE TABLE m
(
    v Enum8('a' = 1, 'b' = 2)
)
ENGINE = MergeTree()
ORDER BY v
PARTITION BY tuple();

CREATE TABLE d
(
    v Enum8('a' = 1)
)
ENGINE = Distributed('test_cluster_two_shards', currentDatabase(), m, rand());

SELECT '---';

SELECT toString(v)
FROM (
        SELECT v
        FROM d
        ORDER BY v ASC
    )
FORMAT Null; -- { serverError UNKNOWN_ELEMENT_OF_ENUM}