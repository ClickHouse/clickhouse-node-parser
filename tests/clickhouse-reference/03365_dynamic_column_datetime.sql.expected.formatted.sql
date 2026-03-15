SET enable_dynamic_type = 1;

CREATE TABLE test
(
    d Dynamic
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 1, min_rows_for_wide_part = 1;