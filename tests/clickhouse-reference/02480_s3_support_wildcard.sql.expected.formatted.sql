SELECT
    a,
    b
FROM s3(s3_conn, filename = 'test_02480_support_wildcard_*', `format` = Parquet)
ORDER BY a ASC;

SELECT
    a,
    b
FROM s3(s3_conn, filename = 'test_02480_support_wildcard_?', `format` = Parquet)
ORDER BY a ASC;

SELECT
    a,
    b
FROM s3(s3_conn, filename = 'test_02480_support_wildcard_??', `format` = Parquet)
ORDER BY a ASC;

SELECT
    a,
    b
FROM s3(s3_conn, filename = 'test_02480_support_wildcard_?*?', `format` = Parquet)
ORDER BY a ASC;

SELECT
    a,
    b
FROM s3(s3_conn, filename = 'test_02480_support_wildcard_{1,333}', `format` = Parquet)
ORDER BY a ASC;

SELECT
    a,
    b
FROM s3(s3_conn, filename = 'test_02480_support_wildcard_{1..333}', `format` = Parquet)
ORDER BY a ASC;

SELECT
    a,
    b
FROM s3(s3_conn, filename = '*/test_02480_support_wildcard_*', `format` = Parquet)
ORDER BY a ASC;

SELECT
    a,
    b
FROM s3(s3_conn, filename = '*/test_02480_support_wildcard_?', `format` = Parquet)
ORDER BY a ASC;

SELECT
    a,
    b
FROM s3(s3_conn, filename = 'prefix/test_02480_support_wildcard_??', `format` = Parquet)
ORDER BY a ASC;

SELECT
    a,
    b
FROM s3(s3_conn, filename = 'prefi?/test_02480_support_wildcard_*', `format` = Parquet)
ORDER BY a ASC;

SELECT
    a,
    b
FROM s3(s3_conn, filename = 'p?*/test_02480_support_wildcard_{56..666}', `format` = Parquet)
ORDER BY a ASC;