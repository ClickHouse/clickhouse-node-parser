SELECT *
FROM test
ORDER BY c3 ASC
LIMIT 1
SETTINGS
    max_bytes_before_external_sort = 1,
    max_bytes_ratio_before_external_sort = 0.0;