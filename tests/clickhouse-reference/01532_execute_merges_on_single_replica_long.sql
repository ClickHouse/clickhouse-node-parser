SELECT * FROM numbers(4) where sleepEachRow(1);
/* we can now check that r1 waits for r2 */
SELECT
    table,
    type,
    new_part_name,
    num_postponed > 0 AS has_postpones,
    postpone_reason
FROM system.replication_queue
WHERE table LIKE 'execute\\_on\\_single\\_replica\\_r%'
AND database = currentDatabase()
ORDER BY table
FORMAT Vertical;
/* we have execute_merges_on_single_replica_time_threshold exceeded */
SELECT * FROM numbers(10) where sleepEachRow(1);
SELECT
    part_name,
    arraySort(groupArrayIf(table, event_type = 'MergeParts')) AS mergers,
    arraySort(groupArrayIf(table, event_type = 'DownloadPart')) AS fetchers
FROM system.part_log
WHERE (event_time > (now() - 120))
  AND (table LIKE 'execute\\_on\\_single\\_replica\\_r%')
  AND (part_name NOT LIKE '%\\_0')
  AND (database = currentDatabase())
GROUP BY part_name
ORDER BY part_name
FORMAT Vertical;
