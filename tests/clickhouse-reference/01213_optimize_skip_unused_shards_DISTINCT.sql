SELECT DISTINCT id FROM dist_01213 WHERE id = 1 SETTINGS distributed_group_by_no_merge=1;
SELECT DISTINCT id FROM dist_01213 WHERE id = 1 SETTINGS optimize_skip_unused_shards=1;
SELECT DISTINCT id FROM dist_01213 SETTINGS optimize_skip_unused_shards=1, optimize_distributed_group_by_sharding_key=0;
SELECT DISTINCT id FROM dist_01213 SETTINGS optimize_skip_unused_shards=1, optimize_distributed_group_by_sharding_key=1;
