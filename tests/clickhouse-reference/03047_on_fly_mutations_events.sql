SELECT count() FROM t_lightweight_mut_7;
SELECT 1, sum(v) FROM t_lightweight_mut_7;
SELECT 2, sum(v) FROM t_lightweight_mut_7 SETTINGS apply_mutations_on_fly = 0;
SELECT 3, sum(v) FROM t_lightweight_mut_7;
SELECT
    query,
    ProfileEvents['ReadTasksWithAppliedMutationsOnFly'],
    ProfileEvents['MutationsAppliedOnFlyInAllReadTasks']
FROM system.query_log
WHERE current_database = currentDatabase() AND query ILIKE 'SELECT%FROM%t_lightweight_mut_7%' AND type = 'QueryFinish'
ORDER BY event_time_microseconds;
