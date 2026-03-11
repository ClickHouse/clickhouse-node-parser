SELECT
    number,
    p,
    count(*) OVER (PARTITION BY p ORDER BY number DESC ROWS BETWEEN UNBOUNDED PRECEDING AND 65537 PRECEDING)
FROM (
        SELECT
            number,
            intDiv(number, 7) AS p
        FROM numbers(71)
    )
ORDER BY
    p ASC,
    number DESC
SETTINGS max_block_size = 2;