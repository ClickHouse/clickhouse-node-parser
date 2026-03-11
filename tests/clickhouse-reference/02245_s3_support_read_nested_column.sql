select a, b.a, b.b from s3(s3_conn, filename='test_02245_s3_nested_parquet1_*', format='Parquet');
select a, b.a, b.b.c, b.b.d from s3(s3_conn, filename='test_02245_s3_nested_parquet2_*', format='Parquet', structure='a Int64, b Tuple(a Int64, b Tuple(c Int64, d String))');
select a, b.a, b.b from s3(s3_conn, filename='test_02245_s3_nested_arrow1_*', format='Arrow');
select a, b.a, b.b.c, b.b.d from s3(s3_conn, filename='test_02245_s3_nested_arrow2_*', format='Arrow', structure='a Int64, b Tuple(a Int64, b Tuple(c Int64, d String))');
select a, b.a, b.b from s3(s3_conn, filename='test_02245_s3_nested_orc1_*', format='ORC');
select a, b.a, b.b.c, b.b.d from s3(s3_conn, filename='test_02245_s3_nested_orc2_*', format='ORC', structure='a Int64, b Tuple(a Int64, b Tuple(c Int64, d String))');
