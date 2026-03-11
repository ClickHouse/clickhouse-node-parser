SELECT *
FROM (
        SELECT
            x,
            sum(y)
        FROM remote('127.0.0.{1,2}', currentDatabase(), tab)
        GROUP BY x
    )
WHERE x = 42;

SELECT *
FROM (
        SELECT
            x,
            sum(y)
        FROM remote('127.0.0.{1,2}', currentDatabase(), tab)
        GROUP BY GROUPING SETS ((x, z + 1), (x, z + 2))
    )
WHERE x = 42;

SELECT *
FROM (
        SELECT
            x,
            sum(y),
            z + 1 AS q
        FROM remote('127.0.0.{1,2}', currentDatabase(), tab)
        GROUP BY GROUPING SETS ((x, z + 1), (x, z + 2))
    )
WHERE q = 42;