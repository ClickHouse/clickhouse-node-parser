SET enable_analyzer = 1;

SET allow_experimental_correlated_subqueries = 1;

SELECT *
FROM numbers(2)
WHERE isNull((
        SELECT count()
        FROM `system`.one
        WHERE number = 2
    ))
ORDER BY `all` ASC;