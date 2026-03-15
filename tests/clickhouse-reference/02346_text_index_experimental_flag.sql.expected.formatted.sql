-- Test CREATE TABLE
SET enable_full_text_index = 0;

CREATE TABLE tab1
(
    id UInt32,
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError SUPPORT_IS_DISABLED }

SET enable_full_text_index = 1;

CREATE TABLE tab
(
    id UInt32,
    str String
)
ENGINE = MergeTree
ORDER BY tuple();