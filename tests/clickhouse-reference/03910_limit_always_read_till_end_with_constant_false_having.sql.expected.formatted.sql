SELECT 1
FROM (
        SELECT 1 AS c0
        WHERE EXISTS((
                SELECT 1
            ))
        LIMIT 1
    ) AS v0
GROUP BY v0.c0
HAVING v0.c0 = 1
    AND v0.c0 = 2
SETTINGS
    exact_rows_before_limit = 1,
    execute_exists_as_scalar_subquery = 0;