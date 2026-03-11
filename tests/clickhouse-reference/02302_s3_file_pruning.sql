select * from test_02302;  -- { serverError NOT_IMPLEMENTED }
-- Test s3 table function with glob
select * from s3(s3_conn, filename='test_02302_*', format=Parquet) where _file like '%5';
select * from test_02302 where _file like '%1';
select _file, * from test_02302 where _file like '%1';
select * from test_02302 where (_file like '%.1' OR _file like '%.2') AND a > 1;
select 'a1' as _file, * from test_02302 where _file like '%1' ORDER BY a;
