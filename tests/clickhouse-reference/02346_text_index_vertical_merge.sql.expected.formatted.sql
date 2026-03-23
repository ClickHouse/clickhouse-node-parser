-- Tests vertical merges for columns with text index
SET enable_full_text_index = 1;

SET mutations_sync = 2;

SET use_skip_indexes_on_data_read = 1;

CREATE TABLE tab
(
    id UInt64,
    c1 String,
    c2 String
)
ENGINE = MergeTree
ORDER BY id
SETTINGS min_bytes_for_wide_part = 0, vertical_merge_algorithm_min_rows_to_activate = 1, vertical_merge_algorithm_min_columns_to_activate = 1;

INSERT INTO tab SELECT
    number,
    concat('c1', toString(number)),
    concat('c2', toString(number + 1))
FROM numbers(10000);

SELECT count()
FROM tab
WHERE hasAllTokens(c1, 'c11')
    AND hasAllTokens(c2, 'c21');