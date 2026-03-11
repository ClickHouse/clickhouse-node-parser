SELECT * FROM test_collate ORDER BY s;
SELECT * FROM test_collate ORDER BY s COLLATE 'ru';
SELECT * FROM test_collate ORDER BY x, s;
SELECT * FROM test_collate ORDER BY x, s COLLATE 'ru';
SELECT * FROM test_collate_null ORDER BY s;
SELECT * FROM test_collate_null ORDER BY s COLLATE 'ru';
SELECT * FROM test_collate_null ORDER BY x, s;
SELECT * FROM test_collate_null ORDER BY x, s COLLATE 'ru';
