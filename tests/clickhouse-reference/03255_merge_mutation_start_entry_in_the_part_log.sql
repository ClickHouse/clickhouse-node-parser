SELECT * FROM test ORDER BY ALL;
SELECT event_type, merge_reason, table, part_name, partition_id, partition, rows, merged_from
FROM system.part_log WHERE database = currentDatabase() AND event_type IN ('MergePartsStart', 'MergeParts', 'MutatePartStart', 'MutatePart')
ORDER BY event_time_microseconds FORMAT Vertical;
