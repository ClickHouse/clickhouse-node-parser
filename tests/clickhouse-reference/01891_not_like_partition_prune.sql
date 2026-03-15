create table test (a String)  Engine MergeTree order by a partition by a;
select * from test where a like '1%1' order by a;
select * from test where a not like '1%1' order by a;
select * from test where a not like '1%2' order by a;
