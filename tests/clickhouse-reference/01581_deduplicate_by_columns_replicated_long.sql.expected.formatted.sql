SELECT
    'r1',
    id,
    val,
    count(),
    uniqExact(unique_value)
FROM replicated_deduplicate_by_columns_r1
GROUP BY
    id,
    val
ORDER BY
    id ASC,
    val ASC;

SELECT
    'r2',
    id,
    val,
    count(),
    uniqExact(unique_value)
FROM replicated_deduplicate_by_columns_r2
GROUP BY
    id,
    val
ORDER BY
    id ASC,
    val ASC;