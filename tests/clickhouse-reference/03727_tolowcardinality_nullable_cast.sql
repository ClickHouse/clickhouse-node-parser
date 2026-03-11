-- Query that triggers KeyCondition optimization with toLowCardinality
SELECT * FROM test_tolowcardinality_nullable WHERE toLowCardinality(str) = 'a' ORDER BY id;
SELECT * FROM test_tolowcardinality_nullable ORDER BY id;
-- Test 2: Direct toLowCardinality on Nullable column
SELECT toLowCardinality(materialize(toNullable('test'))) AS result;
SELECT toLowCardinality(materialize(CAST(NULL AS Nullable(String)))) AS result;
SELECT id FROM test_tolowcardinality_where WHERE toLowCardinality(val) = 'x' ORDER BY id;
