-- Tags: no-fasttest, no-parallel
-- no-fasttest because of Parquet
-- no-parallel because we're writing a file with fixed name
SELECT count()
FROM url('http://localhost:11111/test/hive_partitioning/column0=Elizabeth/sample.parquet');

SELECT count()
FROM url('http://localhost:11111/test/hive_partitioning/column0=Elizabeth/sample.parquet')
WHERE column1 = 'meow';

SELECT sleep(1); -- quirk in schema cache: cache is not used for up to 1s after file is written

SELECT count()
FROM file('03531.parquet');

SELECT count()
FROM file('03531.parquet')
WHERE number = 13;