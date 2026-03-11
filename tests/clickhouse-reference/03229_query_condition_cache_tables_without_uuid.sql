-- Prints 00000000-0000-0000-0000-000000000000.
SELECT uuid FROM system.parts WHERE database = 'memory_db';
SELECT count(*) from system.query_condition_cache; -- no entry
SELECT count(*) FROM tab WHERE val = 24; -- 1 match
