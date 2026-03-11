-- Pick projection based on both filters
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM t_proj WHERE region = 'eu' AND user_id = 101)
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
SELECT * FROM t_proj WHERE region = 'eu' AND user_id = 101 ORDER BY ALL;
-- Region only
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM t_proj WHERE region = 'zzz')
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
SELECT * FROM t_proj WHERE region = 'zzz' ORDER BY ALL;
-- User only
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM t_proj WHERE user_id = 106)
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
SELECT * FROM t_proj WHERE user_id = 106 ORDER BY ALL;
-- OR → projection index disabled
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM t_proj WHERE region = 'asia' OR user_id = 101)
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
SELECT * FROM t_proj WHERE region = 'asia' OR user_id = 101 ORDER BY ALL;
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM t_gran WHERE region = 'top')
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
SELECT * FROM t_gran WHERE region = 'top' ORDER BY ALL;
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM t_gran WHERE region = 'mid')
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
SELECT * FROM t_gran WHERE region = 'mid' ORDER BY ALL;
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM t_gran WHERE region = 'bot')
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
SELECT * FROM t_gran WHERE region = 'bot' ORDER BY ALL;
-- Should use projection for rows 4–6 only
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM t_partial WHERE region = 'ru')
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
SELECT * FROM t_partial WHERE region = 'ru' ORDER BY ALL;
-- CN appears in both partial and full materialized parts
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM t_partial WHERE region = 'cn')
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
SELECT * FROM t_partial WHERE region = 'cn' ORDER BY ALL;
-- check projection part exists on both replicas
SELECT table, name
FROM system.projection_parts
WHERE database = currentDatabase() AND table IN ('t_repl', 't_repl2')
ORDER BY ALL;
