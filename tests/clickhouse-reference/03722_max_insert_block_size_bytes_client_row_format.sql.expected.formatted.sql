-- We expect to see 8 parts inserted
SELECT count()
FROM `system`.part_log
WHERE table = 'test_max_insert_bytes'
    AND event_type = 'NewPart'
    AND (query_id = (
        SELECT argMax(query_id, event_time)
        FROM `system`.query_log
        WHERE like(query, '%INSERT INTO test_max_insert_bytes FORMAT CSV%')
            AND type = 'QueryFinish'
            AND current_database = currentDatabase()
    ));

-- We expect to see 4 parts inserted
SELECT count()
FROM `system`.part_log
WHERE table = 'test_min_insert_rows_bytes'
    AND event_type = 'NewPart'
    AND (query_id = (
        SELECT argMax(query_id, event_time)
        FROM `system`.query_log
        WHERE like(query, '%INSERT INTO test_min_insert_rows_bytes FORMAT CSV%')
            AND type = 'QueryFinish'
            AND current_database = currentDatabase()
    ));

-- We expect to see 2 parts inserted
SELECT count()
FROM `system`.part_log
WHERE table = 'test_min_insert_rows'
    AND event_type = 'NewPart'
    AND (query_id = (
        SELECT argMax(query_id, event_time)
        FROM `system`.query_log
        WHERE like(query, '%INSERT INTO test_min_insert_rows FORMAT CSV%')
            AND type = 'QueryFinish'
            AND current_database = currentDatabase()
    ));

-- We expect to see 2 parts inserted
SELECT count()
FROM `system`.part_log
WHERE table = 'test_min_insert_bytes'
    AND event_type = 'NewPart'
    AND (query_id = (
        SELECT argMax(query_id, event_time)
        FROM `system`.query_log
        WHERE like(query, '%INSERT INTO test_min_insert_bytes FORMAT CSV%')
            AND type = 'QueryFinish'
            AND current_database = currentDatabase()
    ));