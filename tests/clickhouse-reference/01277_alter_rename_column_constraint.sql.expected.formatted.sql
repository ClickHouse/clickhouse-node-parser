CREATE TABLE table_for_rename
(
    date Date,
    key UInt64,
    value1 String,
    value2 String,
    value3 String,
    CONSTRAINT cs_value1 CHECK toInt64(value1) < toInt64(value2),
    CONSTRAINT cs_value2 CHECK toInt64(value2) < toInt64(value3)
)
ENGINE = MergeTree()
ORDER BY key
PARTITION BY date;

SELECT *
FROM table_for_rename
ORDER BY key ASC;

SELECT '-- insert after rename --';