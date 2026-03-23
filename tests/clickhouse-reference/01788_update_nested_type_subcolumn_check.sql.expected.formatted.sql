SYSTEM DROP  TABLE IF EXISTS test_wide_nested;

CREATE TABLE test_wide_nested
(
    id Int,
    `info.id` Array(Int),
    `info.name` Array(String),
    `info.age` Array(Int)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0;

SET mutations_sync = 1;

INSERT INTO test_wide_nested SELECT
    number,
    [number,number + 1],
    ['aa','bb'],
    [number,number * 2]
FROM numbers(5);

SELECT *
FROM test_wide_nested
WHERE id = 1
ORDER BY id ASC;

SELECT *
FROM test_wide_nested;

SYSTEM DROP  TABLE test_wide_nested;

SYSTEM DROP  TABLE IF EXISTS test_wide_not_nested;

CREATE TABLE test_wide_not_nested
(
    id Int,
    `info.id` Int,
    `info.name` String,
    `info.age` Int
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 0;

INSERT INTO test_wide_not_nested SELECT
    number,
    number,
    'aa',
    number * 2
FROM numbers(5);

SELECT *
FROM test_wide_not_nested
ORDER BY id ASC;

SYSTEM DROP  TABLE test_wide_not_nested;