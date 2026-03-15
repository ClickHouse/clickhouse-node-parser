SET enable_full_text_index = 1;

SET use_skip_indexes_on_data_read = 1;

SET use_query_condition_cache = 1;

CREATE TABLE tab
(
    id UInt32,
    message String,
    INDEX idx message TYPE text(tokenizer = splitByNonAlpha)
)
ENGINE = MergeTree
ORDER BY (id);

SELECT groupArray(id)
FROM tab
WHERE hasAnyTokens(message, ['abc']);

SELECT groupArray(id)
FROM tab
WHERE hasAnyTokens(message, ['ab']);

SELECT groupArray(id)
FROM tab
WHERE hasAnyTokens(message, ['foo']);