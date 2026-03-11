SELECT skewSamp(x_value)
FROM (
        SELECT x_value AS x_value
        FROM series__fuzz_35
        LIMIT 2
    )
FORMAT Null;