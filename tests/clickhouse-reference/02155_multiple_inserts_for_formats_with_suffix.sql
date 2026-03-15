create table test (number UInt64) engine=File('Parquet');
select * from test order by number;
create table test (number UInt64) engine=File('Parquet', 'test_02155/test1/data.Parquet');
select * from file(concat(currentDatabase(), '/test2/data.Parquet'), 'Parquet', 'number UInt64');
select * from file(concat(currentDatabase(), '/test2/data.1.Parquet'), 'Parquet', 'number UInt64');
create table test (number UInt64) engine=File('Parquet', 'test_02155/test3/data.Parquet.gz');
select * from file(concat(currentDatabase(), '/test4/data.Parquet.gz'), 'Parquet', 'number UInt64');
select * from file(concat(currentDatabase(), '/test4/data.1.Parquet.gz'), 'Parquet', 'number UInt64');
