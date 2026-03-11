SELECT *
FROM
    a
LEFT JOIN j
    USING (id)
ORDER BY
    a.id ASC,
    a.val ASC
SETTINGS enable_optimize_predicate_expression = 1;

SELECT *
FROM
    a
LEFT JOIN j
    USING (id)
ORDER BY
    a.id ASC,
    a.val ASC
SETTINGS enable_optimize_predicate_expression = 0;

SELECT *
FROM
    (
        SELECT
            0 AS id,
            1 AS val
    ) AS _
INNER JOIN j
    USING (id);