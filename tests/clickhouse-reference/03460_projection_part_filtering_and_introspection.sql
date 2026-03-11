-- region projection is enough effective for filtering
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM test_simple_projection WHERE region = 'europe' AND user_id = 101)
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
-- Only user_id projection is effective for filtering
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM test_simple_projection WHERE region != 'unknown' AND user_id = 106)
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
-- Both region and user_id projections are effective for filtering
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM test_simple_projection WHERE region = 'us_west' AND user_id = 107)
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
-- Neither projection is effective for filtering
SELECT trimLeft(explain)
FROM (EXPLAIN projections = 1 SELECT * FROM test_simple_projection WHERE region != 'unknown' AND user_id != 999)
WHERE explain LIKE '%ReadFromMergeTree%' OR match(explain, '^\s+[A-Z][a-z]+(\s+[A-Z][a-z]+)*:');
