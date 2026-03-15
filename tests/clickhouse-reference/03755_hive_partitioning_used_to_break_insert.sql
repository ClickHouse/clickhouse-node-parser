-- Tags: no-fasttest

-- Test based on https://github.com/ClickHouse/ClickHouse/issues/81048#issuecomment-3139789210

SET use_hive_partitioning=1;
SELECT * FROM file(currentDatabase() || '_03755_output/date=2019-04-04/path.snappy.parquet') ORDER BY foo_key;
