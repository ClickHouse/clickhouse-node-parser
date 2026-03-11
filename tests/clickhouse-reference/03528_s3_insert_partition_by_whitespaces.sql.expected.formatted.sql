SELECT *
FROM s3(s3_conn, filename = concat(currentDatabase(), '/1/test.parquet'));

SELECT *
FROM s3(s3_conn, filename = concat(currentDatabase(), '/2/test.parquet'));