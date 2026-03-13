-- Only 10 granules should be read
SELECT
    id,
    v1
FROM tab
ORDER BY v1 ASC
LIMIT 10
SETTINGS
    max_rows_to_read = 640,
    use_skip_indexes_for_top_k = 1,
    use_skip_indexes_on_data_read = 0;

SELECT
    id,
    v1
FROM tab
ORDER BY v1 DESC
LIMIT 10
SETTINGS
    max_rows_to_read = 640,
    use_skip_indexes_for_top_k = 1,
    use_skip_indexes_on_data_read = 0;

-- Verify EXPLAIN indexes=1 output to confirm skip index usage for top-n
SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT
            id,
            v1
        FROM tab
        ORDER BY v1 ASC
        LIMIT 10
        SETTINGS
            use_skip_indexes_for_top_k = 1,
            use_skip_indexes_on_data_read = 0
    )
WHERE like(`explain`, '%TopK%');

--  If WHERE clause is present, TopN via skip index only optimization not possible - row should not seen
SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN indexes = 1
        SELECT
            id,
            v1
        FROM tab
        WHERE v2 > 0
        ORDER BY v1 ASC
        LIMIT 10
        SETTINGS
            use_skip_indexes_for_top_k = 1,
            use_skip_indexes_on_data_read = 0
    )
WHERE like(`explain`, '%TopK%');

-- Verify that dynamic filter injects PREWHERE dynamic filter
SELECT trimLeft(`explain`) AS `explain`
FROM (
        EXPLAIN actions = 1
        SELECT
            id,
            v1
        FROM tab
        WHERE v2 > 0
        ORDER BY v1 ASC
        LIMIT 10
        SETTINGS
            use_skip_indexes_for_top_k = 0,
            use_top_k_dynamic_filtering = 1
    )
WHERE like(`explain`, '%topK%');

-- Verify execution of dynamic filter
SELECT
    id,
    v1
FROM tab
WHERE v2 > 0
ORDER BY v1 ASC
LIMIT 5
SETTINGS
    use_skip_indexes_for_top_k = 0,
    use_top_k_dynamic_filtering = 1;