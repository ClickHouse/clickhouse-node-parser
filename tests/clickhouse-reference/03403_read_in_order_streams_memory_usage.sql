SELECT *
FROM 03403_data
ORDER BY id
FORMAT Null
SETTINGS max_threads = 1024,
         max_streams_to_max_threads_ratio = 10000000;
SELECT *
FROM system.query_log
WHERE Settings['max_streams_to_max_threads_ratio'] = '10000000'
  AND query like '%FROM 03403_data%'
  AND type = 'QueryFinish'
  AND memory_usage > 20_000_000
  AND current_database = currentDatabase();
