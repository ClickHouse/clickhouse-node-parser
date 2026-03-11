SELECT
    name,
    is_frozen
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 'part_info';

SELECT *
FROM part_info
ORDER BY t ASC;