SELECT *
FROM test
ORDER BY number ASC;

SELECT *
FROM file(concat(currentDatabase(), '/test2/data.Parquet'), 'Parquet', 'number UInt64');

SELECT *
FROM file(concat(currentDatabase(), '/test2/data.1.Parquet'), 'Parquet', 'number UInt64');

SELECT *
FROM file(concat(currentDatabase(), '/test4/data.Parquet.gz'), 'Parquet', 'number UInt64');

SELECT *
FROM file(concat(currentDatabase(), '/test4/data.1.Parquet.gz'), 'Parquet', 'number UInt64');