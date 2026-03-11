SELECT sum(value)
FROM test_mv;

SELECT sum(value)
FROM (
        SELECT
            number,
            sum(number) AS value
        FROM (
                SELECT
                    *,
                    toDecimal64(number, 6) AS val
                FROM numbers
            )
        GROUP BY number
    );

SELECT
    count(),
    sum(n),
    sum(toInt64(s)),
    max(n),
    min(n)
FROM src;

SELECT
    count(),
    sum(n),
    sum(toInt64(s)),
    max(n),
    min(n)
FROM dst;

SELECT
    count(),
    sum(toInt64(n)),
    max(n),
    min(n)
FROM mv;

SELECT
    count(),
    sum(toInt64(n)),
    max(n),
    min(n)
FROM dist;

SELECT
    count(),
    sum(toInt64(n)),
    max(toUInt32(n)),
    min(toInt128(n))
FROM dist;