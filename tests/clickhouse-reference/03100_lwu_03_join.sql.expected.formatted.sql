SELECT
    name,
    `rows`
FROM `system`.parts
WHERE database = currentDatabase()
    AND table = 't_shared'
    AND active
ORDER BY name ASC;

SELECT *
FROM t_shared
ORDER BY id ASC;

SELECT mapSort(mapFilter((k, v) -> k IN ('ReadTasksWithAppliedPatches', 'PatchesAppliedInAllReadTasks', 'PatchesMergeAppliedInAllReadTasks', 'PatchesJoinAppliedInAllReadTasks'), ProfileEvents))
FROM `system`.query_log
WHERE current_database = currentDatabase()
    AND like(query, '%SELECT * FROM t_shared ORDER BY id%')
    AND type = 'QueryFinish'
ORDER BY event_time_microseconds ASC;