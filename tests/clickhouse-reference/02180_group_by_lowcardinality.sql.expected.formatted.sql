SELECT
    val,
    avg(toUInt32(val))
FROM t_group_by_lowcardinality
GROUP BY val
LIMIT 10
SETTINGS
    max_threads = 1,
    max_rows_to_group_by = 100,
    group_by_overflow_mode = 'any'
FORMAT JSONEachRow;