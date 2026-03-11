SELECT table, part_type FROM system.parts WHERE table = 'data_compact' AND database = currentDatabase();
SELECT root.nested_array FROM data_compact;
SELECT table, part_type FROM system.parts WHERE table = 'data_wide' AND database = currentDatabase();
SELECT root.nested_array FROM data_wide;
