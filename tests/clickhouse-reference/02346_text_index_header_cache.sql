SELECT '--- cache miss on the first run.';
SELECT count() FROM tab WHERE hasAnyTokens(message, 'text_000');
SELECT * FROM text_index_cache_stats(filter = 'text_000');
SELECT count() FROM tab WHERE hasAnyTokens(message, 'text_511');
SELECT * FROM text_index_cache_stats(filter = 'text_511');
SELECT count() FROM tab WHERE hasAnyTokens(message, 'text_001');
SELECT * FROM text_index_cache_stats(filter = 'text_001');
SELECT count() FROM tab WHERE hasAnyTokens(message, 'text_510');
SELECT * FROM text_index_cache_stats(filter = 'text_510');
