SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE tab_00481
(
    date Date,
    value UInt64,
    s String,
    m FixedString(16)
)
ENGINE = MergeTree(date, (date, value), 8);

SET preferred_max_column_in_block_size_bytes = 32;

SELECT
    blockSize(),
    *
FROM tab_00481
FORMAT Null;

SELECT 0;