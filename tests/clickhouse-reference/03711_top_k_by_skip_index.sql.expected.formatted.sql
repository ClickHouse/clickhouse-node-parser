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