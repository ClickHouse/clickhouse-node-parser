SELECT count() > 1
    AND SUM(ProfileEvents['ZooKeeperTransactions']) >= 4
FROM `system`.part_log
WHERE event_time > now() - toIntervalMinute(10)
    AND database == currentDatabase()
    AND table == 'part_log_profile_events_r2'
    AND event_type == 'DownloadPart';