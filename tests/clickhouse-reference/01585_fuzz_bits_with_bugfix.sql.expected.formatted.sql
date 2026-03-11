SELECT toTypeName(fuzzBits('stringstring', 0.5))
FROM numbers(3);

SELECT toTypeName(fuzzBits('stringstring', 0.5))
FROM (
        SELECT 1 AS x
        UNION ALL
        SELECT NULL
    )
GROUP BY x;