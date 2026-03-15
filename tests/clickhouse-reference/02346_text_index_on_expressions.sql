SET enable_full_text_index = 1;
SET use_skip_indexes_on_data_read = 1;
CREATE TABLE tab
(
    id UInt64,
    s1 String,
)
ENGINE = MergeTree
ORDER BY id;
SELECT id FROM tab WHERE hasAllTokens(lower(s1), 'a') ORDER BY id;
SELECT id FROM tab WHERE hasAllTokens(lower(s1), 'b') ORDER BY id;
CREATE TABLE tab
(
    id UInt64,
    s1 String,
    s2 String
)
ENGINE = MergeTree
ORDER BY id;
SELECT id FROM tab WHERE hasAllTokens(concat(s1, ' ', s2), 'A');
SELECT id FROM tab WHERE hasAllTokens(concat(s1, ' ', s2), 'D');
