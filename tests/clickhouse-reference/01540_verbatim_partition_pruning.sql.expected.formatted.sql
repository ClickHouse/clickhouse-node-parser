CREATE TABLE xy
(
    x int,
    y int
)
ENGINE = MergeTree
ORDER BY y
PARTITION BY intHash64(x) % 2
SETTINGS index_granularity = 1;

-- Now we have two partitions: 0 and 1, each of which contains 2 values.
-- minmax index for the first partition is 0 <= x <= 8
-- minmax index for the second partition is 2 <= x <= 9
SET max_rows_to_read = 2;

SELECT *
FROM xy
WHERE intHash64(x) % 2 = intHash64(2) % 2;

-- Equality is another special operator that can be treated as an always monotonic indicator for deterministic functions.
-- minmax index is not enough.
SELECT *
FROM xy
WHERE x = 8;

CREATE TABLE xyz
(
    x int,
    y int,
    z int
)
ENGINE = MergeTree
ORDER BY x
PARTITION BY if(toUInt8(x), y, z)
SETTINGS index_granularity = 1;

SELECT *
FROM xyz
WHERE y = 2;

CREATE TABLE test
(
    d Date,
    k Int64,
    s String
)
ENGINE = MergeTree
ORDER BY (d, k)
PARTITION BY (toYYYYMM(d),k);

SELECT *
FROM test
WHERE d != '2020-01-01';

CREATE TABLE myTable
(
    myDay Date,
    myOrder Int32,
    someData String
)
ENGINE = ReplacingMergeTree
ORDER BY (myOrder)
PARTITION BY floor(toYYYYMMDD(myDay), -1);

SELECT *
FROM myTable AS mt
WHERE myDay = '2021-01-02';