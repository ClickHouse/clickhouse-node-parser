-- Tags: no-fasttest, no-parallel
-- no-fasttest because of Parquet
-- no-parallel because we're writing a file with fixed name

select count() from url('http://localhost:11111/test/hive_partitioning/column0=Elizabeth/sample.parquet');
select count() from url('http://localhost:11111/test/hive_partitioning/column0=Elizabeth/sample.parquet') where column1 = 'meow';
select sleep(1); -- quirk in schema cache: cache is not used for up to 1s after file is written
select count() from file('03531.parquet');
select count() from file('03531.parquet') where number = 13;
