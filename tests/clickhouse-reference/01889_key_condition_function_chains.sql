set force_primary_key=1;
create table tab (t DateTime) engine = MergeTree order by toStartOfDay(t);
select t from tab where t > '2020-01-01 01:01:01';
create table tab (t DateTime) engine = MergeTree order by toStartOfDay(t + 1);
select t from tab where t + 1 > '2020-01-01 01:01:01';
set force_primary_key = 0;
set force_index_by_date=1;
create table tab (x Int32, y Int32) engine = MergeTree partition by x + y order by tuple();
select x, y from tab where (x + y) = 2;
create table tab (x Int32, y Int32) engine = MergeTree partition by ((x + y) + 1) * 2 order by tuple();
select x, y from tab where (x + y) + 1 = 3;
-- with x + y as s select x, y from tab where s + 1 = 3;

set force_index_by_date=0;
