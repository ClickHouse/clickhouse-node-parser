create table tp (x Int32, y Int32, projection p (select x, y order by x)) engine = MergeTree order by y settings min_rows_for_wide_part = 4, min_bytes_for_wide_part = 32;
create table tp (p Date, k UInt64, v1 UInt64, v2 Int64, projection p1 ( select p, sum(k), sum(v1), sum(v2) group by p) ) engine = MergeTree partition by toYYYYMM(p) order by k settings min_bytes_for_wide_part = 0;
create table tp (x int, projection p (select sum(x))) engine = MergeTree order by x settings min_rows_for_wide_part = 2, min_bytes_for_wide_part = 0;
select part_type from system.parts where database = currentDatabase() and table = 'tp';
select part_type from system.projection_parts where database = currentDatabase() and table = 'tp';
