create table test_in (a LowCardinality(String)) Engine = MergeTree order by a;
select * from test_in where a in ('a');
