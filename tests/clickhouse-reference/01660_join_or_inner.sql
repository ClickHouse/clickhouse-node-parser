SET joined_subquery_requires_alias = 0;
create table tab2 (a2 Int32, b2 Int32) engine = MergeTree order by a2;
create table tab3 (a3 Int32, b3 Int32) engine = MergeTree order by a3;
set max_threads = 1;
SET any_join_distinct_right_table_keys = 0;
select tab2.*, tab3.* from tab2 any join tab3 on a2 = a3 or b2 = b3 ORDER BY ALL;
select tab2.*, tab3.* from tab2 any join tab3 on b2 = b3 or a2 = a3 ORDER BY ALL;
SET any_join_distinct_right_table_keys = 1;
SELECT 1 FROM (select 1 a, 1 aa, 1 aaa, 1 aaaa) A JOIN (select 1 b, 1 bb, 1 bbb, 1 bbbb, 1 bbbbb) B ON a = b OR a = bb OR a = bbb OR a = bbbb OR aa = b OR aa = bb OR aa = bbb OR aa = bbbb OR aaa = b OR aaa = bb OR aaa = bbb OR aaa = bbbb OR aaaa = b OR aaaa = bb OR aaaa = bbb OR aaaa = bbbb OR a = bbbbb OR aa = bbbbb;
