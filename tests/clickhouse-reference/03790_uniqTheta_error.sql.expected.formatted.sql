SELECT throwIf(stddevSampStable(theta) / avg(theta) > 0.1)
FROM (
        SELECT
            number % 3 AS key,
            uniqTheta(generateUUIDv4(number)) AS theta
        FROM numbers_mt(9160000)
        GROUP BY key
        WITH TOTALS
        SETTINGS max_threads = 8
    )
FORMAT Null;