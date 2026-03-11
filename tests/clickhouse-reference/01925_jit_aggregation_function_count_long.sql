SELECT id, count(value), count(value_nullable) FROM test_table GROUP BY id ORDER BY id;
