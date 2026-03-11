SELECT * FROM test_collate ORDER BY s, x;
SELECT * FROM test_collate ORDER BY s COLLATE 'ru', x;
SELECT * FROM test_collate ORDER BY x, s;
SELECT * FROM test_collate ORDER BY x, s COLLATE 'ru';
