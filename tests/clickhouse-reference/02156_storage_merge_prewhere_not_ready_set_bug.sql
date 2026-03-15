create table merge_kek_1 (x UInt32, y UInt32) engine = MergeTree order by x;
create table merge_kek_2 (x UInt32, y UInt32) engine = MergeTree order by x;
select sum(x), min(x + x), max(x + x) from merge(currentDatabase(), '^merge_kek_.$') where x > 200 and y in (select 500 + number * 2 from numbers(100)) settings max_threads=2;
