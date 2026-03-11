SELECT
    round(cramersV(a, b) OVER (), 2),
    round(cramersVBiasCorrected(a, b) OVER (), 2),
    round(theilsU(a, b) OVER (), 2),
    round(theilsU(b, a) OVER (), 2),
    round(contingency(a, b) OVER (), 2)
FROM (
        SELECT
            number,
            number % 3 AS a,
            number % 5 AS b
        FROM numbers(10)
    )
ORDER BY number ASC;

SELECT
    grp,
    round(cramersV(a, b) OVER (PARTITION BY grp), 2),
    round(cramersVBiasCorrected(a, b) OVER (PARTITION BY grp), 2),
    round(theilsU(a, b) OVER (PARTITION BY grp), 2),
    round(theilsU(b, a) OVER (PARTITION BY grp), 2),
    round(contingency(a, b) OVER (PARTITION BY grp), 2)
FROM (
        SELECT
            number % 4 AS grp,
            number % 3 AS a,
            number AS b
        FROM numbers(15)
    )
ORDER BY grp ASC;

SELECT
    number,
    round(cramersV(a, b) OVER (ORDER BY number ASC), 2),
    round(cramersVBiasCorrected(a, b) OVER (ORDER BY number ASC), 2),
    round(theilsU(a, b) OVER (ORDER BY number ASC), 2),
    round(theilsU(b, a) OVER (ORDER BY number ASC), 2),
    round(contingency(a, b) OVER (ORDER BY number ASC), 2)
FROM (
        SELECT
            number,
            number % 3 AS a,
            number % 7 AS b
        FROM numbers(20)
    )
ORDER BY number ASC;

SELECT
    number,
    round(cramersV(a, b) OVER (ORDER BY number ASC ROWS BETWEEN UNBOUNDED PRECEDING AND 3 FOLLOWING), 2),
    round(cramersVBiasCorrected(a, b) OVER (ORDER BY number ASC ROWS BETWEEN UNBOUNDED PRECEDING AND 3 FOLLOWING), 2),
    round(theilsU(a, b) OVER (ORDER BY number ASC ROWS BETWEEN UNBOUNDED PRECEDING AND 3 FOLLOWING), 2),
    round(theilsU(b, a) OVER (ORDER BY number ASC ROWS BETWEEN UNBOUNDED PRECEDING AND 3 FOLLOWING), 2),
    round(contingency(a, b) OVER (ORDER BY number ASC ROWS BETWEEN UNBOUNDED PRECEDING AND 3 FOLLOWING), 2)
FROM (
        SELECT
            number,
            number % 3 AS a,
            number % 7 AS b
        FROM numbers(20)
    )
ORDER BY number ASC;