SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM test_simple_projection WHERE region = 'europe' AND user_id = 101)
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
SELECT * FROM test_simple_projection WHERE region = 'europe' AND user_id = 101 ORDER BY ALL;
-- region_proj is enough to filter part
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM test_simple_projection WHERE region = 'zzz' AND user_id = 101)
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
SELECT * FROM test_simple_projection WHERE region = 'zzz' AND user_id = 101 ORDER BY ALL;
-- narrowing filter via user_id_proj
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM test_simple_projection WHERE region = 'us_west' AND user_id = 106)
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
SELECT * FROM test_simple_projection WHERE region = 'us_west' AND user_id = 106 ORDER BY ALL;
-- it's not possible to use different projection indexes with or filter
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM test_simple_projection WHERE region = 'asia' OR user_id = 101)
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
SELECT * FROM test_simple_projection WHERE region = 'asia' OR user_id = 101 ORDER BY ALL;
-- Fuzzer
SELECT *, _part_offset = (isNullable(1) = toUInt128(6)), * FROM test_simple_projection PREWHERE (101 = user_id) = ignore(255, isZeroOrNull(assumeNotNull(0))) WHERE (106 = user_id) AND (region = 'us_west');
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM test_projection_granule_edge_cases WHERE region = 'top_region')
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
SELECT * FROM test_projection_granule_edge_cases WHERE region = 'top_region' ORDER BY ALL;
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM test_projection_granule_edge_cases WHERE region = 'mid_region')
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
SELECT * FROM test_projection_granule_edge_cases WHERE region = 'mid_region' ORDER BY ALL;
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM test_projection_granule_edge_cases WHERE region = 'bol_region')
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
SELECT * FROM test_projection_granule_edge_cases WHERE region = 'bol_region' ORDER BY ALL;
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM test_partial_projection WHERE region = 'ru')
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
SELECT * FROM test_partial_projection WHERE region = 'ru' ORDER BY ALL;
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM test_partial_projection WHERE region = 'cn')
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
SELECT * FROM test_partial_projection WHERE region = 'cn' ORDER BY ALL;
