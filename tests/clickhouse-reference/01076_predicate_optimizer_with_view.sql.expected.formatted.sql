SELECT *
FROM (
        SELECT
            toUInt64(b),
            sum(id) AS b
        FROM test
    )
WHERE `toUInt64(sum(id))` = 3;