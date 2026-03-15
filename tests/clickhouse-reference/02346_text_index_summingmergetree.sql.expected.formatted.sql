SET enable_full_text_index = 1;

CREATE TABLE tab
(
    id UInt32,
    key String,
    value UInt32,
    INDEX idx_key (key) TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = SummingMergeTree()
ORDER BY id;

SELECT '-- direct read disabled';

SET use_skip_indexes_on_data_read = 0;

SELECT sum(value)
FROM tab
WHERE hasToken(key, 'foo');

SELECT sum(value)
FROM tab
WHERE hasToken(key, 'bar');

SET use_skip_indexes_on_data_read = 1;

SELECT value
FROM tab
WHERE hasToken(key, 'foo');

SELECT value
FROM tab
WHERE hasToken(key, 'bar');