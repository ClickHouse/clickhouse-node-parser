SELECT count()
FROM t_lwu_lock_profile_events;

SELECT
    ProfileEvents['PatchesAcquireLockTries'],
    ProfileEvents['PatchesAcquireLockMicroseconds'] > 0
FROM `system`.query_log
WHERE type = 'QueryFinish'
    AND current_database = currentDatabase()
    AND like(query, '%DELETE FROM t_lwu_lock_profile_events WHERE id < 10000%');