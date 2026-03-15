SET enable_full_text_index = 1;
SET use_skip_indexes_on_data_read = 1;
-- Force-enable text index caches
SET use_text_index_header_cache = 1;
SET use_text_index_dictionary_cache = 1;
SET use_text_index_postings_cache = 1;
CREATE TABLE tab
(
    s String,
    INDEX idx(s) TYPE text(tokenizer = sparseGrams(3, 10))
)
ENGINE = MergeTree ORDER BY tuple();
SELECT count() FROM tab WHERE s LIKE '%888%' SETTINGS use_skip_indexes = 0;
SELECT count() FROM tab WHERE hasAnyTokens(s, '888');
SELECT
    ProfileEvents['TextIndexHeaderCacheMisses'] > 0,
    ProfileEvents['TextIndexDictionaryBlockCacheMisses'] > 0,
    ProfileEvents['TextIndexPostingsCacheMisses'] > 0
FROM system.query_log
WHERE current_database = currentDatabase() AND query LIKE '%SELECT count() FROM tab%' AND type = 'QueryFinish'
ORDER BY event_time_microseconds;
