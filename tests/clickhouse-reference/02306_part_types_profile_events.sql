SELECT count(), sum(ProfileEvents['InsertedWideParts']), sum(ProfileEvents['InsertedCompactParts'])
    FROM system.query_log WHERE current_database = currentDatabase()
        AND log_comment = '02306_part_types_profile_events'
        AND query ILIKE 'INSERT INTO%' AND type = 'QueryFinish';
SELECT count(), sum(ProfileEvents['MergedIntoWideParts']), sum(ProfileEvents['MergedIntoCompactParts'])
    FROM system.query_log WHERE current_database = currentDatabase()
        AND log_comment = '02306_part_types_profile_events'
        AND query ILIKE 'OPTIMIZE TABLE%' AND type = 'QueryFinish';
SELECT part_type FROM system.part_log WHERE database = currentDatabase()
    AND table = 't_parts_profile_events' AND event_type = 'NewPart'
    ORDER BY event_time_microseconds;
SELECT part_type, count() > 0 FROM system.part_log WHERE database = currentDatabase()
    AND table = 't_parts_profile_events' AND event_type = 'MergeParts'
    GROUP BY part_type ORDER BY part_type;
