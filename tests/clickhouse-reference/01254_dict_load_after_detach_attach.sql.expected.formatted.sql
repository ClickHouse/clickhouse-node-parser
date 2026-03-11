SELECT
    query_count,
    status
FROM `system`.dictionaries
WHERE database = currentDatabase()
    AND name = 'dict';

SELECT dictGetUInt64('dict', 'val', toUInt64(0));