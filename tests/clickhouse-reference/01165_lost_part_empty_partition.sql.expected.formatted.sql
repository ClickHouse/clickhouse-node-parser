SELECT lost_part_count
FROM `system`.replicas
WHERE database = currentDatabase()
    AND table = 'rmt2';

SELECT count()
FROM `system`.text_log
WHERE like(logger_name, concat('%', currentDatabase(), '%'))
    AND ilike(message, '%table with non-zero lost_part_count equal to%');