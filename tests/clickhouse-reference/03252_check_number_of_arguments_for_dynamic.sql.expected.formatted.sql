SELECT 1
FROM
    (
        SELECT 1 AS c0
    ) AS tx
FULL JOIN t AS t2
    ON equals(t2.a.Float32); -- { serverError NUMBER_OF_ARGUMENTS_DOESNT_MATCH }