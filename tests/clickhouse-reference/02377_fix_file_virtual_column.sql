create table test_02377 (n UInt32, s String) engine=File(CSVWithNames);
select * from test_02377 order by n;
select *, _path, _file from test_02377 format Null;
select _path, _file from test_02377 format Null;
