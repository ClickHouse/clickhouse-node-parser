SELECT
    *,
    ngramMinHash(*) AS minhash,
    mortonEncode(untuple(ngramMinHash(*))) AS z
FROM (
        SELECT toString(number)
        FROM numbers(10)
    )
ORDER BY z ASC
LIMIT 100;