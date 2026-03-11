SELECT *
FROM numbers(4)
WHERE sleepEachRow(1);

SELECT
    table,
    type,
    new_part_name,
    num_postponed > 0 AS has_postpones,
    postpone_reason
FROM `system`.replication_queue
WHERE like(table, 'execute\\_on\\_single\\_replica\\_r%')
    AND database = currentDatabase()
ORDER BY table ASC
FORMAT Vertical;

SELECT *
FROM numbers(10)
WHERE sleepEachRow(1);

SELECT
    part_name,
    arraySort(groupArrayIf(table, event_type = 'MergeParts')) AS mergers,
    arraySort(groupArrayIf(table, event_type = 'DownloadPart')) AS fetchers
FROM `system`.part_log
WHERE (event_time > (now() - 120))
    AND (like(table, 'execute\\_on\\_single\\_replica\\_r%'))
    AND (notLike(part_name, '%\\_0'))
    AND (database = currentDatabase())
GROUP BY part_name
ORDER BY part_name ASC
FORMAT Vertical;