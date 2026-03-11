SELECT * FROM insert_dedup_token1 ORDER BY id;
SELECT DISTINCT exception FROM system.part_log
WHERE table = 'insert_dedup_token1'
  AND database = currentDatabase()
  AND event_type = 'NewPart'
  AND error = 389;
SELECT * FROM insert_dedup_token2 ORDER BY id;
