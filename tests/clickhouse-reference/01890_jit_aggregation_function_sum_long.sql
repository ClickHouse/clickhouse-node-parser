SELECT id, sum(value1), sum(value2), sum(value3), sum(value4) FROM test_table_unsigned_values GROUP BY id ORDER BY id;
SELECT id, sum(value1), sum(value2), sum(value3), sum(value4)FROM test_table_signed_values GROUP BY id ORDER BY id;
SELECT id, sum(value1), sum(value2) FROM test_table_float_values GROUP BY id ORDER BY id;
SELECT id, sum(value1), sum(value2), sum(value3), sum(value4) FROM test_table_nullable_unsigned_values GROUP BY id ORDER BY id;
SELECT id, sum(value1), sum(value2), sum(value3), sum(value4) FROM test_table_nullable_signed_values GROUP BY id ORDER BY id;
SELECT id, sum(value1), sum(value2) FROM test_table_nullable_float_values GROUP BY id ORDER BY id;
SELECT id, sum(value1), sum(value2), sum(value3) FROM test_table_null_specifics GROUP BY id ORDER BY id;
