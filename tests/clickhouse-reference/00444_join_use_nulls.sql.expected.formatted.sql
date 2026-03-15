SET join_use_nulls = 0;

SET any_join_distinct_right_table_keys = 1;

SET joined_subquery_requires_alias = 0;

SELECT
    k,
    a,
    b
FROM
    (
        SELECT
            number AS k,
            toString(number) AS a
        FROM `system`.numbers
        LIMIT 10
    )
INNER JOIN (
        SELECT
            number AS k,
            toString(number) AS b
        FROM `system`.numbers
        LIMIT 5, 10
    )
    USING (k)
ORDER BY k ASC;

SELECT
    k,
    a,
    b
FROM
    (
        SELECT
            number AS k,
            toString(number) AS a
        FROM `system`.numbers
        LIMIT 10
    )
LEFT JOIN (
        SELECT
            number AS k,
            toString(number) AS b
        FROM `system`.numbers
        LIMIT 5, 10
    )
    USING (k)
ORDER BY k ASC;

SELECT
    k,
    a,
    b
FROM
    (
        SELECT
            number AS k,
            toString(number) AS a
        FROM `system`.numbers
        LIMIT 10
    )
RIGHT JOIN (
        SELECT
            number AS k,
            toString(number) AS b
        FROM `system`.numbers
        LIMIT 5, 10
    )
    USING (k)
ORDER BY k ASC;

SELECT
    k,
    a,
    b
FROM
    (
        SELECT
            number AS k,
            toString(number) AS a
        FROM `system`.numbers
        LIMIT 10
    )
FULL JOIN (
        SELECT
            number AS k,
            toString(number) AS b
        FROM `system`.numbers
        LIMIT 5, 10
    )
    USING (k)
ORDER BY k ASC;

SET join_use_nulls = 1;