create table cc (a UInt64, b String) ENGINE = MergeTree order by (a, b) SETTINGS compress_marks = true;
select * from cc;
