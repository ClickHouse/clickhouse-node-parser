SELECT name, column, type, statistics, estimates.cardinality, estimates.min, estimates.max
FROM system.parts_columns
WHERE database = currentDatabase() AND table = 'test_table' AND active
ORDER BY name, column;
SELECT count() FROM test_table WHERE NOT ignore(*);
SELECT uniqExact(v1), uniqExact(v2), uniqExact(v3) FROM test_table WHERE NOT ignore(*);
