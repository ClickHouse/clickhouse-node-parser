SET enable_full_text_index = 1;

CREATE TABLE tab
(
    id UInt32,
    key String,
    value String,
    INDEX idx_key (key) TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = ReplacingMergeTree()
ORDER BY id;

SELECT '-- direct read disabled';

SET use_skip_indexes_on_data_read = 0;

SELECT value
FROM tab
WHERE hasToken(key, 'foo')
ORDER BY value ASC;

SELECT value
FROM tab FINAL
WHERE hasToken(key, 'foo')
ORDER BY value ASC;

SET use_skip_indexes_on_data_read = 1;

SELECT value
FROM tab
WHERE hasToken(key, 'bar')
ORDER BY value ASC;

SELECT value
FROM tab FINAL
WHERE hasToken(key, 'bar')
ORDER BY value ASC;

SELECT value
FROM tab
WHERE hasToken(key, 'baz')
ORDER BY value ASC;

SELECT value
FROM tab FINAL
WHERE hasToken(key, 'baz')
ORDER BY value ASC;