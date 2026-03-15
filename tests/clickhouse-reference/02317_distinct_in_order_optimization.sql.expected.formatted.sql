SELECT '-- enable distinct in order optimization';

SET optimize_distinct_in_order = 1;

CREATE TABLE distinct_in_order
(
    a int
)
ENGINE = MergeTree()
ORDER BY a
SETTINGS index_granularity = 10;

SELECT DISTINCT *
FROM distinct_in_order
SETTINGS
    max_block_size = 10,
    max_threads = 1;

SELECT DISTINCT a
FROM distinct_in_order
SETTINGS
    max_block_size = 10,
    max_threads = 1;

CREATE TABLE distinct_in_order
(
    a int,
    b int,
    c int
)
ENGINE = MergeTree()
ORDER BY (a, b)
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT DISTINCT a
FROM distinct_in_order;

SELECT DISTINCT a
FROM distinct_in_order
ORDER BY a ASC;

SELECT DISTINCT a
FROM distinct_in_order
ORDER BY a DESC;

SELECT DISTINCT
    a,
    b
FROM distinct_in_order
ORDER BY b ASC;

SELECT DISTINCT
    a,
    b
FROM distinct_in_order
ORDER BY b DESC;

SELECT DISTINCT
    a,
    c
FROM distinct_in_order
ORDER BY c ASC;

SELECT DISTINCT
    a,
    c
FROM distinct_in_order
ORDER BY c DESC;

SELECT DISTINCT
    b,
    c
FROM distinct_in_order
ORDER BY c ASC;

SELECT DISTINCT
    b,
    c
FROM distinct_in_order
ORDER BY c DESC;

-- { echoOn }
SELECT DISTINCT
    1 AS x,
    2 AS y
FROM distinct_in_order;

SELECT DISTINCT
    1 AS x,
    2 AS y
FROM distinct_in_order
ORDER BY x ASC;

SELECT DISTINCT
    1 AS x,
    2 AS y
FROM distinct_in_order
ORDER BY
    x ASC,
    y ASC;

SELECT
    a,
    x
FROM (
        SELECT DISTINCT
            a,
            1 AS x
        FROM distinct_in_order
        ORDER BY x ASC
    )
ORDER BY a ASC;

SELECT DISTINCT
    a,
    1 AS x,
    2 AS y
FROM distinct_in_order
ORDER BY a ASC;

SELECT
    a,
    b,
    x,
    y
FROM (
        SELECT DISTINCT
            a,
            b,
            1 AS x,
            2 AS y
        FROM distinct_in_order
        ORDER BY a ASC
    )
ORDER BY
    a ASC,
    b ASC;

SELECT DISTINCT
    x,
    y
FROM (
        SELECT
            1 AS x,
            2 AS y
        FROM distinct_in_order
        ORDER BY x ASC
    )
ORDER BY y ASC;

SELECT DISTINCT
    a,
    b,
    x,
    y
FROM (
        SELECT
            a,
            b,
            1 AS x,
            2 AS y
        FROM distinct_in_order
        ORDER BY a ASC
    )
ORDER BY
    a ASC,
    b ASC;

CREATE TABLE distinct_cardinality_low
(
    low UInt64,
    medium UInt64,
    high UInt64
)
ENGINE = MergeTree()
ORDER BY (low, medium)
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

CREATE TABLE distinct_in_order
(
    low UInt64,
    medium UInt64,
    high UInt64
)
ENGINE = MergeTree()
ORDER BY (low, medium)
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

CREATE TABLE ordinary_distinct
(
    low UInt64,
    medium UInt64,
    high UInt64
)
ENGINE = MergeTree()
ORDER BY (low, medium)
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT count() AS diff
FROM (
        SELECT DISTINCT *
        FROM distinct_in_order
EXCEPT
        SELECT *
        FROM ordinary_distinct
    );

CREATE TABLE sorting_key_empty_tuple
(
    a int,
    b int
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT DISTINCT a
FROM sorting_key_empty_tuple;

CREATE TABLE sorting_key_contain_function
(
    datetime DateTime,
    a int
)
ENGINE = MergeTree()
ORDER BY (toDate(datetime))
SETTINGS index_granularity = 8192, index_granularity_bytes = '10Mi';

SELECT DISTINCT datetime
FROM sorting_key_contain_function;

SELECT DISTINCT toDate(datetime)
FROM sorting_key_contain_function;