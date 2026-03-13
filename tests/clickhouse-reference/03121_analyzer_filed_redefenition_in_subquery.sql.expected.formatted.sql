-- query 1
SELECT my_field
FROM (
        SELECT
            *,
            'redefined' AS my_field
        FROM test_subquery
    );

-- query 2
SELECT my_field
FROM (
        SELECT
            'redefined' AS my_field,
            *
        FROM test_subquery
    );

-- query 3
SELECT my_field
FROM (
        SELECT
            *,
            'redefined' AS my_field
        FROM (
                SELECT *
                FROM test_subquery
            )
    );