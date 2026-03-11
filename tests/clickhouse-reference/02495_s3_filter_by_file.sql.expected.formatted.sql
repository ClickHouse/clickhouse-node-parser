SELECT
    *,
    _file
FROM s3(s3_conn, filename = 'test_02495_1', `format` = Parquet)
WHERE _file = 'test_02495_1';