SELECT * FROM replacing_merge_tree ORDER BY key;
SELECT * FROM collapsing_merge_tree ORDER BY key;
SELECT * FROM versioned_collapsing_merge_tree ORDER BY key;
SELECT * FROM summing_merge_tree ORDER BY key;
SELECT * FROM aggregating_merge_tree ORDER BY key;
SELECT * FROM empty ORDER BY key;
SELECT table, partition, active FROM system.parts where table = 'empty' and active = 1 and database = currentDatabase();
