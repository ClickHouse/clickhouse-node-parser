CREATE TABLE test
(
    number UInt64
)
ENGINE = File('Parquet');

SELECT *
FROM test
ORDER BY number ASC;

CREATE TABLE test
(
    number UInt64
)
ENGINE = File('Parquet', 'test_02155/test1/data.Parquet');

SELECT *
FROM file(concat(currentDatabase(), '/test2/data.Parquet'), 'Parquet', 'number UInt64');

SELECT *
FROM file(concat(currentDatabase(), '/test2/data.1.Parquet'), 'Parquet', 'number UInt64');

CREATE TABLE test
(
    number UInt64
)
ENGINE = File('Parquet', 'test_02155/test3/data.Parquet.gz');

SELECT *
FROM file(concat(currentDatabase(), '/test4/data.Parquet.gz'), 'Parquet', 'number UInt64');

SELECT *
FROM file(concat(currentDatabase(), '/test4/data.1.Parquet.gz'), 'Parquet', 'number UInt64');