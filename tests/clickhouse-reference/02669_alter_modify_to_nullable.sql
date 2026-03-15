CREATE TABLE t_modify_to_nullable (key UInt64, id UInt64, s String)
ENGINE = MergeTree ORDER BY id PARTITION BY key
SETTINGS min_bytes_for_wide_part = 0, ratio_of_defaults_for_sparse_serialization = 0.9;
SELECT name, type, serialization_kind FROM system.parts_columns
WHERE database = currentDatabase() AND table = 't_modify_to_nullable' AND column = 's' AND active
ORDER BY name;
SELECT count(s), countIf(s != ''), arraySort(groupUniqArray(s)) FROM t_modify_to_nullable;
SET mutations_sync = 2;
SELECT part_name, read_rows FROM system.part_log
WHERE database = currentDatabase() AND table = 't_modify_to_nullable' AND event_type = 'MutatePart'
ORDER BY part_name;
