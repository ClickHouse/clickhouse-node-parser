-- Testing basic functionality with compact parts
set mutations_sync = 2;
create table mt_compact(a UInt64, b UInt64 DEFAULT a * a, s String, n Nested(x UInt32, y String), lc LowCardinality(String))
engine = MergeTree
order by a partition by a % 10
settings index_granularity = 8,
min_bytes_for_wide_part = 0,
min_rows_for_wide_part = 10;
select * from mt_compact order by a limit 10;
select distinct part_type from system.parts where database = currentDatabase() and table = 'mt_compact' and active;
select part_type, count() from system.parts where database = currentDatabase() and table = 'mt_compact' and active group by part_type order by part_type;
select * from mt_compact order by a, s limit 10;
select * from mt_compact where a > 1 order by a, s limit 10;
