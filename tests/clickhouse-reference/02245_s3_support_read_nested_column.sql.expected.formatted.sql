SELECT
    a,
    b.a,
    b.b
FROM s3(s3_conn, filename = 'test_02245_s3_nested_parquet1_*', `format` = 'Parquet');

SELECT
    a,
    b.a,
    b.b.c,
    b.b.d
FROM s3(s3_conn, filename = 'test_02245_s3_nested_parquet2_*', `format` = 'Parquet', structure = 'a Int64, b Tuple(a Int64, b Tuple(c Int64, d String))');

SELECT
    a,
    b.a,
    b.b
FROM s3(s3_conn, filename = 'test_02245_s3_nested_arrow1_*', `format` = 'Arrow');

SELECT
    a,
    b.a,
    b.b.c,
    b.b.d
FROM s3(s3_conn, filename = 'test_02245_s3_nested_arrow2_*', `format` = 'Arrow', structure = 'a Int64, b Tuple(a Int64, b Tuple(c Int64, d String))');

SELECT
    a,
    b.a,
    b.b
FROM s3(s3_conn, filename = 'test_02245_s3_nested_orc1_*', `format` = 'ORC');

SELECT
    a,
    b.a,
    b.b.c,
    b.b.d
FROM s3(s3_conn, filename = 'test_02245_s3_nested_orc2_*', `format` = 'ORC', structure = 'a Int64, b Tuple(a Int64, b Tuple(c Int64, d String))');