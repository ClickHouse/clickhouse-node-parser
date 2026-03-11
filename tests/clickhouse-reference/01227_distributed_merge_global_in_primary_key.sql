SELECT '------------------- Distributed ------------------';
SELECT count()
FROM test_distributed
WHERE name GLOBAL IN (SELECT name FROM test_distributed);
SELECT count()
FROM merge(currentDatabase(), 'test_distributed')
WHERE name GLOBAL IN (SELECT name FROM test_distributed);
SELECT count()
FROM merge(currentDatabase(), 'test_local')
WHERE name GLOBAL IN (SELECT name FROM test_distributed);
SELECT count()
FROM merge(currentDatabase(), 'test_local')
WHERE name GLOBAL IN (SELECT name FROM merge(currentDatabase(), 'test_local'));
SELECT count()
FROM merge(currentDatabase(), 'test_local')
WHERE name GLOBAL IN (SELECT name FROM remote('127.0.0.{1,2}', currentDatabase(), test_merge));
SELECT count()
FROM remote('127.0.0.{1,2}', currentDatabase(), test_merge)
WHERE name GLOBAL IN (SELECT name FROM test_distributed);
SELECT count()
FROM test_merge_distributed
WHERE name GLOBAL IN (SELECT name FROM test_merge_distributed);
SELECT count()
FROM remote('127.0.0.{1,2}', currentDatabase(), test_merge)
WHERE name GLOBAL IN (SELECT name FROM remote('127.0.0.{1,2}', currentDatabase(), test_merge));
SELECT count()
FROM test_distributed_merge
WHERE name GLOBAL IN (SELECT name FROM remote('127.0.0.{1,2}', currentDatabase(), test_merge));
SELECT count()
FROM test_distributed_merge
WHERE name GLOBAL IN (SELECT name FROM remote('127.0.0.{1,2}', currentDatabase(), test_distributed_merge));
SELECT count()
FROM test_distributed_merge
WHERE name GLOBAL IN (SELECT name FROM test_distributed_merge);
SELECT count()
FROM remote('127.0.0.{1,2}', currentDatabase(), test_distributed_merge)
WHERE name GLOBAL IN (SELECT name FROM remote('127.0.0.{1,2}', currentDatabase(), test_merge));
