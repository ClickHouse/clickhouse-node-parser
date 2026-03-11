SELECT trim(explain) FROM ( EXPLAIN indexes = 1 SELECT * FROM skip_table WHERE v = 125 SETTINGS per_part_index_stats=1) WHERE explain like '%Name%';
