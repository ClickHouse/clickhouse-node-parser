SELECT
    ifNull(fun_res, 0),
    count(*)
FROM (
        SELECT
            a,
            windowFunnel(86400000, 'strict_increase', 'strict_once')((b = '10')
            OR (c = '10')
            OR (b = '22')
            OR (c = '3')
            OR (b = '6')
            OR (c = '5')
            OR (b = '6')
            OR (c = '9'), (b = '9')
            OR (c = '91'), (b = '99')
            OR (c = '99'), (b = '74')
            OR (c = '74'), (b = '55')
            OR (c = '55'), (b = '13')
            OR (c = '13'), (b = '69')
            OR (c = '69')) AS fun_res
        FROM test
        GROUP BY a
    )
GROUP BY fun_res
FORMAT Null
SETTINGS log_queries = 1, max_memory_usage = '800Mi';