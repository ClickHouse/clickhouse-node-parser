-- Tags: global
WITH (
        SELECT countDistinct(colU)
        FROM tabA
    ) AS withA,

(
        SELECT countDistinct(colU)
        FROM tabA
    ) AS withB

SELECT withA / withB AS ratio
FROM (
        SELECT
            date AS period,
            colX
        FROM (
                SELECT
                    date,
                    if(colA IN (
                        SELECT colB
                        FROM tabC
                    ), 0, colA) AS colX
                FROM tabB
            ) AS tempB
        GROUP BY
            period,
            colX
    ) AS main; -- {serverError UNKNOWN_TABLE}