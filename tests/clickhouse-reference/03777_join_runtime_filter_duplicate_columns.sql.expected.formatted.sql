SELECT `explain`
FROM (
        EXPLAIN keep_logical_steps = 1, header = 1
        SELECT *
        FROM
            (
                SELECT
                    number,
                    number,
                    number + 1 AS e,
                    e
                FROM numbers(5)
            ) AS `left`
        INNER JOIN (
                SELECT
                    number,
                    number + 1 AS k,
                    k
                FROM numbers(2, 5)
            ) AS `right`
            USING (number)
        ORDER BY `ALL` ASC
    );

SELECT *
FROM
    (
        SELECT
            number,
            number,
            number + 1 AS e,
            e
        FROM numbers(5)
    ) AS `left`
INNER JOIN (
        SELECT
            number,
            number + 1 AS k,
            k
        FROM numbers(2, 5)
    ) AS `right`
    USING (number)
ORDER BY `ALL` ASC;