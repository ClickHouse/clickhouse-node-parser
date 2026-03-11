SELECT count()
FROM url('http://localhost:11111/test/hive_partitioning/column0=Elizabeth/sample.parquet');

SELECT count()
FROM url('http://localhost:11111/test/hive_partitioning/column0=Elizabeth/sample.parquet')
WHERE column1 = 'meow';

SELECT sleep(1);

SELECT count()
FROM file('03531.parquet');

SELECT count()
FROM file('03531.parquet')
WHERE number = 13;