create table test_02312 (x Tuple(a UInt32, b UInt32)) engine=File(Parquet);
select * from test_02312;
create table test_02312 (x Tuple(a UInt32, b UInt32)) engine=File(Arrow);
create table test_02312 (x Tuple(a UInt32, b UInt32)) engine=File(ORC);
create table test_02312 (a Nested(b Nested(c UInt32))) engine=File(Parquet);
create table test_02312 (a Nested(b Nested(c UInt32))) engine=File(Arrow);
create table test_02312 (a Nested(b Nested(c UInt32))) engine=File(ORC);
