SELECT count(*) = 18 * 18 * 17 + 35
FROM (
        SELECT key
        FROM (
                WITH 18 AS n

                SELECT concat(repeat('\0', number % n), repeat('1', intDiv(number, n) % n), repeat('\0', intDiv(number, n * n) % n)) AS key
                FROM numbers(18 * 18 * 18)
            )
        GROUP BY key
    );