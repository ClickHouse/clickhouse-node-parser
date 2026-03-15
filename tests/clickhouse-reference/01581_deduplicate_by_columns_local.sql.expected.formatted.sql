CREATE TABLE source_data
(
    pk Int32,
    sk Int32,
    val UInt32,
    partition_key UInt32 DEFAULT 1,
    PRIMARY KEY(pk)
)
ENGINE = MergeTree
ORDER BY (pk, sk);

SELECT
    'TOTAL rows',
    count()
FROM source_data;

-- table with duplicates on MATERIALIZED columns
CREATE TABLE full_duplicates
(
    pk Int32,
    sk Int32,
    val UInt32,
    partition_key UInt32,
    mat UInt32 MATERIALIZED 12345,
    alias UInt32 ALIAS 2,
    PRIMARY KEY(pk)
)
ENGINE = MergeTree
ORDER BY (pk, toString(sk * 10))
PARTITION BY (partition_key + 1); -- silly order key to ensure that key column is checked even when it is a part of expression. See [1] below.

SELECT *
FROM full_duplicates;

CREATE TABLE partial_duplicates
(
    pk Int32,
    sk Int32,
    val UInt32,
    partition_key UInt32 DEFAULT 1,
    mat UInt32 MATERIALIZED rand(),
    alias UInt32 ALIAS 2,
    PRIMARY KEY(pk)
)
ENGINE = MergeTree
ORDER BY (pk, sk);

SELECT count()
FROM partial_duplicates;

SELECT *
FROM partial_duplicates;