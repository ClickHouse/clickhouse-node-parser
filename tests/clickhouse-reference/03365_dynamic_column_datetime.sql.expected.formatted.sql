SET enable_dynamic_type = 1;

SYSTEM drop  table if exists test;

CREATE TABLE test
(
    d Dynamic
)
ENGINE = MergeTree
ORDER BY tuple()
SETTINGS min_bytes_for_wide_part = 1, min_rows_for_wide_part = 1;

INSERT INTO test SELECT toDateTime64(materialize('2024-01-01'), 3, 'Asia/Istanbul');

SYSTEM drop  table test;