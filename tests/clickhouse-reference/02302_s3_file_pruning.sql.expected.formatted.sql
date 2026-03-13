SELECT *
FROM test_02302; -- { serverError NOT_IMPLEMENTED }

-- Test s3 table function with glob
SELECT *
FROM s3(s3_conn, filename = 'test_02302_*', `format` = Parquet)
WHERE like(_file, '%5');

SELECT *
FROM test_02302
WHERE like(_file, '%1');

SELECT
    _file,
    *
FROM test_02302
WHERE like(_file, '%1');

SELECT *
FROM test_02302
WHERE ((like(_file, '%.1')
    OR like(_file, '%.2')))
    AND a > 1;

SELECT
    'a1' AS _file,
    *
FROM test_02302
WHERE like(_file, '%1')
ORDER BY a ASC;