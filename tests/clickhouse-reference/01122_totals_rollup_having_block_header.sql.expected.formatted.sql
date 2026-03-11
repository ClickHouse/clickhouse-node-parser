SELECT
    a,
    b,
    count(*)
FROM rollup_having
GROUP BY
    a,
    b
WITH ROLLUP
WITH TOTALS
HAVING isNotNull(a);

SELECT
    a,
    b,
    count(*)
FROM rollup_having
GROUP BY
    a,
    b
WITH ROLLUP
WITH TOTALS
HAVING isNotNull(a)
    AND isNotNull(b);