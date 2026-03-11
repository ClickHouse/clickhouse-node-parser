SELECT partition_id
FROM `system`.detached_parts
WHERE (table = 'restore_01640')
    AND (database = currentDatabase());

SELECT
    _part,
    *
FROM restore_01640;