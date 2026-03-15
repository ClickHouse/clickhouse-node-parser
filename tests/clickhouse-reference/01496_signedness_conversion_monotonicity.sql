create table test1 (i Int64) engine MergeTree order by i;
select count() from test1 where toInt16(i) = 1777;
