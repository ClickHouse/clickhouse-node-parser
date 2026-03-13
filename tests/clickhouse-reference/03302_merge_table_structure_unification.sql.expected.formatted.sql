-- TODO: defaults are not calculated
SELECT *
FROM test_merge
ORDER BY a ASC;

SELECT '--- table function';

-- Note that this will also pick up the test_merge table, duplicating the results
SELECT *
FROM merge('^test_')
ORDER BY a ASC;