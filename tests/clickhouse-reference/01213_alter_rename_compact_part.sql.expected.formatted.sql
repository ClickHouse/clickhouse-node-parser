CREATE TABLE table_with_compact_parts
(
    date Date,
    key UInt64,
    value1 String,
    value2 String,
    value3 String
)
ENGINE = MergeTree()
ORDER BY key
PARTITION BY date
SETTINGS index_granularity = 8, min_rows_for_wide_part = 10, min_bytes_for_wide_part = '10G';

SELECT value1
FROM table_with_compact_parts
WHERE key = 1;

SELECT renamed_value1
FROM table_with_compact_parts
WHERE key = 1;

SELECT *
FROM table_with_compact_parts
WHERE key = 1
FORMAT TSVWithNames;

SELECT
    renamed_value2,
    renamed_value3
FROM table_with_compact_parts
WHERE key = 7;

SELECT *
FROM table_with_compact_parts
WHERE key = 7
FORMAT TSVWithNames;