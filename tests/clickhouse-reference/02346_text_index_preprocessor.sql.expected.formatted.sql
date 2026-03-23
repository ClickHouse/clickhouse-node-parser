-- Tags: no-parallel
-- Tag no-parallel: Messes with internal cache and global udf factory
SET enable_full_text_index = 1;

SET use_skip_indexes_on_data_read = 1;

-- Tests the preprocessor argument for tokenizers in the text index definitions
SYSTEM DROP  TABLE IF EXISTS tab;

CREATE TABLE tab
(
    key UInt64,
    val String,
    INDEX idx val TYPE text(tokenizer = 'splitByNonAlpha', preprocessor = lower(val))
)
ENGINE = MergeTree
ORDER BY key;

INSERT INTO tab;

SELECT count()
FROM tab
WHERE hasToken(val, 'foo');

SELECT count()
FROM tab
WHERE hasToken(val, 'BAR');

SELECT count()
FROM tab
WHERE hasToken(val, 'Baz');

SELECT count()
FROM tab
WHERE hasToken(val, 'def');

SELECT count()
FROM tab
WHERE hasAllTokens(val, 'foo');

SELECT count()
FROM tab
WHERE hasAllTokens(val, 'BAR');

SELECT count()
FROM tab
WHERE hasAllTokens(val, 'Baz');

SELECT count()
FROM tab
WHERE hasAnyTokens(val, 'foo');

SELECT count()
FROM tab
WHERE hasAnyTokens(val, 'BAR');

SELECT count()
FROM tab
WHERE hasAnyTokens(val, 'Baz');

SYSTEM DROP  TABLE tab;

CREATE TABLE tab
(
    key UInt64,
    val LowCardinality(String),
    INDEX idx val TYPE text(tokenizer = 'splitByNonAlpha', preprocessor = lower(val))
)
ENGINE = MergeTree
ORDER BY key;

CREATE TABLE tab
(
    key UInt64,
    val FixedString(3),
    INDEX idx val TYPE text(tokenizer = 'splitByNonAlpha', preprocessor = lower(val))
)
ENGINE = MergeTree
ORDER BY key;

CREATE TABLE tab
(
    key UInt64,
    val Array(String),
    INDEX idx val TYPE text(tokenizer = 'splitByNonAlpha', preprocessor = lower(val))
)
ENGINE = MergeTree
ORDER BY tuple();

INSERT INTO tab;

CREATE TABLE tab
(
    key UInt64,
    val Array(FixedString(3)),
    INDEX idx val TYPE text(tokenizer = 'splitByNonAlpha', preprocessor = lower(val))
)
ENGINE = MergeTree
ORDER BY tuple();

CREATE TABLE tab
(
    key UInt64,
    val String,
    INDEX idx val TYPE text(tokenizer = 'splitByNonAlpha', preprocessor = concat(val, val))
)
ENGINE = MergeTree
ORDER BY tuple();

SYSTEM DROP  FUNCTION IF EXISTS udf_preprocessor;

CREATE FUNCTION udf_preprocessor AS s -> concat(val, lower(val));

CREATE TABLE tab
(
    key UInt64,
    val String,
    INDEX idx val TYPE text(tokenizer = 'splitByNonAlpha', preprocessor = udf_preprocessor(val))
)
ENGINE = MergeTree
ORDER BY tuple();

SYSTEM DROP  FUNCTION udf_preprocessor;

-- The preprocessor argument must reference the index column
CREATE TABLE tab
(
    key UInt64,
    val String,
    other_str String,
    INDEX idx val TYPE text(tokenizer = 'splitByNonAlpha', preprocessor = lower(other_str))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }

CREATE TABLE tab
(
    key UInt64,
    val String,
    other_str String,
    INDEX idx val TYPE text(tokenizer = 'splitByNonAlpha', preprocessor = concat(val, other_str))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }

CREATE TABLE tab
(
    key UInt64,
    val String,
    INDEX idx upper(val) TYPE text(tokenizer = 'splitByNonAlpha', preprocessor = lower(val))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }

SELECT '-- Not even the same expression';

CREATE TABLE tab
(
    key UInt64,
    val String,
    INDEX idx lower(val) TYPE text(tokenizer = 'splitByNonAlpha', preprocessor = lower(val))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }

CREATE TABLE tab
(
    key UInt64,
    val String,
    INDEX idx upper(val) TYPE text(tokenizer = 'splitByNonAlpha', preprocessor = lower(upper(val)))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }

CREATE TABLE tab
(
    key UInt64,
    val String,
    INDEX idx val TYPE text(tokenizer = 'splitByNonAlpha', preprocessor = BAD)
)
ENGINE = MergeTree
ORDER BY key; -- { serverError BAD_ARGUMENTS }

CREATE TABLE tab
(
    key UInt64,
    val String,
    INDEX idx val TYPE text(tokenizer = 'splitByNonAlpha', preprocessor = nonExistingFunction(val))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError UNKNOWN_FUNCTION }

CREATE TABLE tab
(
    key UInt64,
    val String,
    INDEX idx val TYPE text(tokenizer = 'splitByNonAlpha', preprocessor = length(val))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_QUERY }

CREATE TABLE tab
(
    key UInt64,
    val String,
    INDEX idx val TYPE text(tokenizer = 'splitByNonAlpha', preprocessor = hostname())
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_QUERY }

CREATE TABLE tab
(
    key UInt64,
    val String,
    INDEX idx val TYPE text(tokenizer = 'splitByNonAlpha', preprocessor = concat(val, toString(rand())))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError INCORRECT_QUERY }