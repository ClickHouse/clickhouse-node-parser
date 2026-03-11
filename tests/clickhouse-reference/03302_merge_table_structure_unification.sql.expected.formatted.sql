SELECT *
FROM test_merge
ORDER BY a ASC;

SELECT '--- table function';

SELECT *
FROM merge('^test_')
ORDER BY a ASC;