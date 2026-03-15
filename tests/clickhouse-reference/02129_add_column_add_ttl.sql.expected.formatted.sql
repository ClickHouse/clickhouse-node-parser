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

SELECT *
FROM ttl_test_02129
ORDER BY
    a ASC,
    b ASC,
    d ASC,
    c ASC;

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