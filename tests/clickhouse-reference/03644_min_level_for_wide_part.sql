SET alter_sync = 2;
-- Can produce initial parts with level 1
SET optimize_on_insert = 0;
CREATE TABLE t_03644_min_level_for_wide_part (x int) ENGINE = MergeTree ORDER BY x
SETTINGS min_bytes_for_wide_part = 0, min_rows_for_wide_part = 0, min_level_for_wide_part = 1;
SELECT level, part_type FROM system.parts WHERE database = currentDatabase() AND table = 't_03644_min_level_for_wide_part' AND active;
SET optimize_on_insert = 1;
CREATE TABLE t_03644_min_level_for_wide_part_rmt (x int, y int) ENGINE = ReplacingMergeTree ORDER BY x
SETTINGS min_bytes_for_wide_part = 0, min_rows_for_wide_part = 0, min_level_for_wide_part = 2;
SELECT level, part_type FROM system.parts WHERE database = currentDatabase() AND table = 't_03644_min_level_for_wide_part_rmt' AND active;
