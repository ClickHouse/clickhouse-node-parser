SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE table_00483
(
    date Date,
    `Struct.Key1` Array(UInt64),
    `Struct.Key2` Array(UInt64),
    padding FixedString(16)
)
ENGINE = MergeTree(date, (date), 16);

SET preferred_max_column_in_block_size_bytes = 96;

SELECT
    blockSize(),
    *
FROM table_00483
PREWHERE `Struct.Key1`[1] = 19
    AND `Struct.Key2`[1] >= 0
FORMAT Null;

CREATE TABLE table_00483
(
    date Date,
    `Struct.Key1` Array(UInt64),
    `Struct.Key2` Array(UInt64),
    padding FixedString(16),
    x UInt64
)
ENGINE = MergeTree(date, (date), 8);

SET preferred_max_column_in_block_size_bytes = 112;

SELECT
    blockSize(),
    *
FROM table_00483
PREWHERE x = 7
FORMAT Null;