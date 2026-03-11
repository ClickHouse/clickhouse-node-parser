SELECT ignore(x)
FROM (
        SELECT groupArray(number) AS x
        FROM numbers(3355443)
    )
GROUP BY x
FORMAT Null;