CREATE TABLE data_compact
(
    `root.array` Array(UInt8),
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS min_rows_for_wide_part=100, min_bytes_for_wide_part=1e9;
SELECT table, part_type FROM system.parts WHERE table = 'data_compact' AND database = currentDatabase();
SELECT root.nested_array FROM data_compact;
CREATE TABLE data_wide
(
    `root.array` Array(UInt8),
)
ENGINE = MergeTree()
ORDER BY tuple()
SETTINGS min_rows_for_wide_part=0, min_bytes_for_wide_part=0;
SELECT table, part_type FROM system.parts WHERE table = 'data_wide' AND database = currentDatabase();
SELECT root.nested_array FROM data_wide;
