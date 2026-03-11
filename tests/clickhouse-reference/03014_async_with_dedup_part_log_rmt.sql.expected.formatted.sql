SELECT '-- Inserted part --';

SELECT
    error,
    count()
FROM `system`.part_log
WHERE table = '03014_async_with_dedup_part_log'
    AND database = currentDatabase()
    AND event_type = 'NewPart'
GROUP BY error
ORDER BY error ASC;