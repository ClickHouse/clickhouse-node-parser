SELECT count() AS x
WITH TOTALS
HAVING x != toNullable(0);

SELECT
    k,
    count() AS c
FROM (
        SELECT
            number,
            multiIf(number < 10, 'hello', number < 50, 'world', 'goodbye') AS k
        FROM `system`.numbers
        LIMIT 100
    )
GROUP BY k
WITH TOTALS
HAVING nullIf(c, 10) < 50
ORDER BY c ASC;