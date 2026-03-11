-- nothing to read
select i from a where _part_offset >= 5 order by i settings max_bytes_to_read = 1;
-- one granule
select i from a where _part_offset = 0 order by i settings max_rows_to_read = 2;
select i from a where _part_offset = 1 order by i settings max_rows_to_read = 2;
select i from a where _part_offset = 2 order by i settings max_rows_to_read = 2;
select i from a where _part_offset = 3 order by i settings max_rows_to_read = 2;
select i from a where _part_offset = 4 order by i settings max_rows_to_read = 1;
-- other predicates
select i from a where _part_offset in (1, 4) order by i settings max_rows_to_read = 3;
select i from a where _part_offset not in (1, 4) order by i settings max_rows_to_read = 4;
-- the force_primary_key check still works
select i from a where _part_offset = 4 order by i settings force_primary_key = 1; -- { serverError INDEX_NOT_USED }
-- combining with other primary keys doesn't work (makes no sense)
select i from a where i = -3 or _part_offset = 4 order by i settings force_primary_key = 1; -- { serverError INDEX_NOT_USED }
-- multiple parts with _part predicate
select i from b where (_part = 'all_1_1_0' and _part_offset in (1, 4)) or (_part = 'all_2_2_0' and _part_offset in (0, 4)) order by i settings max_rows_to_read = 6;
