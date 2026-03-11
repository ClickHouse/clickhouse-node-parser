SELECT 1 FROM table1 T1 ALL INNER JOIN table2 T2 ON T1.table = T2.name LIMIT 1;
SELECT 1 FROM cluster('test_shard_localhost', system.columns) T1 ALL INNER JOIN cluster('test_shard_localhost', system.tables) T2 ON T1.table = T2.name LIMIT 1;
SELECT 1 FROM (SELECT * FROM table1) T1 ALL INNER JOIN (SELECT * FROM table2) T2 ON T1.table = T2.name LIMIT 1;
