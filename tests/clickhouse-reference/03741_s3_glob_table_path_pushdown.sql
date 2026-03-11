SELECT _path, count() FROM 03741_data GROUP BY 1 ORDER BY 1;
SELECT count() FROM 03741_data WHERE _path = 'test/03741_data/file1.parquet';
SELECT count() FROM 03741_data WHERE _path != 'test/03741_data/file1.parquet';
SELECT count() FROM 03741_data WHERE _path = 'clickhouse/fake_directory/file1.parquet';
SELECT count() FROM 03741_data WHERE _path IN ('test/03741_data/file1.parquet', 'test/03741_data/file2.parquet');
SELECT count() FROM 03741_data WHERE _path NOT IN ('test/03741_data/file1.parquet', 'test/03741_data/file2.parquet');
SELECT count() FROM 03741_data WHERE _path IN ('clickhouse/fake_directory/fake.parquet');
SELECT count() FROM 03741_data WHERE _path IN ('clickhouse/fake_directory/fake.parquet', 'test/03741_data/nested/file3.parquet');
SELECT count() FROM 03741_data WHERE _path NOT IN ('clickhouse/fake_directory/fake.parquet', 'test/03741_data/nested/file3.parquet');
SELECT count() FROM 03741_data WHERE _path IN (03741_filter);
SELECT count() FROM 03741_data WHERE _path NOT IN (03741_filter);
SELECT count() FROM 03741_data WHERE _path IN (SELECT * FROM 03741_filter WHERE path LIKE '%nested%');
SELECT count() FROM 03741_data WHERE _path NOT IN (SELECT * FROM 03741_filter WHERE path LIKE '%nested%');
SELECT count() FROM 03741_data WHERE _path IN (SELECT * FROM 03741_filter UNION ALL SELECT 'clickhouse/fake_directory/fake.parquet');
SELECT count() FROM 03741_data WHERE _path NOT IN (SELECT * FROM 03741_filter UNION ALL SELECT 'clickhouse/fake_directory/fake.parquet');
SELECT count() FROM 03741_data WHERE _path = 'test/03741_data/file1.parquet' AND number > 5;
SELECT count() FROM 03741_data WHERE _path = 'test/03741_data/file1.parquet' OR number > 5;
SELECT count() FROM 03741_data WHERE (_path = 'test/03741_data/file1.parquet' OR _path IN (SELECT 'test/03741_data/nested/file4.parquet')) AND number < 3;
SELECT count() FROM 03741_data WHERE (_path = 'test/03741_data/file1.parquet' AND number = 2) OR (_path = 'test/03741_data/nested/file4.parquet' AND number = 4);
SELECT count() FROM 03741_data WHERE (_path = 'test/03741_data/file1.parquet' OR number = 2) AND (_path = 'test/03741_data/file2.parquet' OR number <= 1);
SELECT count() FROM 03741_data WHERE substr(_path, 1, 23) = 'test/03741_data/nested/';
SELECT count() FROM 03741_data WHERE _path = 'test/03741_data/file2.parquet'
SETTINGS s3_path_filter_limit = 0;
SELECT count() FROM 03741_data WHERE _path IN ('test/03741_data/file1.parquet', 'test/03741_data/file2.parquet')
SETTINGS s3_path_filter_limit = 1;
SELECT count() FROM 03741_data WHERE _path IN ('test/03741_data/file1.parquet', 'test/03741_data/file2.parquet')
SETTINGS s3_path_filter_limit = 2;
SELECT ProfileEvents['S3ListObjects'], ProfileEvents['EngineFileLikeReadFiles']
FROM system.query_log
WHERE current_database = currentDatabase()
  AND log_comment like '%03741_s3_glob_table_path_pushdown%'
  AND query_kind = 'Select'
  AND type = 'QueryFinish'
ORDER BY event_time_microseconds;
SELECT count() FROM 03741_data WHERE _path = 'test/03741_data/file1.parquet' AND _path = 'test/03741_data/file2.parquet';
