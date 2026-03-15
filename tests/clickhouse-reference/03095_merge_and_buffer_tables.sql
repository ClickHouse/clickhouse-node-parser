create table mt1 (f1 Int32, f2 Int32) engine = MergeTree() order by f1;
create table mt2 as mt1 engine = MergeTree() order by f1;
create table b as mt1 engine = Buffer(currentDatabase(), mt2, 16, 1, 1, 10000, 1000000, 10000000, 100000000);
create table m as mt1 engine = Merge(currentDatabase(), '^(mt1|b)$');
-- do select
select f1, f2
from m
where f1 = 1 and f2 = 1;
