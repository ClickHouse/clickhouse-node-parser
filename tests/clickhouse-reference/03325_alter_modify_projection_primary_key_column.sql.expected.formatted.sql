SYSTEM drop  table if exists test;

CREATE TABLE test
(
    x UInt16,
    y UInt16,
    PROJECTION proj (    SELECT *
    ORDER BY x ASC)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_rows_for_wide_part = 1, min_bytes_for_wide_part = 1;

INSERT INTO test SELECT
    number,
    number
FROM numbers(100000);

SELECT *
FROM test
WHERE x = 10;

SYSTEM drop  table test;

CREATE TABLE test
(
    x UInt16,
    y UInt16,
    PROJECTION proj (    SELECT *
    ORDER BY x ASC)
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_rows_for_wide_part = 1000000000, min_bytes_for_wide_part = 10000000000;