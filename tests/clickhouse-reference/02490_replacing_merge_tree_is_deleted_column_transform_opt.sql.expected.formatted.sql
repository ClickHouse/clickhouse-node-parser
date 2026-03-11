SELECT count()
FROM tab FINAL;

SELECT count()
FROM tab FINAL
WHERE id >= 100;

SELECT count()
FROM tab FINAL
WHERE (id % 2) = 1;

SELECT count()
FROM tab FINAL
WHERE (id % 2) = 0;

SELECT count()
FROM tab FINAL
SETTINGS
    do_not_merge_across_partitions_select_final = 0,
    split_intersecting_parts_ranges_into_layers_final = 0;

SELECT count()
FROM tab FINAL
SETTINGS
    do_not_merge_across_partitions_select_final = 1,
    split_intersecting_parts_ranges_into_layers_final = 1;