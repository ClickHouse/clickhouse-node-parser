SET join_use_nulls = 1;

SELECT '--';

SELECT c
FROM (
        SELECT d2.c
        FROM
            (
                SELECT
                    1 AS a,
                    2 AS b
            ) AS d1
        FULL JOIN (
                SELECT
                    1 AS a,
                    3 AS c
            ) AS d2
            ON (d1.a = d2.a)
    );