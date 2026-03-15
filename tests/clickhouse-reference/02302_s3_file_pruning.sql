-- Tags: no-parallel, no-fasttest
-- Tag no-fasttest: Depends on S3

SET merge_tree_read_split_ranges_into_intersecting_and_non_intersecting_injection_probability = 0.0;
create table test_02302 (a UInt64) engine = S3(s3_conn, filename='test_02302_{_partition_id}', format=Parquet) partition by a;
select * from test_02302;  -- { serverError NOT_IMPLEMENTED }
set max_rows_to_read = 1;
-- Test s3 table function with glob
select * from s3(s3_conn, filename='test_02302_*', format=Parquet) where _file like '%5';
create table test_02302 (a UInt64) engine = S3(s3_conn, filename='test_02302.2', format=Parquet);
create table test_02302 (a UInt64) engine = S3(s3_conn, filename='test_02302.1', format=Parquet);
create table test_02302 (a UInt64) engine = S3(s3_conn, filename='test_02302', format=Parquet);
select * from test_02302 where _file like '%1';
select _file, * from test_02302 where _file like '%1';
set max_rows_to_read = 2;
select * from test_02302 where (_file like '%.1' OR _file like '%.2') AND a > 1;
set max_rows_to_read = 999;
select 'a1' as _file, * from test_02302 where _file like '%1' ORDER BY a;
