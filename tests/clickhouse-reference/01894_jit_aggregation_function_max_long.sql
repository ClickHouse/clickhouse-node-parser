SELECT id, max(value1), max(value2), max(value3), max(value4) FROM test_table_unsigned_values GROUP BY id ORDER BY id;
SELECT id, max(value1), max(value2), max(value3), max(value4) FROM test_table_signed_values GROUP BY id ORDER BY id;
SELECT id, min(value1), min(value2) FROM test_table_float_values GROUP BY id ORDER BY id;
SELECT id, max(value1), max(value2), max(value3), max(value4) FROM test_table_nullable_unsigned_values GROUP BY id ORDER BY id;
SELECT id, max(value1), max(value2), max(value3), max(value4) FROM test_table_nullable_signed_values GROUP BY id ORDER BY id;
SELECT id, max(value1), max(value2) FROM test_table_nullable_float_values GROUP BY id ORDER BY id;
SELECT id, max(value1), max(value2), max(value3) FROM test_table_null_specifics GROUP BY id ORDER BY id;
