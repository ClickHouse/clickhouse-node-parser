SELECT * FROM s3(s3_conn, filename = currentDatabase() || '/1/test.parquet');
SELECT * FROM s3(s3_conn, filename = currentDatabase() || '/2/test.parquet');
