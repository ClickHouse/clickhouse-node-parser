DROP TABLE IF EXISTS ttl_test_02129;

CREATE TABLE ttl_test_02129
(
    a Int64,
    b String,
    d Date
)
ENGINE = MergeTree
ORDER BY a
PARTITION BY d
SETTINGS min_bytes_for_wide_part = 0, min_rows_for_wide_part = 0, materialize_ttl_recalculate_only = 0;

INSERT INTO ttl_test_02129 SELECT
    number,
    '',
    '2021-01-01'
FROM numbers(10);

INSERT INTO ttl_test_02129 SELECT
    number,
    '',
    '2021-01-01',
    1
FROM numbers(10);

SELECT *
FROM ttl_test_02129
ORDER BY
    a ASC,
    b ASC,
    d ASC,
    c ASC;

DROP TABLE ttl_test_02129;

CREATE TABLE ttl_test_02129
(
    a Int64,
    b String,
    d Date
)
ENGINE = MergeTree
ORDER BY a
PARTITION BY d
SETTINGS min_bytes_for_wide_part = 0, min_rows_for_wide_part = 0, materialize_ttl_recalculate_only = 1;