SELECT count()
FROM test_distributed
WHERE name GLOBAL IN (
        SELECT name
        FROM test_distributed
    );

SELECT count()
FROM merge(currentDatabase(), '^test_distributed$')
WHERE name GLOBAL IN (
        SELECT name
        FROM test_distributed
    );

SELECT count()
FROM merge(currentDatabase(), '^test_distributed$')
PREWHERE name GLOBAL IN (
        SELECT name
        FROM test_distributed
    );

SELECT count()
FROM merge(currentDatabase(), '^test_log$')
PREWHERE a = 3;