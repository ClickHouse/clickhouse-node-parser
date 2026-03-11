SELECT *
FROM s3('http://localhost:11111/test/MyPrefix/BU%20-%20UNIT%20-%201/*.parquet');

SELECT *
FROM s3('http://localhost:11111/test/MyPrefix/*.parquet?some_token=ABCD', NOSIGN);