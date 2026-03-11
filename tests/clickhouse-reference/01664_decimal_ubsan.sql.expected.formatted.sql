SELECT sumWithOverflow(a - 65537)
FROM (
        SELECT CAST(number AS Decimal32(4)) AS a
        FROM numbers(10)
    );