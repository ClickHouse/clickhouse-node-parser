-- verify : 10000 rows expected
SELECT count()
FROM tab FINAL;
-- add a filter : 9950 rows expected
SELECT count()
FROM tab FINAL
WHERE id >= 100;
-- only even id's are left - 0 rows expected
SELECT count()
FROM tab FINAL
WHERE (id % 2) = 1;
-- 10000 rows expected
SELECT count()
FROM tab FINAL
WHERE (id % 2) = 0;
-- Total 10000 (From A & B) + 100 (From C) + 7500 (From D) + 100 (From E) = 17700 rows
SELECT count()
FROM tab FINAL
SETTINGS do_not_merge_across_partitions_select_final=0,split_intersecting_parts_ranges_into_layers_final=0;
SELECT count()
FROM tab FINAL
SETTINGS do_not_merge_across_partitions_select_final=1,split_intersecting_parts_ranges_into_layers_final=1;
