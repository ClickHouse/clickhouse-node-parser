-- Tags: no-fasttest
-- https://github.com/ClickHouse/ClickHouse/issues/44039
SET enable_analyzer=1;
create table test_window_collate(c1 String, c2 String) engine=MergeTree order by c1;
select c2, groupArray(c2) over (partition by c1 order by c2  asc collate 'zh_Hans_CN') as res from test_window_collate order by c2  asc collate 'zh_Hans_CN';
