-- Tags: no-fasttest
INSERT INTO FUNCTION s3('http://localhost:11111/test/data_*_{_partition_id}.csv') PARTITION BY number % 3 SELECT *
FROM numbers(10); -- {serverError DATABASE_ACCESS_DENIED}