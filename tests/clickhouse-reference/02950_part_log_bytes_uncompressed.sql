SELECT event_type, table, part_name, bytes_uncompressed > 0, (bytes_uncompressed > 0 ? (size_in_bytes < bytes_uncompressed ? '1' : toString((size_in_bytes, bytes_uncompressed))) : '0')
FROM system.part_log
WHERE event_date >= yesterday() AND database = currentDatabase() AND table = 'part_log_bytes_uncompressed'
    AND (event_type != 'RemovePart' OR part_name = 'all_4_4_0') -- ignore removal of other parts
ORDER BY part_name, event_type;
