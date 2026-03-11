SELECT '--- cache miss on the first token.';

SELECT count()
FROM tab
WHERE hasAnyTokens(message, 'text_pl_1');

SELECT *
FROM text_index_cache_stats(filter = 'text_pl_1');

SELECT count()
FROM tab
WHERE hasAnyTokens(message, 'text_pl_2');

SELECT *
FROM text_index_cache_stats(filter = 'text_pl_2');