SET optimize_trivial_insert_select = 1;
CREATE TABLE move_partition_to_oneself (key UInt64 CODEC(NONE)) ENGINE = MergeTree ORDER BY tuple();
SELECT partition, rows FROM system.parts WHERE database = currentDatabase() AND table = 'move_partition_to_oneself' and active;
