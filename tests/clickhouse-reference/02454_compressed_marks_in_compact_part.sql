drop table if exists cc sync;
create table cc (a UInt64, b String) ENGINE = MergeTree order by (a, b) SETTINGS compress_marks = true;
insert into cc  values (2, 'World');
select * from cc;
