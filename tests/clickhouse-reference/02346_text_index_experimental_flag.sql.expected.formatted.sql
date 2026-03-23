-- Tests that CREATE TABLE and ADD INDEX respect settings 'enable_full_text_index'
SYSTEM DROP  TABLE IF EXISTS tab;

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

SYSTEM DROP  TABLE tab1;

CREATE TABLE tab
(
    id UInt32,
    str String
)
ENGINE = MergeTree
ORDER BY tuple();

SYSTEM DROP  TABLE tab;