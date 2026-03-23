SET enable_full_text_index = 1;
DROP TABLE IF EXISTS tab;
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text() -- { serverError BAD_ARGUMENTS }
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY tuple();
DROP TABLE tab;
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'ngrams')
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'sparseGrams')
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByString')
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'array')
)
ENGINE = MergeTree
ORDER BY tuple();
SELECT '-- tokenizer must be splitByNonAlpha, ngrams, sparseGrams, splitByString or array.';
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'invalid')
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = splitByNonAlpha)
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = splitByNonAlpha())
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = splitByString)
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = splitByString())
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = ngrams)
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = ngrams())
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = sparseGrams)
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = sparseGrams())
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = array)
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = array())
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = ngrams(4))
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = ngrams(0))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = ngrams(-1))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = ngrams(18_446_744_073_709_551_616))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = sparseGrams(3))
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = sparseGrams(3, 4))
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = sparseGrams(3, 4, 4))
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = sparseGrams(2))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = sparseGrams(101))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = sparseGrams(50, 49))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = sparseGrams(50, 51, 49))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = sparseGrams(50, 51, 52))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = splitByString(['\n', '\\']))
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = splitByString('\n'))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = splitByString([1, 2]))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', posting_list_block_size = 1)
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', posting_list_block_size = 0)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', posting_list_block_size = 1024.0)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', dictionary_block_size = 1)
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', dictionary_block_size = 0)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', dictionary_block_size = 1024.0)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', dictionary_block_size = '1024')
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', dictionary_block_size = -1)
)
ENGINE = MergeTree
ORDER BY tuple();  -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', dictionary_block_frontcoding_compression = 1024.0)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', dictionary_block_frontcoding_compression = '1024')
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', dictionary_block_frontcoding_compression = 1)
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', dictionary_block_frontcoding_compression = 2)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', dictionary_block_frontcoding_compression = -1)
)
ENGINE = MergeTree
ORDER BY tuple();  -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', dictionary_block_frontcoding_compression = 0)
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', posting_list_codec = 1024)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', posting_list_codec = 1.0)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', posting_list_codec = 'none')
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', posting_list_codec = 'bitpacking')
)
ENGINE = MergeTree
ORDER BY tuple();
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', posting_list_codec = 'invalid_codec')
)
ENGINE = MergeTree
ORDER BY tuple(); -- TODO: this should throw an exception but it doesn't
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 1)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(ngrams)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = ngrams('4'))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', tokenizer = ngrams(3))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = ngrams(3), tokenizer = ngrams(4))
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', dictionary_block_frontcoding_compression = 1, dictionary_block_frontcoding_compression = 1)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha', non_existing_argument = 1024)
)
ENGINE = MergeTree
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    key UInt64,
    str1 String,
    str2 String,
    INDEX idx (str1, str2) TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree ORDER BY key; -- { serverError INCORRECT_NUMBER_OF_COLUMNS }
CREATE TABLE tab(
    s String,
    INDEX idx_1(s) TYPE text(tokenizer = 'splitByNonAlpha'),
    INDEX idx_2(s) TYPE text(tokenizer = ngrams(3))
)
Engine = MergeTree()
ORDER BY tuple(); -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    str String,
    INDEX idx_1 (str) TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree ORDER BY tuple();
CREATE TABLE tab
(
    key UInt64,
    u64 UInt64,
    INDEX idx u64 TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY key; -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    key UInt64,
    f32 Float32,
    INDEX idx f32 TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY key; -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    key UInt64,
    arr Array(UInt64),
    INDEX idx arr TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY key; -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    key UInt64,
    arr Array(Float32),
    INDEX idx arr TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY key; -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    key UInt64,
    map Map(UInt64, String),
    INDEX idx mapKeys(map) TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY key; -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    key UInt64,
    map Map(Float32, String),
    INDEX idx mapKeys(map) TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY key; -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    key UInt64,
    map Map(String, UInt64),
    INDEX idx mapValues(map) TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY key; -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    key UInt64,
    map Map(String, Float32),
    INDEX idx mapValues(map) TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY key; -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    key UInt64,
    n_str Nullable(String),
    INDEX idx n_str TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY key; -- { serverError BAD_ARGUMENTS }
SET allow_suspicious_low_cardinality_types = 1;
CREATE TABLE tab
(
    key UInt64,
    lc LowCardinality(UInt64),
    INDEX idx lc TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY key; -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    key UInt64,
    lc LowCardinality(Float32),
    INDEX idx lc TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY key; -- { serverError BAD_ARGUMENTS }
CREATE TABLE tab
(
    key UInt64,
    str String,
    str_fixed FixedString(3),
    INDEX idx str TYPE text(tokenizer = 'splitByNonAlpha'),
    INDEX idx_fixed str_fixed TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY key;
INSERT INTO tab VALUES (1, 'foo', toFixedString('foo', 3)), (2, 'bar', toFixedString('bar', 3)), (3, 'baz', toFixedString('baz', 3));
SELECT count() FROM tab WHERE str = 'foo' SETTINGS force_data_skipping_indices='idx';
SELECT count() FROM tab WHERE str_fixed = toFixedString('foo', 3) SETTINGS force_data_skipping_indices='idx_fixed';
CREATE TABLE tab
(
    key UInt64,
    lc LowCardinality(String),
    lc_fixed LowCardinality(FixedString(3)),
    INDEX idx lc TYPE text(tokenizer = 'splitByNonAlpha'),
    INDEX idx_fixed lc_fixed TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY key;
SELECT count() FROM tab WHERE lc = 'foo' SETTINGS force_data_skipping_indices='idx';
SELECT count() FROM tab WHERE lc_fixed = toFixedString('foo', 3) SETTINGS force_data_skipping_indices='idx_fixed';
CREATE TABLE tab
(
    key UInt64,
    arr Array(String),
    arr_fixed Array(FixedString(3)),
    INDEX idx arr TYPE text(tokenizer = 'splitByNonAlpha'),
    INDEX idx_fixed arr_fixed TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY key;
INSERT INTO tab VALUES (1, ['foo'], [toFixedString('foo', 3)]), (2, ['bar'], [toFixedString('bar', 3)]), (3, ['baz'], [toFixedString('baz', 3)]);
SELECT count() FROM tab WHERE has(arr, 'foo') SETTINGS force_data_skipping_indices='idx';
SELECT count() FROM tab WHERE has(arr_fixed, toFixedString('foo', 3)) SETTINGS force_data_skipping_indices='idx_fixed';
CREATE TABLE tab
(
    key UInt64,
    map Map(String, String),
    map_fixed Map(FixedString(3), FixedString(3)),
    INDEX idx_keys mapKeys(map) TYPE text(tokenizer = 'splitByNonAlpha'),
    INDEX idx_keys_fixed mapKeys(map_fixed) TYPE text(tokenizer = 'splitByNonAlpha'),
    INDEX idx_values mapValues(map) TYPE text(tokenizer = 'splitByNonAlpha'),
    INDEX idx_values_fixed mapValues(map_fixed) TYPE text(tokenizer = 'splitByNonAlpha')
)
ENGINE = MergeTree
ORDER BY key;
INSERT INTO tab VALUES (1, {'foo' : 'foo'}, {'foo' : 'foo'}), (2, {'bar' : 'bar'}, {'bar' : 'bar'});
SELECT count() FROM tab WHERE mapContainsKey(map, 'foo') SETTINGS force_data_skipping_indices='idx_keys';
SELECT count() FROM tab WHERE mapContainsKey(map_fixed, toFixedString('foo', 3)) SETTINGS force_data_skipping_indices='idx_keys_fixed';
SELECT count() FROM tab WHERE has(mapValues(map), 'foo') SETTINGS force_data_skipping_indices='idx_values';
SELECT count() FROM tab WHERE has(mapValues(map_fixed), toFixedString('foo', 3)) SETTINGS force_data_skipping_indices='idx_values_fixed';
