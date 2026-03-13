SELECT 1
FROM
    (
        SELECT 1
    ) AS tx
INNER JOIN VALUES((*)) AS ty
    USING (c0); -- { serverError UNKNOWN_IDENTIFIER }

SELECT *
FROM
    numbers(1) AS t1
FULL JOIN numbers(1, 46
    AND (isNull(1))
    AND ((*
    AND 3))) AS t2
    USING (number);