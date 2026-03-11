select * from test_02381_compress where a = 1000 limit 1;
-- Compare the size of marks on disk
select table, sum(rows), sum(bytes_on_disk) sum_bytes, sum(marks_bytes) sum_marks_bytes, (sum_bytes - sum_marks_bytes) exclude_marks from system.parts_columns where active and database = currentDatabase() and table like 'test_02381%' group by table order by table;
select * from test_02381_compress where a = 10000 limit 1;
select * from test_02381 where a = 10000 limit 1;
select * from test_02381_compact order by a;
