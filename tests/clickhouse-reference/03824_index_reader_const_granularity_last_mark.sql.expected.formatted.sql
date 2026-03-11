SELECT
    id,
    v1
FROM tab
ORDER BY v1 DESC
LIMIT 257
SETTINGS
    use_skip_indexes_for_top_k = 1,
    use_skip_indexes_on_data_read = 0;