SELECT count()
FROM t;

SELECT count()
FROM t FINAL;

SELECT count()
FROM t FINAL
SETTINGS do_not_merge_across_partitions_select_final = 1;

SELECT count()
FROM t FINAL
SETTINGS do_not_merge_across_partitions_select_final = 0;