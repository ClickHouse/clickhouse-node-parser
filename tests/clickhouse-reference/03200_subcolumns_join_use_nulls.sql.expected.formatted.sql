SELECT count()
FROM
    (
        SELECT number
        FROM numbers(10)
    ) AS tbl
LEFT JOIN t_subcolumns_join
    ON number = id
WHERE isNull(id)
SETTINGS
    enable_analyzer = 1,
    optimize_functions_to_subcolumns = 1,
    join_use_nulls = 1;