SELECT * FROM m2 WHERE id > 1 AND id < 5 ORDER BY id SETTINGS force_primary_key=1, max_bytes_to_read=64;
SELECT 1 FROM merge(currentDatabase(), '^v$');
