SET allow_deprecated_syntax_for_merge_tree = 1;

CREATE TABLE one_table
(
    date Date,
    one UInt64
)
ENGINE = MergeTree(date, (date, one), 8192);

SET preferred_block_size_bytes = 8192;

SELECT isNull(one)
FROM one_table
WHERE isNull(one);